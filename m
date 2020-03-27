From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 08:19:24 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] Makefile: fix locale
 purge when BR2_PER_PACKAGE_DIRECTORIES=y
Message-ID: <20200327070639.E48528852B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00f09e30ab70fe88ab415c88ab019ee1e6756210
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

With BR2_PER_PACKAGE_DIRECTORIES=y, we have the following code in the
main Makefile:

target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
	@$(call MESSAGE,"Finalizing target directory")
	$(call per-package-rsync,$(sort $(PACKAGES)),target,$(TARGET_DIR))
	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))

The per-package-rsync call creates the global $(TARGET_DIR) from the
per-package $(TARGET_DIR). Then, we call the TARGET_FINALIZE_HOOKS.

One of the TARGET_FINALIZE_HOOKS, PURGE_LOCALES, remove locales that
are not desired by the user. It does so using a loop with the
$(wildcard ...) function.

However, the $(wildcard ...) function is expanded at the moment the
rule is evaluated. And with per-package directory, at the time the
rule is evaluated, the global $(TARGET_DIR) is empty, so $(wildcard
...) will return nothing. It is indeed only after the call to
per-package-rsync that the TARGET_DIR will be populated.

This commit fixes that by moving away from $(wildcard ...) and use a
shell test instead, since we are anyway in big block of shell code.

With this, locales are properly purged again when
BR2_PER_PACKAGE_DIRECTORIES=y.

Fixes: c4e6d5c8be6ada8e7c60950e3b499c55d48761cb ("core: implement per-package SDK and target")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr:
  - make the style look like the code around (no space in front of ;)
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 658a80ec739acdd1f2be76fad17f3a9a5f99b88a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c5d66705ce..5b17a32f30 100644
--- a/Makefile
+++ b/Makefile
@@ -698,8 +698,9 @@ define PURGE_LOCALES
 	rm -f $(LOCALE_WHITELIST)
 	for i in $(LOCALE_NOPURGE) locale-archive; do echo $$i >> $(LOCALE_WHITELIST); done
 
-	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/lib/locale)); \
+	for dir in $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/lib/locale); \
 	do \
+		if [ ! -d $$dir ]; then continue; fi; \
 		for langdir in $$dir/*; \
 		do \
 			if [ -e "$${langdir}" ]; \

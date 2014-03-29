From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 12:08:59 +0100
Subject: [Buildroot] [git commit] Add back rootfs-* dependencies to "source"
	and "legal-info" targets
Message-ID: <20140329110931.060E49C3AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1069239cf2098fbdce7046627e1dc53a07acbc3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After adding support top-level parallel make the rootfs-* dependencies
were not anymore considered for the "source" and "legal-info" targets
because the rootfs-* targets were removed from TARGETS variable and
placed in the TARGETS_ROOTFS variable so to fix the issue use use both
"TARGETS" and "TARGETS_ROOTFS" variables.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Vincent Stehl?? <vincent.stehle@freescale.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 197cf84..41c51c6 100644
--- a/Makefile
+++ b/Makefile
@@ -419,7 +419,8 @@ TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 # variable for each enabled target.
 # Notice: this only works for newstyle gentargets/autotargets packages
 TARGETS_HOST_DEPS = $(sort $(filter host-%,$(foreach dep,\
-		$(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS))),\
+		$(addsuffix _DEPENDENCIES,\
+			$(call UPPERCASE,$(TARGETS) $(TARGETS_ROOTFS))),\
 		$($(dep)))))
 # Host packages can in turn have their own dependencies. Likewise find
 # all the package names listed in the HOST_<PKG>_DEPENDENCIES for each

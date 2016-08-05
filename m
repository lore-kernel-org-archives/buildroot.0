From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 20:59:42 +0200
Subject: [Buildroot] [git commit] package/kmsxx: detect failure at
	install-staging
Message-ID: <20160805185958.A55FF7FBA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd183755ffed03107df1e58b948e3d99b167c5e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the staging-install commands do not detect failures to
install the libs.

That's because we use ';' to separate the commands, so we only get the
result of the last one.

Fix that by using multi-line commands, so they each are called on their
own and make would catch the failures.

Partially fixes (only detects the real failure):
    http://autobuild.buildroot.org/results/82c/82cfb7451f933b222abe30b5d35d23e409a4af79
    and a few others.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmsxx/kmsxx.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index d49ec8f..84c860c 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -39,8 +39,8 @@ endef
 define KMSXX_INSTALL_STAGING_CMDS
 	$(foreach l,$(KMSXX_LIBS),\
 		$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
-			$(STAGING_DIR)/usr/lib/lib$(l).so ; \
-		mkdir -p $(STAGING_DIR)/usr/include/$(l) ; \
+			$(STAGING_DIR)/usr/lib/lib$(l).so
+		mkdir -p $(STAGING_DIR)/usr/include/$(l)
 		cp -dpfr $(@D)/$(l)/inc/$(l)/* $(STAGING_DIR)/usr/include/$(l)/
 	)
 endef

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 22:58:51 -0300
Subject: [Buildroot] [PATCH 3/3] host-microperl: define module paths and
	other improvements
In-Reply-To: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1331517531-2291-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Define archlib, privlib, sitelib and sitearch for host-microperl so that
modules get installed in a unified directory hierarchy.

Drop loclibpth and switch to libpth using the host linker to dump all
the library search paths. This should fix ubuntu build issues.

Switch from -des to -der to make the detection phase faster.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/microperl/microperl.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index d5b5a7c..74d7046 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -26,7 +26,12 @@ endif
 define HOST_MICROPERL_CONFIGURE_CMDS
 	cd $(@D) ; \
 	./Configure -Dcc="$(HOSTCC)" -Dprefix="$(HOST_DIR)/usr" \
-		-Dloclibpth='/lib /lib64 /usr/lib /usr/lib64' -des
+		-Darchlib="$(HOST_DIR)/usr/lib/perl5/$(MICROPERL_VERSION)/`uname -m`" \
+		-Dprivlib="$(HOST_DIR)/usr/lib/perl5/$(MICROPERL_VERSION)" \
+		-Dsitelib="$(HOST_DIR)/usr/lib/perl5/site_perl/$(MICROPERL_VERSION)" \
+		-Dsitearch="$(HOST_DIR)/usr/lib/perl5/site_perl/$(MICROPERL_VERSION)/`uname -m`" \
+		-Dlibpth="`ld --verbose|grep SEARCH_DIR|sed -e 's/SEARCH_DIR("//g' -e 's/");//g'`" \
+		-der
 endef
 
 define HOST_MICROPERL_BUILD_CMDS
-- 
1.7.3.4

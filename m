From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 23 Aug 2012 10:14:15 +0200
Subject: [Buildroot] [PATCH 4/9] microperl: build extensions at build time
In-Reply-To: <1345709660-25443-1-git-send-email-francois.perrad@gadz.org>
References: <1345709660-25443-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1345709660-25443-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

just set PERL5LIB in build tree
optim: symlink only one time, before the loop

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/microperl/microperl.mk |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index b2a912a..fa92144 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -97,6 +97,7 @@ define MICROPERL_CONFIGURE_CMDS
 	cp -f $(@D)/uconfig.sh $(@D)/config.sh
 	echo "ccname='$(TARGET_CC)'" >>$(@D)/config.sh
 	echo "PERL_CONFIG_SH=true" >>$(@D)/config.sh
+	touch $(@D)/config.h    # avoid warning : out of date
 	cd $(@D) ; $(HOST_DIR)/usr/bin/perl make_patchnum.pl ; \
 	$(HOST_DIR)/usr/bin/perl configpm
 endef
@@ -106,16 +107,17 @@ define MICROPERL_BUILD_CMDS
 		CC="$(HOSTCC)" bitcount.h
 	$(MAKE) -f Makefile.micro -C $(@D) \
 		CC="$(TARGET_CC)" OPTIMIZE="$(TARGET_CFLAGS)"
+	$(MICROPERL_BUILD_EXTENSIONS)
 endef
 
 # Some extensions don't need a build run
 # We try to build anyway to avoid a huge black list
 # Just ignore make_ext.pl warning/errors
 define MICROPERL_BUILD_EXTENSIONS
+	cd $(@D); rm -f miniperl; ln -s $(HOST_DIR)/usr/bin/perl miniperl;
 	for i in $(MICROPERL_MODS); do \
-	cd $(@D); ln -sf $(HOST_DIR)/usr/bin/perl miniperl; \
-		PERL5LIB=$(TARGET_DIR)/$(MICROPERL_ARCH_DIR) \
-		$(HOST_DIR)/usr/bin/perl make_ext.pl MAKE="$(MAKE)" --nonxs \
+	cd $(@D); PERL5LIB=lib \
+		./miniperl make_ext.pl MAKE="$(MAKE)" --nonxs \
 		`echo $$i|sed -e 's/.pm//'`; \
 	done
 endef
@@ -131,7 +133,6 @@ define MICROPERL_INSTALL_TARGET_CMDS
 		$(INSTALL) -m 0644 -D $(@D)/lib/$$i \
 			$(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$$i; \
 	done
-	$(MICROPERL_BUILD_EXTENSIONS)
 	for i in $(MICROPERL_MODS); do \
 		j=`echo $$i|cut -d : -f 1` ; \
 		if [ -d $(@D)/lib/$$j ] ; then \
-- 
1.7.9.5

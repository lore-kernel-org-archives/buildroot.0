From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 10 Nov 2012 15:41:07 +0100
Subject: [Buildroot] [PATCH 1/2] perl: fix configure step
Message-ID: <1352558468-3643-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configure -A symbol=val generates a extra space in config.sh,
which causes failure like this :
    Building Module-Runtime-0.013
    Unknown OS type ' linux' - using default settings

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.mk |   27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 0893eb5..cbfeeab 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -55,14 +55,8 @@ PERL_CONF_OPT = \
 	--target-tools-prefix=$(TARGET_CROSS) \
 	--prefix=/usr \
 	-Dld="$(TARGET_CC_NOCCACHE)" \
-	-A ccflags="$(TARGET_CFLAGS)" \
-	-A ldflags="$(TARGET_LDFLAGS) -lm" \
-	-A mydomain="" \
-	-A myhostname="$(BR2_TARGET_GENERIC_HOSTNAME)" \
-	-A myuname="Buildroot $(BR2_VERSION_FULL)" \
-	-A osname=linux \
-	-A osvers=$(LINUX_VERSION) \
-	-A perladmin=root
+	-Dccflags="$(TARGET_CFLAGS)" \
+	-Dldflags="$(TARGET_LDFLAGS) -lm"
 
 ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
     PERL_CONF_OPT += -Dusedevel
@@ -79,6 +73,23 @@ endif
 
 define PERL_CONFIGURE_CMDS
 	(cd $(@D); HOSTCC='$(HOSTCC_NOCACHE)' ./configure $(PERL_CONF_OPT))
+	echo "# patched values" >>$(@D)/config.sh
+	$(SED) '/^myarchname=/d' \
+		-e '/^mydomain=/d' \
+		-e '/^myhostname=/d' \
+		-e '/^myuname=/d' \
+		-e '/^osname=/d' \
+		-e '/^osvers=/d' \
+		-e '/^perladmin=/d' \
+		$(@D)/config.sh
+	echo "myarchname='$(GNU_TARGET_NAME)'"                  >>$(@D)/config.sh
+	echo "mydomain=''"                                      >>$(@D)/config.sh
+	echo "myhostname='$(BR2_TARGET_GENERIC_HOSTNAME)'"      >>$(@D)/config.sh
+	echo "myuname='Buildroot $(BR2_VERSION_FULL)'"          >>$(@D)/config.sh
+	echo "osname='linux'"                                   >>$(@D)/config.sh
+	echo "osvers='$(BR2_LINUX_KERNEL_VERSION)'"             >>$(@D)/config.sh
+	echo "perladmin='root'"                                 >>$(@D)/config.sh
+	(cd $(@D); ./Configure -S)
 	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
 endef
 
-- 
1.7.9.5

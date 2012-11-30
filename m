From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 12:17:08 -0800
Subject: [Buildroot] [git commit] perl: fix configure step
Message-ID: <20121203145716.A100599848@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ba19df16ab9da681c2e5be2f2c7693c24ed0d8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Configure -A symbol=val generates a extra space in config.sh,
which causes failure like this :
    Building Module-Runtime-0.013
    Unknown OS type ' linux' - using default settings

[Arnout: use -A define:foo instead of patching config.sh]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/perl/perl.mk |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 0893eb5..391047d 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -55,14 +55,14 @@ PERL_CONF_OPT = \
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
+	-Dldflags="$(TARGET_LDFLAGS) -lm" \
+	-A define:mydomain="" \
+	-A define:myhostname="$(BR2_TARGET_GENERIC_HOSTNAME)" \
+	-A define:myuname="Buildroot $(BR2_VERSION_FULL)" \
+	-A define:osname=linux \
+	-A define:osvers=$(LINUX_VERSION) \
+	-A define:perladmin=root
 
 ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
     PERL_CONF_OPT += -Dusedevel

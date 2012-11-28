From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 28 Nov 2012 17:09:20 +0100
Subject: [Buildroot] [PATCHv3 for-next 4/6] perl: fix configure step
In-Reply-To: <1354118962-18601-1-git-send-email-arnout@mind.be>
References: <1354118962-18601-1-git-send-email-arnout@mind.be>
Message-ID: <1354118962-18601-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Francois Perrad <fperrad@gmail.com>

Configure -A symbol=val generates a extra space in config.sh,
which causes failure like this :
    Building Module-Runtime-0.013
    Unknown OS type ' linux' - using default settings

[Arnout: use -A define:foo instead of patching config.sh]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/perl/perl.mk |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

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
-- 
1.7.10.4

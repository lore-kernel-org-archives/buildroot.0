From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:23 +0100
Subject: [Buildroot] [RFC v3 18/30] perl: don't loose the -shared flag when
	TARGET_LDFLAGS isn't empty
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-19-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is in order to support the per-package staging directory.
---
 package/perl/perl.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index b1f2101..2b9cdff 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -33,6 +33,8 @@ PERL_POST_DOWNLOAD_HOOKS += PERL_CROSS_DOWNLOAD
 define PERL_CROSS_EXTRACT
 	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(DL_DIR)/$(PERL_CROSS_SOURCE) | \
 	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	$(SED) "s/-L\*|-R\*|-Wl,-R\*)/-L\*|-R\*|-Wl,-R\*|-shared)/" \
+		$(@D)/cnf/configure_misc.sh
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
@@ -57,7 +59,7 @@ PERL_CONF_OPTS = \
 	--prefix=/usr \
 	-Dld="$(TARGET_CC_NOCCACHE)" \
 	-Dccflags="$(TARGET_CFLAGS)" \
-	-Dldflags="$(TARGET_LDFLAGS) -lm" \
+	-Dldflags="$(TARGET_LDFLAGS) -lm -shared" \
 	-Dmydomain="" \
 	-Dmyhostname="$(BR2_TARGET_GENERIC_HOSTNAME)" \
 	-Dmyuname="Buildroot $(BR2_VERSION_FULL)" \
-- 
2.3.1

From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Fri, 28 Oct 2016 10:18:25 -0300
Subject: [Buildroot] [PATCH 07/11] perl: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1477660709-5935-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1477660709-5935-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1477660709-5935-7-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/perl/perl.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index b19fa78..23ea728 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -104,15 +104,16 @@ HOST_PERL_CONF_OPTS = \
 	-Dcc="$(HOSTCC)"
 
 define HOST_PERL_CONFIGURE_CMDS
-	(cd $(@D); HOSTCC='$(HOSTCC_NOCCACHE)' ./Configure $(HOST_PERL_CONF_OPTS))
+	(cd $(@D); HOSTCC='$(HOSTCC_NOCCACHE)' $(HOST_MAKE_ENV) \
+		./Configure $(HOST_PERL_CONF_OPTS))
 endef
 
 define HOST_PERL_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define HOST_PERL_INSTALL_CMDS
-	$(MAKE) -C $(@D) INSTALL_DEPENDENCE='' install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_DEPENDENCE='' install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3

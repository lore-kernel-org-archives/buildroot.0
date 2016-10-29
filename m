From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:53:49 +0200
Subject: [Buildroot] [git commit] perl: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161029135923.847607FEB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57711efbe8a766b1534beeed37a3812777e3ba36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 56fc579..84af75d 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -104,15 +104,16 @@ HOST_PERL_CONF_OPTS = \
 	-Dcc="$(HOSTCC)"
 
 define HOST_PERL_CONFIGURE_CMDS
-	(cd $(@D); HOSTCC='$(HOSTCC_NOCCACHE)' ./Configure $(HOST_PERL_CONF_OPTS))
+	(cd $(@D); $(HOST_MAKE_ENV) HOSTCC='$(HOSTCC_NOCCACHE)' \
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

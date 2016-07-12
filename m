From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jul 2016 23:50:33 +0200
Subject: [Buildroot] [git commit] package/syslog-ng: fix localstatdir
	directory
Message-ID: <20160714102606.5B48D8212D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6868a342b4cf6a0b0184a0c3040cc300a68bb86b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

syslog-ng is built with the default buildroot flag localstatdir=/var

This causes three issues:

1) syslog-ng creates two files (syslog-ng.ctl and syslog-ng.persist in /var)
which shouldn't have random files generated in it.

2) SELinux expects it in it's default directory /var/run.

3) This breakes read only file systems because /var/ usually isn't mounted as
a seperate filing system.

Setting the buildflag to the default /var/run
fixes all three of thee of these issues.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/syslog-ng/syslog-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 1acaad8..c11d3bd 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -13,7 +13,7 @@ SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	eventlog libglib2 openssl pcre
 # rabbit-mq needs -lrt
 SYSLOG_NG_CONF_ENV = LIBS=-lrt
-SYSLOG_NG_CONF_OPTS = --disable-manpages
+SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run
 
 # We override busybox's S01logging init script
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)

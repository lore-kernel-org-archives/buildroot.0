From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 08:54:33 +0100
Subject: [Buildroot] [git commit] libevent: fix openssl detection when
	statically linking
Message-ID: <20150227082309.25DB7817F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f29bb169cff521e01f9e94af7275a4e110d256bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes (indirectly):
http://autobuild.buildroot.net/results/dbf/dbf2d348de3831a86728f9d72cb56b9f2ddbf554/
http://autobuild.buildroot.net/results/6a8/6a89183e558e4ff27841c3e544687ad4a04fb036/
http://autobuild.buildroot.net/results/c80/c80eedb4d7335f1aef736a1312900c2b371eabc9/
http://autobuild.buildroot.net/results/91b/91b4ab54ed9d422bfaef765d09cc92192012ce7e/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libevent/libevent.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index c50b1d2..d67c738 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -26,6 +26,11 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBEVENT_DEPENDENCIES += openssl
 LIBEVENT_CONF_OPTS += --enable-openssl
+# openssl needs zlib but configure forgets to link against it causing
+# openssl detection to fail
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBEVENT_CONF_ENV += OPENSSL_LIBADD='-lz'
+endif
 else
 LIBEVENT_CONF_OPTS += --disable-openssl
 endif

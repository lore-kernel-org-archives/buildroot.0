From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 21:32:35 +0200
Subject: [Buildroot] [git commit] logrotate: needs mmu
Message-ID: <20131001193429.979909B313@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=243fe9a7d9b19ab48df88e1493c2a4dacd1e91f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix below build error:

logrotate.o: In function `switch_user_permanently':
/opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:129: undefined reference to `fork'
logrotate.o: In function `removeLogFile':
/opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:431: undefined reference to `fork'
logrotate.o: In function `mailLog':
/opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:597: undefined reference to `fork'
/opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:615: undefined reference to `fork'
logrotate.o: In function `compressLogFile':
/opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:533: undefined reference to `fork'
collect2: ld returned 1 exit status
make[1]: *** [logrotate] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/logrotate/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/logrotate/Config.in b/package/logrotate/Config.in
index 0d0ec61..bc7b295 100644
--- a/package/logrotate/Config.in
+++ b/package/logrotate/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LOGROTATE
 	bool "logrotate"
 	select BR2_PACKAGE_POPT
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	help
 	  A simple program to rotate logs.
 

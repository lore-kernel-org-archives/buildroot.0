From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 10:12:21 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] php: fix build with mysqli
Message-ID: <20180828081344.2C30D813B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64e63b6ce644a44944efa79e0ea7653d339f6be3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

This fixes autobuild failures like
http://autobuild.buildroot.net/results/3288b742cee650ee47a41c5b4d6aaef1fe67bff1

php compile breaks with:

ext/mysqlnd/mysqlnd_auth.o: In function `php_mysqlnd_scramble_sha2':
mysqlnd_auth.c:(.text+0x1054): undefined reference to `PHP_SHA256Init'
mysqlnd_auth.c:(.text+0x1064): undefined reference to `PHP_SHA256Update'
mysqlnd_auth.c:(.text+0x1070): undefined reference to `PHP_SHA256Final'
mysqlnd_auth.c:(.text+0x1078): undefined reference to `PHP_SHA256Init'
mysqlnd_auth.c:(.text+0x1088): undefined reference to `PHP_SHA256Update'
mysqlnd_auth.c:(.text+0x1094): undefined reference to `PHP_SHA256Final'
mysqlnd_auth.c:(.text+0x109c): undefined reference to `PHP_SHA256Init'
mysqlnd_auth.c:(.text+0x10ac): undefined reference to `PHP_SHA256Update'
mysqlnd_auth.c:(.text+0x10bc): undefined reference to `PHP_SHA256Update'
mysqlnd_auth.c:(.text+0x10c8): undefined reference to `PHP_SHA256Final'

It looks like the php mysqli extension needs the hash extension to work.  This
seems to be a php Make dependany bug.  This patch works around it until the
upstream maintainers can fix it.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 65f96452636b96c01ea3f00db6e4e7a240837101)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/Config.ext | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 6b3d86925d..60ef1aee7c 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -113,6 +113,7 @@ endif
 
 config BR2_PACKAGE_PHP_EXT_MYSQLI
 	bool "Mysqli"
+	select BR2_PACKAGE_PHP_EXT_HASH
 	help
 	  MySQL Improved extension support
 

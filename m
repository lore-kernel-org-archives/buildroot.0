From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 27 Aug 2018 06:21:27 -0700
Subject: [Buildroot] [PATCH 1/1] php: fix build with mysqli
Message-ID: <20180827132127.20658-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

--
I'm OK with modifing the above at commit time.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
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
 
-- 
2.14.4

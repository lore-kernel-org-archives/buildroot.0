From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  3 Apr 2018 07:45:25 +0300
Subject: [Buildroot] [PATCH 2/2] prosody: needs MMU
In-Reply-To: <a4acccee1aac11202402728b64d23a3f0f7128be.1522730725.git.baruch@tkos.co.il>
References: <a4acccee1aac11202402728b64d23a3f0f7128be.1522730725.git.baruch@tkos.co.il>
Message-ID: <e7d3af9b986c98c2e11b0a60789401b7e49687c6.1522730725.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

prosody POSIX support code calls fork() unconditionally.

prosody also uses the mallinfo() API, but uClibc does not provide that
for no-MMU targets.

Fixes:
http://autobuild.buildroot.net/results/2d0/2d0f97e41cc1d4c9c7a0eacd4eec8bad6f00bcff/
http://autobuild.buildroot.net/results/f69/f69dfb1a7d1163b402b1f9bef045891c229539e5/

Cc: Dushara Jayasinghe <nidujay@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/prosody/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/prosody/Config.in b/package/prosody/Config.in
index 1bc79b7f2a78..ef26e2750b66 100644
--- a/package/prosody/Config.in
+++ b/package/prosody/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PROSODY
 	bool "prosody"
+	depends on BR2_USE_MMU # fork
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_LUAEXPAT # runtime
 	select BR2_PACKAGE_LUASEC # runtime
@@ -16,3 +17,4 @@ config BR2_PACKAGE_PROSODY
 
 comment "prosody needs the lua interpreter"
 	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on BR2_USE_MMU
-- 
2.16.2

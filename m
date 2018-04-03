From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Apr 2018 15:50:39 +0200
Subject: [Buildroot] [git commit] prosody: needs MMU
Message-ID: <20180403135146.94DA47FEE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3c0b4383f8b0d87796bdde20f98275e6ef2db14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

prosody POSIX support code calls fork() unconditionally.

prosody also uses the mallinfo() API, but uClibc does not provide that
for no-MMU targets.

Fixes:
http://autobuild.buildroot.net/results/2d0/2d0f97e41cc1d4c9c7a0eacd4eec8bad6f00bcff/
http://autobuild.buildroot.net/results/f69/f69dfb1a7d1163b402b1f9bef045891c229539e5/

Cc: Dushara Jayasinghe <nidujay@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prosody/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/prosody/Config.in b/package/prosody/Config.in
index 1bc79b7f2a..ef26e2750b 100644
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

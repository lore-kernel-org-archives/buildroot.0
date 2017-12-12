From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Dec 2017 11:14:55 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] package/turbolua: Fix
 build with gcc7
Message-ID: <20171212101021.3AD4282BC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2493cae0981867879af1c50ffee9ae01322986e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

gcc7 has -Wimplicit-fallthrough enabled by default. Together with
-Werror in turbolua makefile it gives -Werror=implicit-fallthrough=
build error.

Add upstreamable patch [1], which fixes typo in FALLTHROUGH comment,
so it makes the fallthrough explicit for gcc.

[1] https://github.com/kernelsauce/turbo/pull/323

Fixes:
http://autobuild.buildroot.net/results/6f107b62f105508044185576b071323e5d73dd83
http://autobuild.buildroot.net/results/d303929960c667a21181d0bbdab64ba8a8d56a4f

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit d1839b7f0e7c6be2e90887b27dee58d9a0441771)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...er-Fix-typo-in-switch-FALLTHROUGH-comment.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/turbolua/0001-http-parser-Fix-typo-in-switch-FALLTHROUGH-comment.patch b/package/turbolua/0001-http-parser-Fix-typo-in-switch-FALLTHROUGH-comment.patch
new file mode 100644
index 0000000..bb27056
--- /dev/null
+++ b/package/turbolua/0001-http-parser-Fix-typo-in-switch-FALLTHROUGH-comment.patch
@@ -0,0 +1,31 @@
+From 570db52d7fd3b4deffe785e60fb362e1496844ee Mon Sep 17 00:00:00 2001
+From: Marcin Niestroj <m.niestroj@grinn-global.com>
+Date: Tue, 26 Sep 2017 12:10:53 +0200
+Subject: [PATCH] http-parser: Fix typo in switch FALLTHROUGH comment
+
+This also suppresses -Wimplicit-fallthrough warning, which is enabled
+in gcc7 by default.
+
+PR for upstream: https://github.com/kernelsauce/turbo/pull/323
+
+Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+---
+ deps/http-parser/http_parser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps/http-parser/http_parser.c b/deps/http-parser/http_parser.c
+index 8cf6fb0..2ff1073 100644
+--- a/deps/http-parser/http_parser.c
++++ b/deps/http-parser/http_parser.c
+@@ -2095,7 +2095,7 @@ http_parser_parse_url(
+       case s_req_server_with_at:
+         found_at = 1;
+ 
+-      /* FALLTROUGH */
++      /* FALLTHROUGH */
+       case s_req_server:
+         uf = UF_HOST;
+         break;
+-- 
+2.14.1
+

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Apr 2018 17:48:11 +0200
Subject: [Buildroot] [PATCH] download/git: don't require too-recent git
Message-ID: <20180408154811.27234-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

git has supported -C only since 1.8.5, and some distros have not yet
caught up after moe than 4 years...

Fall back to entering the directory.

Fixes:
    http://autobuild.buildroot.net/results/35f9f7a4adc6c2cad741079e4afdf1408c94703b

Reported-by: Andr? Hentschel <nerv@dawncrow.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Andr? Hentschel <nerv@dawncrow.de>
---
 support/download/git | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 787b6bcca0..868dfad0dd 100755
--- a/support/download/git
+++ b/support/download/git
@@ -47,7 +47,9 @@ git_cache="${dl_dir}/git"
 # fetch'ed later.
 if [ ! -d "${git_cache}" ]; then
     _git init "'${git_cache}'"
-    _git -C "'${git_cache}'" remote add origin "'${uri}'"
+    pushd "${git_cache}" >/dev/null
+    _git remote add origin "'${uri}'"
+    popd >/dev/null
 fi
 
 pushd "${git_cache}" >/dev/null
-- 
2.14.1

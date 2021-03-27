From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Mar 2021 21:53:27 +0100
Subject: [Buildroot] [PATCH 1/5] legacy: add note about removing options
In-Reply-To: <cover.1616878389.git.yann.morin.1998@free.fr>
References: <cover.1616878389.git.yann.morin.1998@free.fr>
Message-ID: <6d9b2dbd892a411fa00eb9ce653982016dcff229.1616878389.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Legacy options might still be in use, for example as a legacy default
(e.g. as a string default, or as a choice default).

So, when we eventually remove legacy options, we must ensure they are
no longer used.

Add a small shell snippet to make that easy.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8ebbc4c295..ef2da34c33 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -6,7 +6,10 @@
 # This will make the transition for the user more convenient.
 #
 # When adding legacy symbols to this file, add them to the front. The oldest
-# symbols will be removed again after about two years.
+# symbols will be removed again after about two years. When removing symbols,
+# ensure there is nothing that still uses them (like legacy defaults):
+#   syms="$(git diff |sed -r -e '/^-config ([^[:space:]]+)$/!d; s//\1/')"
+#   for sym in ${syms}; do git --no-pager grep ${sym}; done
 #
 # The symbol should be copied as-is from the place where it was previously
 # defined, but the help text should be removed or replaced with something that
-- 
2.25.1

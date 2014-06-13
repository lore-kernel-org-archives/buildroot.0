From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 01:02:27 +0200
Subject: [Buildroot] [PATCH 03/20 RFC] support/gen-manual-lists.py: bail out
	early for legacy symbols
In-Reply-To: <cover.1402699915.git.yann.morin.1998@free.fr>
References: <cover.1402699915.git.yann.morin.1998@free.fr>
Message-ID: <97051d5faa0925f0906a9566961fcc3a396c4b73.1402699915.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

When searching for virtual package providers, there's no need to
handle legacy symbols at all, so just bail out early.
---
 support/scripts/gen-manual-lists.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index 483b384..95c10dc 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -389,13 +389,13 @@ class Buildroot:
             for sym in self.config:
                 if not sym.is_symbol():
                     continue
+                if _symbol_is_legacy(sym):
+                    continue
                 selects = sym.get_selected_symbols()
                 if not selects:
                     continue
                 for s in selects:
                     if s == symbol:
-                        if _symbol_is_legacy(sym):
-                            continue
                         if sym.prompts:
                             l = self._get_symbol_label(sym,False)
                             parent_pkg = _get_parent_package(sym)
-- 
1.8.3.2

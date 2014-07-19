From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 18:03:26 +0200
Subject: [Buildroot] [git commit] support/gen-manual-lists.py: bail out
	early for legacy symbols
Message-ID: <20140719160431.9A96B9D25F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c4498082becf90246a1fdf245e41c3bf3004033
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When searching for virtual package providers, there's no need to
handle legacy symbols at all, so just bail out early.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/gen-manual-lists.py |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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

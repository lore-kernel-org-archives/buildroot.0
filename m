From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 14 Jul 2015 01:45:27 +0200
Subject: [Buildroot] [PATCH v3 1/2] purge-locales: further refactoring after
	removing man paths
Message-ID: <1436831128-19423-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the man paths have been removed, it is no longer necessary to
grep them out and the loop can be simplified.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
v3: Partial rebase, since v1 was already merged.
v2: remove the grep -v man as well, which allows us to use $dir/*
    instead of the funky ls construct.
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 02a1032..f764ae5 100644
--- a/Makefile
+++ b/Makefile
@@ -546,9 +546,9 @@ define PURGE_LOCALES
 
 	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/lib/locale)); \
 	do \
-		for lang in $$(cd $$dir; ls .|grep -v man); \
+		for langdir in $$dir/*; \
 		do \
-			grep -qx $$lang $(LOCALE_WHITELIST) || rm -rf $$dir/$$lang; \
+			grep -qx $${langdir##*/} $(LOCALE_WHITELIST) || rm -rf $$langdir; \
 		done; \
 	done
 endef
-- 
2.1.4

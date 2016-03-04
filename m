From: Trent Piepho <tpiepho@kymetacorp.com>
Date: Fri, 4 Mar 2016 01:50:55 +0000
Subject: [Buildroot] [PATCH] purge-locales: Handle empty locale directories
	better
Message-ID: <1457056294.25961.111.camel@rtred1test09.kymeta.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a locale directory is empty, shell code like "for langdir in
$$dir/*;" will loop once with langdir set to "path/to/dir/*", rather
than not looping at all, which would obviously be the desired
behavior.

Then "grep -qx $${langdir##*/}" ungoes two shell expansions (how?)
that transform the expression from "${langdir##*/}" to "*" to "list
of all files in buildroot root dir".  Which is most certainly not what
this command was supposed to do.

If one of those files happens to be an 8GB flash image, grep consumes
all available memory and crashes trying to search it.

Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f2822a2..0df5a35 100644
--- a/Makefile
+++ b/Makefile
@@ -581,7 +581,8 @@ define PURGE_LOCALES
 	do \
 		for langdir in $$dir/*; \
 		do \
-			grep -qx $${langdir##*/} $(LOCALE_WHITELIST) || rm -rf $$langdir; \
+			[ -e "$${langdir}" ] || continue; \
+			grep -qx "$${langdir##*/}" $(LOCALE_WHITELIST) || rm -rf $$langdir; \
 		done; \
 	done
 	if [ -d $(TARGET_DIR)/usr/share/X11/locale ]; \
-- 
2.7.0.25.gfc10eb5.dirty

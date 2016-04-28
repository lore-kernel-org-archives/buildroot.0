From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 23:48:09 +0200
Subject: [Buildroot] [git commit] purge-locales: Handle empty locale
	directories better
Message-ID: <20160428214858.03B7B81ED2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbe29b9896d5a6a3b10c999522bb0ac29e934b51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If a locale directory is empty, shell code like "for langdir in
$$dir/*;" will loop once with langdir set to "path/to/dir/*", rather
than not looping at all, which would obviously be the desired
behavior.

Then "grep -qx $${langdir##*/}" ungoes two shell expansions (how?)
that transform the expression from "${langdir##*/}" to "*" to "list of
all files in buildroot root dir".  Which is most certainly not what
this command was supposed to do.

If one of those files happens to be an 8GB flash image, grep consumes
all available memory and crashes trying to search it.

Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0e4beb2..daa32a4 100644
--- a/Makefile
+++ b/Makefile
@@ -583,7 +583,10 @@ define PURGE_LOCALES
 	do \
 		for langdir in $$dir/*; \
 		do \
-			grep -qx $${langdir##*/} $(LOCALE_WHITELIST) || rm -rf $$langdir; \
+			if [ -e "$${langdir}" ]; \
+			then \
+				grep -qx "$${langdir##*/}" $(LOCALE_WHITELIST) || rm -rf $$langdir; \
+			fi \
 		done; \
 	done
 	if [ -d $(TARGET_DIR)/usr/share/X11/locale ]; \

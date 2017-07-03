From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 3 Jul 2017 23:00:48 +0200
Subject: [Buildroot] [PATCH v14 1/4] makedevs: support optional files
Message-ID: <20170703210051.3457-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the 'F' file type to makedevs, that allows a file to be optional.
With this option, the line is just silently skipped if the file doesn't
exist (or is not a regular file).

This is useful for _PERMISSIONS where the file can be configured out
by package-specific configuration that is not directly handled by
Buildroot, like busybox.

Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Cc: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v14:
 - Split off the makedevs change in a separate patch.
 - Fix it - AFAICS, the original patch would just skip all F lines.
---
 package/makedevs/makedevs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index 7092b1475e..1ba5936342 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -570,9 +570,12 @@ int main(int argc, char **argv)
 				ret = EXIT_FAILURE;
 				goto loop;
 			}
-		} else if (type == 'f') {
+		} else if (type == 'f' || type == 'F') {
 			struct stat st;
 			if ((stat(full_name, &st) < 0 || !S_ISREG(st.st_mode))) {
+				if (type == 'F') {
+					continue; /*Ignore optional files*/
+				}
 				bb_perror_msg("line %d: regular file '%s' does not exist", linenum, full_name);
 				ret = EXIT_FAILURE;
 				goto loop;
-- 
2.13.2

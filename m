From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 00:54:36 +0200
Subject: [Buildroot] [git commit] makedevs: support optional files
Message-ID: <20170703225435.46EB78179C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdbbc72934bc781cff7306da3c5233d21022bc33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/makedevs/makedevs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index 7092b14..1ba5936 100644
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

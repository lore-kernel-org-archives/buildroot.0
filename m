From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon,  6 Aug 2018 00:17:14 -0300
Subject: [Buildroot] [2018.02.x 1/2] makedevs: allow leading whitespace for
 capabilities
Message-ID: <20180806031715.7088-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently makedevs silently ignores extended attributes with leading
whitespace, for example those added to a <PACKAGE>_PERMISSIONS following
the recommended style from check-package.

Makedevs already ignores leading whitespace for normal entries (file
permission changes and device files creation). Do the same for extended
attributes.

Fixes: #11191.

Reported-by: Jean-pierre Cartal <jpcartal@free.fr>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/makedevs/makedevs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index 1ba5936342..c57b964f5c 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -510,7 +510,7 @@ int main(int argc, char **argv)
 
 		linenum++;
 
-		if (1 == sscanf(line, "|xattr %254s", xattr)) {
+		if (1 == sscanf(line, " |xattr %254s", xattr)) {
 #ifdef EXTENDED_ATTRIBUTES
 			if (!full_name)
 				bb_error_msg_and_die("line %d should be after a file\n", linenum);
-- 
2.17.1

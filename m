From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 31 May 2013 22:05:44 +0200
Subject: [Buildroot] [git commit] ext-toolchain-wrapper: fix paths if
	executable was resolved by PATH
Message-ID: <20130531200806.9582B9A6EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74ae7af927da3e807e1e3b9a68a4bb1fed5243bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If ext-toolchain-wrapper or any symbolic link to it was resolved by PATH,
the wrapper takes the working directory to calculate the relative paths.

Now '/proc/self/exe' is used to resolve the absolute path to the toolchain
directory if the wrapper was called neither with a relative nor an absolute
path.

[Peter: fix off-by-one, swap value == var checks around]
Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../toolchain-external/ext-toolchain-wrapper.c     |   17 +++++++++++++++--
 1 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 9a2fc70..9d79d68 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -61,7 +61,7 @@ int main(int argc, char **argv)
 	char *relbasedir, *absbasedir;
 	char *progpath = argv[0];
 	char *basename;
-	int ret;
+	int ret, i, count = 0;
 
 	/* Calculate the relative paths */
 	basename = strrchr(progpath, '/');
@@ -77,7 +77,20 @@ int main(int argc, char **argv)
 		absbasedir = realpath(relbasedir, NULL);
 	} else {
 		basename = progpath;
-		absbasedir = realpath("../..", NULL);
+		absbasedir = malloc(PATH_MAX + 1);
+		ret = readlink("/proc/self/exe", absbasedir, PATH_MAX);
+		if (ret < 0) {
+			perror(__FILE__ ": readlink");
+			return 2;
+		}
+		absbasedir[ret] = '\0';
+		for (i = ret; i > 0; i--) {
+			if (absbasedir[i] == '/') {
+				absbasedir[i] = '\0';
+				if (++count == 3)
+					break;
+			}
+		}
 	}
 	if (absbasedir == NULL) {
 		perror(__FILE__ ": realpath");

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 01 Mar 2012 13:06:36 -0000
Subject: [Buildroot] [git commit] DOWNLOAD_WGET: use -O instead of -P to set
	output file
Message-ID: <20120301130634.F162390BF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf2486bf317e4bbf88c801fb96183ba62be78cc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some URLs use url-encoded arguments to specify the file to download.
Wget will then use an output file name which includes all the ampersands
and such.  However, this is not what we see from buildroot.

E.g.:
FOO_SITE="http://git.foo.com/?p=foo.git;a=blob;f="
FOO_SOURCE="foo.tgz"

wget will download this into $(DL_DIR)/index.html?p=foo.git;a=blob;f=foo.tgz
buildroot thinks it's in $(DL_DIR)/foo.tgz

To make sure the view of wget and buildroot are consistent, specify
the output file explicitly.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 33461b4..ea44c6c 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -238,7 +238,7 @@ endef
 
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
-	$(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
+	$(WGET) -O $(DL_DIR)/$(2) $(call qstrip,$(1))/$(2)
 endef
 
 define SOURCE_CHECK_WGET

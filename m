From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 11 Jul 2017 19:26:24 +0200
Subject: [Buildroot] [RFC v1] libv4l: build utils only on MMU (with fork
	support) platforms
Message-ID: <20170711172624.7516-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

    CXXLD    v4l2-compliance
  .../output/build/libv4l-1.12.5/lib/libv4lconvert/.libs/libv4lconvert.so: undefined reference to `fork'
  collect2: error: ld returned 1 exit status

[1] http://autobuild.buildroot.net/results/7e8/7e8fbd99a8c091d7bbeedd16066297682bbe29fe

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
The libv4l build for noMMU platforms was enabled with commit 'package/libv4l:
allow build of v4l2 utilities on noMMU platforms' (see [2]). But libv4lconvert uses
fork internally, so all utils linking against fail to build. Fix this by disabling
the utils on noMMU platforms (so keep building all libraries).

Alternatives would be:

- disable libv4l on all noMMU platforms (not only the utils), revert a part
  of commit [2]

- create a patch to disable only libv4lconvert (and all dependend utils)
  on noMMU platforms

[2] https://git.buildroot.net/buildroot/commit/?id=f837251785e9389f53d695ddb8a094707865171b
---
 package/libv4l/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index e7f78dc70f..61c290f251 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -19,6 +19,7 @@ comment "libv4l JPEG support not enabled"
 
 config BR2_PACKAGE_LIBV4L_UTILS
 	bool "v4l-utils tools"
+	depends on BR2_USE_MMU # fork(), used in libv4lconvert linked by various utils eg. v4l2-compliance
 	help
 	  v4l-utils is a collection of various video4linux and DVB utilities.
 	  Enable this if you want to build the following tools:
-- 
2.11.0

From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  5 Feb 2016 22:50:26 +0100
Subject: [Buildroot] [PATCH v2] package/oprofile: fix musl build
Message-ID: <1454709026-13262-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build error has not yet been found by the autobuilders:

operf.cpp: In function ?int __delete_old_previous_sample_data(const char*, const stat*, int, FTW*)?:
operf.cpp:862:10: error: ?FTW_STOP? was not declared in this scope
   return FTW_STOP;
          ^
operf.cpp:864:10: error: ?FTW_CONTINUE? was not declared in this scope
   return FTW_CONTINUE;
          ^
operf.cpp: In function ?void convert_sample_data()?:
operf.cpp:899:41: error: ?FTW_ACTIONRETVAL? was not declared in this scope
                 int flags = FTW_DEPTH | FTW_ACTIONRETVAL;

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added patch comment, removed unneeded patch for libop/op_events.c.
    (Arnout)

 package/oprofile/0001-musl.patch | 48 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/oprofile/0001-musl.patch

diff --git a/package/oprofile/0001-musl.patch b/package/oprofile/0001-musl.patch
new file mode 100644
index 0000000..094cd16
--- /dev/null
+++ b/package/oprofile/0001-musl.patch
@@ -0,0 +1,48 @@
+Remove non-Posix use of FTW_ACTIONRETVAL
+
+The musl implementation of nftw doesn't support the glibc extension
+FTW_ACTIONRETVAL. Since none of the features of FTW_ACTIONRETVAL are
+used here, just use the normal nftw return value.
+
+Downloaded from:
+https://github.com/openwrt-mirror/openwrt/blob/f22d5e25660106a48727c7aa5d1a73e4171a7987/package/devel/oprofile/patches/100-musl.patch
+after I found a hint for the patch here:
+http://patchwork.openembedded.org/patch/112675/
+
+Removed unneeded patch for libop/op_events.c.
+
+Because openwrt removed the oprofile package from their repo last week
+https://github.com/openwrt-mirror/openwrt/commit/aaf46a8524e138e1673a398e8d2dd9357405b313#diff-fe14456f94abf436d997e2c01c10f3bd
+I decided to put this patch into the buildroot repo instead of adding
+_PATCH to oprofile.mk
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/pe_profiling/operf.cpp
++++ b/pe_profiling/operf.cpp
+@@ -857,11 +857,14 @@ static int __delete_old_previous_sample_
+                                 int tflag  __attribute__((unused)),
+                                 struct FTW *ftwbuf __attribute__((unused)))
+ {
++	int err;
++
+ 	if (remove(fpath)) {
++		err = errno;
+ 		perror("sample data removal error");
+-		return FTW_STOP;
++		return err;
+ 	} else {
+-		return FTW_CONTINUE;
++		return 0;
+ 	}
+ }
+ 
+@@ -896,7 +899,7 @@ static void convert_sample_data(void)
+ 		return;
+ 
+ 	if (!operf_options::append) {
+-                int flags = FTW_DEPTH | FTW_ACTIONRETVAL;
++                int flags = FTW_DEPTH;
+ 		errno = 0;
+ 		if (nftw(previous_sampledir.c_str(), __delete_old_previous_sample_data, 32, flags) !=0 &&
+ 				errno != ENOENT) {
-- 
2.7.0

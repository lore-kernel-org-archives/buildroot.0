From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 11:14:49 +0100
Subject: [Buildroot] [PATCH 2/2] package/oprofile: fux musl build
In-Reply-To: <1454235289-1353-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454235289-1353-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454235289-1353-2-git-send-email-bernd.kuhls@t-online.de>
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
 package/oprofile/0001-musl.patch | 53 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/oprofile/0001-musl.patch

diff --git a/package/oprofile/0001-musl.patch b/package/oprofile/0001-musl.patch
new file mode 100644
index 0000000..95ae200
--- /dev/null
+++ b/package/oprofile/0001-musl.patch
@@ -0,0 +1,53 @@
+Fix musl build
+
+Downloaded from:
+https://github.com/openwrt-mirror/openwrt/blob/f22d5e25660106a48727c7aa5d1a73e4171a7987/package/devel/oprofile/patches/100-musl.patch
+after I found a hint for the patch here:
+http://patchwork.openembedded.org/patch/112675/
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
+--- a/libop/op_events.c
++++ b/libop/op_events.c
+@@ -83,7 +83,7 @@ static int parse_hex(char const * str)
+ static u64 parse_long_hex(char const * str)
+ {
+ 	u64 value;
+-	if (sscanf(str, "%Lx", &value) != 1)
++	if (sscanf(str, "0x%llx", &value) != 1)
+ 		parse_error("expected long hexadecimal value");
+ 
+ 	fflush(stderr);
-- 
2.7.0

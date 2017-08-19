From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Aug 2017 22:55:28 +0200
Subject: [Buildroot] [PATCH 3/3] kvmtool: add patches fixing build warnings
	with musl
In-Reply-To: <20170819205528.31753-1-thomas.petazzoni@free-electrons.com>
References: <20170819205528.31753-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170819205528.31753-3-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit backports three patches that are already upstream in
kvmtool fixing build warnings with musl. Those are not strictly needed
for the build to succeed, they just reduce the amount of warning
noise.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
This is by no mean mandatory for the master branch, I'm just doing it
as I was working on kvmtool. If we don't want that for master, I'll
submit a different patch for next that bumps kvmtool to a newer
version that includes those fixes. Let me know what you think is best.
---
 .../0003-use-poll.h-instead-of-sys-poll.h.patch    | 33 ++++++++
 ...nd-use-C-library-provided-strlcpy-and-str.patch | 90 ++++++++++++++++++++++
 package/kvmtool/0005-Fix-call-to-connect.patch     | 34 ++++++++
 3 files changed, 157 insertions(+)
 create mode 100644 package/kvmtool/0003-use-poll.h-instead-of-sys-poll.h.patch
 create mode 100644 package/kvmtool/0004-check-for-and-use-C-library-provided-strlcpy-and-str.patch
 create mode 100644 package/kvmtool/0005-Fix-call-to-connect.patch

diff --git a/package/kvmtool/0003-use-poll.h-instead-of-sys-poll.h.patch b/package/kvmtool/0003-use-poll.h-instead-of-sys-poll.h.patch
new file mode 100644
index 0000000..a358569
--- /dev/null
+++ b/package/kvmtool/0003-use-poll.h-instead-of-sys-poll.h.patch
@@ -0,0 +1,33 @@
+From 19490e24895df95253e43a7aacf3ef408b830bd5 Mon Sep 17 00:00:00 2001
+From: Andre Przywara <andre.przywara@arm.com>
+Date: Fri, 17 Jul 2015 17:02:15 +0100
+Subject: [PATCH] use <poll.h> instead of <sys/poll.h>
+
+The manpage of poll(2) states that the prototype of poll is defined
+in <poll.h>. Use that header file instead of <sys/poll.h> to allow
+compilation against musl-libc.
+
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+Signed-off-by: Will Deacon <will.deacon@arm.com>
+[backport from upstream commit 52c22e6e64a94cc701d86587d32cd3822ac5c293.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ disk/core.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/disk/core.c b/disk/core.c
+index 309e16c..dd2f258 100644
+--- a/disk/core.c
++++ b/disk/core.c
+@@ -5,7 +5,7 @@
+ 
+ #include <linux/err.h>
+ #include <sys/eventfd.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ 
+ #define AIO_MAX 256
+ 
+-- 
+2.9.4
+
diff --git a/package/kvmtool/0004-check-for-and-use-C-library-provided-strlcpy-and-str.patch b/package/kvmtool/0004-check-for-and-use-C-library-provided-strlcpy-and-str.patch
new file mode 100644
index 0000000..d0591b9
--- /dev/null
+++ b/package/kvmtool/0004-check-for-and-use-C-library-provided-strlcpy-and-str.patch
@@ -0,0 +1,90 @@
+From 7a9c16dcf58ff4c8154f3a9dfa1f02ec3daa1662 Mon Sep 17 00:00:00 2001
+From: Andre Przywara <andre.przywara@arm.com>
+Date: Fri, 17 Jul 2015 17:02:16 +0100
+Subject: [PATCH] check for and use C library provided strlcpy and strlcat
+
+The musl-libc library provides implementations of strlcpy and strlcat,
+so introduce a feature check for it and only use the kvmtool
+implementation if there is no library support for it.
+This avoids clashes with the public definition.
+
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+Signed-off-by: Will Deacon <will.deacon@arm.com>
+[backport from upstream commit 8f22adc4230f07980a318ad1662fba5af0c131c1.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile                 |  5 +++++
+ config/feature-tests.mak | 10 ++++++++++
+ include/kvm/strbuf.h     |  2 ++
+ util/strbuf.c            |  2 ++
+ 4 files changed, 19 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 151fa9d..bf71db4 100644
+--- a/Makefile
++++ b/Makefile
+@@ -199,6 +199,11 @@ endif
+ # On a given system, some libs may link statically, some may not; so, check
+ # both and only build those that link!
+ 
++ifeq ($(call try-build,$(SOURCE_STRLCPY),$(CFLAGS),),y)
++	CFLAGS_DYNOPT	+= -DHAVE_STRLCPY
++	CFLAGS_STATOPT	+= -DHAVE_STRLCPY
++endif
++
+ ifeq ($(call try-build,$(SOURCE_BFD),$(CFLAGS),-lbfd -static),y)
+ 	CFLAGS_STATOPT	+= -DCONFIG_HAS_BFD
+ 	OBJS_STATOPT	+= symbol.o
+diff --git a/config/feature-tests.mak b/config/feature-tests.mak
+index 6bee6c2..03cdb42 100644
+--- a/config/feature-tests.mak
++++ b/config/feature-tests.mak
+@@ -196,3 +196,13 @@ int main(void)
+ 	return 0;
+ }
+ endef
++
++define SOURCE_STRLCPY
++#include <string.h>
++
++int main(void)
++{
++	strlcpy(NULL, NULL, 0);
++	return 0;
++}
++endef
+diff --git a/include/kvm/strbuf.h b/include/kvm/strbuf.h
+index 2beefbc..7657339 100644
+--- a/include/kvm/strbuf.h
++++ b/include/kvm/strbuf.h
+@@ -6,8 +6,10 @@
+ 
+ int prefixcmp(const char *str, const char *prefix);
+ 
++#ifndef HAVE_STRLCPY
+ extern size_t strlcat(char *dest, const char *src, size_t count);
+ extern size_t strlcpy(char *dest, const char *src, size_t size);
++#endif
+ 
+ /* some inline functions */
+ 
+diff --git a/util/strbuf.c b/util/strbuf.c
+index 99d6b0c..2c6e8ad 100644
+--- a/util/strbuf.c
++++ b/util/strbuf.c
+@@ -13,6 +13,7 @@ int prefixcmp(const char *str, const char *prefix)
+ 	}
+ }
+ 
++#ifndef HAVE_STRLCPY
+ /**
+  * strlcat - Append a length-limited, %NUL-terminated string to another
+  * @dest: The string to be appended to
+@@ -60,3 +61,4 @@ size_t strlcpy(char *dest, const char *src, size_t size)
+ 	}
+ 	return ret;
+ }
++#endif
+-- 
+2.9.4
+
diff --git a/package/kvmtool/0005-Fix-call-to-connect.patch b/package/kvmtool/0005-Fix-call-to-connect.patch
new file mode 100644
index 0000000..434ca34
--- /dev/null
+++ b/package/kvmtool/0005-Fix-call-to-connect.patch
@@ -0,0 +1,34 @@
+From d375235f49184371026791ae8f6f9dc307de8a61 Mon Sep 17 00:00:00 2001
+From: Andre Przywara <andre.przywara@arm.com>
+Date: Fri, 17 Jul 2015 17:02:14 +0100
+Subject: [PATCH] Fix call to connect()
+
+According to the manpage and the prototype the second argument to
+connect(2) is a "const struct sockaddr*", so cast our protocol
+specific type back to the super type.
+This fixes compilation on musl-libc.
+
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+Signed-off-by: Will Deacon <will.deacon@arm.com>
+[backport from upstream commit d77bd4f466f341d4b35fe8b91176ef8a37160e19.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ kvm-ipc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kvm-ipc.c b/kvm-ipc.c
+index b1c43dd..5a0b6e0 100644
+--- a/kvm-ipc.c
++++ b/kvm-ipc.c
+@@ -99,7 +99,7 @@ int kvm__get_sock_by_instance(const char *name)
+ 	strlcpy(local.sun_path, sock_file, sizeof(local.sun_path));
+ 	len = strlen(local.sun_path) + sizeof(local.sun_family);
+ 
+-	r = connect(s, &local, len);
++	r = connect(s, (struct sockaddr *)&local, len);
+ 	if (r < 0 && errno == ECONNREFUSED) {
+ 		/* Tell the user clean ghost socket file */
+ 		pr_err("\"%s\" could be a ghost socket file, please remove it",
+-- 
+2.9.4
+
-- 
2.9.4

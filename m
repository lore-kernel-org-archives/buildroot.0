From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  9 Feb 2017 18:47:54 +0100
Subject: [Buildroot] [PATCH 1/6] toolchain: add option for toolchains
	affected by GCC PR libstdc++/64735
In-Reply-To: <20170209174759.15819-1-joerg.krause@embedded.rocks>
References: <20170209174759.15819-1-joerg.krause@embedded.rocks>
Message-ID: <20170209174759.15819-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

exception_ptr, nested_exception, and future from libstdc++ are not
available for architectures not supporting always lock-free atomic ints
before GCC 7.

Bug report:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735

Fix available starting from GCC 7 (not yet released):
https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=244051

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 toolchain/toolchain-common.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 7a217b65c..0bd80c9fd 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -7,6 +7,10 @@ source "package/gdb/Config.in.host"
 
 comment "Toolchain Generic Options"
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735
+config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	bool
+
 # https://sourceware.org/bugzilla/show_bug.cgi?id=19405
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
 	bool
-- 
2.11.1

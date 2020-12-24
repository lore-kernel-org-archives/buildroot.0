From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 24 Dec 2020 11:14:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/erlang-jiffy: needs -fPIC
Message-ID: <20201224101440.3427472-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/9ac6e1bf9eaf922c0b7f869416ec33f40ed3543c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-rebar.config-add-fPIC.patch          | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/erlang-jiffy/0001-rebar.config-add-fPIC.patch

diff --git a/package/erlang-jiffy/0001-rebar.config-add-fPIC.patch b/package/erlang-jiffy/0001-rebar.config-add-fPIC.patch
new file mode 100644
index 0000000000..4809cad03b
--- /dev/null
+++ b/package/erlang-jiffy/0001-rebar.config-add-fPIC.patch
@@ -0,0 +1,43 @@
+From 18a2ec2ab855e4762c4adab9a86ec6f601e35de9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 24 Dec 2020 10:57:54 +0100
+Subject: [PATCH] rebar.config: add -fPIC
+
+Add -fPIC to avoid the following build failure:
+
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /tmp/cc0ULrdG.ltrans1.ltrans.o: relocation R_X86_64_PC32 against symbol `dec_destroy' can not be used when making a shared object; recompile with -fPIC
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: final link failed: bad value
+collect2: error: ld returned 1 exit status
+sh(/home/buildroot/autobuild/instance-3/output-1/host/bin/x86_64-linux-g++ c_src/decoder.o c_src/encoder.o c_src/jiffy.o c_src/termstack.o c_src/utf8.o c_src/util.o c_src/doubles.o c_src/objects.o c_src/double-conversion/bignum-dtoa.o c_src/double-conversion/bignum.o c_src/double-conversion/cached-powers.o c_src/double-conversion/diy-fp.o c_src/double-conversion/double-conversion.o c_src/double-conversion/fast-dtoa.o c_src/double-conversion/fixed-dtoa.o c_src/double-conversion/strtod.o  -flto -lstdc++ -flto -lstdc++ -shared  -L/home/buildroot/autobuild/instance-3/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/erlang/lib/erl_interface-3.13.1/lib -lei -o priv/jiffy.so)
+failed with return code 1 and the following output:
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /tmp/cc0ULrdG.ltrans1.ltrans.o: relocation R_X86_64_PC32 against symbol `dec_destroy' can not be used when making a shared object; recompile with -fPIC
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: final link failed: bad value
+collect2: error: ld returned 1 exit status
+
+ERROR: Command [compile] failed!
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9ac6e1bf9eaf922c0b7f869416ec33f40ed3543c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/davisp/jiffy/pull/208]
+---
+ rebar.config | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rebar.config b/rebar.config
+index b951b5e..8bff5e7 100644
+--- a/rebar.config
++++ b/rebar.config
+@@ -15,7 +15,7 @@
+         "CXXFLAGS", "$CXXFLAGS -Ic_src/ -g -Wall $FLTO_FLAG -Werror -O3"},
+ 
+     {"(linux|solaris|freebsd|netbsd|openbsd|dragonfly|darwin|gnu)",
+-        "LDFLAGS", "$LDFLAGS $FLTO_FLAG -lstdc++"},
++        "LDFLAGS", "$LDFLAGS $FLTO_FLAG -lstdc++ -fPIC"},
+ 
+     %% OS X Leopard flags for 64-bit
+     {"darwin9.*-64$", "CXXFLAGS", "-m64"},
+-- 
+2.29.2
+
-- 
2.29.2

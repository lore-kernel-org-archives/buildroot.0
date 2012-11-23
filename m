From: Ronny Meeus <ronny.meeus@gmail.com>
Date: Fri, 23 Nov 2012 14:04:24 +0100
Subject: [Buildroot] Passing arguments to the linker when external toolchain
	is used.
Message-ID: <CAMJ=MEc1T6Uz2tLS3ybdp5hwv7zX15ufGYMVuAY7jOSA+U=sYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I'm using buildroot to build an environment for MIPS (Cavium).
For this I use a 64 bit toolchain provided by Cavium as an external toolchain.

My buildroot configuration is as follows:
* Buildroot 2012.05
* Target Architecture: MIPS (big endian)
* Target Architecture Variant: mips 64
* Target ABI: n32
* glibc

In my application we need to create partially linked objects that will
be linked together in a final link step.
I see that the correct options (ABI etc) are passed to the compiler
via the ext-toolchain-wrapper construction, but for the linker this
technique is not used. It is directly invoked without modifying the
command line. If I want to create this partially linked file, I need
to pass an extra option the linker to indicate that is needs to use
the N32 abi (-melf32btsmipn32).

To make this work, I needed to make 2 changes:
- make the linker a link to the ext-toolchain-wrapper
- change the ext-toolchain-wrapper so that it passes to options to the
linker (currently the option is hardcoded but this needs to be changed
so that the BR2_TARGET_LDFLAGS are used.
Both changes are shown below.

Please comment on whether this approach is the correct one or is there
a better alternative available.

$ hg diff toolchain/toolchain-external/ext-toolchain-wrapper.c
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c
b/toolchain/toolchain-external/ext-toolchain-wrapper.c
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -19,7 +19,7 @@

 static char path[PATH_MAX] = BR_CROSS_PATH;

-static char *predef_args[] = {
+static char *predef_args_cc[] = {
        path,
        "--sysroot", BR_SYSROOT,
 #ifdef BR_ARCH
@@ -48,6 +48,11 @@ static char *predef_args[] = {
 #endif
 };

+static char *predef_args_lnk[] = {
+       path,
+       "-melf32btsmipn32",
+};
+
 static const char *get_basename(const char *name)
 {
        const char *base;
@@ -64,16 +69,24 @@ static const char *get_basename(const ch
 int main(int argc, char **argv)
 {
        char **args, **cur;
+       char **predef_args = predef_args_cc;
+       int size_args = sizeof(predef_args_cc);

-       cur = args = malloc(sizeof(predef_args) + (sizeof(char *) * argc));
+       if (strcmp(argv[0]+strlen(argv[0])-3,"-ld") == 0) {
+               predef_args = predef_args_lnk;
+               size_args = sizeof(predef_args_lnk);
+       }
+
+       cur = args = malloc(size_args + (sizeof(char *) * argc));
        if (args == NULL) {
                perror(__FILE__ ": malloc");
                return 2;
        }

        /* start with predefined args */
-       memcpy(cur, predef_args, sizeof(predef_args));
-       cur += sizeof(predef_args) / sizeof(predef_args[0]);
+       memcpy(cur, predef_args, size_args);
+       cur += size_args / sizeof(predef_args[0]);

        /* append forward args */
        memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));


diff --git a/toolchain/toolchain-external/ext-tool.mk
b/toolchain/toolchain-external/ext-tool.mk
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -440,7 +440,7 @@ endif
        for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
                base=$${i##*/}; \
                case "$$base" in \
-               *cc|*cc-*|*++|*++-*|*cpp) \
+               *cc|*cc-*|*++|*++-*|*cpp|*ld) \
                        ln -sf $(@F) $$base; \
                        ;; \
                *) \

---
Ronny

From: Will Newton <will.newton@gmail.com>
Date: Fri, 29 Oct 2010 14:18:27 +0100
Subject: [Buildroot] CFLAGS_FOR_BUILD compiler flags
Message-ID: <AANLkTim12PLkFLjAZw08vJTM5VjUWCDYPSHXM9u8cOWY@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

It looks like something changed with the flags passed when building
toolchains. In older buildroots it seems we passed "-g -O2"
explicitly:

$ grep CFLAGS_FOR_BUILD toolchain/gcc/gcc-uclibc-3.x.mk
CFLAGS_FOR_BUILD="-g -O2 $(HOST_CFLAGS)" \
CFLAGS_FOR_BUILD="-g -O2 $(HOST_CFLAGS)" \
CFLAGS_FOR_BUILD="-g -O2 $(HOST_CFLAGS)" \

Now we use TARGET_CONFIGURE_OPTS, which sets CFLAGS_FOR_BUILD for us:

$ grep CFLAGS_FOR_BUILD package/Makefile.in
CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
FCFLAGS_FOR_BUILD="$(HOST_FCFLAGS)" \

But without the -g -O2 being added. This results in the toolchain
being built without optimisations, which makes it a bit slower than it
otherwise would be (although I expect it makes building the toolchain
faster!).

CFLAGS_FOR_BUILD is currently defaulted in the top-level Makefile but
then not used. Perhaps a patch like the below would be the right thing
to do? Comments?

---

Set a default set of flags (-g -O2) for the host tools, this
prevents the tools from being built without optimisation which
improves build times considerably.

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 Makefile |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 462d974..c711f22 100644
--- a/Makefile
+++ b/Makefile
@@ -144,14 +144,14 @@ HOSTLD:=$(shell which $(HOSTLD) || type -p
$(HOSTLD) || echo ld)
 HOSTLN:=$(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
 HOSTNM:=$(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)

-ifndef CFLAGS_FOR_BUILD
-CFLAGS_FOR_BUILD:=-g -O2
+ifndef HOST_CFLAGS
+HOST_CFLAGS:=-g -O2
 endif
-ifndef CXXFLAGS_FOR_BUILD
-CXXFLAGS_FOR_BUILD:=-g -O2
+ifndef HOST_CXXFLAGS
+HOST_CXXFLAGS:=-g -O2
 endif
-ifndef FCFLAGS_FOR_BUILD
-FCFLAGS_FOR_BUILD:=-g -O2
+ifndef HOST_FCFLAGS
+HOST_FCFLAGS:=-g -O2
 endif
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD

-- 
1.7.2.2
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Makefile-Default-values-of-HOST_CFLAGS-_CXXFLAGS-and.patch
Type: text/x-patch
Size: 1219 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101029/b3fb61c4/attachment.bin>

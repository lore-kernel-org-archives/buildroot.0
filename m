From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 02 May 2014 10:02:38 +0200
Subject: [Buildroot] [PATCH v4] manual/configure.txt: fix C++ escaping
Message-ID: <330afb14854c4fbd104f.1399017758@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For asciidoc, a string like '+these are some words+' will be displayed in
monospace font. Such sequences are identified by searching for a matching
pair of + signs in the same block.

The string 'C++' also contains such + signs. In most cases, this does not
pose a problem and no escaping is necessary. However, if 'C++' occurs twice
in the same block, the + signs will be matched to each other, and asciidoc
formats all text between them as monospaced text. In this case, escaping of
one of these 'C++' occurances is necessary to get the right formatting.

In one place of the manual, there is a sentence that causes such a problem:
    "you only have to tell whether your toolchain supports C++ or not and
    whether it has built-in RPC support. If your external toolchain uses
    the 'uClibc' library, then you have to tell Buildroot if it supports
    largefile, IPv6, RPC, wide-char, locale, program invocation, threads
    and C++."

Commit 082dec8ce440236b1477e568f0965f05ad241adb was based on a patch fixing
this problem in one place of the manual, but was incorrectly changed while
committing.

This patch reverts the incorrect changes in that commit, and solves the
problem correctly.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v4:
 - (ThomasDS) update commit message
v3:
 - rebase on top of the master
v2:
 - remove only one backslash

 docs/manual/configure.txt |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -100,7 +100,7 @@ most important ones allow to:
    toolchain should have largefile support (i.e. support for files
    larger than 2 GB on 32 bits systems), IPv6 support, RPC support
    (used mainly for NFS), wide-char support, locale support (for
-   internationalization), C\++ support or thread support. Depending on
+   internationalization), C++ support or thread support. Depending on
    which options you choose, the number of userspace applications and
    libraries visible in Buildroot menus will change: many applications
    and libraries require certain toolchain options to be enabled. Most
@@ -165,7 +165,7 @@ Then, you have three solutions to use an
   prefix+ and +External toolchain C library+ options. Then, you have
   to tell Buildroot what your external toolchain supports. If your
   external toolchain uses the 'glibc' library, you only have to tell
-  whether your toolchain supports C++ or not and whether it has
+  whether your toolchain supports C\++ or not and whether it has
   built-in RPC support. If your external toolchain uses the 'uClibc'
   library, then you have to tell Buildroot if it supports largefile,
   IPv6, RPC, wide-char, locale, program invocation, threads and

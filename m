From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 May 2014 10:48:45 +0200
Subject: [Buildroot] [git commit] manual/configure.txt: fix C++ escaping
Message-ID: <20140502103007.3817E9CABE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4109a20beaaacafaa30b3b67e732e78f10352771
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/configure.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 0f755fc..da4bdb0 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -97,7 +97,7 @@ most important ones allow to:
    toolchain should have largefile support (i.e. support for files
    larger than 2 GB on 32 bits systems), IPv6 support, RPC support
    (used mainly for NFS), wide-char support, locale support (for
-   internationalization), C\++ support or thread support. Depending on
+   internationalization), C++ support or thread support. Depending on
    which options you choose, the number of userspace applications and
    libraries visible in Buildroot menus will change: many applications
    and libraries require certain toolchain options to be enabled. Most
@@ -161,7 +161,7 @@ Then, you have three solutions to use an external toolchain:
   prefix+ and +External toolchain C library+ options. Then, you have
   to tell Buildroot what your external toolchain supports. If your
   external toolchain uses the 'glibc' library, you only have to tell
-  whether your toolchain supports C++ or not and whether it has
+  whether your toolchain supports C\++ or not and whether it has
   built-in RPC support. If your external toolchain uses the 'uClibc'
   library, then you have to tell Buildroot if it supports largefile,
   IPv6, RPC, wide-char, locale, program invocation, threads and

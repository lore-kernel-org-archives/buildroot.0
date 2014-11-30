From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Nov 2014 23:56:14 +0100
Subject: [Buildroot] [git commit] infra: do not append an empty
	LD_LIBRARY_PATH
Message-ID: <20141130231214.E3AA97FF39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=514d7cab61ce908d567a1144efa02b3352480196
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we set LD_LIBRARY_PATH when building our host tools, we append any
pre-existing value to our custom path:
        LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"

But then if LD_LIBRARY_PATH was previously empty, we end up with an
LD_LIBRARY_PATH that ends with a colon.

Also, when we check that an existing LD_LIBRARY_PATH does not contain
CWD, we previously did not look for a zero-length prefix.

Since 'man ld.so' says of LD_LIBRARY_PATH:
    A colon-separated list of directories in which to search for ELF
    libraries at execution-time. Similar to the PATH environment
    variable.

And POSIX states about PATH:
    A zero-length prefix is a legacy feature that indicates the current
    working directory.

And bash also recognises a zero-length prefix to search in CWD:
    A zero-length (null) directory name in the value of PATH indicates
    the current directory.

We may thus end up on a system where a zero-length prefix in
LD_LIBRARY_PATH is interpreted as CWD.

Do not append the previous LD_LIBRARY_PATH if it was empty, and check
for a zero-length prefix when checking dependencies.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in                  |    4 ++--
 support/dependencies/dependencies.sh |    3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index df39afd..36ecf0b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -307,11 +307,11 @@ HOST_CONFIGURE_OPTS = PATH=$(BR_PATH) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
-		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
 		INTLTOOL_PERL=$(PERL)
 
 HOST_MAKE_ENV = PATH=$(BR_PATH) \
-		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index a9c5b31..af5ce0e 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -14,8 +14,11 @@ fi
 # sanity check for CWD in LD_LIBRARY_PATH
 # try not to rely on egrep..
 if test -n "$LD_LIBRARY_PATH" ; then
+	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep '::' >/dev/null 2>&1 ||
 	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep ':\.:' >/dev/null 2>&1 ||
+	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep 'TRiGGER_start:' >/dev/null 2>&1 ||
 	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep 'TRiGGER_start\.:' >/dev/null 2>&1 ||
+	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep ':TRiGGER_end' >/dev/null 2>&1 ||
 	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep ':\.TRiGGER_end' >/dev/null 2>&1 ||
 	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep 'TRiGGER_start\.TRiGGER_end' >/dev/null 2>&1
 	if test $? = 0; then

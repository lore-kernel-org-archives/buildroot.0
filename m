From: Vincent Fazio <vfazio@xes-inc.com>
Date: Mon, 17 Aug 2020 14:27:12 -0500
Subject: [Buildroot] [PATCH 1/1] package/ibm-sw-tpm2: fix glibc build errors
Message-ID: <20200817192712.32481-1-vfazio@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vincent Fazio <vfazio@gmail.com>

In order to not have to define all architecture bitness variants in
src/LibSupport.h to conditionally define RADIX_BITS, a patch was created
to depend on LONG_BIT being defined via limits.h

For glibc, LONG_BIT is behind a _XOPEN_SOURCE define guard so patch the
makefile to define this macro as well as _DEFAULT_SOURCE.

Defining _XOPEN_SOURCE requires _DEFAULT_SOURCE to be explicitly defined
for builds to succeed as it is no longer impliclty defined when
_XOPEN_SOURCE is defined.

Fixes:
	http://autobuild.buildroot.net/results/bc145dd23c80a0660300766d0c114a00ed2e52b6/
	http://autobuild.buildroot.net/results/1d84e70c30d4d0719274aa4f3edc01772beb24a3/

Fixes: 19bd089004 ("package/ibm-sw-tpm2: fix patch to address musl builds")

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 package/ibm-sw-tpm2/0002-Add-required-defines.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/0002-Add-required-defines.patch

diff --git a/package/ibm-sw-tpm2/0002-Add-required-defines.patch b/package/ibm-sw-tpm2/0002-Add-required-defines.patch
new file mode 100644
index 0000000000..c9e2f19bd2
--- /dev/null
+++ b/package/ibm-sw-tpm2/0002-Add-required-defines.patch
@@ -0,0 +1,11 @@
+--- a/src/makefile
++++ b/src/makefile
+@@ -46,6 +46,8 @@ CCFLAGS = -Wall  			\
+ 	 -c -ggdb -O0 			\
+ 	-DTPM_POSIX			\
+ 	-D_POSIX_			\
++	-D_DEFAULT_SOURCE		\
++	-D_XOPEN_SOURCE			\
+ 	-DTPM_NUVOTON
+ 
+ # add this line for big endian platforms
-- 
2.28.0

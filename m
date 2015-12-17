From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 23:48:02 +0100
Subject: [Buildroot] [git commit] sysvinit: arm64 build fix
Message-ID: <20151217224947.2865182571@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c93805207e24df082495f4d050bc2f29f3d19dd6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sysvinit was not able to be built for arm64 architectures.
The package patch was changed according to the suggestion of
Thomas Petazzoni.

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sysvinit/0001-fix-libcrypt-test.patch | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/sysvinit/0001-fix-libcrypt-test.patch b/package/sysvinit/0001-fix-libcrypt-test.patch
index 207270d..6c22436 100644
--- a/package/sysvinit/0001-fix-libcrypt-test.patch
+++ b/package/sysvinit/0001-fix-libcrypt-test.patch
@@ -6,12 +6,15 @@ Index: b/src/Makefile
 ===================================================================
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -78,7 +78,7 @@
+@@ -78,8 +78,9 @@ else
  endif
  
  # Additional libs for GNU libc.
 -ifneq ($(wildcard /usr/lib*/libcrypt.a),)
-+ifneq ($(wildcard $(SYSROOT)/usr/lib*/libcrypt.a),)
-   SULOGINLIBS	+= -lcrypt
+-  SULOGINLIBS	+= -lcrypt
++HAS_LIBCRYPT=$(shell f=`mktemp` && echo 'int main(void) {}' | $(CC) -o $$f -xc - -lcrypt >/dev/null 2>&1 && echo yes; rm -f $$f)
++ifeq ($(HAS_LIBCRYPT),yes)
++  SULOGINLIBS += -lcrypt
  endif
  
+ all:		$(BIN) $(SBIN) $(USRBIN)

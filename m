From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Wed, 16 Dec 2015 15:21:38 +0000
Subject: [Buildroot] [PATCH v2] sysvinit: arm64 build fix
Message-ID: <875368a848cb37f12c0c13638c987ce0f7783700.1442850883.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sysvinit was not able to be built for arm64 architectures.
The package patch was changed according to the suggestion of 
Thomas Petazzoni.

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
---
 package/sysvinit/0001-fix-libcrypt-test.patch | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/sysvinit/0001-fix-libcrypt-test.patch b/package/sysvinit/0001-fix-libcrypt-test.patch
index 207270d..3724110 100644
--- a/package/sysvinit/0001-fix-libcrypt-test.patch
+++ b/package/sysvinit/0001-fix-libcrypt-test.patch
@@ -1,17 +1,20 @@
 Make the libcrypt test somewhat cross-compilation compliant
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
 Index: b/src/Makefile
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
-- 
1.8.1.5

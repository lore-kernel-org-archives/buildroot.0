From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 21 Jan 2017 20:13:14 +0100
Subject: [Buildroot] [PATCH] package/hplip: fix build by bumping to version
	3.16.11
Message-ID: <20170121191314.11474-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adjust patch #2 to apply successfully.

Fixes:
http://autobuild.buildroot.net/results/bee/beea88e0848ccabcafe6b92c2a69074ed1114225/
http://autobuild.buildroot.net/results/4ba/4ba68d3e6764f395f3314c46c4d06b101c23479c/
http://autobuild.buildroot.net/results/345/3455044679a497fbee72378e59178724305720d9/
.. and many more.

The previous version 3.15.11 failed to build because of:

```
hpijs/hpcupsfax.cpp: In function 'int main(int, char**)':
prnt/hpijs/hpcupsfax.cpp:651:5: error: 'ppd_file_t' was not declared in
this scope
     ppd_file_t          *ppd;
     ^
```

`ppd_file_t` is defined in "cups/ppd.h" which was not included in 3.15.11, but
is in 3.16.11.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch | 2 +-
 package/hplip/hplip.hash                                        | 2 +-
 package/hplip/hplip.mk                                          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch b/package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch
index 7c7538d1a..814749017 100644
--- a/package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch
+++ b/package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch
@@ -23,7 +23,7 @@ index 8b06428..680cad5 100755
 @@ -27,8 +27,7 @@
  
  #AC_PREREQ(2.59)
- AC_INIT([HP Linux Imaging and Printing], [3.15.11], [3.15.11], [hplip])
+ AC_INIT([HP Linux Imaging and Printing], [3.16.11], [3.16.11], [hplip])
 -#AM_INIT_AUTOMAKE([1.9 foreign])
 -AM_INIT_AUTOMAKE
 +AM_INIT_AUTOMAKE([1.9 foreign subdir-objects])
diff --git a/package/hplip/hplip.hash b/package/hplip/hplip.hash
index 75ff7d3d0..9dfb7a2ad 100644
--- a/package/hplip/hplip.hash
+++ b/package/hplip/hplip.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  33c4711bde04a34b81f3f70e6277a0375dded171469e5aa8b9cef1a14a407c6d  hplip-3.15.11.tar.gz
+sha256  f6e20cacb4891e4e60fc5de2213a10f8d0c68840f9b511aa38cfca0cb29f9b24  hplip-3.16.11.tar.gz
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index d70e2e926..9a2c9db02 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HPLIP_VERSION = 3.15.11
+HPLIP_VERSION = 3.16.11
 HPLIP_SITE = http://downloads.sourceforge.net/hplip/hplip
 HPLIP_AUTORECONF = YES
 HPLIP_DEPENDENCIES = cups libusb jpeg host-pkgconf
-- 
2.11.0

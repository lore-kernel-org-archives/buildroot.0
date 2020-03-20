From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 20 Mar 2020 15:23:58 -0700
Subject: [Buildroot] [PATCH 1/2] package/gobject-introspection/g-ir-scanner:
 do not set default compiler values
Message-ID: <20200320222359.88689-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Commit 8b0aeafce2a22913e6a44818227f6a39e3225157 set 7 new variables in
g-ir-scanner.in:

export CPP="${CPP:-${HOST_DIR}/bin/@BASENAME_TARGET_CPP@}"
export CC="${CC:-${HOST_DIR}/bin/@BASENAME_TARGET_CC@}"
export CXX="${CXX:-${HOST_DIR}/bin/@BASENAME_TARGET_CXX@}"
CPPFLAGS="${CPPFLAGS:- at TARGET_CPPFLAGS@}"
CFLAGS="${CFLAGS:- at TARGET_CFLAGS@}"
CXXFLAGS="${CXXFLAGS:- at TARGET_CXXFLAGS@}"
LDFLAGS="${LDFLAGS:- at TARGET_LDFLAGS@}"

However, defaulting to CPP, CC, or CXX breaks some packages because they may
hard code CC to the system CC.

One such package is libostree which has the line
"INTROSPECTION_SCANNER_ENV = CC=gcc" in the Makefile.

Because g-ir-scanner defaults CC to a predefined CC instead of explicitly
overwriting it, the CC passed from the makefile is used, and linking errors
occur as a result.

Remove the defaults for the following and explicitly set the paths to the
proper cross-toolchain binaries:
CPP, CC, CXX

Fixes
http://autobuild.buildroot.org/results/f8a14307e6feff61acd963d6cd2aac289e6d1647

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gobject-introspection/g-ir-scanner.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gobject-introspection/g-ir-scanner.in b/package/gobject-introspection/g-ir-scanner.in
index 22df7be309..6fc495389e 100644
--- a/package/gobject-introspection/g-ir-scanner.in
+++ b/package/gobject-introspection/g-ir-scanner.in
@@ -5,9 +5,9 @@
 # the variables blank (LDFLAGS, CFLAGS, and CPPFLAGS.)
 # Export these variables to ensure all build systems can generate .gir and
 # .typelib files properly.
-export CPP="${CPP:-${HOST_DIR}/bin/@BASENAME_TARGET_CPP@}"
-export CC="${CC:-${HOST_DIR}/bin/@BASENAME_TARGET_CC@}"
-export CXX="${CXX:-${HOST_DIR}/bin/@BASENAME_TARGET_CXX@}"
+export CPP="${HOST_DIR}/bin/@BASENAME_TARGET_CPP@"
+export CC="${HOST_DIR}/bin/@BASENAME_TARGET_CC@"
+export CXX="${HOST_DIR}/bin/@BASENAME_TARGET_CXX@"
 export CPPFLAGS="${CPPFLAGS:- at TARGET_CPPFLAGS@}"
 export CFLAGS="${CFLAGS:- at TARGET_CFLAGS@}"
 export CXXFLAGS="${CXXFLAGS:- at TARGET_CXXFLAGS@}"
-- 
2.25.1

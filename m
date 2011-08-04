From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Aug 2011 21:34:24 +0200
Subject: [Buildroot] [PATCH] package: fix <pkg>_DL_VERSION value
Message-ID: <1312486464-29590-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

993e51bc22f508fbaf39c5c49fd0595fc5c56013 introduced a <pkg>_DL_VERSION
in addition to <pkg>_VERSION. This variable, purely internal to the
package infrastructure, allows to store the *raw* version name, as
defined in the package .mk file. However, as this version string can
contain slashes, it is not appropriate to be part of the build
directory name of the package. This is why <pkg>_VERSION is defined to
be the same thing as <pkg>_DL_VERSION, except that slashes are
replaced by underscores.

However, the initial implementation didn't take into account the case
of host packages. So 763822e874fd8d39b591feaa9639f76183897fb7 was
committed to fix this. But unfortunately, this commit got it wrong
again: it forgot the case where <pkg>_VERSION is set, but not
HOST_<pkg>_VERSION. In this case, HOST_<pkg>_DL_VERSION remained
empty. This can be seen for example by building host-sstrip.

This problem has been noticed by Julien Boibessot
<julien.boibessot@free.fr>, who also helped in fixing the
issue. Thanks!

The fix is simply to ensure that <pkg>_DL_VERSION is properly set in
all cases: when HOST_<pkg>_VERSION is defined, when only <pkg>_VERSION
is defined, and when no version is defined.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 90530dc..868bf28 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -366,15 +366,17 @@ $(2)_NAME			=  $(1)
 # sanitize the package version that is used in paths, directory and file names.
 # Forward slashes may appear in the package's version when pointing to a
 # version control system branch or tag, for example remotes/origin/1_10_stable.
-$(2)_DL_VERSION	= $($(2)_VERSION)
 ifndef $(2)_VERSION
  ifdef $(3)_VERSION
-  $(2)_VERSION = $($(3)_VERSION)
+  $(2)_DL_VERSION = $($(3)_VERSION)
+  $(2)_VERSION = $(subst /,_,$($(3)_VERSION))
  else
   $(2)_VERSION = undefined
+  $(2)_DL_VERSION = undefined
  endif
 else
- $(2)_VERSION = $(subst /,_,$($(2)_VERSION))
+  $(2)_DL_VERSION = $($(2)_VERSION)
+  $(2)_VERSION = $(subst /,_,$($(2)_VERSION))
 endif
 
 $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
-- 
1.7.4.1

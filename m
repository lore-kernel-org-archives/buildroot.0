From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 16:21:19 +0100
Subject: [Buildroot] [git commit] pkg-python: improve error handling
Message-ID: <20131215152212.05E889C028@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27bc8868f245e0ff358804f68a8c3de7e9224fbd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make the python packing a bit easier to use by providing a detailed error
message if <pkg>_SETUP_TYPE isn't set to a valid value.

At the same time adjust the error message used when <pkg>_SETUP_TIME isn't
set to list the exact variable name that should be set, and don't talk about
'Unknown' as it isn't printed when the variable isn't set (or is set to the
empty string).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index e436f22..5f137d5 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -94,7 +94,7 @@ ifndef $(2)_SETUP_TYPE
  ifdef $(3)_SETUP_TYPE
   $(2)_SETUP_TYPE = $($(3)_SETUP_TYPE)
  else
-  $$(error "$(1): Unknown or undefined <pkg>_SETUP_TYPE")
+  $$(error "$(2)_SETUP_TYPE must be set")
  endif
 endif
 
@@ -124,6 +124,8 @@ $(2)_BASE_BUILD_TGT   = build
 $(2)_BASE_BUILD_OPT   =
 $(2)_BASE_INSTALL_OPT = $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT)
 endif
+else
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils' or 'setuptools'")
 endif
 
 # The below statement intends to calculate the dependencies of host

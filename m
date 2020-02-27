From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 22:02:04 +0100
Subject: [Buildroot] [git commit] package/swig: create a legacy symlink for
 swig3.0
Message-ID: <20200227210134.03A2B8041E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=738cefe7000758385adcfee514a4b9fb4354535d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-swig package installs the swig binary as 'swig' and adds a
swig<major> symlink (E.G.  swig4.0).  This causes issues for older software
which may not know about the 4.0 version of swig, E.G.  CMake 3.10.x
contains the following swig detection logic:

find_program(SWIG_EXECUTABLE NAMES swig3.0 swig2.0 swig)

If the host has a 3.x or 2.x variant of swig installed, then that will be
used instead of our host-swig.

As a workaround, also add a swig3.0 symlink so our host-swig will be used.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Peter: reworded]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swig/swig.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 3dba3425cf..5881a0e423 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -27,6 +27,7 @@ SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 
 define HOST_SWIG_INSTALL_SYMLINK
 	ln -fs swig $(HOST_DIR)/bin/swig$(SWIG_VERSION_MAJOR)
+	ln -fs swig $(HOST_DIR)/bin/swig3.0
 endef
 
 HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_SYMLINK

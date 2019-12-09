From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon,  9 Dec 2019 11:10:26 -0600
Subject: [Buildroot] [PATCH 1/1] package/lirc-tools: use single quote with
 SETUPTOOLS_ENV
Message-ID: <20191209171027.22631-1-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the change to pkg-python to use TARGET_CONFIGURE_OPTS in
PKG_PYTHON_SETUPTOOLS_ENV in commit 1745fcde74, the
LIRC_TOOLS_MAKE_ENV is incorrect as it sets the SETUPTOOLS_ENV using
double quotes. This causes issues because the
PKG_PYTHON_SETUPTOOLS_ENV contain double quotes as well. This causes a
build error such as:

  /bin/sh: -I/home/naourr/work/instance-0/output-1/host/include
          CXXFLAGS_FOR_BUILD=-O2: No such file or directory

Fix this by using single quotes with PKG_PYTHON_SETUPTOOLS_ENV instead
of double quotes.

Fixes:
  http://autobuild.buildroot.net/results/f7a9c02add9bde563c7289f7c0be2cb7aefd96b8

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
---
 package/lirc-tools/lirc-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index e468f2a25d..d66f4e9925 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -47,7 +47,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIRC_TOOLS_DEPENDENCIES += python3 host-python3-setuptools
-LIRC_TOOLS_MAKE_ENV += SETUPTOOLS_ENV="$(PKG_PYTHON_SETUPTOOLS_ENV)"
+LIRC_TOOLS_MAKE_ENV += SETUPTOOLS_ENV='$(PKG_PYTHON_SETUPTOOLS_ENV)'
 endif
 
 define LIRC_TOOLS_INSTALL_INIT_SYSV
-- 
2.17.1

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 17:18:11 +0200
Subject: [Buildroot] [git commit] python-treq: add missing
	BR2_INSTALL_LIBSTDCPP dependency
Message-ID: <20160524151833.1C06E8049D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4eed1ac0c47a0165d42be30f1731b85baa0a122d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-treq selects python-pyopenssl, which depends on C++ support, but
this dependency was not propagated to python-treq, causing the following
kconfig warning:

warning: (BR2_PACKAGE_PYTHON_TREQ) selects BR2_PACKAGE_PYTHON_PYOPENSSL which has unmet direct dependencies ((BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3) && BR2_INSTALL_LIBSTDCPP)

This commit fixes that by adding the appropriate dependency.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: add Config.in comment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-treq/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index a8590a9..4a23737 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -5,9 +5,13 @@ config BR2_PACKAGE_PYTHON_TREQ
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
 	help
 	  treq is an HTTP library inspired by requests but written on
 	  top of Twisted's Agents.  It provides a simple, higher level
 	  API for making HTTP requests when using Twisted.
 
 	  https://github.com/twisted/treq
+
+comment "python-treq needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP

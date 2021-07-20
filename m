From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 12:08:28 +0200
Subject: [Buildroot] [PATCH] package/python-pysftp: add missing C++
 dependency from paramiko
Message-ID: <20210720100828.421187-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

python-paramiko has a dependency on C++ support, which was added in
commit 2d7b73cf75daedd4a198a75546308fedae7c9467 in 2016.

When python-pysftp was added in commit
3b920487bad119abf5bfb10a237cedd3b5278c10 in 2020, this C++ dependency
was not propagated, even though python-pysftp selects python-paramiko.

This commit fixes this issue by propagating the dependency, which
fixes this warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PARAMIKO
  Depends on [n]: (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y] && BR2_INSTALL_LIBSTDCPP [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_PYSFTP [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y]

That occurs with configuration with C++ disabled, but python-pysftp
enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pysftp/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-pysftp/Config.in b/package/python-pysftp/Config.in
index de2d2df63d..5d5b731f33 100644
--- a/package/python-pysftp/Config.in
+++ b/package/python-pysftp/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_PYTHON_PYSFTP
 	bool "python-pysftp"
 	depends on BR2_PACKAGE_PYTHON3 # python-paramiko -> python-bcrypt
+	depends on BR2_INSTALL_LIBSTDCPP # python-paramiko
 	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
 	help
 	  A friendly face on SFTP.
 
 	  https://bitbucket.org/dundeemt/pysftp
+
+comment "python-pysftp needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.31.1

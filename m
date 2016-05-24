From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 17:15:29 +0200
Subject: [Buildroot] [git commit] python-service-identity: add missing
	BR2_INSTALL_LIBSTDCPP dependency
Message-ID: <20160524151833.1106A81F0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=518cb7ff03ceb0bbc7aa6eb6fafbf43d1e3025b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-service-identity selects python-pyopenssl and python-pyasn, both
of which depend on C++ support, but this dependency was not propagated
to python-service-identity causing the following kconfig warning:

warning: (BR2_PACKAGE_PYTHON_SERVICE_IDENTITY) selects BR2_PACKAGE_PYTHON_PYOPENSSL which has unmet direct dependencies ((BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3) && BR2_INSTALL_LIBSTDCPP)
warning: (BR2_PACKAGE_PYTHON_SERVICE_IDENTITY) selects BR2_PACKAGE_PYTHON_PYASN which has unmet direct dependencies ((BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3) && BR2_INSTALL_LIBSTDCPP)
warning: (BR2_PACKAGE_PYTHON_SERVICE_IDENTITY) selects BR2_PACKAGE_PYTHON_PYASN_MODULES which has unmet direct dependencies ((BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3) && BR2_INSTALL_LIBSTDCPP)

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: add Config.in comment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-service-identity/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index e2200f6..c9cbb6c 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -4,7 +4,11 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	select BR2_PACKAGE_PYTHON_PYASN # runtime
 	select BR2_PACKAGE_PYTHON_PYASN_MODULES # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-pyasn
 	help
 	  Service identity verification for pyOpenSSL.
 
 	  https://pypi.python.org/pypi/service_identity
+
+comment "python-service-identify needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP

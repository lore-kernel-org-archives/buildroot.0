From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 22:29:46 +0100
Subject: [Buildroot] [git commit] python-crossbar: propagate missing
	dependencies
Message-ID: <20160310213529.997B48185E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5ac4b329f4fb913715e0941e4cca6e889ed643c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-crossbar selects python-msgpack which selects msgpack, which
depends on C++ and 4-byte __sync intrinsics. But python-crossbar does
not have the dependencies propagated.

Fixes:

  http://autobuild.buildroot.org/results/80f58b7264139dd82c690cb8aae97349aa412539/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-crossbar/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 84c65c1..4e613db 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -29,9 +29,15 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_TWISTED
 	select BR2_PACKAGE_PYTHON_UJSON
 	select BR2_PACKAGE_PYTHON_WSACCEL
+	depends on BR2_INSTALL_LIBSTDCPP # python-msgpack -> msgpack
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # python-msgpack -> msgpack
 	help
 	  Crossbar.io is an open-source WAMP application router that
 	  allows to build advanced applications from loosely-coupled
 	  components that can talk in real-time with each other.
 
 	  https://pypi.python.org/pypi/crossbar
+
+comment "python-crossbar needs a toolchain w/ C++"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP

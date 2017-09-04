From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Sep 2017 22:45:25 +0200
Subject: [Buildroot] [git commit branch/2017.02.x]
	package/python-service-identity: the attrs distribution is required
Message-ID: <20170904205601.88FBA8211C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80c457604f0bee1a11d2fe7113f2c886f7fd99ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Apparently the service identify code requires the python attrs
to be availabe:

Traceback (most recent call last):
  File "/opt/exablox/bin/configsrv", line 5, in <module>
    from pkg_resources import load_entry_point
  File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3138, in <module>
    @_call_aside
  File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3124, in _call_aside
    f(*args, **kwargs)
  File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3151, in _initialize_master_working_set
    working_set = WorkingSet._build_master()
  File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 661, in _build_master
    ws.require(__requires__)
  File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 962, in require
    needed = self.resolve(parse_requirements(requirements))
  File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 849, in resolve
    raise DistributionNotFound(req, requirers)
pkg_resources.DistributionNotFound: The 'attrs' distribution was not found and is required by service-identity

Signed-off-by: Charles Hardin <ckhardin@exablox.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 49229b157c30646b8961c64419921af0aa54024b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-service-identity/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index c9cbb6c..73593b0 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	bool "python-service-identity"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-pyasn
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_CHARACTERISTIC # runtime
 	select BR2_PACKAGE_PYTHON_PYASN # runtime
 	select BR2_PACKAGE_PYTHON_PYASN_MODULES # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-pyasn
 	help
 	  Service identity verification for pyOpenSSL.
 

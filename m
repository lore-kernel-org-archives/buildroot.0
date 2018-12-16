From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:58:06 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/docker-compose:
 add patch to allow recent 2.x releases of python-requests
Message-ID: <20181216215437.B9F1680294@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f38ab949d607fb798d2241f2d5abf38b69487565
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

setup.py explicitly listed a maximum allowed version of python-requests,
causing runtime failures with the python-requests version we have:

Loaded image: docker-enp.bin.cloud.barco.com/eis/baseos-docker-snmp:0.1.0
Traceback (most recent call last):
  File "/usr/bin/docker-compose", line 6, in <module>
    from pkg_resources import load_entry_point
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3123, in <module>
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3107, in _call_aside
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3136, in _initialize_master_working_set
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 580, in _build_master
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 593, in _build_from_requirements
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 781, in resolve
pkg_resources.DistributionNotFound: The 'requests!=2.11.0,!=2.12.2,!=2.18.0,<2.19,>=2.6.1' distribution was not found and is required by docker-compose
FAIL

Upstream regularly updates setup.py as new python-requests releases are
made, but it is unknown why new python-requests releases (which are supposed
to be backwards compatible) should not be allowed right away.

Add a path submitted upstream to only disallow new major versions, similar
to how the other dependencies are handled.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 53261d8082692aa62bdbf7edcaba163f81590a8c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...py-allow-all-recent-2.x-requests-releases.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/docker-compose/0001-setup.py-allow-all-recent-2.x-requests-releases.patch b/package/docker-compose/0001-setup.py-allow-all-recent-2.x-requests-releases.patch
new file mode 100644
index 0000000000..1378c3b81a
--- /dev/null
+++ b/package/docker-compose/0001-setup.py-allow-all-recent-2.x-requests-releases.patch
@@ -0,0 +1,34 @@
+From a79152d1d621ea9d477ecc6862a03cae80b2425b Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Sat, 15 Dec 2018 14:04:57 +0100
+Subject: [PATCH] setup.py: allow all recent 2.x requests releases
+
+Instead of having to update this for each new requests release.
+
+It it not quite clear why the restriction was added in the first place in
+commit b0480b4d04e (Bump SDK version to latest), but change it to simply
+disallow the upcoming 3.0 release to match what is done for the other
+modules.
+
+Submitted upstream: https://github.com/docker/compose/pull/6415
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 96530726..3c8c7d0e 100644
+--- a/setup.py
++++ b/setup.py
+@@ -33,7 +33,7 @@ install_requires = [
+     'cached-property >= 1.2.0, < 2',
+     'docopt >= 0.6.1, < 0.7',
+     'PyYAML >= 3.10, < 4',
+-    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.19',
++    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 3.0',
+     'texttable >= 0.9.0, < 0.10',
+     'websocket-client >= 0.32.0, < 1.0',
+     'docker >= 3.1.4, < 4.0',
+-- 
+2.11.0
+

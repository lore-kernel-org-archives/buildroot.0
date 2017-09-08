From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  8 Sep 2017 10:38:16 +0200
Subject: [Buildroot] [PATCH] python-paho-mqtt: bump to version 1.3.0
Message-ID: <20170908083816.24876-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Change setup type to setuptools.

Add a patch removing the pytest-runner dependency. The patch was sent
upstream.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...e-pytest-runner-a-conditional-requirement.patch | 30 ++++++++++++++++++++++
 package/python-paho-mqtt/python-paho-mqtt.hash     |  4 +--
 package/python-paho-mqtt/python-paho-mqtt.mk       |  6 ++---
 3 files changed, 35 insertions(+), 5 deletions(-)
 create mode 100644 package/python-paho-mqtt/0001-Make-pytest-runner-a-conditional-requirement.patch

diff --git a/package/python-paho-mqtt/0001-Make-pytest-runner-a-conditional-requirement.patch b/package/python-paho-mqtt/0001-Make-pytest-runner-a-conditional-requirement.patch
new file mode 100644
index 0000000000..b2fbe246cb
--- /dev/null
+++ b/package/python-paho-mqtt/0001-Make-pytest-runner-a-conditional-requirement.patch
@@ -0,0 +1,30 @@
+From 38373d36094b5a708c595f8c560d14e8ab61aac6 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Fri, 8 Sep 2017 08:58:31 +0200
+Subject: [PATCH] Make pytest-runner a conditional requirement
+
+Check for pytest-runner only if setup.py was invoked with 'test'
+argument.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ setup.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 85d9c5f..10fb6df 100644
+--- a/setup.py
++++ b/setup.py
+@@ -12,7 +12,8 @@ with open('README.rst', 'rb') as readme_file:
+ 
+ requirements = []
+ test_requirements = ['pytest', 'pylama']
+-setup_requirements = ['pytest-runner']
++needs_pytest = set(['pytest', 'test', 'ptr']).intersection(sys.argv)
++setup_requirements = ['pytest-runner'] if needs_pytest else []
+ 
+ if sys.version_info < (3, 0):
+     test_requirements += ['mock']
+-- 
+2.11.0
+
diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
index 6cb3cc2bf0..9add16d5c8 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.hash
+++ b/package/python-paho-mqtt/python-paho-mqtt.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/paho-mqtt/json, sha256 locally computed
-md5	241150b3fcb920ddca4d33181f3238b1  paho-mqtt-1.2.tar.gz
-sha256	9100a6aa706ab699d414ec02705a21eb66f436184691d0bf1f2a85a6213c6c1f  paho-mqtt-1.2.tar.gz
+md5	b9338236e2836e8579ef140956189cc4  paho-mqtt-1.3.0.tar.gz
+sha256	2c9ef5494cfc1e41a9fff6544c5a2cd59ea5d401d9119a06ecf7fad6a2ffeb93  paho-mqtt-1.3.0.tar.gz
diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
index f0c27295e1..b87b37aa9a 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.mk
+++ b/package/python-paho-mqtt/python-paho-mqtt.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PAHO_MQTT_VERSION = 1.2
+PYTHON_PAHO_MQTT_VERSION = 1.3.0
 PYTHON_PAHO_MQTT_SOURCE = paho-mqtt-$(PYTHON_PAHO_MQTT_VERSION).tar.gz
-PYTHON_PAHO_MQTT_SITE = https://pypi.python.org/packages/82/d9/7064d3a0a1d62756a1a809c85b99f864c641b66de84c15458f72193b7708
+PYTHON_PAHO_MQTT_SITE = https://pypi.python.org/packages/33/7f/3ce1ffebaa0343d509aac003800b305d821e89dac3c11666f92e12feca14
 PYTHON_PAHO_MQTT_LICENSE = EPL-1.0 or EDLv1.0
 PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt edl-v10 epl-v10
-PYTHON_PAHO_MQTT_SETUP_TYPE = distutils
+PYTHON_PAHO_MQTT_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.11.0

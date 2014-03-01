From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 13:06:18 +0100
Subject: [Buildroot] [git commit] python, python3: fix unicodedata enabling
Message-ID: <20140301120708.B33249BC87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bec21dcfa7042d1f7065cf467c4f9c777f0fd072
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A confusion was made when applying commit
c3d539b53ff0533e91ae849dbdcdd589b0fec0cc ('host python/python3:
conditionally disable unicodedata') and then commit
73293e88c828c9bddc0b684a4603f86f70f8e876 ('python, python3: enable
unicodedata for host-python, needed by setuptools').

The first commit added the enabling of unicodedata in the host Python
when the target Python is configured with unicodedata, which is
necessary because building the target unicodedata Python module
requires having unicodedata support in the host Python.

The second commit enabled the unicodedata unconditionally in the host
Python, because it is needed by host-setuptools.

However, when the second commit was applied, the logic that consisted
in disabling unicodedate in the host Python when not needed was kept,
which resulted in breaking the build of host-setuptools due to the
lack of unicodedata support in the host python.

This commit fixes that by only leaving the unconditional
--enable-unicodedata in the host Python configuration options, and
therefore removing the problematic conditional --disable-unicodedata.

Fixes:

  http://autobuild.buildroot.org/results/b62/b622fc14776f5a6c26ff0d1fb882f4ae6cccc5d8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk   |    1 -
 package/python3/python3.mk |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index e177ef7..94765cb 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -89,7 +89,6 @@ endif
 
 ifneq ($(BR2_PACKAGE_PYTHON_UNICODEDATA),y)
 PYTHON_CONF_OPT += --disable-unicodedata
-HOST_PYTHON_CONF_OPT += --disable-unicodedata
 endif
 
 # Default is UCS2 w/o a conf opt
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 24e90d6..880b66e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -77,7 +77,6 @@ endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
 PYTHON3_CONF_OPT += --disable-unicodedata
-HOST_PYTHON3_CONF_OPT += --disable-unicodedata
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)

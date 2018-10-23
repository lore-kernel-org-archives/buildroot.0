From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 00:48:21 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/setools: host
 variant needs host-python-enum34
Message-ID: <20181023224637.2B0658865B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40d02fabe517b68a468c807be5cd8ca21b3a2af9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The enum34 dependency is required for python2.7 for both the host and
target builds.  This patch adds the host dependency to match what is
already in place for the target.

The host build is used by the setools package seinfo tool offline for
host based policy analysis. The analysis is easiest performed offline
as the policy is checked for path/reachability, which is something
that occurs by taking the policy file and using debug libraries to
perform test cases.

Fixes the following runtime error:

$ ./output/host/bin/sesearch
Traceback (most recent call last):
[...]
  File "/home/test/buildroot/output/host/lib/python2.7/site-packages/setools-4.1.1-py2.7-linux-x86_64.egg/setools/policyrep/util.py", line 21, in <module>
    from enum import Enum
ImportError: No module named enum

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a5e4eddb84d11ad0e4ee5c7d5298f6267e0e7f87)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/setools/setools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 6748c95c23..c152e541c1 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -18,6 +18,7 @@ SETOOLS_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
 else
 SETOOLS_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
 SETOOLS_DEPENDENCIES += python-enum34
+HOST_SETOOLS_DEPENDENCIES += host-python-enum34
 endif
 
 define SETOOLS_FIX_SETUP

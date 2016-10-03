From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:22:05 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: change install prefix
Message-ID: <20161003213608.5DE1981814@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01f19618c7d927c847a3bf127641b02b51f1af98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ltp-testsuite installs some of its files directly at its specified
prefix, which by default in Buildroot is /usr for autotools packages.
This is currently leaving scripts and its internal directories directly
installed in /usr, such as in:

  # ls /usr
  IDcheck.sh       lib64            runltplite.sh    share
  Version          libexec          runtest          testcases
  bin              runalltests.sh   sbin             testscripts
  lib              runltp           scenario_groups  ver_linux

It also seems to be not feasible to try to install all of its testcases
to standard locations such as /usr/bin as may contain hundreds of
binaries and may not be able to find them all if we change their install
locations. Therefore, it is better if ltp-testsuite installs its tree to
its own self-contained subdirectory.
Upstream instructions recommend that the install path be /opt/ltp,
however it seems that installing things to /opt is not a very common
Buildroot practice.
The proposal then is to install it to /usr/lib/ltp-testsuite and so it
can be run directly from there.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index cf48072..e97659e 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -21,6 +21,10 @@ else
 LTP_TESTSUITE_CONF_OPTS += --without-modules
 endif
 
+# We change the prefix to a custom one, otherwise we get scripts and
+# directories directly in /usr, such as /usr/runalltests.sh
+LTP_TESTSUITE_CONF_OPTS += --prefix=/usr/lib/ltp-testsuite
+
 # Needs libcap with file attrs which needs attr, so both required
 ifeq ($(BR2_PACKAGE_LIBCAP)$(BR2_PACKAGE_ATTR),yy)
 LTP_TESTSUITE_DEPENDENCIES += libcap

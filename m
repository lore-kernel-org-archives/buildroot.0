From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Apr 2019 11:25:28 +0200
Subject: [Buildroot] [git commit] package/boost: don't install boost cmake
 files
Message-ID: <20190418092108.4A2BA87F43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4349746dac6f55b0b0faca21a7e609fb67d1471b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 1.70.0, boost installs its own cmake files which are
utterly broken so don't install them otherwise all cmake packages using
boost (host-thrift, domoticz, i2pd ...) will fail because
BOOST_INCLUDE_DIRS will be empty

Fixes:
 - http://autobuild.buildroot.org/results/4ada26bab5c1e6504c7d8c92672326ced1d336df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/boost.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 920a3dd37f..a2d8395fd4 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -76,8 +76,8 @@ BOOST_DEPENDENCIES += python
 endif
 endif
 
-HOST_BOOST_OPTS += toolset=gcc threading=multi variant=release link=shared \
-	runtime-link=shared
+HOST_BOOST_OPTS += --no-cmake-config toolset=gcc threading=multi \
+	variant=release link=shared runtime-link=shared
 
 ifeq ($(BR2_MIPS_OABI32),y)
 BOOST_ABI = o32
@@ -87,7 +87,8 @@ else
 BOOST_ABI = sysv
 endif
 
-BOOST_OPTS += toolset=gcc \
+BOOST_OPTS += --no-cmake-config \
+	     toolset=gcc \
 	     threading=multi \
 	     abi=$(BOOST_ABI) \
 	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release)

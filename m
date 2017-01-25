From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 16:44:37 +1300
Subject: [Buildroot] [git commit] package/libasplib: bump version
Message-ID: <20170125034447.7ABA481EA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f1c60326f3b6afdb297403889a1be70d85bc24d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libasplib now contains modules, we enable only those for the moment
which do not need external dependencies. We are not in a hurry to fully
support all features of this package because the upcoming Kodi release
17.x-Krypton will not carry any ADSP add-ons:
https://github.com/xbmc/repo-binary-addons/commit/db3b767309df25daae4f01f01dba85ca7b3464b0

-DASPLIB_MODULES_TO_BUILD=some looks hackish because the default is to
enable all modules:
https://github.com/AchimTuran/asplib/blob/master/CMakeLists.txt#L35

But -DASPLIB_MODULES_TO_BUILD=OFF does not disable the build of all
modules as well because of
https://github.com/AchimTuran/asplib/blob/master/asplib_modules/CMakeLists.txt#L19
so I added "some" as fake value.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libasplib/libasplib.hash |  2 +-
 package/libasplib/libasplib.mk   | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/libasplib/libasplib.hash b/package/libasplib/libasplib.hash
index bbd027d..76534e5 100644
--- a/package/libasplib/libasplib.hash
+++ b/package/libasplib/libasplib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ccc2718c79a8d684317cc1987ede88b198e1602df47d0f18f03d474eda00af9c libasplib-f7219142e790a329b002a94f3db943abcb183739.tar.gz
+sha256 68e117348fa17592dde7672477e927119a0e477103ced1d3a57d92e30880a147  libasplib-be7fac89218a84b75f7598e3d76625ece99296f2.tar.gz
diff --git a/package/libasplib/libasplib.mk b/package/libasplib/libasplib.mk
index 41aeaeb..038fc38 100644
--- a/package/libasplib/libasplib.mk
+++ b/package/libasplib/libasplib.mk
@@ -4,10 +4,18 @@
 #
 ################################################################################
 
-LIBASPLIB_VERSION = f7219142e790a329b002a94f3db943abcb183739
+LIBASPLIB_VERSION = be7fac89218a84b75f7598e3d76625ece99296f2
 LIBASPLIB_SITE = $(call github,AchimTuran,asplib,$(LIBASPLIB_VERSION))
 LIBASPLIB_LICENSE = GPLv3+
 LIBASPLIB_LICENSE_FILES = LICENSE
 LIBASPLIB_INSTALL_STAGING = YES
 
+LIBASPLIB_CONF_OPTS = \
+	-DASPLIB_MODULES_TO_BUILD=some \
+	-DBUILD_BIQUAD=ON \
+	-DBUILD_IIR=ON \
+	-DBUILD_LOGGER=ON \
+	-DBUILD_SIGNALS=ON \
+	-DBUILD_TIMER=ON
+
 $(eval $(cmake-package))

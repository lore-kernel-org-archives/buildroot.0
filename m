From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 23 Mar 2016 12:14:48 +0100
Subject: [Buildroot] [PATCH 1/1] gnuradio: fix boost detection
Message-ID: <1458731688-2975-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

With some configuration, built fails with :
-- Configuring gnuradio-runtime support...
--   Dependency Boost_FOUND = 0
--   Dependency ENABLE_VOLK = ON
--   Dependency PYTHONINTERP_FOUND = TRUE
CMake Error at cmake/Modules/GrComponent.cmake:75 (message):
  user force-enabled gnuradio-runtime but configuration checked failed
Call Stack (most recent call first):
  gnuradio-runtime/CMakeLists.txt:36 (GR_REGISTER_COMPONENT)

Boost is not found due to missing "indirect dependencies".
According to FindBoost.cmake, provided by cmake, Boost_thread depends on
Boost_atomic and Boost_chrono.

Fix:

http://autobuild.buildroot.net/results/eb099fcfc5f98daa9c06e24d45dbc97df19b0d4f/
http://autobuild.buildroot.net/results/4469c2ba7e4611c7841ebac980a2fb17720b0433/
http://autobuild.buildroot.net/results/a40486033a535dd11a90eceec80b41fd350bb394/
http://autobuild.buildroot.net/results/11024182df6b604d558cba07f2f3898edcdf5a06/
http://autobuild.buildroot.net/results/c6c1bb98eb42ee1d23183e275ea02343b5753846/
http://autobuild.buildroot.net/results/046a0ecc4b6b0d6df60b4ce3e279123e1c15123f/
http://autobuild.buildroot.net/results/6cc844e7bd7761e2238f55989e71520b91dd2a9f/
http://autobuild.buildroot.net/results/c3f186ebfef53e60dc2c4c7c8a27e6b3771f001a/
http://autobuild.buildroot.net/results/1399e81c32ea60f9ba37e9b5c1e6bf07541fba81/
http://autobuild.buildroot.net/results/8e038ac8b6e43abc4c7d437f267e497d7f808926/
http://autobuild.buildroot.net/results/f7b4fb5d8a65ecf45361cded2572eaeba1ea4302/
http://autobuild.buildroot.net/results/aa08901dfd81f6845dc632462bc32d921130c6b1/
http://autobuild.buildroot.net/results/1402de7f2d7ab36bf92cf5abdcb7ae90f0d13604/
http://autobuild.buildroot.net/results/5b644a88f457a8c5dda7961c8ae8b7299a774e8f/
http://autobuild.buildroot.net/results/c264cc6a5266b2703e58e0222f5b79d67ca3d450/
http://autobuild.buildroot.net/results/8ee3626e2523032218e17d9e6644403e64768f2d/
http://autobuild.buildroot.net/results/33748edd3555296c1d8a8b49c83bca6003781993/
http://autobuild.buildroot.net/results/c814797698adb4bba7044c2edbe0ca3655d94fd5/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 603532c..837a037 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -13,6 +13,8 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_ATOMIC # boost_thread
+	select BR2_PACKAGE_BOOST_CHRONO # boost_thread
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
-- 
2.7.3

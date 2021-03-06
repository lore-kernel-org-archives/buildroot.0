From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 21:30:52 +0100
Subject: [Buildroot] [git commit branch/next] package/libplatform: bump
 version
Message-ID: <20210306213554.0C5218765B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=977f5fd13480699d94e0ba63d9afae94b71906e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add -std=c++11 to CXXFLAGS to fix build with gcc < 5.x:

buildroot/output/build/libplatform-a7cd0d5780ed80a4e70480d1650749f29e8a1fb2/src/util/StringUtils.cpp:
 In static member function 'static std::string& StringUtils::TrimLeft(std::string&)':
buildroot/output/build/libplatform-a7cd0d5780ed80a4e70480d1650749f29e8a1fb2/src/util/StringUtils.cpp:456:99:
 warning: lambda expressions only available with -std=c++11 or -std=gnu++11 [enabled by default]
   str.erase(str.begin(), ::find_if(str.begin(), str.end(), [](char s) { return isspace_c(s) == 0; }));
                                                                                                   ^
buildroot/output/build/libplatform-a7cd0d5780ed80a4e70480d1650749f29e8a1fb2/src/util/StringUtils.cpp:456:100:
 error: no matching function for call to 'find_if(std::basic_string<char>::iterator, std::basic_string<char>::iterator,
  StringUtils::TrimLeft(std::string&)::__lambda0)'
   str.erase(str.begin(), ::find_if(str.begin(), str.end(), [](char s) { return isspace_c(s) == 0; }));
                                                                                                    ^

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libplatform/libplatform.hash | 2 +-
 package/libplatform/libplatform.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libplatform/libplatform.hash b/package/libplatform/libplatform.hash
index f08435da12..283b435b7c 100644
--- a/package/libplatform/libplatform.hash
+++ b/package/libplatform/libplatform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  209daeb87af4ca92199887eb151b2a459bb81566cdaa092644e0889afb64bf6a  libplatform-1c9d14fa996af33760a2c700caebd2bd9ae527c9.tar.gz
+sha256  ebee46c76b86b40b703fa913465f5004fa3166eeb6a4794c58fc8a5c25702931  libplatform-a7cd0d5780ed80a4e70480d1650749f29e8a1fb2.tar.gz
 sha256  80fc66febbb2393c9d518e3eefa4ad9aae15a9b6a84174c0e443ea79eeea5131  src/os.h
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
index ca57a07d15..5d909f784c 100644
--- a/package/libplatform/libplatform.mk
+++ b/package/libplatform/libplatform.mk
@@ -4,10 +4,14 @@
 #
 ################################################################################
 
-LIBPLATFORM_VERSION = 1c9d14fa996af33760a2c700caebd2bd9ae527c9
+LIBPLATFORM_VERSION = a7cd0d5780ed80a4e70480d1650749f29e8a1fb2
 LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
 LIBPLATFORM_LICENSE = GPL-2.0+
 LIBPLATFORM_LICENSE_FILES = src/os.h
 LIBPLATFORM_INSTALL_STAGING = YES
 
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
+LIBPLATFORM_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+endif
+
 $(eval $(cmake-package))

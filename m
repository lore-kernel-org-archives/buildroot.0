From: Johan Derycke <johan.derycke@barco.com>
Date: Tue,  4 Mar 2014 17:53:47 +0100
Subject: [Buildroot] [PATCH v3 2/2] boost: make build with python an option
In-Reply-To: <1393952027-21201-1-git-send-email-johan.derycke@barco.com>
References: <1393952027-21201-1-git-send-email-johan.derycke@barco.com>
Message-ID: <1393952027-21201-2-git-send-email-johan.derycke@barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to boost to build the Boost.Python library.
http://www.boost.org/doc/libs/1_55_0/libs/python/doc/index.html

Signed-off-by: Johan Derycke <johan.derycke@barco.com>
---
Changes v2 -> v3:
  -Avoid line-wrap using "git send-email"
Changes v1 -> v2:
  -Fixed indentations and blank lines
  -Removed package/Config.in
  -Allow build with python3

 package/boost/Config.in |    4 ++++
 package/boost/boost.mk  |   13 +++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 68c3909..a74c2d7 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -60,6 +60,10 @@ config BR2_PACKAGE_BOOST_MPI
 config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	bool "boost-program_options"

+config BR2_PACKAGE_BOOST_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	bool "boost-python"
+
 config BR2_PACKAGE_BOOST_RANDOM
 	bool "boost-random"

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 7aab614..53d2b4d 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -26,7 +26,7 @@ HOST_BOOST_FLAGS = --without-icu \
 # atomic library compile only with upstream version, wait for next 
release
 # coroutine breaks on some weak toolchains and it's new for 1.54+
 # log breaks with some toolchain combinations and it's new for 1.54+
-BOOST_WITHOUT_FLAGS = atomic coroutine log python
+BOOST_WITHOUT_FLAGS = atomic coroutine log

 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
@@ -40,6 +40,7 @@ BOOST_WITHOUT_FLAGS += $(if 
$(BR2_PACKAGE_BOOST_LOCALE),,locale)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
 BOOST_WITHOUT_FLAGS += $(if 
$(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PYTHON),,python)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_REGEX),,regex)
 BOOST_WITHOUT_FLAGS += $(if 
$(BR2_PACKAGE_BOOST_SERIALIZATION),,serialization)
@@ -50,6 +51,8 @@ BOOST_WITHOUT_FLAGS += $(if 
$(BR2_PACKAGE_BOOST_THREAD),,thread)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TIMER),,timer)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_WAVE),,wave)

+BOOST_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
+
 ifeq ($(BR2_PACKAGE_ICU),y)
 BOOST_FLAGS += --with-icu=$(STAGING_DIR)/usr
 BOOST_DEPENDENCIES += icu
@@ -61,6 +64,12 @@ ifeq ($(BR2_PACKAGE_BOOST_IOSTREAMS),y)
 BOOST_DEPENDENCIES += bzip2 zlib
 endif

+ifeq ($(BR2_PACKAGE_BOOST_PYTHON),y)
+BOOST_FLAGS += --with-python-root=$(HOST_DIR)
+BOOST_TARGET_CXXFLAGS 
+= -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/
+BOOST_DEPENDENCIES += python
+endif
+
 HOST_BOOST_OPT += toolset=gcc threading=multi variant=release link=shared 
\
 	runtime-link=shared

@@ -84,7 +93,7 @@ BOOST_FLAGS += $(if 
$(BOOST_WITHOUT_FLAGS_COMMASEPERATED), --without-libraries=$

 define BOOST_CONFIGURE_CMDS
 	(cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
-	echo "using gcc : $(TARGET_CC_VERSION) : $(TARGET_CXX) : 
<cxxflags>\"$(TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > 
$(@D)/user-config.jam
+	echo "using gcc : $(TARGET_CC_VERSION) : $(TARGET_CXX) : 
<cxxflags>\"$(BOOST_TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" 
 > $(@D)/user-config.jam
 	echo "" >> $(@D)/user-config.jam
 endef

-- 
1.7.10.4



DISCLAIMER:
Unless indicated otherwise, the information contained in this message is 
privileged and confidential, and is intended only for the use of the 
addressee(s) named above and others who have been specifically authorized 
to receive it. If you are not the intended recipient, you are hereby 
notified that any dissemination, distribution or copying of this message 
and/or attachments is strictly prohibited. The company accepts no 
liability for any damage caused by any virus transmitted by this email. 
Furthermore, the company does not warrant a proper and complete 
transmission of this information, nor does it accept liability for any 
delays. If you have received this message in error, please contact the 
sender and delete the message. Thank you.

From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 12 Feb 2019 21:26:15 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-02-11
In-Reply-To: <20190212070052.8321F87024@whitealder.osuosl.org>
References: <20190212070052.8321F87024@whitealder.osuosl.org>
Message-ID: <20190212212615.5beb3ec1@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 12 Feb 2019 07:00:46 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

[...]
> Results for branch 'master'
> ===========================
> 
[...]
>          arm |                  libdrm-2.4.97 | NOK | http://autobuild.buildroot.net/results/68430721e9a22aab153f39800fd8db39b3a9941f |    

make[4]: Entering directory '/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-5/output/build/libdrm-2.4.97/tests/amdgpu'
  CC       amdgpu_test-basic_tests.o
  CC       amdgpu_test-amdgpu_test.o
  CC       amdgpu_test-bo_tests.o
basic_tests.c: In function 'amdgpu_userptr_test':
basic_tests.c:1649:7: warning: implicit declaration of function 'fork' [-Wimplicit-function-declaration]
  if (!fork()) {
       ^~~~
  CC       amdgpu_test-cs_tests.o
  CC       amdgpu_test-vce_tests.o
  CC       amdgpu_test-uvd_enc_tests.o
  CC       amdgpu_test-vcn_tests.o
  CC       amdgpu_test-deadlock_tests.o
  CC       amdgpu_test-vm_tests.o
  CCLD     amdgpu_test
amdgpu_test-basic_tests.o: In function `amdgpu_userptr_test':
basic_tests.c:(.text+0xbd4): undefined reference to `fork'
collect2: error: ld returned 1 exit status
Makefile:458: recipe for target 'amdgpu_test' failed


From libdrm-2.4.97/tests/Makefile.am:

	if HAVE_AMDGPU
	if HAVE_CUNIT
	SUBDIRS += amdgpu
	endif
	endif

This is the only place where HAVE_CUNIT is evaluated (and the '--enable-install-test-programs'
option only triggers the install vs. not-install and not the building of the tests),
so package/libdrm/libdrm.mk could/should be changed to:

--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -47,6 +47,9 @@ endif
 --- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -38,6 +38,7 @@ config BR2_PACKAGE_LIBDRM_AMDGPU
        bool "amdgpu"
        depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
        select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
+       depends on BR2_USE_MMU && !BR2_PACKAGE_CUNIT # fork
        help
          Install AMD GPU driver.

 ifeq ($(BR2_PACKAGE_LIBDRM_AMDGPU),y)
 LIBDRM_CONF_OPTS += --enable-amdgpu
+ifeq ($(BR2_PACKAGE_CUNIT),y)
+LIBDRM_DEPENDENCIES += cunit
+endif
 else
 LIBDRM_CONF_OPTS += --disable-amdgpu
 endif
@@ -115,9 +118,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
 LIBDRM_CONF_OPTS += --enable-install-test-programs
-ifeq ($(BR2_PACKAGE_CUNIT),y)
-LIBDRM_DEPENDENCIES += cunit
-endif
 endif

and package/libdrm/Config.in to:

--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -38,6 +38,7 @@ config BR2_PACKAGE_LIBDRM_AMDGPU
        bool "amdgpu"
        depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
        select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
+       depends on BR2_USE_MMU && !BR2_PACKAGE_CUNIT # fork
        help
          Install AMD GPU driver.

But this seems strange, maybe better solution would be an additional '--disable-build-test-programs'
option?

Regards,
Peter

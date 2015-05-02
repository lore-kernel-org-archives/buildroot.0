From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 16:53:26 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/openpowerlink2: new package
In-Reply-To: <1430494560-5196-1-git-send-email-romain.naour@openwide.fr>
References: <1430494560-5196-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <5544E4E6.3000100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/05/15 17:35, Romain Naour wrote:
> The openpowerlink2 package archive contains several cmake projects,
> and each of them must be packaged separately in Buildroot.
> 
> "With version 2.0, the source code has been cleanly split into an
> application-oriented user library and a time-critical stack driver."

 Is the library's API also sufficiently different to warrant making it
powerlink2? It's difficult to evaluate for us since we don't have anything that
makes use of it in buildroot...

> 
> This complicates the packaging but it help to refine the dependencies
                                        helps

> compared to openpowerlink v1 build system.
> (openpowerlink v1 require C++ only for the qt demo)
                    requires

> 
> The generic openpowerlink2 package provide all sources files and
> patches which are then used by other openpowerlink2-* packages
> (sub-packages).
> Doing this avoids patches duplication over all sub-packages.
> 
> All patches fixes several issues with the cmake build system.
               fix

 What's the upstream status of these patches?

> 
> For each sub-packages, the extract hook create a symlink to the
                                          creates

> sources and the path to the cmake project is provided by *_SUBDIR
> value.

 Ouch, I really really don't like that. I'd much prefer to re-extract it from
the same source for each individual package - a bit like what we do with gcc.
The patches can be symlinked or applied with a hook (like is done for gcc).

> 
> There is one project for the EPL stack libraries wich provides:

 Perhaps explain what EPL is.

>  * an user space EPL stack to be linked into application
>  * an user space EPL stack pcap daemon
>  * an kernel space EPL library interface
> 
> There is two projects for EPL network driver:
        are               the

>  * pcap daemon driver
>  * kernel module driver.
> 
> Note: On x86/x86_64 only few EPL ethernet driver are available for
                           a                drivers

> the EPL kernel stack implementation:
>  * Intel 82573
>  * Intel 8255x
>  * Intel I210
>  * Realtek RTL-8111/8168 (new since V2.1.0)
>  * Realtek RTL-8139
> 
> There are one project for each demo applications:
        is                            application

>  * demo_cn_embedded
>  * demo_mn_embedded
>  * demo_cn_console
>  * demo_mn_console
>  * demo_mn_qt
> 
> Only demo_mn_console will be packaged in Buildroot for now.
> 
> This patch add the package for the stack libraries.
             adds

 This patch actually does two things: it adds the overall openpowerlink
infrastructure, and it adds the stack libraries. So it should be split into two
patches: one which adds the openpowerlink2 package, and one which adds the
openpowerlink2-stack package.

 Also, the policy is not to create more subdirectories. So openpowerlink2-stack
should appear directly under packages/.

> 
> [1] http://sourceforge.net/p/openpowerlink/discussion/newbie/thread/3f13af65/
> 
[snip]
> diff --git a/package/openpowerlink2/0002-FIX-Don-t-link-demos-with-Debug-and-Release-librarie.patch b/package/openpowerlink2/0002-FIX-Don-t-link-demos-with-Debug-and-Release-librarie.patch
> new file mode 100644
> index 0000000..16602ac
> --- /dev/null
> +++ b/package/openpowerlink2/0002-FIX-Don-t-link-demos-with-Debug-and-Release-librarie.patch
> @@ -0,0 +1,116 @@
> +From 545fc1d84a224093f7f79b5193aa3f7308f86b3a Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Wed, 17 Sep 2014 13:45:19 +0200
> +Subject: [PATCH] [FIX] Don't link demos with Debug and Release libraries
> +
> +This is acutualy used by Visual Studio:
           actually

> +
> +"When you create a Visual Studio Solution on Windows by CMake,
> +the solution contains both Release and Debug build configurations.
> +You can switch between them in Visual Studio.
> +Therefore, you need both release and debug libraries."
> +
> +This patch break the build for Windows.

 I don't by that.

 Yes, you'll need to build both Release and Debug libraries. But you need to
link with only one of them.

 But in fact, that's exactly what TARGET_LINK_LIBRARIES does [1] - the libraries
after 'optimized' will be used in all configurations except Debug, and the
target after 'debug' will be used in the Debug configuration. So this patch is
doing what CMake should already do according to the documentation...
However, it turns out that CMake checks if ${OPLKLIB_DEBUG} exists even if we
don't need it because we're not in a Debug configuration.

 So, I think this patch should be acceptable upstream with an adapted commit
message:

[FIX] Don't link demos with Debug and Release libraries

TARGET_LINK_LIBRARIES() will link only with the 'debug' libraries in debug mode
and only with the 'optimized' libraries in any other mode, but CMake still
checks if the libraries that you don't link with exist. That makes it impossible
to release just an optimized library without debug library [1].

Therefore, this patch provides an alternative way to distinguish between debug
and optimized, with an explicit condition.

[1] http://sourceforge.net/p/openpowerlink/discussion/newbie/thread/3f13af65/

> +
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> +---
> + apps/demo_cn_console/CMakeLists.txt  |    6 +++++-
> + apps/demo_cn_embedded/CMakeLists.txt |    6 +++++-
> + apps/demo_mn_console/CMakeLists.txt  |    6 +++++-
> + apps/demo_mn_embedded/CMakeLists.txt |    6 +++++-
> + apps/demo_mn_qt/CMakeLists.txt       |    6 +++++-
> + 5 files changed, 25 insertions(+), 5 deletions(-)
> +
> +diff --git a/apps/demo_cn_console/CMakeLists.txt b/apps/demo_cn_console/CMakeLists.txt
> +index 2ba2bbd..4051bc8 100644
> +--- a/apps/demo_cn_console/CMakeLists.txt
> ++++ b/apps/demo_cn_console/CMakeLists.txt
> +@@ -105,8 +105,12 @@ SET_PROPERTY(TARGET demo_cn_console
> + 
> + ################################################################################
> + # Libraries to link
> ++IF(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
> ++    TARGET_LINK_LIBRARIES(demo_cn_console debug ${OPLKLIB_DEBUG})

 The 'debug' part is now redundant.

> ++ELSE ()

 The coding style seems to be not to insert a space here.

> ++    TARGET_LINK_LIBRARIES(demo_cn_console optimized ${OPLKLIB})

 And here the optimized part.

> ++ENDIF()
> + 
[snip]

> diff --git a/package/openpowerlink2/0003-FIX-install-the-stack-libraries-to-lib-subdirectory.patch b/package/openpowerlink2/0003-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
> new file mode 100644
> index 0000000..9d68288
> --- /dev/null
> +++ b/package/openpowerlink2/0003-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
> @@ -0,0 +1,108 @@
> +From e322ca01613f6a51f1465711c2f890a372053a30 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Fri, 1 May 2015 12:19:34 +0200
> +Subject: [PATCH] [FIX] install the stack libraries to "lib" subdirectory
> +
> +Using '.' to install the stack libraries is not correct since
> +it will install them to /usr/ when CMAKE_INSTALL_PREFIX is set

 CMAKE_INSTALL_PREFIX isn't needed here, CMake will add that automatically.

> +to "/usr/".
> +
> +ls /usr/liboplkmnapp-kernelintf.so
> +
> +Fix this by using ${CMAKE_INSTALL_PREFIX}/lib instead of '.'

 I guess there must be a reason why upstream does this crazy sh*t, so probably
this patch will be harder for them to accept...

[snip]
> diff --git a/package/openpowerlink2/Config.in b/package/openpowerlink2/Config.in
> new file mode 100644
> index 0000000..8e61a7d
> --- /dev/null
> +++ b/package/openpowerlink2/Config.in
> @@ -0,0 +1,46 @@
> +comment "openpowerlink2 needs a toolchain w/ threads"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

 Did you test with uClibc and/or musl?

> +
> +menuconfig BR2_PACKAGE_OPENPOWERLINK2
> +	bool "openpowerlink2"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_i386 || BR2_x86_64
> +	help
> +	  openPOWERLINK2 is an Open Source Industrial Ethernet
> +	  stack implementing the POWERLINK protocol for Managing Node
> +	  (MN, POWERLINK Master) and Controlled Node (CN, POWERLINK Slave).
> +
> +	  It is provided by
> +	  SYSTEC electronic (http://www.systec-electronic.com),
> +	  B&R (http://www.br-automation.com) and
> +	  Kalycito (http://www.kalycito.com).
> +
> +	  https://sourceforge.net/projects/openpowerlink/

 This refers to http://openpowerlink.sourceforge.net/web/ as the website.

> +
> +if BR2_PACKAGE_OPENPOWERLINK2
> +
> +choice
> +	prompt "Select MN/CN mode"
> +
> +	config BR2_PACKAGE_OPENPOWERLINK2_MN
> +	bool "MN"
> +	help
> +	  Enable Managing Node mode

 Perhaps add (Master) here.

> +
> +	config BR2_PACKAGE_OPENPOWERLINK2_CN
> +	bool "CN"
> +	help
> +	  Enable Controlled Node mode
> +
> +endchoice
> +
> +source "package/openpowerlink2/openpowerlink2-stack/Config.in"
> +
> +config BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL
> +	string "debug level for openpowerlink stack"
> +	default "0xEC000000L"
> +	help
> +	  Debug level to be used for openPOWERLINK debugging functions.

 Maybe slightly more explanation what the bits mean? At least you should explain
that it has to be a hex number starting with 0x and ending with L.

 Why do you have this default?

> +
> +endif # BR2_PACKAGE_OPENPOWERLINK2
> diff --git a/package/openpowerlink2/openpowerlink2-stack/Config.in b/package/openpowerlink2/openpowerlink2-stack/Config.in
> new file mode 100644
> index 0000000..c3ddf47
> --- /dev/null
> +++ b/package/openpowerlink2/openpowerlink2-stack/Config.in
> @@ -0,0 +1,34 @@
> +
> +choice
> +	prompt "Select openPOWERLINK library type"
> +
> +config BR2_PACKAGE_OPENPOWERLINK2_STACK_MONOLITHIC_USER_STACK_LIB
> +	bool "the EPL stack is directly linked into application."
> +	select BR2_PACKAGE_LIBPCAP
> +	help
> +	  Compile a monolithic openPOWERLINK library. The library contains
> +	  an Ethernet driver which is using the PCAP library for accessing
> +	  the network.

 Add "No kernel-side driver is needed."

 Or actually, replace driver with stack everywhere.

> +
> +config BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB
> +	bool "build EPL stack as linux userspace pcap daemon."
> +	select BR2_PACKAGE_LIBPCAP
> +	help
> +	  Compile openPOWERLINK application library which contains the
> +	  interface to a Linux user space driver, and the Linux user space

 I wouldn't call it driver, and there's no need to mention Linux so often.

> +	  driver. It is used for implementing a multi-process solution
> +	  where the openPOWERLINK kernel layer is running as a separate

 This 'kernel' is confusing, so just remove it.

> +	  Linux user space daemon (e.g. a PCAP based user space daemon).

 e.g. -> i.e.

 And add "No kernel-side stack is needed."

> +
> +config BR2_PACKAGE_OPENPOWERLINK2_STACK_KERNEL_STACK_LIB
> +	bool "build EPL stack as linux kernelspace module."
> +	depends on BR2_LINUX_KERNEL # openpowerlink-kernel-driver
> +	help
> +	  Compile openPOWERLINK application library which contains the
> +	  interface to a Linux kernel space driver. It is used together
> +	  with a Linux kernel module openPOWERLINK driver.

 It is used together with -> This will also build and install

 Also mention the name of that module.

> +
> +comment "openpowerlink kernel stack needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
> +endchoice
> diff --git a/package/openpowerlink2/openpowerlink2-stack/openpowerlink2-stack.mk b/package/openpowerlink2/openpowerlink2-stack/openpowerlink2-stack.mk
> new file mode 100644
> index 0000000..9fa2d63
> --- /dev/null
> +++ b/package/openpowerlink2/openpowerlink2-stack/openpowerlink2-stack.mk
> @@ -0,0 +1,69 @@
> +################################################################################
> +#
> +# openpowerlink2-stack
> +#
> +################################################################################
> +
> +OPENPOWERLINK2_STACK_VERSION = $(OPENPOWERLINK2_VERSION)
> +
> +OPENPOWERLINK2_STACK_LICENSE = $(OPENPOWERLINK2_LICENSE)
> +OPENPOWERLINK2_STACK_LICENSE_FILES = $(OPENPOWERLINK2_LICENSE_FILES)
> +
> +# We want to use the same archive for all sub-packages.
> +OPENPOWERLINK2_STACK_SOURCE =
> +OPENPOWERLINK2_STACK_DEPENDENCIES = openpowerlink2
> +
> +define OPENPOWERLINK2_STACK_SYMLINK_TO_SRC_HOOK
> +	ln -s $(OPENPOWERLINK2_DIR) $(OPENPOWERLINK2_STACK_DIR)/src
> +endef

 So here you can use the global _SOURCE and _SITE, and change this into

in the global .mk file:

define OPENPOWERLINK2_EXTRACT_CMDS
	$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
		$(TAR) -C $($(PKG)_DIR) $(TAR_OPTIONS) - $($(PKG)_TAR_OPTIONS)
endef

and in openpowerlink2-stack.mk:

OPENPOWERLINK2_STACK_EXTRACT_TAR_OPTIONS = src
OPENPOWERLINK2_STACK_EXTRACT_CMDS = $(OPENPOWERLINK2_EXTRACT_CMDS)

> +
> +OPENPOWERLINK2_STACK_POST_EXTRACT_HOOKS += OPENPOWERLINK2_STACK_SYMLINK_TO_SRC_HOOK
> +
> +OPENPOWERLINK2_STACK_SUBDIR = src/stack
> +
> +OPENPOWERLINK2_STACK_INSTALL_STAGING = YES
> +
> +OPENPOWERLINK2_STACK_CONF_OPTS = -DCFG_DEBUG_LVL=$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL))

 Add "" around this. And split the long line.

> +
> +# All option are ON by default

 So by default it would build the monolithic stack, the daemon, and the kernel
interface?

> +ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_STACK_MONOLITHIC_USER_STACK_LIB),y)
> +OPENPOWERLINK2_STACK_DEPENDENCIES += libpcap
> +OPENPOWERLINK2_STACK_CONF_OPTS += \
> +	-DCFG_COMPILE_LIB_MN=$(if $(BR2_PACKAGE_OPENPOWERLINK2_MN),ON,OFF) \
> +	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
> +	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
> +	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
> +	-DCFG_COMPILE_LIB_CN=$(if $(BR2_PACKAGE_OPENPOWERLINK2_CN),ON,OFF) \
> +	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
> +	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
> +	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB),y)
> +OPENPOWERLINK2_STACK_DEPENDENCIES += libpcap
> +OPENPOWERLINK2_STACK_CONF_OPTS += \
> +	-DCFG_COMPILE_LIB_MN=OFF \
> +	-DCFG_COMPILE_LIB_MNAPP_USERINTF=$(if $(BR2_PACKAGE_OPENPOWERLINK2_MN),ON,OFF) \
> +	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
> +	-DCFG_COMPILE_LIB_MNDRV_PCAP=$(if $(BR2_PACKAGE_OPENPOWERLINK2_MN),ON,OFF) \
> +	-DCFG_COMPILE_LIB_CN=OFF \
> +	-DCFG_COMPILE_LIB_CNAPP_USERINTF=$(if $(BR2_PACKAGE_OPENPOWERLINK2_CN),ON,OFF) \
> +	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
> +	-DCFG_COMPILE_LIB_CNDRV_PCAP=$(if $(BR2_PACKAGE_OPENPOWERLINK2_CN),ON,OFF)
> +else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_STACK_KERNEL_STACK_LIB),y)
> +OPENPOWERLINK2_STACK_CONF_OPTS += \
> +	-DCFG_COMPILE_LIB_MN=OFF \
> +	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
> +	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=$(if $(BR2_PACKAGE_OPENPOWERLINK2_MN),ON,OFF) \
> +	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
> +	-DCFG_COMPILE_LIB_CN=OFF \
> +	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
> +	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=$(if $(BR2_PACKAGE_OPENPOWERLINK2_CN),ON,OFF) \
> +	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF

 There is nothing here that refers to $(LINUX_DIR), so how is the module built?

> +endif
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +OPENPOWERLINK2_STACK_CONF_OPTS += -DCFG_COMPILE_SHARED_LIBRARY=NO
> +else
> +OPENPOWERLINK2_STACK_CONF_OPTS += -DCFG_COMPILE_SHARED_LIBRARY=YES
> +endif
> +
> +$(eval $(cmake-package))
> diff --git a/package/openpowerlink2/openpowerlink2.mk b/package/openpowerlink2/openpowerlink2.mk
> new file mode 100644
> index 0000000..82c4277
> --- /dev/null
> +++ b/package/openpowerlink2/openpowerlink2.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# openpowerlink2
> +#
> +################################################################################
> +
> +OPENPOWERLINK2_VERSION = V2.1.1
> +OPENPOWERLINK2_SITE = http://git.code.sf.net/p/openpowerlink/openPOWERLINK2
> +OPENPOWERLINK2_SITE_METHOD = git

 What's wrong with the tarball [2] ? It has the same contents. It is missing a
leading directory component but that's easily solved with custom extract commands.

 In that case, of course, add a hash file.


 Regards,
 Arnout

> +OPENPOWERLINK2_LICENSE = BSD-2c, GPLv2
> +OPENPOWERLINK2_LICENSE_FILES = license.md
> +
> +# Just extract the archive
> +
> +$(eval $(generic-package))
> +
> +include package/openpowerlink2/openpowerlink2-stack/openpowerlink2-stack.mk
> 

[1] http://www.cmake.org/cmake/help/v3.2/command/target_link_libraries.html
[2]
http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/V2.1.1/openPOWERLINK-V2.1.1.tar.gz

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

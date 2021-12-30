Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB812C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 17:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FF6F827C6;
	Thu, 30 Dec 2021 17:00:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OBvIJcYEjdyu; Thu, 30 Dec 2021 17:00:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97E2C827FA;
	Thu, 30 Dec 2021 17:00:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B36831BF3CB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B00A3827FA
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eAwO8jLWLCIT for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 17:00:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07E13827C6
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 17:00:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E8E186000B;
 Thu, 30 Dec 2021 17:00:17 +0000 (UTC)
Date: Thu, 30 Dec 2021 18:00:16 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Gilles Talis <gilles.talis@gmail.com>
Message-ID: <20211230180010.04c873f9@windsurf>
In-Reply-To: <20211024113654.88720-1-gilles.talis@gmail.com>
References: <20211024113654.88720-1-gilles.talis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/clpeak: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Gilles,

On Sun, 24 Oct 2021 13:36:54 +0200
Gilles Talis <gilles.talis@gmail.com> wrote:

> clpeak is a tool that profiles OpenCL devices to find
> their peak capacities
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
>  DEVELOPERS                 |  1 +
>  package/Config.in          |  1 +
>  package/clpeak/Config.in   | 14 ++++++++++++++
>  package/clpeak/clpeak.hash |  3 +++
>  package/clpeak/clpeak.mk   | 13 +++++++++++++
>  5 files changed, 32 insertions(+)
>  create mode 100644 package/clpeak/Config.in
>  create mode 100644 package/clpeak/clpeak.hash
>  create mode 100644 package/clpeak/clpeak.mk

Thanks for this package submission! Unfortunately, I'm afraid there is
an issue: it downloads stuff during the configure step. See below:

>>> clpeak 0777205be1d5681d5a76d46ec94588544e8462a5 Configuring
...
-- The C compiler identification is GNU 9.3.0
-- The CXX compiler identification is GNU 9.3.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /home/thomas/projets/buildroot/output/host/bin/aarch64-linux-gcc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /home/thomas/projets/buildroot/output/host/bin/aarch64-linux-g++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Looking for CL_VERSION_2_2
-- Looking for CL_VERSION_2_2 - found
-- Found OpenCL: /home/thomas/projets/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenCL.so (found version "2.2") 
CMake Warning (dev) in CMakeLists.txt:
  No project() command is present.  The top-level CMakeLists.txt file must
  contain a literal, direct call to the project() command.  Add a line of
  code such as

    project(ProjectName)

  near the top of the file, but after cmake_minimum_required().

  CMake is pretending there is a "project(Project)" command on the first
  line.
This warning is for project developers.  Use -Wno-dev to suppress it.

-- The C compiler identification is GNU 9.3.0
-- The CXX compiler identification is GNU 9.3.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /home/thomas/projets/buildroot/output/host/bin/aarch64-linux-gcc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /home/thomas/projets/buildroot/output/host/bin/aarch64-linux-g++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build
gmake[1]: Entering directory '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build'
gmake[2]: Entering directory '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build'
gmake[3]: Entering directory '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build'
gmake[3]: Leaving directory '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build'
gmake[3]: Entering directory '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build'
[ 12%] Creating directories for 'hpp_headers'
[ 25%] Performing download step (git clone) for 'hpp_headers'
Cloning into 'hpp_headers'...
remote: Enumerating objects: 558, done.        
remote: Counting objects: 100% (558/558), done.        
remote: Compressing objects: 100% (396/396), done.        
remote: Total 558 (delta 324), reused 355 (delta 155), pack-reused 0        
Receiving objects: 100% (558/558), 762.72 KiB | 5.45 MiB/s, done.
Resolving deltas: 100% (324/324), done.
Already on 'master'
Your branch is up to date with 'origin/master'.
Submodule 'external/CMock' (https://github.com/ThrowTheSwitch/CMock) registered for path 'external/CMock'
Submodule 'external/Unity' (https://github.com/ThrowTheSwitch/Unity) registered for path 'external/Unity'
Cloning into '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build/hpp/src/hpp_headers/external/CMock'...
Cloning into '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build/hpp/src/hpp_headers/external/Unity'...
Submodule path 'external/CMock': checked out '7cc41ddfdd07dc5eb8359d278f439f14031d64ad'
Submodule 'vendor/c_exception' (https://github.com/throwtheswitch/cexception.git) registered for path 'external/CMock/vendor/c_exception'
Submodule 'vendor/unity' (https://github.com/throwtheswitch/unity.git) registered for path 'external/CMock/vendor/unity'
Cloning into '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build/hpp/src/hpp_headers/external/CMock/vendor/c_exception'...
Cloning into '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build/hpp/src/hpp_headers/external/CMock/vendor/unity'...
Submodule path 'external/CMock/vendor/c_exception': checked out 'dce9e8b26f2179439002e02d691429e81a32b6c0'
Submodule 'vendor/unity' (https://github.com/throwtheswitch/unity.git) registered for path 'external/CMock/vendor/c_exception/vendor/unity'
Cloning into '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build/hpp/src/hpp_headers/external/CMock/vendor/c_exception/vendor/unity'...
Submodule path 'external/CMock/vendor/c_exception/vendor/unity': checked out '2c7629a0ae90ffe991b5fd08e4db8672f72ed64c'
Submodule path 'external/CMock/vendor/unity': checked out '031f3bbe45f8adf504ca3d13e6f093869920b091'
Submodule path 'external/Unity': checked out '7d2bf62b7e6afaf38153041a9d53c21aeeca9a25'
[ 37%] Performing update step for 'hpp_headers'
HEAD is now at 1df82b9 Add param traits for CL_DEVICE_SUPPORTED_REGISTER_ALLOCATIONS_ARM (#165)
[ 50%] No patch step for 'hpp_headers'
[ 62%] Performing configure step for 'hpp_headers'
-- The C compiler identification is GNU 9.3.0
-- The CXX compiler identification is GNU 9.3.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /home/thomas/projets/buildroot/output/host/bin/aarch64-linux-gcc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /home/thomas/projets/buildroot/output/host/bin/aarch64-linux-g++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build/hpp/src/hpp_headers-build
[ 75%] Performing build step for 'hpp_headers'
gmake[4]: Entering directory '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build/hpp/src/hpp_headers-build'
gmake[4]: Leaving directory '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build/hpp/src/hpp_headers-build'
[ 87%] Performing install step for 'hpp_headers'
gmake[4]: Entering directory '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build/hpp/src/hpp_headers-build'
Install the project...
-- Install configuration: "Release"
-- Installing: /home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp_install/include/CL
-- Installing: /home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp_install/include/CL/cl2.hpp
-- Installing: /home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp_install/include/CL/opencl.hpp
gmake[4]: Leaving directory '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build/hpp/src/hpp_headers-build'
[100%] Completed 'hpp_headers'
gmake[3]: Leaving directory '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build'
[100%] Built target hpp_headers
gmake[2]: Leaving directory '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build'
gmake[1]: Leaving directory '/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp/build'
-- Selected OpenCL includes from /home/thomas/projets/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include;/home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5/clhpp_install/include
-- Selected OpenCL lib /home/thomas/projets/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenCL.so
-- Configuring done
-- Generating done
CMake Warning:
  Manually-specified variables were not used by the project:

    BUILD_DOC
    BUILD_DOCS
    BUILD_EXAMPLE
    BUILD_EXAMPLES
    BUILD_TEST
    BUILD_TESTING
    BUILD_TESTS


-- Build files have been written to: /home/thomas/projets/buildroot/output/build/clpeak-0777205be1d5681d5a76d46ec94588544e8462a5

Also, while note related to clpeak, I did try to build this
configuration (which uses the NXP OpenCL provider):

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_CLPEAK=y
BR2_PACKAGE_FREESCALE_IMX=y
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8=y
BR2_PACKAGE_IMX_GPU_VIV=y
# BR2_TARGET_ROOTFS_TAR is not set

and it fails with:

/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/9.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: /home/thomas/projets/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib64/libGAL.so: undefined reference to `stat@GLIBC_2.33'

And indeed the C library in this toolchain is glibc 2.31. So this means
that the libGAL library shipped by NXP in imx-gpu-viv will only work
with glibc >= 2.33.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0C0C19F2C
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 14:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D120C40B1B;
	Thu, 28 Jul 2022 14:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D120C40B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIJXxC5JkYBQ; Thu, 28 Jul 2022 14:36:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98F8740A19;
	Thu, 28 Jul 2022 14:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98F8740A19
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C98DC1BF3BD
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 14:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A44BC60F45
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 14:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A44BC60F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkzV9CDGtwyM for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 14:36:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B452160F4D
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B452160F4D
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 14:36:08 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id BFD22BDE0E4C;
 Thu, 28 Jul 2022 16:36:05 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 28 Jul 2022 14:36:05 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <46b4d64c-1779-bcaf-3fdf-05f33b341c9a@mind.be>
References: <20211227074056.13882-1-br015@umbiko.net>
 <20220320114138.433796-1-br015@umbiko.net>
 <46b4d64c-1779-bcaf-3fdf-05f33b341c9a@mind.be>
Message-ID: <2c0db3bb1559bcfc536b46bf7ed4728f@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.6 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v3 1/1] package/zziplib: fix static build
 failure with mpd
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?J=C3=B6rg_Krause?= <joerg.krause@embedded.rocks>,
 fontaine.fabrice@gmail.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[added Fabrice, he is aware of this issue]

Hi Arnout, all

Analysis /result inline, I now need to test this fix with the known 
defects [2][3][4]

An additional column "debug?" in the autobuild results might be useful.

Kind regards,
Andreas

[2] http://autobuild.buildroot.net/?reason=mpd-0.23.3
[3] http://autobuild.buildroot.net/?reason=mpd-0.23.5
[4] http://autobuild.buildroot.net/?reason=zziplib-0.13.72


On 2022-07-25 20:49, Arnout Vandecappelle wrote:
> Hi Andreas,
> 
> On 20/03/2022 12:41, Andreas Ziegler wrote:
>> The current released version of zziplib copies static libraries with 
>> appended
>> major version, but omits creating the necessary links to the base file 
>> names.
>> This prevents the linker to find the libraries via the search path.
>> 
>> The issue (https://github.com/gdraheim/zziplib/issues/117) has been
>> fixed upstream; this patch extracts the necessary part of commit 
>> 0e8d35f92efb680c81f6ec1fca9f11d173dce389, to enable creation of 
>> symlinks.
>> 
>> This resolves the following autobuild issues:
>> 
>> http://autobuild.buildroot.net/results/6c56b645a2b723920f07b98474452824fba5e2c1
>> http://autobuild.buildroot.net/results/032aaff121fb114f388c67dbca3ad2b02f670e38
>> http://autobuild.buildroot.net/results/ba711034c0abe980f677e26de41739223e2f66e9
>> 
>> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> 
>  Since this patch was merged, we have failures [1] like:
> 
> [ 37%] Building C object zzipwrap/CMakeFiles/zzipwrap.dir/zzipwrap.c.o
> make[3]: stat: zzip/libzzip.a: Too many levels of symbolic links
> make[3]: *** No rule to make target 'zzip/libzzip.a', needed by
> 'zzipwrap/zzipwrap'.  Stop.
> 
>  Since this is about symlinks, it might be related to this patch.
> Could you have a look?
> 
>  Regards,
>  Arnout

ANALYSIS

zziplib normally uses a version number (major version only) when 
building libraries; zziplib version 0.13.72 omits creating the usual 
links from versioned file names to the base name, which created 
autobuild errors for downstream components in the past.

Porting part of the CMake code present in the latest version of the 
zziplib repository solved this problem, but creates another one whenever 
versioning is not employed, since zzip/CMakeLists.txt does not handle 
this case properly: existing libraries are overwritten with a recursive 
link.

The mechanism used in zzip/CMakeLists.txt is identical for all libraries 
and implemented like this:

if(ZZIP_LIBLATEST)

	...

	get_target_property(libname libzzip OUTPUT_NAME)
	get_target_property(librelease libzzip RELEASE_POSTFIX)
	add_custom_target(libzzip_latest ALL
		COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> 
${lib}${libname}${dll}
		)
	install(FILES
		${outdir}/${lib}${libname}${dll}
		DESTINATION ${CMAKE_INSTALL_LIBDIR})

	...

endif(ZZIP_LIBLATEST)

The librelease variable is never used. $<TARGET_FILE_NAME:libzzip*> 
contains either a versioned or an unversioned file name (depending on 
RELEASE_POSTFIX being used by CMake). The link creation is handled by an 
unconditional cmake target that is executed regardless of the target 
file presence. Since both arguments to the create_symlink command may be 
identical, this can result in a recursive symlink overwriting the 
original file.


ROOT CAUSE:

CMAKE_BUILD_TYPE was set to Debug:

>>> zziplib 0.13.72 Installing to staging directory
PATH="/home/data/test/autobuild/host/bin:/home/data/test/autobuild/host/sbin:/home/iago/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" 
  /usr/bin/make -j5  
DESTDIR=/home/data/test/autobuild/host/microblaze-buildroot-linux-uclibc/sysroot 
install/fast -C /home/data/test/autobuild/build/zziplib-0.13.72/
Install the project...
-- Install configuration: "Debug"

zziplib settings are only complete for release builds, therefore, for 
example the version info is missing from the library files.

> 
> [1] 
> http://autobuild.buildroot.net/results/743/7433a2ad111e2f014c81f196d3d1e2f63dffa858/
> 
> 
> 
>> ---
>> Changes v1 -> v2:
>>   - extract link creation from commit 0e8d35f
>> Changes v2 -> v3:
>>   - update failure list
>> 
>>   ...-implant-ZZIP_LIBLATEST-for-zzip_lib.patch | 78 
>> +++++++++++++++++++
>>   1 file changed, 78 insertions(+)
>>   create mode 100644 
>> package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
>> 
>> diff --git 
>> a/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch 
>> b/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
>> new file mode 100644
>> index 0000000000..50380861bc
>> --- /dev/null
>> +++ b/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
>> @@ -0,0 +1,78 @@
>> +Extract link creation for versioned libraries from commit
>> +0e8d35f92efb680c81f6ec1fca9f11d173dce389.
>> +
>> +Signed-off-by: Andreas Ziegler <br015@umbiko.net>
>> +
>> +---
>> +From 0e8d35f92efb680c81f6ec1fca9f11d173dce389 Mon Sep 17 00:00:00 
>> 2001
>> +From: Guido Draheim <guidod@gmx.de>
>> +Date: Sat, 22 May 2021 15:13:28 +0200
>> +Subject: [PATCH] #117 implant ZZIP_LIBLATEST for zzip.lib
>> +
>> +---
>> + zzip/CMakeLists.txt | 57 
>> +++++++++++++++++++++++++++++++++++----------
>> + 1 file changed, 45 insertions(+), 12 deletions(-)
>> +
>> +diff --git a/zzip/CMakeLists.txt b/zzip/CMakeLists.txt
>> +index a966d5f..ccd08b6 100644
>> +--- a/zzip/CMakeLists.txt
>> ++++ b/zzip/CMakeLists.txt
>> +@@ -28,6 +28,12 @@ option(ZZIP_LIBTOOL "Ensure binary compatibility 
>> with libtool" OFF)
>> + option(ZZIP_PKGCONFIG "Generate pkg-config files for linking" OFF)
>> + endif()
>> +
>> ++if(ZZIP_LIBTOOL OR ZZIP_PKGCONFIG)
>> ++option(ZZIP_LIBLATEST "Ensure libname.lib links to libname-REL.lib" 
>> ON)
>> ++else()
>> ++option(ZZIP_LIBLATEST "Ensure libname.lib links to libname-REL.lib" 
>> OFF)
>> ++endif()
>> ++
>> + # used in zzip/_config.h
>> + set(ZZIP_PACKAGE "${PROJECT_NAME}lib")
>> + set(ZZIP_VERSION "${PROJECT_VERSION}")
>> +@@ -346,6 +340,45 @@ if(ZZIP_LIBTOOL)
>> +   endif(CMAKE_SHARED_LIBRARY_SONAME_C_FLAG)
>> + endif(ZZIP_LIBTOOL)
>> +
>> ++if(ZZIP_LIBLATEST)
>> ++  if(BUILD_SHARED_LIBS)
>> ++    set(lib ${CMAKE_SHARED_LIBRARY_PREFIX})
>> ++    set(dll ${CMAKE_SHARED_LIBRARY_SUFFIX})
>> ++  else()
>> ++    set(lib ${CMAKE_STATIC_LIBRARY_PREFIX})
>> ++    set(dll ${CMAKE_STATIC_LIBRARY_SUFFIX})
>> ++  endif()
>> ++    get_target_property(libname libzzip OUTPUT_NAME)
>> ++    get_target_property(librelease libzzip RELEASE_POSTFIX)
>> ++    add_custom_target(libzzip_latest ALL
>> ++        COMMAND ${CMAKE_COMMAND} -E create_symlink 
>> $<TARGET_FILE_NAME:libzzip> ${lib}${libname}${dll}
>> ++        )
>> ++    install(FILES
>> ++        ${outdir}/${lib}${libname}${dll}
>> ++        DESTINATION ${CMAKE_INSTALL_LIBDIR})
>> ++    if(ZZIPFSEEKO)
>> ++    get_target_property(libname libzzipfseeko OUTPUT_NAME)
>> ++    get_target_property(librelease libzzipfseeko RELEASE_POSTFIX)

Using a conditional CMake target ensures that existing files will not be 
overwritten:

	set(libzzip_target "${outdir}/${lib}${libname}${dll}")
	add_custom_target(libzzip_latest ${libzzip_target}

>> ++    add_custom_target(libzzipfseeko_latest ALL
>> ++        COMMAND ${CMAKE_COMMAND} -E create_symlink 
>> $<TARGET_FILE_NAME:libzzipfseeko> ${lib}${libname}${dll}
>> ++        )
>> ++    install(FILES
>> ++        ${outdir}/${lib}${libname}${dll}
>> ++        DESTINATION ${CMAKE_INSTALL_LIBDIR})
>> ++    endif(ZZIPFSEEKO)
>> ++    if(ZZIPMMAPPED)
>> ++    get_target_property(libname libzzipmmapped OUTPUT_NAME)
>> ++    get_target_property(librelease libzzipmmapped RELEASE_POSTFIX)
>> ++    add_custom_target(libzzipmmaped_latest ALL
>> ++        COMMAND ${CMAKE_COMMAND} -E create_symlink 
>> $<TARGET_FILE_NAME:libzzipmmapped> ${lib}${libname}${dll}
>> ++        )
>> ++    install(FILES
>> ++        ${outdir}/${lib}${libname}${dll}
>> ++        DESTINATION ${CMAKE_INSTALL_LIBDIR})
>> ++    endif(ZZIPMMAPPED)
>> ++endif(ZZIP_LIBLATEST)
>> ++
>> ++
>> + ## messages ##############################################
>> +
>> + message(STATUS "lib zzipfseeko  to be compiled: ${ZZIPFSEEKO}")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

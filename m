Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B5BC43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 06:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD52783FC4;
	Tue, 26 Jul 2022 06:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD52783FC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8a3NhmCo8BLr; Tue, 26 Jul 2022 06:31:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5F6583FA1;
	Tue, 26 Jul 2022 06:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5F6583FA1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C6131BF287
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 06:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2666083FA1
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 06:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2666083FA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GDlNHld5Wr0k for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 06:31:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54F5883E46
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54F5883E46
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 06:31:13 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 7261CBDE8B77;
 Tue, 26 Jul 2022 08:24:01 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 26 Jul 2022 06:24:01 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <46b4d64c-1779-bcaf-3fdf-05f33b341c9a@mind.be>
References: <20211227074056.13882-1-br015@umbiko.net>
 <20220320114138.433796-1-br015@umbiko.net>
 <46b4d64c-1779-bcaf-3fdf-05f33b341c9a@mind.be>
Message-ID: <96e281da781cc3e21932c1560e162a0a@umbiko.net>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

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

This build [1] creates recursive links for two libraries:

$ ls -l zzip/*.a
-rw-r--r-- 1 iago iago 173008 Jul 26 07:26 zzip/libzzip.a
lrwxrwxrwx 1 iago iago     15 Jul 26 07:26 zzip/libzzipfseeko.a -> 
libzzipfseeko.a
lrwxrwxrwx 1 iago iago     16 Jul 26 07:26 zzip/libzzipmmapped.a -> 
libzzipmmapped.a

Removing the patch lets the build complete successfully.

I will have a look.

Kind regards,
Andreas

>  Regards,
>  Arnout
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B90FC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 20:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B2C683DB7;
	Mon, 25 Jul 2022 20:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B2C683DB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzU0aK0_ZP5c; Mon, 25 Jul 2022 20:49:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C4348331B;
	Mon, 25 Jul 2022 20:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C4348331B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 385EF1BF32A
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 20:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11ED04091F
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 20:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11ED04091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W-r7ByoxpB-Z for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 20:49:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C058540176
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C058540176
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 20:49:42 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m17so17326640wrw.7
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 13:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=An11HL+pBpAqhaKln8FC0wbdYurDit7is6KGjotcRsg=;
 b=6rMQMDwN2goMQt6EtfU2aPMuAENlKNYZ44Wo8J+OkluC8G/SD30NLFBgTBi5/zQUOG
 50yGzkFRPcuTXW2gQ2EAFtr9MEmpDONYaU02TZXCkqh+tKp9he9Dx+G1thWtYphfz53I
 97Va9BhOCheOQy9GJxORuL0drBPxBe35PfQZngizJQifBKdK0Dtf37zrerIh74C+2qks
 N58PykHmjVH1vbDIfxq4Z0/ekDxZLDg8JhQq9LjBiMHD/WIGmrmTele8HiQdT1s227Sh
 67fh+qhN7DUc+pOIbVy772FrqY2Xr7aAUy5IqayrPLyOvd0ee64EtE9MXbXp7aBv87MU
 868g==
X-Gm-Message-State: AJIora/Kur5TBHME0Z6Qgb3Y5769K7D0N4yDleAJS7C4V3OXO6KuVQ5+
 VEDby43RsF5Y/Xzu5Fpo1Zmxgg==
X-Google-Smtp-Source: AGRyM1ugZTaU6wv0I+K+U6c2V8gf3ynAUJwxPCniFCl1J1tOezIsp2s0hguskOFv7Z/kpx2XMG2SDQ==
X-Received: by 2002:adf:f5cf:0:b0:21e:2ebc:4126 with SMTP id
 k15-20020adff5cf000000b0021e2ebc4126mr8844241wrp.195.1658782180709; 
 Mon, 25 Jul 2022 13:49:40 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adfaa49000000b0021e7e050404sm8161283wrd.117.2022.07.25.13.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 13:49:40 -0700 (PDT)
Message-ID: <46b4d64c-1779-bcaf-3fdf-05f33b341c9a@mind.be>
Date: Mon, 25 Jul 2022 22:49:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20211227074056.13882-1-br015@umbiko.net>
 <20220320114138.433796-1-br015@umbiko.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220320114138.433796-1-br015@umbiko.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=An11HL+pBpAqhaKln8FC0wbdYurDit7is6KGjotcRsg=;
 b=DOF+zdako+w7U41j3imW2Thl/Q5t4bmqpI+OjWV+BNoHWjFosm3uqHK/NKkcDyuF1D
 gGIfqV4vZeMgHqyAUl5TUWcrEtDRHIrLM9IBnIfo0h0ansMvXF4Qpy3R+3PY9tdK3kgQ
 2vZYq23fwcJIzC2BA7ERHKcgVwG6ocq+mKK2jXbzz2xHSdzW/dzz5z1djq9n15+9BMLd
 qL0idY2dtjhM23wFbrtamNV+9439mzb94Rn4IYa/Wms1YnvAuc4fKSd5U527LbJwxgS+
 Qu9wgrF/tTPg0H5w///QssHVikGLPgJDSG7GUHNW1z5r6mgTA3tzWYQMnEmAWINrG3Cd
 cEwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DOF+zdak
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
 =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Andreas,

On 20/03/2022 12:41, Andreas Ziegler wrote:
> The current released version of zziplib copies static libraries with appended
> major version, but omits creating the necessary links to the base file names.
> This prevents the linker to find the libraries via the search path.
> 
> The issue (https://github.com/gdraheim/zziplib/issues/117) has been
> fixed upstream; this patch extracts the necessary part of commit 0e8d35f92efb680c81f6ec1fca9f11d173dce389, to enable creation of symlinks.
> 
> This resolves the following autobuild issues:
> 
> http://autobuild.buildroot.net/results/6c56b645a2b723920f07b98474452824fba5e2c1
> http://autobuild.buildroot.net/results/032aaff121fb114f388c67dbca3ad2b02f670e38
> http://autobuild.buildroot.net/results/ba711034c0abe980f677e26de41739223e2f66e9
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

  Since this patch was merged, we have failures [1] like:

[ 37%] Building C object zzipwrap/CMakeFiles/zzipwrap.dir/zzipwrap.c.o
make[3]: stat: zzip/libzzip.a: Too many levels of symbolic links
make[3]: *** No rule to make target 'zzip/libzzip.a', needed by 
'zzipwrap/zzipwrap'.  Stop.

  Since this is about symlinks, it might be related to this patch. Could you 
have a look?

  Regards,
  Arnout

[1] 
http://autobuild.buildroot.net/results/743/7433a2ad111e2f014c81f196d3d1e2f63dffa858/



> ---
> Changes v1 -> v2:
>   - extract link creation from commit 0e8d35f
> Changes v2 -> v3:
>   - update failure list
> 
>   ...-implant-ZZIP_LIBLATEST-for-zzip_lib.patch | 78 +++++++++++++++++++
>   1 file changed, 78 insertions(+)
>   create mode 100644 package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
> 
> diff --git a/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch b/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
> new file mode 100644
> index 0000000000..50380861bc
> --- /dev/null
> +++ b/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
> @@ -0,0 +1,78 @@
> +Extract link creation for versioned libraries from commit
> +0e8d35f92efb680c81f6ec1fca9f11d173dce389.
> +
> +Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> +
> +---
> +From 0e8d35f92efb680c81f6ec1fca9f11d173dce389 Mon Sep 17 00:00:00 2001
> +From: Guido Draheim <guidod@gmx.de>
> +Date: Sat, 22 May 2021 15:13:28 +0200
> +Subject: [PATCH] #117 implant ZZIP_LIBLATEST for zzip.lib
> +
> +---
> + zzip/CMakeLists.txt | 57 +++++++++++++++++++++++++++++++++++----------
> + 1 file changed, 45 insertions(+), 12 deletions(-)
> +
> +diff --git a/zzip/CMakeLists.txt b/zzip/CMakeLists.txt
> +index a966d5f..ccd08b6 100644
> +--- a/zzip/CMakeLists.txt
> ++++ b/zzip/CMakeLists.txt
> +@@ -28,6 +28,12 @@ option(ZZIP_LIBTOOL "Ensure binary compatibility with libtool" OFF)
> + option(ZZIP_PKGCONFIG "Generate pkg-config files for linking" OFF)
> + endif()
> +
> ++if(ZZIP_LIBTOOL OR ZZIP_PKGCONFIG)
> ++option(ZZIP_LIBLATEST "Ensure libname.lib links to libname-REL.lib" ON)
> ++else()
> ++option(ZZIP_LIBLATEST "Ensure libname.lib links to libname-REL.lib" OFF)
> ++endif()
> ++
> + # used in zzip/_config.h
> + set(ZZIP_PACKAGE "${PROJECT_NAME}lib")
> + set(ZZIP_VERSION "${PROJECT_VERSION}")
> +@@ -346,6 +340,45 @@ if(ZZIP_LIBTOOL)
> +   endif(CMAKE_SHARED_LIBRARY_SONAME_C_FLAG)
> + endif(ZZIP_LIBTOOL)
> +
> ++if(ZZIP_LIBLATEST)
> ++  if(BUILD_SHARED_LIBS)
> ++    set(lib ${CMAKE_SHARED_LIBRARY_PREFIX})
> ++    set(dll ${CMAKE_SHARED_LIBRARY_SUFFIX})
> ++  else()
> ++    set(lib ${CMAKE_STATIC_LIBRARY_PREFIX})
> ++    set(dll ${CMAKE_STATIC_LIBRARY_SUFFIX})
> ++  endif()
> ++    get_target_property(libname libzzip OUTPUT_NAME)
> ++    get_target_property(librelease libzzip RELEASE_POSTFIX)
> ++    add_custom_target(libzzip_latest ALL
> ++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${lib}${libname}${dll}
> ++        )
> ++    install(FILES
> ++        ${outdir}/${lib}${libname}${dll}
> ++        DESTINATION ${CMAKE_INSTALL_LIBDIR})
> ++    if(ZZIPFSEEKO)
> ++    get_target_property(libname libzzipfseeko OUTPUT_NAME)
> ++    get_target_property(librelease libzzipfseeko RELEASE_POSTFIX)
> ++    add_custom_target(libzzipfseeko_latest ALL
> ++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${lib}${libname}${dll}
> ++        )
> ++    install(FILES
> ++        ${outdir}/${lib}${libname}${dll}
> ++        DESTINATION ${CMAKE_INSTALL_LIBDIR})
> ++    endif(ZZIPFSEEKO)
> ++    if(ZZIPMMAPPED)
> ++    get_target_property(libname libzzipmmapped OUTPUT_NAME)
> ++    get_target_property(librelease libzzipmmapped RELEASE_POSTFIX)
> ++    add_custom_target(libzzipmmaped_latest ALL
> ++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${lib}${libname}${dll}
> ++        )
> ++    install(FILES
> ++        ${outdir}/${lib}${libname}${dll}
> ++        DESTINATION ${CMAKE_INSTALL_LIBDIR})
> ++    endif(ZZIPMMAPPED)
> ++endif(ZZIP_LIBLATEST)
> ++
> ++
> + ## messages ##############################################
> +
> + message(STATUS "lib zzipfseeko  to be compiled: ${ZZIPFSEEKO}")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C6EE83EEF
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0E6660A60;
	Wed,  4 Feb 2026 13:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7PXZRYZKZeX; Wed,  4 Feb 2026 13:41:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D90A60AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770212507;
	bh=AgpYu3xk1TdQ7YMDWOnxQoxrXQva36NTW0+wpc4g4Nc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lJ6I1ETVn8sAszPKGnmOYHLJWDCTHZokxWTDCr12k6SdzVhMI4kahBLnlSDb/Raiz
	 0LUFZUhrhkUgM7+L1NU4XaGd9OWjkL7Qa4/OvF5yFyEOWifbxn/CHLg4XXd2E+P4NK
	 8GtMzjJRNr68gnQuCDe8ZNiSv6KXUzRVtyAjDqDNLFPEQNrwpWzJcp+H0Kp8W8fAiX
	 kBTQgr5I1aMgqn9zDZdj69tMFBCK/YnibKYY1IlDOILUHPnr7fWpyTF+INKUJEr6r2
	 DoiMkEIulrqE5fsEGOVbvOj7Lrvg3yREsnbVWABGUVOE2hdiQwjoc2JO0tpdKBxLyJ
	 q9DBwlJWHcCsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D90A60AA1;
	Wed,  4 Feb 2026 13:41:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BD0FF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F146283E64
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEM6pxaBue87 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:41:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.222.179;
 helo=mail-qk1-f179.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E17AF83E6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E17AF83E6C
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E17AF83E6C
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:41:41 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-8c6a7638f42so1006291785a.2
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 05:41:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770212500; x=1770817300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bAk1XcGgqNzyB+GkNPpOpMMna52Nw6mVwpkvIMVjxYA=;
 b=LEM70MfoBAWAA0YY76+BxlgMhHqZNHfs4Pd4FM1ErmxXq/ea/VUY2uqa/gyNY3Sa/R
 BNU4j4E9cxoDUJmYEsrJP51jQdFCorvwV1a2CwLgNxLCgeoJ4cVyQCHMIyQHR3x6MIya
 OYLTULXabFXs/McPl0bG8Auvh+lmNaklXpzKPiIEzkprW8bq55w5he1VPHpKBhqf3wCu
 9DqtDnbmLFT3E1lfNOUnL88h6MR14iMzfSCBzviaKFwMYJOsqBqdzrJJb1R9XEmIVlro
 IpXySJXofCXCk+QAEV3LqNl2FJSUKAzUEWzrA4+uJahz92KGPIutqA50V5iv4rEjZlFo
 1hNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUND58vRgWUlxI63VNdfKSGeiGY6uD4E82sAr8t2+8tw9bqcnG8RtpyLHiRUh5Bn/vVJDel26r2u2Q=@buildroot.org
X-Gm-Message-State: AOJu0YylQ5kuHBFrrQIbh610tXgbTbVMeXT+E+nqxPcP97RK45pgo7xE
 UDyV/6O5uJciPjeDjl5yl+B2XbxaI8VC/+jERmN5KHMz3+qYuGBmp9ATry/lR4rD
X-Gm-Gg: AZuq6aKMull0q3FjDo8hHMHbApuIiTO0IlBwyCGiYMsi7AQdp8KDW5LEkUOhVYGjdpy
 3yRMzdVNTAOzV3CkKm4wwh8z3ehkHGozZHX46DWZSfV5k8UtDblet7CV9FKgwv4DXHtQ84nHtNX
 JQO6WWMV5k4Lg6pSqCjcFwEhiDHMqiPMBS3mVnI5zoB5cPdQp1IwKLal5NxXZ/lfh1XBW7OMVNm
 bJXSfpcuYvgp+G/ySQasEgMu29SHqKr58OGZE/CsTHm2Jp4Gml5v+01pmX6jQdx5typXvPBpwMA
 8ai336EdRDGdPI0o6EuPYXZGY4tZ2e+xbnR5pV2H8EqKnYPQQjGjBYcHmB/Jd/RtRAU14GPBHdD
 VUFpLWuQmIbBMzlDywsv/TbPNZSA8f+e6CM3/mYgq5utbrEqj6OzI7Rl3YjMambSw59a3oxUETa
 jvEbyGKTl1lqv0PskXaqeo5aLcdvCRhDRDYatYRrOcXG7ZF4pYFZQDfdhcrJErZUCB6DK82kb2M
 9arOPU=
X-Received: by 2002:a05:620a:480b:b0:8c7:16fb:ed49 with SMTP id
 af79cd13be357-8ca2f9c071fmr377233585a.63.1770212500331; 
 Wed, 04 Feb 2026 05:41:40 -0800 (PST)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com.
 [209.85.219.52]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8ca2fd494e2sm183673585a.46.2026.02.04.05.41.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 05:41:39 -0800 (PST)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-89461ccc46eso123133416d6.2
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 05:41:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVmgxiBZDJBbhNuLPXJmuxopTYSIWxIdCfsOq+1iMqvbe7Gzn5e98s/3UqJlNTsLHpQmbVUZYcB0+Q=@buildroot.org
X-Received: by 2002:ad4:5e8c:0:b0:894:6127:9018 with SMTP id
 6a1803df08f44-895221227e5mr35920926d6.9.1770212499169; Wed, 04 Feb 2026
 05:41:39 -0800 (PST)
MIME-Version: 1.0
References: <CACXRmJgF31hdsS_wY2tt6ok=CqMXbWwmy227s42jPw_tOZcPyw@mail.gmail.com>
 <20260204123609.3607193-1-thomas@devoogdt.com>
In-Reply-To: <20260204123609.3607193-1-thomas@devoogdt.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 4 Feb 2026 14:41:27 +0100
X-Gmail-Original-Message-ID: <CACXRmJh1-5Cy92kF9TM5nDs_uB90WAe5iOGmNNL2E-cMhJE7GA@mail.gmail.com>
X-Gm-Features: AZwV_QjuPe5xzfpNfEyDVMoYfeZ0-y1CLPJ0T9Ds8i_NncOPnO7G_2xpwBO134M
Message-ID: <CACXRmJh1-5Cy92kF9TM5nDs_uB90WAe5iOGmNNL2E-cMhJE7GA@mail.gmail.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: bernd@kuhls.net, buildroot@buildroot.org, romain.naour@gmail.com, 
 romain.naour@smile.fr, thomas.devoogdt@barco.com, 
 thomas.petazzoni@bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v3] package/mesa3d: fix compilation with
 host-llvm enabled
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Romain, All,


Update:

When compiling on master, then meson is somehow able to find the right
llvm-config, so reproduction only seems to be possible if the host
machine ships with a newer version as the one buildroot is using.

llvm-config found: YES
(/home/thomas/Documents/external/buildroot/output/host/bin/llvm-config)
21.1.8
Run-time dependency LLVM (modules: bitwriter, core, coverage, engine,
executionengine, instcombine, irreader, libdriver, linker, lto,
mcdisassembler, mcjit, native, option, scalaropts, target,
transformutils, all-targets, coroutines, frontenddriver, frontendhlsl,
lto, windowsdriver) found: YES 21.1.8


Kr,

Thomas Devoogdt


Op wo 4 feb 2026 om 13:36 schreef Thomas Devoogdt <thomas@devoogdt.com>:
>
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
>
> Meson's custom LLVM parser uses llvm-config with a default search path of
> /usr/bin, causing it to detect the host system's llvm-config (version 18.1.3)
> instead of the buildroot-compiled one. This forces all LLVM-related packages to
> match version 18.1.3, but since the host system lacks llvmspirvlib, the build
> fails. This patch forces Meson to use the buildroot-compiled llvm-config.
>
> Note that LLVM_CONFIG is a CMake option, not a Meson one. This is because
> Meson has custom dependency resolution logic for LLVM (see
> https://mesonbuild.com/Dependencies.html#llvm). The EXTRA_BINARIES mechanism
> cannot be used here, as it only applies to cross-compilation scenarios, which
> does not apply to host-mesa3d builds.
>
> Reproduction (On BR2 tag: 2025.05.3):
>
> BR2_x86_64=y
> BR2_x86_atom=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.24"
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
> BR2_LINUX_KERNEL_INSTALL_TARGET=y
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_LLVM=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
>
> Fixes:
>
> llvm-config found: YES (/usr/bin/llvm-config-18) 18.1.3
> Run-time dependency LLVM (modules: bitwriter, core, coverage, engine, executionengine, instcombine, irreader, libdriver, linker, lto, mcdisassembler, mcjit, native, option, scalaropts, target, transformutils, all-targets, coroutines, frontenddriver, frontendhlsl, lto, windowsdriver) found: YES 18.1.3
> Dependency LLVMSPIRVLib found: NO. Found 15.0.0.0 but need: '>= 18.1' ; matched: '>= 15.0.0.0', '< 18.2'
> Run-time dependency llvmspirvlib found: NO (tried cmake)
>
> output/build/host-mesa3d-25.0.6/meson.build:1882:21: ERROR: Dependency lookup for LLVMSPIRVLib with method 'pkgconfig' failed: Invalid version, need 'LLVMSPIRVLib' ['>= 18.1'] found '15.0.0.0'.
>
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
> v3: Added reproduction info.
>     Actually, I saw the issue first on 2025.02.x with these commits cherry-picked:
>     - 317260f336b65ff0b41a953882cb8cccb789e010
>     - 8b5dd49c5b2eb52e71ba9dff67b1ba54d0e00ac3
>     - 4890415aa9e918bdbb52414e0e53f29e93315291
>     - b08bc5b9e94269adb4a1c5771c8c26c8c87e5b5a
> ---
>  package/mesa3d/mesa3d.mk | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index db46d7bc7c2..b5300df2ba3 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -292,6 +292,9 @@ ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION),y)
>  HOST_MESA3D_TOOLS += imagination
>  endif
>
> +HOST_MESA3D_CONF_ENV = \
> +       LLVM_CONFIG="$(HOST_DIR)/bin/llvm-config"
> +
>  HOST_MESA3D_CONF_OPTS = \
>         -Dglvnd=disabled \
>         -Dgallium-drivers=$(subst $(space),$(comma),$(HOST_MESA3D_GALLIUM_DRIVERS-y)) \
> --
> 2.43.0
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

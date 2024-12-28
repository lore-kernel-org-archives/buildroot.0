Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD38E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 10:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C88C880F74;
	Sat, 28 Dec 2024 10:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_iMklu-Tv6y; Sat, 28 Dec 2024 10:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C699080F7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C699080F7A;
	Sat, 28 Dec 2024 10:25:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01D7DE0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D24144059B
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2GFJ6F8e6AL for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 10:25:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38D9C40595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38D9C40595
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38D9C40595
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:25:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DEAF1C0005;
 Sat, 28 Dec 2024 10:24:59 +0000 (UTC)
Message-ID: <06d13a33-f22f-4b9e-995c-3de3e209911f@korsgaard.com>
Date: Sat, 28 Dec 2024 11:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>
References: <20241215105537.1396270-1-bernd@kuhls.net>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241215105537.1396270-1-bernd@kuhls.net>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/5] package/webkitgtk: disable libdrm usage
 when not available
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/15/24 11:55, Bernd Kuhls wrote:
> Fixes build error
> 
> -- Could NOT find LibDRM (missing: LibDRM_INCLUDE_DIR LibDRM_LIBRARY)
> CMake Error at Source/cmake/OptionsGTK.cmake:320 (message):
>    libdrm is required for USE_LIBDRM
> Call Stack (most recent call first):
>    Source/cmake/WebKitCommon.cmake:237 (include)
>    CMakeLists.txt:21 (include)
> 
> with this defconfig:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_PTHREADS=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_RPI_USERLAND=y
> BR2_PACKAGE_LIBGTK3=y
> BR2_PACKAGE_WEBKITGTK=y
> 
> due to libdrm being enabled by default:
> https://github.com/WebKit/WebKit/blob/f736325e66bfa8e85f85387299448476f3e1fb3c/Source/cmake/OptionsGTK.cmake#L59
> 
> This is a port of buildroot commit 65f8174648a3df922892cfac1ad15279d1bffde3
> for the wpewebkit package, quoting its commit message:
> 
>      Pass USE_LIBDRM=OFF to the wpewebkit CMake configuration step when the
>      libdrm package has not been selected.
> 
>      WPE WebKit can be built without libdrm support, and it will still work
>      with backends that use other platform-specific methods to handle
>      graphics buffers and/or presenting content onto an output. For example
>      this is the case with wpebackend-rdk configured to use rpi-userland,
>      which uses dispmanx to produce the output instead of DRM/KMS.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2024.02.x and 2024.11.x, thanks

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

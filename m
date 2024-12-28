Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B06E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 10:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EC2860836;
	Sat, 28 Dec 2024 10:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKtEfg9HbYHf; Sat, 28 Dec 2024 10:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDF7960837
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDF7960837;
	Sat, 28 Dec 2024 10:31:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BB26757
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 775DD4059F
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fiopf1WIVTzS for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 10:31:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3725D40530
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3725D40530
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3725D40530
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:31:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51C10FF802
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:30:58 +0000 (UTC)
Message-ID: <2825aef2-2f20-49b0-9a58-1e33a8cd7edf@korsgaard.com>
Date: Sat, 28 Dec 2024 11:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241215105537.1396270-1-bernd@kuhls.net>
 <20241215105537.1396270-4-bernd@kuhls.net>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241215105537.1396270-4-bernd@kuhls.net>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 4/5] package/wpewebkit: needs NPTL
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
> /home/buildroot/buildroot/output/build/wpewebkit-2.44.4/Source/WTF/wtf/StackBounds.cpp: In static member function 'static WTF::StackBounds WTF::StackBounds::newThreadStackBounds(WTF::PlatformThreadHandle)':
> /home/buildroot/buildroot/output/build/wpewebkit-2.44.4/Source/WTF/wtf/StackBounds.cpp:117:5: error: 'pthread_getattr_np' was not declared in this scope; did you mean 'pthread_attr_t'?
>    117 |     pthread_getattr_np(thread, &sattr);
> 
> using this defconfig (and libvpx bump to 1.15.0 reverted)
> 
> BR2_arm=y
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_PTHREADS=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_PACKAGE_RPI_USERLAND=y
> BR2_PACKAGE_LIBGTK3=y
> BR2_PACKAGE_WPEWEBKIT=y
> 
> A backport of this patch should be considered because the code is
> present since 2011:
> https://github.com/WebKit/WebKit/blame/03f678fac7076e4d69318bfaae065e4c0eab0f9e/Source/WTF/wtf/StackBounds.cpp#L117
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

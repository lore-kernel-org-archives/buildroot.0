Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4307DC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:24:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACC576054E
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACC576054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5791D40285;
	Sat,  7 Aug 2021 08:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmqA0QxqaRKL; Sat,  7 Aug 2021 08:24:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A69840289;
	Sat,  7 Aug 2021 08:24:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BC2B1BF2FA
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3785F40018
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qf_TxxpXroL for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 08:24:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DF0740017
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 08:24:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f16c:16be:6f47:5c9a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 26B7113F88F;
 Sat,  7 Aug 2021 10:24:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628324684;
 bh=VR4Veor3oOz571prNz04MojEW+QcPyZrUZ6QKt3KA/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DBQsFPmabVBxkmnqgFb6VkEt9YAc7OBgMueVdQ52DGj2mS8VYmGoUXWepsjynlvL/
 eW/qO4ddY6+qQh2mGXlpZS+XYqodDRJ4tWili153uTJ6e2rDey4q/VoX4b+nvPHga3
 SXDpHux4K0jo1Zo9lzFMPKDObihiGXKPTqN2e9F8N3FOMk1Lum1sBHAdB+VGbLQJA6
 AIXzM+i+Ws2EhPBUg9MatZdIgAZcsbuMEDQpWMMnZi6vnRMY2R3P/XWqGPCIp1oSCz
 DqCzlLdFVugs1dmHY/pZ12zu+7X/RRLVnLLq0t3ePFI4koweRAXA1ZXcLmojGqvs9K
 tXDG6n8LnRoFA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Aug 2021 10:24:37 +0200
Date: Sat, 7 Aug 2021 10:24:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210807082437.GR27036@scaer>
References: <20210806211048.115264-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806211048.115264-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: disable vhost-user with
 uclibc-ng
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-06 23:10 +0200, Fabrice Fontaine spake thusly:
> Disable vhost-user on uclibc-ng as it raises build failures since bump
> to version 6.0.0 in commit 6b86c9335fc3ff381878156c6243454d4b688df9 and
> https://github.com/qemu/qemu/commit/810033be083040591fee2fc09f2f294670ed1930
> 
> The issue is that F_ADD_SEALS and F_SEAL_xxx variables are not defined on
> uclibc-ng (even if MFD_ALLOW_SEALING is defined) resulting in the
> following build failure:
> 
> ../subprojects/libvhost-user/libvhost-user.c:1637:22: error: 'F_ADD_SEALS' undeclared (first use in this function)
>  1637 |     ret = fcntl(*fd, F_ADD_SEALS, flags);
>       |                      ^~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9f393539931b51191cf7128e5c618c2398fc86c1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qemu/qemu.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index b2a9420b21..1854aed201 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -201,6 +201,7 @@ define QEMU_CONFIGURE_CMDS
>  			--disable-capstone \
>  			--with-git-submodules=ignore \
>  			--disable-opengl \
> +			$(if $(BR2_TOOLCHAIN_USES_UCLIBC),--disable-vhost-user,--enable-vhost-user) \

I've changed that to use a conditional block, like we use for all other
conditional options.

>  			--disable-vhost-user-blk-server \

I was wodnering whether we would have to do something about that, but
no. It's disabling the option, and the configure script checks it only
if vhost-user is set.

However, there's also vhost-user-fs that we do not handle. The default
is disabled, so that's still OK...

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  			--disable-virtiofsd \
>  			--disable-tests \
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

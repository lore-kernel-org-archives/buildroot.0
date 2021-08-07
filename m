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
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE4EC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 21:20:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AAC260F42
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 21:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AAC260F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1821A606F2;
	Sat,  7 Aug 2021 21:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oiWQF2K1DEAt; Sat,  7 Aug 2021 21:20:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FB7E60656;
	Sat,  7 Aug 2021 21:20:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79DAA1BF3BC
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 21:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 687954017C
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 21:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tu8qaMhHWt6X for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 21:20:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 276DA400EF
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 21:20:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6435:5a60:3dd3:9849])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A12697802BE;
 Sat,  7 Aug 2021 23:20:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628371218;
 bh=vl5mMoFcovC0b8GgxcPLU0FTiAZIppQZGGQluDmpPug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lGX92SZnut0ZSVPikooXVt0nONo3cSE5VAJlhrnPV8XW/m8Q+nrD5S4zUu/0+NUe8
 c3TWpIC77e/78leGV8Qbqfw7AQGUMYEZkdPCBPbAnHo75PdxlJI5gnVi+6jjDqmC8N
 bwmICbKnTAIBDGijtinJtM7BE0r0Gu3SP2AfhKSlAGP+qgNasL7QbLPHUDHF3fiYL+
 UxytrPx1DcqIGHIEY27hG9LesBDI4FBq876w+bWdLsoRG+79DTI5QEbib7crlCz0ny
 nv0f3NiFZJr+z1J6kxz/z6xEaSFkU8bbP2H79tzk6HPZLJTUSo/cEhq5KfNzuKv3BK
 ET8OhZLUOeLvQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Aug 2021 23:20:11 +0200
Date: Sat, 7 Aug 2021 23:20:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210807212011.GG27036@scaer>
References: <20210807172359.974226-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210807172359.974226-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libvirt: disable stack-protector
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-07 19:23 +0200, Fabrice Fontaine spake thusly:
> Set warning_level to 1 instead of the default value of 2 to disable
> stack-protector and avoid the following build failure since the addition
> of the package in commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:
> 
> /tmp/instance-5/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: tests/commandhelper.p/commandhelper.c.o: in function `printInput':
> commandhelper.c:(.text+0xad): undefined reference to `__stack_chk_guard'

It is sad that they misuse the warning-level option to drive the use
of SSP.

That change is however relatively recent:
    https://gitlab.com/libvirt/libvirt/-/commit/a9461d456c9017322fd10ecc9539c6788a27d476

and that commit only speaks about honouring warning-level for warnings.
It looks like the SSP settings got wrongly pulled into that conditional
blovk by chance only.

Probably, they would not be opposed to a fix that gets SSP back out of
the wanrning-level condition, maybe with an option of its own...

Could you look into that, please?

In the meantime: applied to master, thanks.

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.org/results/a2657eb18b579752c8217ab356adcb52931f6785
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libvirt/libvirt.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
> index a0fd5af951..198e64d24c 100644
> --- a/package/libvirt/libvirt.mk
> +++ b/package/libvirt/libvirt.mk
> @@ -51,6 +51,7 @@ LIBVIRT_CONF_OPTS = \
>  	-Dsysctl_config=enabled \
>  	-Dtest_coverage=false \
>  	-Dudev=enabled \
> +	-Dwarning_level=1 \
>  	-Dwireshark_dissector=disabled
>  
>  ifeq ($(BR2_PACKAGE_ATTR),y)
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

Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79B1C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:57:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CBB5611B0
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CBB5611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 090C140240;
	Sat, 11 Sep 2021 12:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0XXC9c34FjUP; Sat, 11 Sep 2021 12:57:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14C104011A;
	Sat, 11 Sep 2021 12:57:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 579371BF31A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47642607C2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQt_XEle4LOb for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 12:57:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 702F4607BD
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 12:57:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 878D2B00572;
 Sat, 11 Sep 2021 14:57:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631365027;
 bh=NtSq5dTNlBbFOzuhejqfvG9gOpgTaNF+7/gD0ZF2sro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=upvy70bl+GQdZEdlXGF9LsQsstaJBrgs+JE5vkX7JCRmeD8bj7zETMrSSMn7dXCzB
 W70fN9hT2wqcxUXejwH1qor8Ab77s85jWjC8RlX5Cm040PimiVE343DTQ2aov61lbg
 B2znTqv/VoLSC+UmAIoA9DGAsQ93jgSUoAQwQrXg5R16s4XBbWyjLeJvUrRuCTZRe6
 bG8zKLGQmfGt+mswe6QP1K2j+hPpKIZZil9LH4J3o/fTJnE/ipsilxByhDSQcRVdbz
 5KzfaH8M5NwytLZyWjplIf5eKVS346dgJ4k3rvF6HTIj+1l8Jk0G5qbvgEs/esV2wq
 HsQTnWLNcqB3A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 14:57:01 +0200
Date: Sat, 11 Sep 2021 14:57:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210911125701.GO1053080@scaer>
References: <20210908063123.463952-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210908063123.463952-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: alsa needs seq
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-08 08:31 +0200, Fabrice Fontaine spake thusly:
> alsa unconditionally uses seq since version 0.2.90 and
> https://github.com/PipeWire/pipewire/commit/818fb9e904a3ea43ba313994e404f1b63833c548
> which will result in the following build failure since commit
> a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9:
> 
> In file included from ../spa/plugins/alsa/alsa-seq-bridge.c:44:
> ../spa/plugins/alsa/alsa-seq.h:71:2: error: unknown type name 'snd_seq_addr_t'
>    71 |  snd_seq_addr_t addr;
>       |  ^~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/65e3a9185b3b84ad78cd05f788f741b8734d2bbc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pipewire/pipewire.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index 2317398088..aee0191894 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -52,7 +52,7 @@ endif
>  ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
>  PIPEWIRE_CONF_OPTS += -Dpipewire-alsa=enabled
>  PIPEWIRE_DEPENDENCIES += alsa-lib
> -ifeq ($(BR2_PACKAGE_ALSA_LIB_UCM)$(BR2_PACKAGE_HAS_UDEV),yy)
> +ifeq ($(BR2_PACKAGE_ALSA_LIB_SEQ)$(BR2_PACKAGE_ALSA_LIB_UCM)$(BR2_PACKAGE_HAS_UDEV),yyy)
>  PIPEWIRE_CONF_OPTS += -Dalsa=enabled
>  else
>  PIPEWIRE_CONF_OPTS += -Dalsa=disabled
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5483EC54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6ADC402A8;
	Wed, 13 Mar 2024 09:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwVJiGhJ8mb4; Wed, 13 Mar 2024 09:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E840C40412
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E840C40412;
	Wed, 13 Mar 2024 09:48:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 935201BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 826C3608B9
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idKMU0S8L0UV for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:48:22 +0000 (UTC)
X-Greylist: delayed 578 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 13 Mar 2024 09:48:22 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3787B6073E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3787B6073E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3787B6073E
 for <buildroot@buildroot.org>; Wed, 13 Mar 2024 09:48:22 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 66BEB440780;
 Wed, 13 Mar 2024 11:37:29 +0200 (IST)
References: <20240313091412.20865-1-francois.perrad@gadz.org>
 <20240313091412.20865-3-francois.perrad@gadz.org>
User-agent: mu4e 1.10.8; emacs 29.2
To: Francois Perrad <fperrad@gmail.com>
Date: Wed, 13 Mar 2024 11:37:02 +0200
In-reply-to: <20240313091412.20865-3-francois.perrad@gadz.org>
Message-ID: <87il1qqxnj.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1710322649;
 bh=7MmsbJq5EZqj7hsp7KdNAQ6uZJZfrmj2Asyew2mAStg=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=uJ3YhjNazrnB6DXVCD9AZMbhFxRNw5zdmnfrQZQRQ7WWrmXicz2BHJgFr/08EqsF8
 7qQkMbXHTXJ/bBhdGwLTEONUXCLXCCazLVbcUAyaZm3nA/EGJa47cMrQqDiM6jR/rG
 K6iKMK+dq/UwvW0gD+pkMViveboJooc3TMNfyKWD5kIpsrwV51bxqR73p+dm4JGDzb
 3tWc+w4tRz1BM7W2QwD1Wgg9iXslzL65u7lhSTqj9Ci9bh74hx+6aOXEleteeC+KF+
 bHzerY3WheqwqL5dwLUGLXcAhWLVfy8zSFSzrkf36xx+QhWCHqSz3AnAySY/BRqYi/
 ddHKqLc88bbGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=uJ3YhjNa
Subject: Re: [Buildroot] [PATCH 03/31] package/dcron: disable busybox crond
 & crontab
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@busybox.net, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

On Wed, Mar 13 2024, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/dcron/dcron.mk | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
> index f0c3efbf8..d4dd48e77 100644
> --- a/package/dcron/dcron.mk
> +++ b/package/dcron/dcron.mk
> @@ -33,4 +33,9 @@ define DCRON_INSTALL_INIT_SYSTEMD
>  		$(TARGET_DIR)/usr/lib/systemd/system/dcron.service
>  endef
>  
> +define DCRON_BUSYBOX_CONFIG_FIXUPS
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_CROND)
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_CRONTAB)
> +endef

Do we still need dcron in BUSYBOX_DEPENDENCIES then?

Same question for other patches in this series.

baruch

> +
>  $(eval $(generic-package))


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

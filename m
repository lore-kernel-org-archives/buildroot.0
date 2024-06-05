Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEB4C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 21:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F16C41684;
	Wed,  5 Jun 2024 21:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15e7O3VBmfUe; Wed,  5 Jun 2024 21:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F8AF41696
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F8AF41696;
	Wed,  5 Jun 2024 21:55:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 945FC1BF5A8
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80CFF41684
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eU9eZG1odlQo for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 21:55:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 314D841696
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 314D841696
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 314D841696
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 21:55:33 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-421396e3918so4928055e9.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 14:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717624531; x=1718229331;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nT1YAQBUwnKINX40d1focz+I7ruxURHUN+UwCh6Pnf4=;
 b=NBpNuVccaXdZo+zm9zXYi+Dihqsgo0cwx1a9Ckn5a6ioonXGyyMtKRdH+7lkzK41qT
 SFlojZXg7ZELmXVuvzdiimB7zN966vdeVZskqFDAiLXivnpfxg9NURWyep9UoQpfZgeY
 x4icE9FXXtpOzH046ov5hQXA+eFB+GAFc9IFQYp2uxQDarpRPYL/HjpOGlYUbB2mP5EU
 uX2tgpkqiNThexhwNPy4viyY9mKLXv/MgWUMsuE6X9GMqG4pYxTqSutVgum2ey7Itw7R
 L7yJ4cpCQ4Dfm9opeQ7/REgHhNffE4Z1tACBRBjCQvP2ZIp/C7VV8IGxBfYabwuH+g/Y
 nm6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJhPsLCEOrsqdSRo4ydQF0I6fllvzOVq3BKzROjzF3Fuug6qvpYrhYA8/2fQdSIdJ04Vu5mS5ZrU+5ryZg6c7DlAeb6k92PA==
X-Gm-Message-State: AOJu0YzAD3+kV0lBkTVbDPeOSvVjlnXp5ilAigW1tMNNAwfcrh4LAdlx
 sdayeOAOZrZBIug+FaatKUhSPHl6nvB9GSLQwgf8LGG0cJhJD6NC8cWZhga2ZA4=
X-Google-Smtp-Source: AGHT+IFSjdc8gS7dMDn/gLYtfImE7HhbVw8TXqN4dZ09VSod4mEy+NvAFyXxp9QIhz9DpDw2ba0bSg==
X-Received: by 2002:a7b:cb90:0:b0:421:2429:7e46 with SMTP id
 5b1f17b1804b1-421562cd308mr35953625e9.13.1717624530959; 
 Wed, 05 Jun 2024 14:55:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2a7799sm1244105e9.27.2024.06.05.14.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 14:55:30 -0700 (PDT)
Message-ID: <9858a2c8-4da7-47e1-9c57-0ab24ae262e2@mind.be>
Date: Wed, 5 Jun 2024 23:55:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717609998.git.yann.morin.1998@free.fr>
 <f4334264ed663d495ff9c8a095c0f56b4b4daaa3.1717609998.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <f4334264ed663d495ff9c8a095c0f56b4b4daaa3.1717609998.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717624531; x=1718229331; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nT1YAQBUwnKINX40d1focz+I7ruxURHUN+UwCh6Pnf4=;
 b=MiUCw3ogsKbZDTbrkD51X/R2arIuDuMQWhShVSA3eCZRiF/YALUqY6aRSFly4/tCdt
 gaORDFrjibcgviRfM5G/CkPqomt2zCbocLhQOT6DiXkweDaM5gNq3TZGPqMiQcfEooVV
 lw7dMhhmY0p4G0QEwLr3qzBquyDYvM1wcpusyc+867VCGq/aG3EKl/0akbTwjOA6jYAp
 bzW4/qGjSdmiJNt796cvIO6272lYhQjwktclWVohx8hnapaySye5zQhkOk1jzfQvjU47
 RiJFmr98le3uOvuz9sObgWJ6nakPxEwte1HB9eiMUmfGaKTH7dSkmCnZs/f8QAocmECt
 uGzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MiUCw3og
Subject: Re: [Buildroot] [PATCH 10/10 v2] package/sunxi-mali-utgard-driver:
 handle patching the Buildroot way
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2024 19:53, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   .../0001-build.sh-do-not-apply-patches.patch  | 39 +++++++++++++++++++
>   .../sunxi-mali-utgard-driver.mk               |  3 +-
>   2 files changed, 40 insertions(+), 2 deletions(-)
>   create mode 100644 package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch
> 
> diff --git a/package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch b/package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch
> new file mode 100644
> index 0000000000..02c6aa7884
> --- /dev/null
> +++ b/package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch
> @@ -0,0 +1,39 @@
> +From 079ed8aa57ba6629b992c3d0d01904d3e5170d3b Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Wed, 5 Jun 2024 13:06:16 +0200
> +Subject: [PATCH] build.sh: do not apply patches
> +
> +In Buildroot, we handle applying the patches in a generic way, with
> +appropriate tools (e.g. with a proper tar).
> +
> +Upstream: not applicable
> +Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> +---
> + build.sh | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/build.sh b/build.sh
> +index d1fedff..26efc53 100755
> +--- a/build.sh
> ++++ b/build.sh
> +@@ -10,6 +10,8 @@ BUILD_OPTS="USING_UMP=0
> + 	    USING_DEVFREQ=1"
> +
> + apply_patches() {
> ++    return 0  # Patching handled by Buildroot
> ++
> +     pushd $2
> +
> +     quilt push -a
> +@@ -22,6 +24,8 @@ apply_patches() {
> + }
> +
> + unapply_patches() {
> ++    return 0  # Patching handled by Buildroot
> ++
> +     pushd $2
> +
> +     quilt pop -a
> +--
> +2.45.1
> +
> diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
> index 72fade58ed..b8a12247d3 100644
> --- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
> +++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
> @@ -16,8 +16,7 @@ SUNXI_MALI_UTGARD_DRIVER_MAKE_OPTS = \
>   
>   define SUNXI_MALI_UTGARD_DRIVER_USE_APPLY_PATCHES
>   	ln -sf $(SUNXI_MALI_UTGARD_REV)/series $(@D)/patches
> -	$(SED) 's|quilt push -a|$(TOPDIR)/support/scripts/apply-patches.sh . ../patches|' \
> -		$(@D)/build.sh
> +	$(APPLY_PATCHES) $(@D)/$(SUNXI_MALI_UTGARD_REV) $(@D)/patches

  This looks like just cleanup to me, not fixing anything. Except that it makes 
sure that the proper tar is used, but that's not even needed for apply-patches.sh.

  So I applied this to next instead of master.

  Regards,
  Arnout

>   endef
>   
>   SUNXI_MALI_UTGARD_DRIVER_POST_PATCH_HOOKS += SUNXI_MALI_UTGARD_DRIVER_USE_APPLY_PATCHES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

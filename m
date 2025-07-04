Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97AFC83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 806F68125E;
	Fri,  4 Jul 2025 06:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNVr3GCdm87T; Fri,  4 Jul 2025 06:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE9FC81D72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE9FC81D72;
	Fri,  4 Jul 2025 06:48:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 327231EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18BAA813C9
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFq0HFeZqN4r for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:48:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35A868149B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35A868149B
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35A868149B
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:01 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so470754f8f.2
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611679; x=1752216479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+fmrubwFxWQRqTuSoXJSBmBT9O9Zxf+LUK+Z5wX9j8A=;
 b=dFBIevHV/dA3WRuwlJb3i/eoSTuu1iMQ52cXd4K7SJRef4CwrSNoc5i3mIZ9j8riv8
 /YgMFJ/X2pNLCye4AJmR8FoPnk7K7QWqycSjs1jnWM0oT+Z2j+vyute3mGqvDcZE3mvM
 FrYkPc4xE8164uc0RpOwrkXU/DPlsJ9wb8o2v6XKdggE/mnWZOxCCNUEP0YRRbmyn5AC
 XWhzQn1Jw2XltWPqAvgx3+PQ5nGQkgX9bCLXMvpi26IRXJuo1XdbFD+JeM7U3PlF3E3U
 Z4p6VR7Wb2BsiXXJoPFrlw5XXLSCHbYmUMBcmy6psQFxgwVkkumJMntWgs1cE1+j6H/t
 03eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk+JA1KIbngUOr0WzQcKD4pN6BHjj6LAQfnJIotmA5zgykNB7Oizqr4CNd2UOrDdz5tvD2qz7Yg3w=@buildroot.org
X-Gm-Message-State: AOJu0YzvcpSCZw3omM1r2HmGIZfjtIGN2DCKvnREM5DG5FdrWYeFixv3
 Jn6qnbS94/V6aY11pjgR2BHbFFnVCWJO0T3h8Vb8NuCXRylcfYyqodlu0YGGjB4pp/gKt0RWzwK
 C6RdE
X-Gm-Gg: ASbGncszP2dZJkf5DTlg27Vok0vPw4a5FaoITCYpUJ5VMMTbPcx9dXbunLQMi7UoAYw
 Q9N9IoROLLW2MI74aD7fOXtOGAO10czvTsnGG9Ki4AXygjNTy52BGjUucoxvMaO4qBFkQw4HH94
 +tF5+B9IhkpkxXhbifcpOVnOZPoL+hgQe8puhMQRnqAv3hDpANfI2Mmbac0JSDWgQuqxOQJlUre
 4MSqjmaFJTTSL1ahs+eT1MQNa3CIINnYhPhCUaPa/zixovJ7xEqQaJl18LJ+P4+iH4mZkcB+SR0
 G3dJkN84IrtBpPVPYJcrXYkfL7y4aPKXv+IkKJrT/9QToHtWXhcyYP4YDXalk6mI+DWRO6+R1+X
 Peob5a7t80g==
X-Google-Smtp-Source: AGHT+IEpfIXJTE3pFoXmERN9x4YGUiMvDl5omDByWagpQHnirpTcttXa0sEHOJpQA6cKLz9cjdHNXQ==
X-Received: by 2002:a05:6000:4205:b0:3a4:f70d:a65e with SMTP id
 ffacd0b85a97d-3b4970315damr628992f8f.37.1751611679274; 
 Thu, 03 Jul 2025 23:47:59 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b97339sm1672095f8f.64.2025.07.03.23.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:47:58 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:47:56 +0200
Message-ID: <20250704064756.4065302-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250624204604.2199246-1-giulio.benetti@benettiengineering.com>
References: <20250624204604.2199246-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611679; x=1752216479; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+fmrubwFxWQRqTuSoXJSBmBT9O9Zxf+LUK+Z5wX9j8A=;
 b=gWPmFXkmeyhJHI6hRZ4FxxZWa+IcjyGqYAdCBTjM4+Thte02NeUrAThX0Pypxa8MxM
 S2nrr1aQe0o1TsF3BfeD66zLBbUwn1FVW5tCZIF4dvNECgPwIMaLH/eDRMOD/NCGck2f
 dzRYsz3HiPD6lbGYoTSykGER1NkVCCf882fkbXxMFg5gBaRMeVfAZqo5RuKevT6FbE2f
 XfgEhfW/oe2q3pFU+P5PvfKil4WAx85yGn8lhmqxq9nlUr/Y/oJC77TrsPTTR6ki5av0
 OpsrRvS4KYJZAVdKil8Abix/wTgeq7CGZ1Sz3nrOkeNLvoybS7XuDvzwIHaynMYpFVzj
 XOPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gWPmFXkm
Subject: Re: [Buildroot] [PATCH] board/freescale/mxs: fix Linux booting
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Actually DTB_LIST accepts only file and not files with relative path
> preprended. This leads to have vfat without .dtb files and so Linux
> doesn't start. Let's fix this by including slash in sed command as done
> for mxc.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.05.x. Thanks

> ---
>  board/freescale/common/mxs/post-image.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/freescale/common/mxs/post-image.sh b/board/freescale/common/mxs/post-image.sh
> index 0bfb835c6e..65154fa8e0 100755
> --- a/board/freescale/common/mxs/post-image.sh
> +++ b/board/freescale/common/mxs/post-image.sh
> @@ -7,7 +7,7 @@
>  #
>  dtb_list()
>  {
> -	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
> +	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([\/a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
>  
>  	for dt in $DTB_LIST; do
>  		echo -n "\"$dt.dtb\", "
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

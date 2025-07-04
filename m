Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85351C83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53E7483D32;
	Fri,  4 Jul 2025 06:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7TbhcfrpS4i1; Fri,  4 Jul 2025 06:46:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9961A83D60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9961A83D60;
	Fri,  4 Jul 2025 06:46:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 016937AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC50E40FA3
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEocpW7J6Qle for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:46:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E49140F8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E49140F8C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E49140F8C
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:44 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4535fbe0299so2820285e9.3
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611603; x=1752216403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bv64XQPlKiGCZ+0HFhRDOOUoKxMEmnzbl6K1r06Qo5c=;
 b=rEnbqDrvnQzzyC9XvxQHj8BWBBXIT0QpNG9g8/o1DgnFGU7Kv25zqVGNZQ+hFVJ7Hk
 OSHt9Q94eLKutHVFZSjfA4SlAKgxshaM4em3JQqbw0ufvcecUSF4uqbf/cDMsTzQxN7A
 /KeetqphKYrM0/IcvieqnDdpwyV7ZsJNY2Y7p12QguodC2/nqcOh4MFpaN79S9kfrq/1
 BfPnMQPSRDfgapfjPMg5835RHZ7/KK+FdAigUrRB6s4CGz6bNUIIxyKBeE1B5AqIvilY
 yZdYdWFhKAAE9C6YeTdbJyAoJCvNAAEpluquLd1Bt1ReaW9HlnYanak9rTS/JDAWfelk
 FvJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/PFSMb8Fyd4MZtm9mZNNittcQmkrwIXHs+eX6hkT+E6lDYVxBk3T9KbLc1I8fnnCRXwVrJ4n8opw=@buildroot.org
X-Gm-Message-State: AOJu0YwGNOT06XL10sNJD7g/XRMS5tBbM9+Gk0EopVtESai7s9OJ9+jL
 iKWAvpt4VdevqeDMlphWz6ajaOb5XLqcxzOCAbLdCtYcosBWTwz57PYyQOBehGk+ocj+6fVshOT
 PWdu6
X-Gm-Gg: ASbGnctsyDlMRDNC37Z1TO5xnDiFwbhO0a5Z+PuXABwqoaHamhv04qWeVLqCDX0ElfW
 +B/jpLMUI43eQ/nTtGy6EbE0DfDrUxy7XkzVVoRAZAsOH8HeXvRmEhwmlROe1Rkr86WM/j8qQ6k
 LpLnuTRhuLeyTyS3Iftai33XuwKtiJaQJc0DKd4cazooKo19R06kuNmj/z5yOtuGX+1Pe0g7L6q
 /m98S2c0pCjloeKcTOQPaQjLBDCvPAaMeoc8P4CFz8cN0mqTbPghZAcZ0NolO6AbcOlDwVPeOcN
 K0a7LauWmDB3L7xxI0CMQ4t/oLKam0aKQVG/BvU20ze5JkOW0xeL2PYaHDnn2bHH4LKmYBLL6CQ
 2uEbpDNzn3DhDEdiO0t0v
X-Google-Smtp-Source: AGHT+IERHOLFDtl2jlhkCDciy/OqFmpF8uNQIZYbN5uMDmBtVlQsoGuT3Jzhkm35g94OiKaM/nhH1Q==
X-Received: by 2002:a05:600c:4755:b0:440:54ef:dfdc with SMTP id
 5b1f17b1804b1-454b31159b2mr10871865e9.8.1751611602857; 
 Thu, 03 Jul 2025 23:46:42 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b1698f54sm17335725e9.33.2025.07.03.23.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:46:42 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:46:41 +0200
Message-ID: <20250704064641.4063963-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250624204604.2199246-1-giulio.benetti@benettiengineering.com>
References: <20250624204604.2199246-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611603; x=1752216403; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bv64XQPlKiGCZ+0HFhRDOOUoKxMEmnzbl6K1r06Qo5c=;
 b=BzlVIL/mAmMo58I++VEv/Sw9vJtiynlC6r+QY9pk3Jx4rJBlcqFtsLbfJpXRWIg1L7
 xfsvdThPZke2z929kaSzGnzaNVI7CrHOd8ZSEQUWaFjGsNW1sVvDsd69IEY8R9dla9BG
 OaqP2mrcwZSkNWSEdlcrmnKrWV0pcI3ajdkJnRUsmavx0j9o3OmFK+C82SINeNiN1hfb
 G7JnHwv7EzOoJh0O839awNZlXb3mbhRwUJd1K2k6dlpaamhrDPR5Cvzcj7jJlju5MTbJ
 C4PCtuNdaGMEbeEWBIx4ZBIps+jw07PDOhnN4TJ+05lnzsjI0VXuJ4yk84N2jMDNSich
 ccEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BzlVIL/m
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

Applied to 2025.02.x. Thanks

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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BCCC44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3321F810CE;
	Fri, 10 Jul 2026 13:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8FFTMGBXZ4f; Fri, 10 Jul 2026 13:51:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 555A8810FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691490;
	bh=Bg9znc06JftNRwRggiYFMajQ+/V5z++Unu9At7VMeAA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jrWCuAiiSrJ4fD7sMsLSBgSGCVaKD8Q5dbGgN2W4vQFtG02u13JtywTEMHcXpmniF
	 ccg0c8PEtDYVp8LMcjXaE/pT7Knpn0YXoZYqBDUSy3sMb0+7bJu6YdxA2JZpF8HxQD
	 M7eZHmcU33pPsegXdiM54yzbylO+pp3YoNhUimM+La1Oybc+axNgQpiwkFNXF9JA1U
	 ghI+tjxORMt8DvgkEnE4Y/X/S9+0epiPGTWeZUeR4aMv5/k5Y8INPSEAhum0fR1rT1
	 ef/lltffPBylpnukvWbcXxoO24GcoevreRc43Jfu4dQZKw7DKt+G1sAGFMldO2zVCN
	 zFE1hLW0CgR4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 555A8810FC;
	Fri, 10 Jul 2026 13:51:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 976CEA3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89291810FC
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqWP5K0s78J7 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:51:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D216810CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D216810CE
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D216810CE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:27 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-476a130c138so1241179f8f.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691485; x=1784296285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wEU1QXtKmMspR98Ac34KGds6BGAlVwkCdmLrf7oGnz0=;
 b=F7IOF12n51INuXCi1omkmOBCLKW5sU43pyNzH9JGmp7CSv2uI0Vl4v93doA/YPiJiU
 ap2m3B/+UuNCfZv+3DKKbujRs2iJ4sbxmiHD5Dquut8KvHYk6B7X+IC4Lp/dK72knv8g
 WdDZWLuw6luCiN3ubMxZ0s7cXVP8XfxVMv8iPcrAY+1HdGnl833riRrrEBGRorvUPstV
 us0DRvtePfb9zJRw1xe21QpqeEEwHTiAXCyJ5UkSXmGR+T8DuEOfVwMHJ3vIhQC3EZnZ
 Sv/+TbM6Gml+ive2YUqZFr+/LtffbeIJosKW5/ZPKT2XkevhlphvJpsi1C/TO9QHWYBR
 JgJA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrIqQqAUINED591/BWIQszGm9VbYewN2U6f52r1SE6Oc3tn9K7VPoI6KH2+5OTwxaMLJw/w4PQYQZ0=@buildroot.org
X-Gm-Message-State: AOJu0YyFMpM0RcEBaaDhXvBvBJjpQUqdQ5NlTTVbw5tl2qEjOtAho9cF
 WtjxQkdNSMyu6N2YTYUYe9ZB+yDLfjRETgTQU6QZ/nx09taNq5vtAutGVKcYstjijyxzYYWb6/U
 xHPUj
X-Gm-Gg: AfdE7cmhff2OLngAhpMkennlPmVVrkcQr6fPA+OOl/R71I00Zj33Wz+5Cpcm0dT1qEp
 eDP8n5YuhfkvffncuxyUZAQ9rPBoElAiY935yOW5HTAZjYO65pxihACSH1wsCv/ohdHoRH1nPTm
 N36hzS9BcoJBLBiI2oi+5aEXILTq/C8VatT/MLNo6n2RYFFCJE1yGWrAngDlhvJJp2Rf/Fiz/yM
 qdwhAVHKUlCRIWYABuEqtjH3bUWC25JssuwL08gzTs02FV4BjgLtmcE64xmes444LYW2HZKG5eH
 c/jmH9ogVlzH2AOik2LjzEhdnqM15OrgP8fuCuAbAW+v3rzb/6ZsnJ/Afv8wgsknS9jf0z4Hygk
 Y6C4pRpyVqm4vU9U04iFeALz5Pvkjh27L4Z0tqJmzvasve6J8MQNJ3nnrCsCg+SVzsgOVPUDVXB
 Sclhuilk611w9uPPNT
X-Received: by 2002:a05:6000:2dc5:b0:473:1ccc:15cc with SMTP id
 ffacd0b85a97d-47df06bb590mr12779405f8f.0.1783691484781; 
 Fri, 10 Jul 2026 06:51:24 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039af67sm68132159f8f.17.2026.07.10.06.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:24 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:24 +0200
Message-ID: <20260710135124.758886-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706142304.431254-1-titouan.christophe@mind.be>
References: <20260706142304.431254-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691485; x=1784296285; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wEU1QXtKmMspR98Ac34KGds6BGAlVwkCdmLrf7oGnz0=;
 b=cMe5c501M1iMNyff2NLJR+BiT4lKOqxKnylLeMQU+udmHZP4DoD4+7ykrElTUOjbMe
 6RVBZ6aqM5ZSU+OEH1ksYY6boZYuhyjX6RqsVfwR4sAaSfMA+mBnfUm3lCGKVPu9MiV2
 KxcyNqvgy2XeWj/Cd/I1R+PxXy0k38cpPb5xOTQmBfHgrDik69yHOjx4f2JQn4M4/rT1
 M0/OeBE6bSjNPg7va7tzQnpBf6dIBzMN5NsJbPdENRwF9hY6iyz0x2YjW/8V25YI/AZj
 NFvFJ0trgMKamq4agWRfy2/m4L/duI3FJZ9PCDg8z6RbKMCbsTkf+DJgCIrOjlTTPWq7
 Su0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cMe5c501
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/openvpn: security
 bump to v2.6.21
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
> See the release notes:
> https://github.com/OpenVPN/openvpn/blob/v2.6.21/Changes.rst
> 
> This fixes the following vulnerabilities:
> - CVE-2026-13117
> - CVE-2026-13698
> - CVE-2026-12996
> - CVE-2026-13122
> - CVE-2026-12932
> - CVE-2026-11771
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/openvpn/openvpn.hash | 2 +-
>  package/openvpn/openvpn.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
> index 957537dde6..2c90b87974 100644
> --- a/package/openvpn/openvpn.hash
> +++ b/package/openvpn/openvpn.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated after checking signature
> -sha256  952ecee5b911a5353c0a6d40af62a7076c6dea1481ef204ce6d3f10481531315  openvpn-2.6.20.tar.gz
> +sha256  24cb6185e544a47323d6798b03d39f2367d96f227bee9cd1543e8ed528319b17  openvpn-2.6.21.tar.gz
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index a117f6ee8c..9ece4df3d8 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENVPN_VERSION = 2.6.20
> +OPENVPN_VERSION = 2.6.21
>  OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
>  OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
>  OPENVPN_LICENSE = GPL-2.0
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

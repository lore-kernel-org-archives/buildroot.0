Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D843CCD185
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 668F880E64;
	Thu,  9 Oct 2025 14:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3luW0dpGbr78; Thu,  9 Oct 2025 14:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A4F480E37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A4F480E37;
	Thu,  9 Oct 2025 14:54:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE47B119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEEBA80E18
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jt0PbCOkPeZT for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7888C80E1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7888C80E1E
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7888C80E1E
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:40 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3fa528f127fso820356f8f.1
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021678; x=1760626478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wb6pjIKX88ESqN9ZD6M6FGRFKwZ6HSSs7qgbyrK9pjc=;
 b=QTZClLepoP05bI7sQq+C0G2VZDVtURMLs6HcPGkh5M6SAuQlM3MQ4mvhO4bzD+MV32
 obdKR1GXnJ3LyoDl1gUMdoZZJ3S+1lVkj18ztmjVt3uee3olV2LcNYQ6CzLH2pChC8FN
 sNz2dy88MkUkNSANbVlG16MAl85yhLkrvZSadF9rNIczaCfZqTD94g0fMMSacN74JxL5
 UlQ5DCByek8sNiijOZkwfNe3Q8hY4Ags4m780bE2MB1b+XXFH/iWUNFHC7fijywUbPby
 Y0SzkD1ladtChITYT7JOFezp1Rp2g9y7DGLt7FJ3h5gKaCsmlwX3u5N6nvmlBFas+QWC
 9S1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7fVlF3qweGwCvpb1aNive37Eyy/vCQx0TdjmfZNv+jPaJLwYnwQ5wIjmkUCcZKOnGo42oEgUlrbs=@buildroot.org
X-Gm-Message-State: AOJu0Yw4e+MWQpWjqVzZGln957Ki2roYImBz2bPOK/++1jxbpcRXth2C
 8WG8pS7NWly3rJF3Dyp62CXRdoGBafUa6VxE4o5dQrFQQd9yiOjQaAqfE7IpvPxR1WM=
X-Gm-Gg: ASbGncuQDJ3IlWPT0F9kCcRFGi4ATLGz+YH41yfHg5JOzstIyST70z+TXmHDKXvelIE
 4zUUShPtFs+nuDcfLxaQiAofmP3TVIpDRH0Lhs31YLHT/cVuTAcXot/GVTl/tdsdDBF5AyEW52Z
 UNCfwZRy/3YpALGOajGIbckEELqMMQZ4K7uPaWdHfaC8tsLGlnS4wtl9dM+OgTg8OG0h8ViYpzE
 FvLiM2vNUb8VRetVmhNC+6xKkCQWSYtYooTHQVlK6FJPmf4pEwVNlqPshNvg61TsPz1uTousUKe
 wjiZCRvIfY8TzSdECZs/yt6/68pzMzfYvmD66SoOMy1PlLTuRRjm8ePRvCZFdM0PTZ9R2r5Z8Cn
 Az3/z5ZkVtaRO+GXiVmEg2XjvrYn61DMeiybUduo6
X-Google-Smtp-Source: AGHT+IEhgIcegepZAELKNteySy5R+YsEdefP6B1fjXY1j3Mbf+n8BNaS2HlbhQSRfD6/sINdxo9ibQ==
X-Received: by 2002:a05:6000:2891:b0:403:8633:b7e3 with SMTP id
 ffacd0b85a97d-4266e7d461emr5455999f8f.30.1760021678220; 
 Thu, 09 Oct 2025 07:54:38 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8ab8b0sm34942476f8f.18.2025.10.09.07.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:37 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:54:37 +0200
Message-ID: <20251009145437.482013-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929185006.865D2863E8@busybox.osuosl.org>
References: <20250929185006.865D2863E8@busybox.osuosl.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021678; x=1760626478; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wb6pjIKX88ESqN9ZD6M6FGRFKwZ6HSSs7qgbyrK9pjc=;
 b=NH4zIG8fj7CBmwKazZy3RwplxtUhSa8LwCVKy49NgtEVHo68+8cyIamH1wyQKxOqE0
 cH4te9fBNrHSbOLkPnWNDMtG0U0pWU3MkgPg1DD2XJRWAW3BQ2Jl7e4AwyMtvbO+FqB1
 WhAeZSeonDOvMsZ4eKQhvwzh4AKz5s25iQ8oFgMQFUUw6JYTQJw+IpYbuUkgTYuLIvSv
 e9Rf/52lE/dZ1RN8pcUheIfglWaXfKKX+TTV9kEwbSPN9TM4xcOX3cR6z4aqYTYTySoL
 aXzqZMIFt4FJOQ5410YxJHia5eDWplBXJzbGpEF2DPyJ6OM9sml/t1D+Q5hFYO/7GPTV
 dH2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NH4zIG8f
Subject: Re: [Buildroot] [git commit] board/zynq: correct zed board links
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
> commit: https://git.buildroot.net/buildroot/commit/?id=4e7f03314d8b777c7616e6bf5edf69c8aa015782
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> The web link www.zedboard.org is no longer valid as it routes to a generic
> avnet.com boards link. Fix this issue by providing direct links to the Avnet
> ZedBoard and Tria MicroZed boards.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  board/zynq/readme.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
> index ed7509f2b5..225af4b9dc 100644
> --- a/board/zynq/readme.txt
> +++ b/board/zynq/readme.txt
> @@ -43,7 +43,9 @@ References:
>     https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/ek-z7-zc706-g.html
>  
>   - Zedboard/Microzed information including schematics, reference designs, and
> -   manuals are available from http://www.zedboard.org .
> +   manuals are available from
> +   https://www.avnet.com/americas/products/avnet-boards/avnet-board-families/zedboard/
> +   https://www.tria-technologies.com/product/microzed/
>  
>  Support for other boards:
>  
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

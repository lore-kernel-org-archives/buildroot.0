Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7ABC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 19:17:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C83EB60D07
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 19:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C83EB60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DFD783D1C;
	Mon,  2 Aug 2021 19:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a767QLMMo4ob; Mon,  2 Aug 2021 19:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D857783CF1;
	Mon,  2 Aug 2021 19:17:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2331BF419
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 19:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 561924036E
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 19:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K4skcz8Ht7ij for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 19:17:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B16DF40317
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 19:17:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 n28-20020a05600c3b9cb02902552e60df56so650741wms.0
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 12:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=NHRKGhHO8ww7W786L65UDjM6Df1rFsimQKjH3D/8pVw=;
 b=g2jNhoXa3P56x3b+1yKNiakBHVPj1NMqXMUpJIhwfaYg6NzYX8WfW7oNcI8mptn4l9
 Kx4ABB3FqtH3PNBOIxmkRc+F4Ps5IUdPONUoyW9aqt7aVtNT1hPB+1bKbjbxKB1zmnwU
 TWQJKVcfmEdyyxnWN5qFmTKZXF3qXl1L5vn9qUi/dYXMFqUhW/dIjDQyglRZVtUBS8vx
 giNlOZzaBl8iTjdaYig0lmv1FLAoA4vqY73i8890rkfi7BlcZ42PNmZaauz4hervSFr3
 MmWJizDI8oRzCjd/8nSOoedHpimb++ZpJpOMBSNB08afLU+fI3/nUodj9WnPtMATcyLZ
 M1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=NHRKGhHO8ww7W786L65UDjM6Df1rFsimQKjH3D/8pVw=;
 b=K+DrxEnEv+IWIpuD+Giqqa2Xf4SKuM2jrYnE6XSFEeVo/d5+fIc9IA00CUdWw3HR+C
 ZNCwb8wCuj7jp+JZd4DjeGtP+g3rVKj5Lc/VHuMr+JJP8GFmUo4IiTblWNi7s3OCZ+h3
 4OVt5VVb5kjNQBtIvIu7nReiA3WIjcqIbTw7/Z44+S39ZcO9hgGzcm7tybgjusjHxYUL
 /TbumzUbq5wTiR1ViHCEOvD8sOnM52a1FlfbsC/tnsW7uizyEAYROfjuvbxpcG19VENJ
 r8ue6fswtWb3b1lSaHAlKjc74bsTR8yK8/TA4AKmf/ZGZPM+rhQYGqsAraVpzDXiK6gO
 sAnw==
X-Gm-Message-State: AOAM533EcnPk5xu8wsLg95m/CQwR90+5/U/Md0qoNITBWYP778PU4lPe
 HagaZf03h+reSzPnvPHVhwg=
X-Google-Smtp-Source: ABdhPJwFqN2tZy7+20ZmCAQgrZQ6lihxUkPE1hmK9ZvnkHP/cvNAxYQiAut8XcnG+uCuwJGpK5hr5Q==
X-Received: by 2002:a1c:a187:: with SMTP id k129mr18226607wme.17.1627931835944; 
 Mon, 02 Aug 2021 12:17:15 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id x18sm4903172wmc.17.2021.08.02.12.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 12:17:15 -0700 (PDT)
Date: Mon, 2 Aug 2021 21:17:12 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YQhEuH0okQM/3P03@pevik>
References: <20210802172116.10073-1-petr.vorel@gmail.com>
 <2A61C2B3-401F-459C-9DD1-727E041D1A20@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2A61C2B3-401F-459C-9DD1-727E041D1A20@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: Backport yet another
 printf fix
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Giulio,

> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

> And thank you for fixing this :-)
Yw. I see time_t printf format is more tricky than I expected, your traditional
approach with casting to long long would not require this change to uint64_t :).

Kind regards,
Petr

> Best regards
> Giulio Benetti
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

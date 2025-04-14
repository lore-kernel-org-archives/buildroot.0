Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63637C369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 09:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35ACF4089C;
	Mon, 14 Apr 2025 09:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6c2Vy1YD5vXt; Mon, 14 Apr 2025 09:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6689740874
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6689740874;
	Mon, 14 Apr 2025 09:11:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 922DE108
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 09:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 835E040874
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 09:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPUkufd_Ql4w for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 09:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91FEF408F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91FEF408F6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91FEF408F6
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 09:11:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43ce4e47a85so3528215e9.0
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 02:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744621909; x=1745226709;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qPnyQTxiJY6RV489scpHAWO4BRzzsFUXZ+1TfIKz25o=;
 b=KX9qlLWg6alvn2ikNICf1zYKfYOkqBNhWlgo0DgoVNvZqM/muDGHrgMDO3EGl8zFb2
 0/oJCpfEIsEHvgDkiJ7hjI/mAHv1fmmHME/9TowhUVaQNpFbSzpOI9YEkiKtzQGpP4Fz
 Bos2ebYcGkIMjl04fje1nH4FlVNoVhEUNl1GvdS8GF3djPvRsIT+tiQmZqxtPnXvVlyb
 p/SIAptvMT/XHcsSrbMReeTswKNpe93LcA/8JXuP6OvDdBeXHnBZxS36N3kk7g41WApV
 PpWXiJ9+HBp0y+1V9qJp3QiQ5bjmGzm3nU4D3gSenaE7jMPwVbNgHwq5oJuUTq7PqPhx
 kSRg==
X-Gm-Message-State: AOJu0YyjA41G5/TEEqFs3MKsQvSRIIaJMPEGioLM9RbOkUpBp2d1Qp/J
 fhvC/DliOgRlS9G1JeZQfD01daI04Hhxx8vQ0L794H0EChACI8jg
X-Gm-Gg: ASbGncuzsLBmsIw9/iDd+vSiC0R9pqEG4IxLPZa6lQBgmpCHapTikgvV/PpKTiOjjOH
 eN7ljMS8+2ja96mxLk3/AolQ9LSrxgA60SB2JOF9VrQdcFygfhqgZewnFnkPv/FuUupL7VcgQLA
 ywk7xoKtrAPKCn2dvkEFNxAMuy0hY6zDy6WPjtzCnMdyHUVVsfSNBMssHgZWnnrMv02gAvj9K5M
 As8fieLv/42jo9qYeWLPA0f+inziWTEDwNfnyEyEy9dOnPO3tjBfAhtoChGex22jZI+5KJbz5fh
 FgliWbstjSYMN26YKjOkU3/PA8EY
X-Google-Smtp-Source: AGHT+IF7PDo6E2xjG+8QSgMeM807d95IB+xgnMu6ateelPmBZ85qK+NDOEHIO0/jvxNT/qUbHrF12w==
X-Received: by 2002:a05:6000:40cc:b0:39c:1258:b36 with SMTP id
 ffacd0b85a97d-39eaaecf329mr3251588f8f.14.1744621909092; 
 Mon, 14 Apr 2025 02:11:49 -0700 (PDT)
Received: from skbuf ([188.25.50.178]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae9640a9sm10468166f8f.10.2025.04.14.02.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 02:11:48 -0700 (PDT)
Date: Mon, 14 Apr 2025 12:11:46 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>,
 Vincent Jardin <vjardin@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <20250414091146.qsadw7kmhnng4ig5@skbuf>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-5-olteanv@gmail.com>
 <e1f065426213f7cc79587e788fb8f79b@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1f065426213f7cc79587e788fb8f79b@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744621909; x=1745226709; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qPnyQTxiJY6RV489scpHAWO4BRzzsFUXZ+1TfIKz25o=;
 b=Gygodc1gG9yQJ5d/n3eQTL2F4IUKLgn6juQX+/yw5Sd+11keWjPWybwM6n9qc9cJYl
 gDtde8woe7BI0W+3rKRgAIHJhHlUmmmGD/tmP0rj64UDRHT1masRZt8GsaGa9p5F80bp
 DkSlJe3+GKrWxqDJGp3QQQ4iP2R353j+mXKk2J/ECrZW6jTPGPoiCr5/4oe2zWOd5MyZ
 ZSKFNn0rnfz+s7i2fhaOtdWcA9OGlIVSo1IL5eZ3bZvbT9uaS+G0ymXY9Xr+dCMeSruY
 rJjG9irVjcilgF/z3hHXjiYpKr/y+zSFwbgjcET0USf/apjYdcGMXZt5AI3DgzlITiMB
 RDDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Gygodc1g
Subject: Re: [Buildroot] [PATCH v2 04/18] package/qoriq-cadence-dp-firmware:
 sync with NXP Yocto download site
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Apr 13, 2025 at 11:44:59AM +0200, Julien Olivain wrote:
> Hi Vladimir,
> 
> On 28/03/2025 19:04, Vladimir Oltean wrote:
> > The updated download path was taken from the Yocto BSP at
> > https://github.com/nxp-qoriq/yocto-sdk.
> > 
> > The recipe is here:
> > https://github.com/Freescale/meta-freescale/blob/master/recipes-bsp/dp-firmware-cadence/dp-firmware-cadence_22.04.bb
> > 
> > Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> 
> I applied a second bacth of this series, which bumps existing QorIQ
> packages and defconfigs to the lf-6.12.3-1.0.0 BSP.
> 
> I slightly changed the commit order, to bump package version first
> and all the defconfigs after. I also reworked few patches to add
> extra info in the commit log and fix few things.
> 
> Applied to master, thanks.
> 
> Best regards,
> 
> Julien.

You rewrote the commit message quite consistently, thanks :)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

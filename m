Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F960CA0FF0
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 23:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A1A2608E9;
	Tue, 26 Aug 2025 23:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51Q7k6-fuNol; Tue, 26 Aug 2025 23:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7223A608D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7223A608D9;
	Tue, 26 Aug 2025 23:20:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25EED114
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 23:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17F864009A
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 23:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVpMNLBijQpZ for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 23:20:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5312640051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5312640051
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5312640051
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 23:20:19 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-b4c1ed55930so2626230a12.1
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 16:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756250419; x=1756855219;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U8hCBqTyW3LsGE1irWnuVscHakbF0CqZTZyfTpuDS9c=;
 b=BXNoht98UkmyZQLdbhqhACBF2LM31TiRov4BTSkuGdISdTrDyUrBV/qgMfbf4yOKNU
 UcaeIljymlSWXIQkAXbo5cc6oNZVdhjvCfaDR4P+jLQvelDtviT6fir6YZrEeCwZMAK9
 Hg4szeDnjSnC2eb4xh2fl4kZuVvT/R3HZvvb80EliN26cDCVimAOEtVg93DnQOo2+Qxf
 x2uoB4iRCnwvGAgMRIQSi45PvFd2hm+6dkqScU1t5yD9p2xSgglV5OP8QOYkNJ7A8YAR
 BCxCSMU0gLFAY78qw7Iljoy+Piq+yGhK9oKnZOEEJtA4r57Mw0EDvywziLBSNPatKe8Y
 ox3g==
X-Gm-Message-State: AOJu0Yy7VUQ+2CgmO++r8IdU0pBn5OAmRQOFtDWW5xkkXBKRV8nQ38Jw
 scLQfl/gcDfNztS2hW7z3cFHcGMO18AXffzMtRdmOeGYNuwwoWunRZGRBuMBTg==
X-Gm-Gg: ASbGnctuNTMW33PIw4F8cL6OE1A55igTHGPjSfHV+AerX9RSn9sn0W2XpijwGidwHTD
 qKnTqNQEuhjD97pfQR24eK1c1dytonBs4G+jcqcH0MvMH4yUSMDMrUxjDTPTrX1u+DUHrZJQayP
 IdWNyjoTVgQQP1It2SGxHM9ylocvuiGCtQytBdZAHYV7Wf+dijT6pJzOYX+ADmHQQgI7BQtW1go
 /5Xct/fItXWr4RQwgYwS4MADSaCMcAHJEd2igRUIuJq263snK4UmrYg3bv8nMj67G5+35GD0f3y
 vAkZdENzAPEnq8xSiFnEQ8wcZJd5TQdS+2EplCK5qUVZDwr6/x2NB3jPmtmWk71otQktiDOEEMn
 AgUEVmvrOgb4uPm7XdL8VdVWKqzoO4ilueHosoQ==
X-Google-Smtp-Source: AGHT+IHuQVoAFvxvt2q25f8wQ9/B+zpaBZExFtAtEXQh4rlKwvx3R1sdZWXapE0iRYvYyM2bXT6Ozg==
X-Received: by 2002:a05:6a20:938e:b0:243:15b9:7792 with SMTP id
 adf61e73a8af0-24340eb3ce9mr25610904637.54.1756250418509; 
 Tue, 26 Aug 2025 16:20:18 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770586b2f23sm8012909b3a.110.2025.08.26.16.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 16:20:18 -0700 (PDT)
Date: Wed, 27 Aug 2025 01:20:10 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Message-ID: <20250826232010.GA221370@pevik>
References: <20250826231121.135117-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250826231121.135117-1-petr.vorel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756250419; x=1756855219; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U8hCBqTyW3LsGE1irWnuVscHakbF0CqZTZyfTpuDS9c=;
 b=kVzKgjuwNsj+/jPiDBA7DT5ltUNEPpSMf601uzrBFKNLlzvm6RVQ3CXDOaovov383Z
 6+USHJRRpyRkJCagk5XAd9D/+AWR56MAgJZRyaLXFkidV5YnxFj5OhFfi2ejaAN43vIj
 9bkgDSOKZocLXm66+vJnZby4JFeXtgbAZkBBUGLhdHZIjt1A/qesIWdD95JqdMpe4Uty
 UXtA/KED9PCBT3UFuJWFkURVTortVFBrub6fqkD1Jo7GXgdQ0AZvBB/hySX+qu/JrahF
 A+/xcXZMlcgbLVBqmsjhUAtwSKuEwrhfcdp8CmG6VfqDjyKRMgyBeQM7T6j0fO57APKP
 GsBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kVzKgjuw
Subject: Re: [Buildroot] [PATCH 1/1] package/nftables: Bump version to 1.1.4
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I'm sorry, this update requires libnftnl >= 1.3.0, patch updating:

https://patchwork.ozlabs.org/project/buildroot/patch/20250826231742.220244-1-petr.vorel@gmail.com/

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

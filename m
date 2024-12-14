Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04484E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 06:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DBFF8200A;
	Sat, 14 Dec 2024 06:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UKvPrJz9vSZ; Sat, 14 Dec 2024 06:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 935D4847BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 935D4847BC;
	Sat, 14 Dec 2024 06:26:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16D4211A4
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 06:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10C284018F
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 06:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GotsL7EQ4rB for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 06:26:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 655AD400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 655AD400D0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 655AD400D0
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 06:26:22 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso16958655e9.2
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:26:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734157580; x=1734762380;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J5rB+HXdG8Jl93Thd4wjnQoHgjYpDfaLUehm78bjhlE=;
 b=DYnEeQXMmPGThtSVv7bh4IMOWv05tnsuZ01xA55Mc3J36Xanr/lvnTEVU3RcGzQzEu
 mvBFOD0mh3DzE9KYA/9MEVx5w+TeV6oi5XoNOoEiFG19iQ+bwJxNKfstWdhYBO8n8FuN
 FuzSP0mLyXoRvX9yOsgjjQ2zu3+sT1Ub76uEyTKzDf91BLM494y9GP5ZQMPzDNRUaHD2
 z3V7CxSqbtev9vOlEDA2uWSpUvqHjMNwfAOrTzwIlXCGnwsHCcSu0YJpMEULtDyHuhW3
 fKr4FvXmNQjA5rOf2Agnmfarz9KrqD0Q1wesyxXNTd6auiOtaI9zGP69iC6v6DaNoNlX
 UnuA==
X-Gm-Message-State: AOJu0Yx8H8GAtB+1go0BiEmxM0U6ZBQY+S+cV2pTPm6p6n2cu7LARWzi
 w+JHFKJRhZRfil2uwLR6aVd8UpuBu0X4eSZb/pUtLRTgSmv/vdU2tD8FdQ==
X-Gm-Gg: ASbGncs80XgWDYyZIxb0oeRE2A81kJW5Ry54sZuG9S+3laIdkCx+UDT71IXMXgQZer/
 bD7ln68GWgTH+0omVt1p5pZAJKGMEl1BAaCT1D7uYFhkwmIhEdkobY1e/j0ibDfmxxOdeww9g05
 GorD+cb1a70SjXVgUveFmKOo1nesooKJemp+uRtSP/EHkxDwkSR6msPrMt2wEW2gVcqznIp3IzI
 qF5gO9YUTEUnyomR9SY2/QHoSv1Xe9aEIL4/wGWibxOYhduBcLzIfkIwkq28g==
X-Google-Smtp-Source: AGHT+IFIE5T6TRSe1ohU9ZDWXwY/75klg7uJBWVlrwkeZwmXe2X2dMZz4apzjqOoPl/3UcD+/EkW3A==
X-Received: by 2002:a05:600c:3d0a:b0:434:f82b:c5e6 with SMTP id
 5b1f17b1804b1-4362aa2e54fmr37336325e9.1.1734157580206; 
 Fri, 13 Dec 2024 22:26:20 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625553213sm69909425e9.8.2024.12.13.22.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 22:26:19 -0800 (PST)
Date: Sat, 14 Dec 2024 07:26:15 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <20241214062615.GA517916@pevik>
References: <20241211210934.179268-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241211210934.179268-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734157580; x=1734762380; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J5rB+HXdG8Jl93Thd4wjnQoHgjYpDfaLUehm78bjhlE=;
 b=cl1Q4d0JQRfkTJDwSPvGQYz6QgcoXs+Pg8HBdSfPW4wO9QGGEfNMpz4aCWzY+4JKGY
 6hh/IRABPE0GcOT9/XbqCX49nDgr26LIkh+hAjjl8rQzTeUk2OtnPD8TaUg+yCpzDow9
 seBKWr55cmaLpkzK0GsgpEVGjaCPdL+GTEuRLWOUUvaBiCBvtMNUv13DohVe+8ULe8zX
 Y0/QBnzPQQYF5AjSx/d9FTTal8kuJhmpDTR+bmi0QzUiIZDw7IHupdhuTP+/gv+d5qmx
 MeKGFNSDwDc9D2tJmlr35ACupRylQPpOHvhp17PAJWojLJNwCSP9iqiPiQTX9eTSZhMM
 bUvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cl1Q4d0J
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.2
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

Hi Giulio,

thanks!
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

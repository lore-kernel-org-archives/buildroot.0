Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46746C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 17:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED16381F06;
	Tue, 22 Apr 2025 17:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wfp9CUbJqLAV; Tue, 22 Apr 2025 17:54:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E88C81F16
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E88C81F16;
	Tue, 22 Apr 2025 17:54:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 416061A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 17:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3277340BF4
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 17:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWxRILFz6l_8 for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 17:54:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1023D40BAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1023D40BAD
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1023D40BAD
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 17:54:48 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-223fd89d036so67967325ad.1
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745344488; x=1745949288;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oEoqPl9y0BisTITumlpgyuntCdw2TTvdgbv1mkhrCQA=;
 b=wwEEFtbZk97kzc8WouwPstl9acBnxGiPyzStbkqKa2jQ6D/BOrrrPshbXKrc1wGwBp
 furKV+0fzfOUULDx/4VhQZ7WIjRbJJeEDVvuXQn5cStKqMbwK8ZFY8Maskr3KE3QgEKW
 zp/JxxVGe7v30ezXwKmn+q+VCjbmfZjEufgJ9qGeWkzbqX3ttjFF8RLRweYfBtzA06Bt
 aMTwCv58VTl7pyDrfTF4Lqx+saLzuzd4/bxbfrBeC3uoxz8SOTmweMNKcvlXwhrP0yeY
 5sl9dUXDRlDK6T4+LA+KNxZ9hZPTndglb3oyXdF5EdTYubK/bhaXhNKLVVKm1KmF/52P
 Rp3w==
X-Gm-Message-State: AOJu0YzXZygWMbdhJ2thcIElfwIYXvxTbCqBQZaINQWmu4bn3Web4dst
 8fb5muOZWuFSD1qmOLCi2SnLb/D1x+wvbBigfl/ixplRqsnsn44pvW3UmqRhXr8=
X-Gm-Gg: ASbGncs1QhJad6KNPS7bZxAmPz1WKo0t3tWnihniik7HgC+F9p37d83RXLrsD5zrU8I
 Hwy0HRrsbwlxwcey35Ch8rgmcxqQ6viTUyoKxhr+6vUR7EPiLNKYMrjMaGKbUZFajk+Br3oxWHQ
 c+4TkSlLjq7+wzn3gvZHIJpBtFqGbDXCqPu6SsuZhQacHCr28RLeZ48vordhDCFle6IA8rsrQ0w
 TjdQgGEgqdIyL3K35LR44MfKhhb/e+eGCXSxxK1rzvyZTdJaIy8xB+L+O7YRzTlv9LR3DTLSvb8
 8T4SJVIjLsJT44rjiWug4jqQw84Ww7LwTzV4V1SXIA==
X-Google-Smtp-Source: AGHT+IFGXMiWBA/7B+nMOXA4QV97sLRbq/v97vJdxODXPShpC/e+MfXpXfFsF4E1nbooDZr2rPKXJQ==
X-Received: by 2002:a17:903:1a0e:b0:220:fe51:1aab with SMTP id
 d9443c01a7336-22c536075d8mr278694315ad.38.1745344488320; 
 Tue, 22 Apr 2025 10:54:48 -0700 (PDT)
Received: from ghost ([50.145.13.30]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50fdeda4sm88190315ad.254.2025.04.22.10.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 10:54:47 -0700 (PDT)
Date: Tue, 22 Apr 2025 10:54:45 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <aAfX5Yn4SYrnUxNA@ghost>
References: <20250421-pixman_riscv_dependency-v2-0-7209dd6f2485@rivosinc.com>
 <20250421-pixman_riscv_dependency-v2-2-7209dd6f2485@rivosinc.com>
 <20250422085730.74c0ccff@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250422085730.74c0ccff@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745344488; x=1745949288;
 darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oEoqPl9y0BisTITumlpgyuntCdw2TTvdgbv1mkhrCQA=;
 b=MfY7rkTRk0BGVGtRCknxxxrGHvcyzmC8GBXMZR1Zb85FK70Uw3XpNuUKIUfrw3myN5
 mJmhSrCOKFZyyHJh4A5JUWBx4Jhx3zYU5zqejEiJv3Drss/iV0LwPHQnf4F3Yylbu1M8
 glFPY7AYvdPj2Ysu/xZ5gAQPXt9ZQBr5BAb/hkP0KJAhBAojpWOrYDD0ZD45HB/ZXJZA
 iCUxE76qjhJc2vSLTg/Yh4yOxNR4lTND6wZScwNbZSZ0dfx0uQS0kr26sGYSDGK8Evvd
 utDgH5oh0KIDMlVNtFj7UYfVf+L+g5To3p5qryH8lQ1oVA/G81wcR5r7QFIw+W2ghS8z
 jYGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=MfY7rkTR
Subject: Re: [Buildroot] [PATCH v2 2/2] package/pixman: Fix pixman
 compilation on riscv
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

On Tue, Apr 22, 2025 at 08:57:30AM +0200, Thomas Petazzoni wrote:
> Hello Charlie,
> 
> On Mon, 21 Apr 2025 14:37:04 -0700
> Charlie Jenkins <charlie@rivosinc.com> wrote:
> 
> > When the riscv vector extension is enabled for pixman, it assumes that
> > the kernel headers also support riscv vector. Apply a patch that
> > disables riscv vector in pixman if the Linux headers do not support
> > COMPAT_HWCAP_ISA_V which pixman requires for vector runtime detection.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Fixes: http://autobuild.buildroot.net/results/4ecdf5320716ec8b39f09fde3fcbbdcdb557f8ab/
> 
> Thanks for the new iteration! One question below.
> 
> > +Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > +Fixes: 0e424031bda2 ("RISC-V floating point operations")
> > +Upstream: Pending
> 
> Rather than just "Pending", we like to have here the link to the
> submission, either a like to the PR/MR, or to the mail posted on a
> mailing list. Could you provide that? No need to resend a v3 just for
> that, it can be fixed up when we apply your patch.

I had to wait for approval to open the MR and I wasn't sure how long it
would take! It ended up being very fast. Here is the MR I opened on the
pixman gitlab
https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/149.

- Charlie

> 
> Thanks a lot!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

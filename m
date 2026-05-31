Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66436CD6E51
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 05:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E12CE61AF1;
	Sun, 31 May 2026 05:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4X68xyySi2L; Sun, 31 May 2026 05:40:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69C5861754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780206000;
	bh=KvXnP+xe5JbLILzVgDisRWa+X9AxEXe45jHHzvDpgjE=;
	h=Date:From:To:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=M4RLViqqjiqwTR6p0Cb1tjsYRKwYGDEfcAx2mdo3/OExmz+/2CtQ3R/t6PYqhqjFu
	 Iuut7nkjJolqPNsqM3FrKE2ixoGpLMYfbcZ96q7Los8+z22/0iwn0/IzYohR1gZ9Ac
	 03fizUgaIaiSLVJadF3FGEiYwa9SN5Xkr+eaLWJvjmLpAQGvyonnhgZICqJfiNlV4a
	 ejFPqunxi88nM/bBe9WHTWk0naGbZTFMgDoIrpHjpks7NSUuPy6k+vXlsqpMvbi/ZW
	 2VdumrKAtUOZCRvfvdHAgDInoBn4nh73iynvBxnwcOG3KKEJGT133Fmq16wezOh/6Q
	 cQZ1WsHi/2/hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69C5861754;
	Sun, 31 May 2026 05:40:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74B84389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 05:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98FAF402BC
 for <buildroot@buildroot.org>; Sun, 31 May 2026 05:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPYENiBtH-QI for <buildroot@buildroot.org>;
 Sun, 31 May 2026 05:39:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0C36400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0C36400C4
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0C36400C4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 05:39:57 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2bf36a6905cso7470535ad.3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780205997; x=1780810797;
 h=content-disposition:mime-version:in-reply-to:mail-followup-to
 :message-id:subject:to:from:date:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GCRm6zJWAW4JxUGI/5rSg4UjrkXKN4EnbnOhgldIH6I=;
 b=KNP52Xj+GKxqI36eKQyl3UbJH53ZI2ng5NzkRExWNW67kTahIIqSXX9eTw6CsODHM0
 fe1hDSN7X6YgtS+NSdY+TZe4y4JpmUS7nBytc8i6ffV8SZvGMw4zy+B15sOt5+9736s6
 ZjEovOycp8l6hKQCkNi1V32W+ydeoCXNHw62vgNn1Peu/88rR+dVHHJJwbfFl55gaV6F
 yac7LStWb+Xqa4ea4R2NZu2qEV+HidyQljOEK4BFxKBLiBwaTGF06oiDzM5VHcLgni28
 X/bVxpLYFdzBpTMoxVCRlaT4rdo2lD2bDa+pXl5Wu6JoLRRTJujAQo6vYnr/4LU5WHXx
 /big==
X-Forwarded-Encrypted: i=1;
 AFNElJ9qiCsG7QEGwcVCAy20r1I7UAaYm8CRUoCelt5hmlfv1xa9rgL64kzZy8bA6rRRV/53eXzknrRbRwY=@buildroot.org
X-Gm-Message-State: AOJu0YyRXBS7I1Jf65ZHvNL7DyO6limbeWuJeMtbCYpCY7+F4mmnmx8X
 n43w+XqvSv8db40rCdbZu5RLAMHMgV3mkrltyxZ8WQ2Z+fsmAkBzk2EaHkVyzvk4
X-Gm-Gg: Acq92OGFdk05zqWH86BCT120VeKFCo/VEG4v3YEvSMcNFo2QegnRSHy8V/qA95dYfQg
 1rFIRY83ySfwapqQIBln8t8bCSl57c4yWEeY1j1uz3nWPsWDHko/NrKfN3JprFhYBjHag8Rm8cg
 tGOyAT8ehQY059FRYipPP/mhmfEVX4OhwYpj1QcfJCoIyPYdhxC4myvZQhj4HIc4+6K43MQ8ADf
 jUXumTZI75BLqGCOgOogjDl/DmtKJODqEypMpjRD2ixxDhjljTod7katnH9cxPkWP2+bIfcBQiS
 6S8OSncoHxTH39T+P7iGuytgF1ZthnLeCPPLX5eFTPrVW58q146dw95nD67V2SsSq8RqMbDvFne
 RTjqrHdKr3JuHBZ5Uzp889X/aQGMeUI4+vZB8Uj7iEXNhSF2KDWMm4eCUN0D9rM+YbBCaMYzGVC
 2+dV4WQq8lo+djungDIRphKzfgUm1vtE0xz/ZM0+l76QIBgA==
X-Received: by 2002:a17:902:fc84:b0:2bd:9803:9304 with SMTP id
 d9443c01a7336-2bf3687bb6amr68635305ad.39.1780205996786; 
 Sat, 30 May 2026 22:39:56 -0700 (PDT)
Received: from fedora ([2409:40e5:104a:da47:4380:deff:ea92:2138])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf23b0019csm66303015ad.45.2026.05.30.22.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 22:39:56 -0700 (PDT)
Date: Sun, 31 May 2026 11:09:52 +0530
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Message-ID: <ahvJqD6wLJE1d3xQ@fedora>
Mail-Followup-To: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
In-Reply-To: <20260502173505.GA12345@buildroot.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780205997; x=1780810797; darn=buildroot.org;
 h=content-disposition:mime-version:in-reply-to:mail-followup-to
 :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GCRm6zJWAW4JxUGI/5rSg4UjrkXKN4EnbnOhgldIH6I=;
 b=UEHrZVwUJStu976rZbEVXmt9YJqOt8t/Dwlt/93xbrno6puEgB09jQ7KDVQC+jFJSa
 aIY9W2m6Sa7uY8+UpwYzd5zlLtiRkn6f8ZQW5FdTyjw7xFg4z1odtxAJpBFCRvk3HaaB
 BoP3OxPVMnHZSXQEsh/TLdjuYCypFrWfm/SfTG/6LK3QM1fI3wyQlm74RbRaLSA8ibKQ
 VEcMr1vWX7ua3f9SR3rZt7XXAPOUuXqgD9uxf4mitewZswuq+UvOP+YLjVgwbdedzAR9
 v9elvZWYSjjSShgFZZbYeKNJk5YRo7fQG+cNOvcjZp/IUzOTdr7XULFY4epzGN7DQlM6
 LbGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=UEHrZVwU
Subject: Re: [Buildroot] [PATCH] package/ncurses: bump to version
 6.6-20260425
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

On Sat, May 31, 2026, Thomas Petazzoni wrote:
> Where did you get this text from? It is nowhere to be found in
> https://invisible-island.net/ncurses/NEWS.html.

The items are in the NEWS file, but I paraphrased poorly and grouped
them incorrectly:

- The poll()/errno fix is from 20260411:
  https://invisible-island.net/ncurses/NEWS.html#t20260411
- The _nc_write_object, _nc_trim_sgr0, and read_SGR fixes are from
  20260418 (credited to Anthropic):
  https://invisible-island.net/ncurses/NEWS.html#t20260418
- The _nc_mouse_parse fix and konsole-direct/mintty/linux-alt1049
  are from 20260404:
  https://invisible-island.net/ncurses/NEWS.html#t20260404

I also got the _nc_trim_sgr0 description wrong -- it was a
source-pointer correction, not a limit-check.

> Also, you're updating from 20251231 to 20260425, there have been
> multiple releases, so surely the changelog is longer than that.

Yes, there are 17 intermediate snapshots (20260103 through 20260425)
and the commit message only covered 2-3 of them. That was a mistake.

> If you're using AI to generate those patches and their commit logs,
> stop immediately. We don't have the time to review AI slop.

Understood. I will send a v2 with a proper commit message covering
all intermediate snapshots, written from the upstream NEWS file.

Regards,
Shubham
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AF0C43602
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09CFC41378;
	Fri,  3 Jul 2026 14:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DHOIQ5fylzk; Fri,  3 Jul 2026 14:33:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 238784132D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089186;
	bh=LVa2H830+XRDL556suRw0uxUWaFbBG+VJxB2WGMpJX0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LKAKNEb495F8zjeOIJsmbw1j2Mi6fJ9tdQO+JDpqdZrMvKUXfHEYTyLi1UA0uBy9i
	 tMf/FaRwRN2JMB5B0lquoHP546PSIn2YlSSeg1rXA7Psb2jx+wU8ypZppahLySjLEx
	 cQVh1tfHv0lRc0FQ4QGP1kKUHknRs9UekVoF4DemowiGmgMxepnr7UKL7pBBhhe9ED
	 C2u9L/gu3dhcs97odBwk4pRKiPNDz8zuDyy1B4fjSy7uK6SF8+cUBjptJQqjlznx6d
	 KP5CekpfgpC+PHZni0OI4BYVyZ5e6Z8AU++LX1gkBb60xdv/FwzeH/MZbkrE1bRXTj
	 d/ikqkrgLP/PA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 238784132D;
	Fri,  3 Jul 2026 14:33:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D76B814F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD95B82B81
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8eVVZXMuUEE for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:33:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A353982A6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A353982A6C
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A353982A6C
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:02 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4728c12ba97so398491f8f.0
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089180; x=1783693980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2lCoSeDel5dhQDncmz/8KTZXzSctOVyBV0boM5bB+vM=;
 b=icI9KhiFdl6Y+Qhad7GLsD/NPgaPNHfdlie9KhtOZ6sfXRD85Wzt/j8BuJqoxofib3
 n81/+FfKE1jtR9DDbOptxXcNxAsGjzFfAJBQaya8JXf0nLCx44uasLpJIM7W0JBGVcik
 bpRW2KgFLkxcRo694Xltahy9t3E8uVAa9rbsgfJ3KknCPdijNfYgEqPpjSzLSme8rPFE
 GQ/c9Rt1ydYKQSAikA/ZPEdwdTCPXOExy+m0yhNdG2WM2/tHmrt5AISLDS6yVM1gcjd2
 YZBeTkh0RKwQRSGlTZceJcLrd5meTpunudcOxOxTu/Z86m/OeK5YQGF99gHX9ngbJqMf
 fd4Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RpsnMOg9ry9zJthjqNMSDHmukUVZgucMA5Yf70fYsD7QHjyvpBQSnsHbFwE0TNE8WpxOBL9ILx0a9w=@buildroot.org
X-Gm-Message-State: AOJu0YyqKb2xCS/Lgnuv8e6T+8kQJPOvL/o38PnJ8loJHe4M9MVN3GfD
 8Y9x+V3u4uXZG5/avN3nrlu779MFeSv7xBSvr79n5UK25SaYUAQ9ereICUOjLTDWj+S1nZ2KdFr
 4sWZN
X-Gm-Gg: AfdE7cnUn1mEurTlqko6lbne7mNZWIauIcdLnZJK+9HYp7pVsmsElFYhFkSdDzV7Q9Y
 Ot5mzVVwqkJmNOR3QyHEUbZ3nwd3B8oTXaEA/J55kd8QDM5RG/RBd7nBs9y+dLHUKcsPj+6TODk
 VcTyS7uazvHp4pw3MemDyfEM8Iv09ccWviJuWAvmaixIqVs068JoONM5ArskXTA6sPZi45/QBPt
 lSDcEV4EtrbqqA9/wVI3fg++cmhc6SIntJb/YiNRrvlWBXuRUR9t69TXfQo9pnFzM5GspZJ77n6
 koEHds8SeVxrOxC9ytIyiBvE+WrfFnzUhSfMYQfTw77k5vs/Otb24OIymBx46lmk4yLN5YykS4P
 efHlTwMdx3Ya4yEyeysMq2Y3XPenh1YfGP0F3hBmUel468VwH3gDCxlyr7qRYNZ6ZtHtfEPuGH0
 BP5TrY
X-Received: by 2002:adf:e191:0:b0:460:1223:a044 with SMTP id
 ffacd0b85a97d-47754483e04mr15396459f8f.0.1783089180318; 
 Fri, 03 Jul 2026 07:33:00 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477dd94ce4csm19342701f8f.17.2026.07.03.07.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:32:59 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:32:59 +0200
Message-ID: <20260703143259.275428-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260622130119.90146-1-giulio.benetti@benettiengineering.com>
References: <20260622130119.90146-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089180; x=1783693980; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2lCoSeDel5dhQDncmz/8KTZXzSctOVyBV0boM5bB+vM=;
 b=Cmv+dqdHEre6DUJVT7AW3lSqNG0X+FP8U2/JFdZEJeTAudb8M5PL8Srfw7Knysy6GC
 EH02GUYDUTDm5iXaqCXLOc3gEB5xOamidMTfizFDUapgLeEt72X+jjDHP9NIc+ujXqN4
 LrV+27nfbR9VIyrvHKotpbFUJ+ZIfz3mIbtREF3oe+VucCXzzQCf4A0PZrNktDq5x2Ra
 8HbAutCs/LSyQX1mjbDpVToaRqAUTXBXbwiM8u9d8xlRRsnfMD0ik9p3HPbMibffdBpK
 jAGt55F4qXsVaImdwGQLcqxEmuQUzHwtFzunsQ3NT+G00tPS5WGvIGkH+UudGEC9GbZv
 I1Kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Cmv+dqdH
Subject: Re: [Buildroot] [PATCH] package/util-linux: fix CVE-2026-27456
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
> As mentioned here[1] we require patch[2] to fix CVE-2026-27456.
> 
> [1]: https://lore.kernel.org/util-linux/c2fo4x3lcppsj77k564i4qodmon3wagx47qf4mqwjwdtiplupg@jmaqrlzp273h/T/#u
> [2]: https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.41&id=2dacaf3eea391e3bbf48e7d3ecce02cafe045b6d
> 
> Cc: Alexander Dahl <alex@netz39.de>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  ...at2-RESOLVE_NO_SYMLINKS-for-backing-.patch | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
> 
> diff --git a/package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch b/package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
> new file mode 100644
> index 0000000000..6d3b41603c
> --- /dev/null
> +++ b/package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
> @@ -0,0 +1,56 @@
> +From 2dacaf3eea391e3bbf48e7d3ecce02cafe045b6d Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com>
> +Date: Wed, 27 May 2026 15:15:22 +0200
> +Subject: [PATCH] loopdev: use openat2(RESOLVE_NO_SYMLINKS) for backing file
> +
> +Use ul_open_no_symlinks() instead of open(O_NOFOLLOW) when
> +LOOPDEV_FL_NOFOLLOW is set.  O_NOFOLLOW only rejects symlinks at the
> +last path component, but TOCTOU attacks swap intermediate components.
> +openat2(RESOLVE_NO_SYMLINKS) rejects symlinks at any component.
> +
> +Upstream: https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.41&id=2dacaf3eea391e3bbf48e7d3ecce02cafe045b6d
> +Signed-off-by: Karel Zak <kzak@redhat.com>
> +(cherry picked from commit 119d23f1e3f55cf10e3c66dab80fc308c9f26456)
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + lib/loopdev.c | 23 ++++++++++++++---------
> + 1 file changed, 14 insertions(+), 9 deletions(-)
> +
> +diff --git a/lib/loopdev.c b/lib/loopdev.c
> +index 76685be70..31377fc9a 100644
> +--- a/lib/loopdev.c
> ++++ b/lib/loopdev.c
> +@@ -1412,16 +1412,21 @@ int loopcxt_setup_device(struct loopdev_cxt *lc)
> + 	if (lc->config.info.lo_flags & LO_FLAGS_DIRECT_IO)
> + 		flags |= O_DIRECT;
> + 	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
> +-		flags |= O_NOFOLLOW;
> +-
> +-	if ((file_fd = open(lc->filename, mode | flags)) < 0) {
> +-		if (mode != O_RDONLY && (errno == EROFS || errno == EACCES))
> +-			file_fd = open(lc->filename, (mode = O_RDONLY) | flags);
> ++		file_fd = ul_open_no_symlinks(lc->filename, mode | flags, 0);
> ++	else
> ++		file_fd = open(lc->filename, mode | flags);
> + 
> +-		if (file_fd < 0) {
> +-			DBG(SETUP, ul_debugobj(lc, "open backing file failed: %m"));
> +-			return -errno;
> +-		}
> ++	if (file_fd < 0 && mode != O_RDONLY
> ++	    && (errno == EROFS || errno == EACCES)) {
> ++		mode = O_RDONLY;
> ++		if (lc->flags & LOOPDEV_FL_NOFOLLOW)
> ++			file_fd = ul_open_no_symlinks(lc->filename, mode | flags, 0);
> ++		else
> ++			file_fd = open(lc->filename, mode | flags);
> ++	}
> ++	if (file_fd < 0) {
> ++		DBG(SETUP, ul_debugobj(lc, "open backing file failed: %m"));
> ++		return -errno;
> + 	}
> + 	DBG(SETUP, ul_debugobj(lc, "backing file open: OK"));
> + 
> +-- 
> +2.47.3
> +
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

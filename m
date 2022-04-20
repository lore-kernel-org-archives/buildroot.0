Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED12C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 17:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C83E18415B;
	Wed, 20 Apr 2022 17:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fhCFqYoiIjKh; Wed, 20 Apr 2022 17:11:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D84C784018;
	Wed, 20 Apr 2022 17:11:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 961631BF4D6
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 17:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 847DC60C34
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 17:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgIkzqLIOS87 for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 17:11:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC95460C0F
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 17:11:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D87A661AA8
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 17:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD1CC385A1
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 17:11:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="F149t92o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1650474701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/4kFsrUIcwKfMfUIV1atY8cSfgD2Wqo5LYrMnTBkobw=;
 b=F149t92o9cs7K+I6cblsUAcbceUPDdu8Tld/iJHiR3udgDEAo1ADb4hz1ErWQ7hmKUOLGh
 7xNINUsANNo4WVlnMv9O9/SdQaANjSteAbNqgoGubgFFj+ShLe49Ul0x0j64VgkqwwYFN8
 5viTM8xfEVLHj1/VJhXePJSi7gaYpG8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 850fb661
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 17:11:41 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id m132so4067442ybm.4
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 10:11:41 -0700 (PDT)
X-Gm-Message-State: AOAM530QxNgGpaTm0/4e9QwPUqQrsKYUNrQRddlkL2bYmXuUu0nWbsdL
 4Jduj1LF9EJCAfysWuL5GQzhcqhRsm0uxU34LTc=
X-Google-Smtp-Source: ABdhPJwMRBntSPEd5LPfyVVoV5B2oqC7EV9Lzx8vuOob5TpaVPiITSC8biU60YrD1/pvPhhoGBfOzf8nqwxL0URQU8c=
X-Received: by 2002:a25:bd8e:0:b0:644:d8dc:1198 with SMTP id
 f14-20020a25bd8e000000b00644d8dc1198mr18605067ybh.398.1650474700443; Wed, 20
 Apr 2022 10:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220420170326.1901572-1-Jason@zx2c4.com>
In-Reply-To: <20220420170326.1901572-1-Jason@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 Apr 2022 19:11:29 +0200
X-Gmail-Original-Message-ID: <CAHmME9rx5E7WyksZzqCXKPttWBQ5QnAg2kLzY2AOYYNdcOLuyA@mail.gmail.com>
Message-ID: <CAHmME9rx5E7WyksZzqCXKPttWBQ5QnAg2kLzY2AOYYNdcOLuyA@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>, Peter Korsgaard <peter@korsgaard.com>,
 Michael Fischer <mf@go-sys.de>, Arnout Vandecappelle <arnout@mind.be>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v5] package/urandom-scripts: actually credit
 seed files via seedrng
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

And if it's easier to read this not in patch form, Busybox's ittybitty
seedrng implementation lives here:
https://git.busybox.net/busybox/tree/util-linux/seedrng.c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB22CD11C2
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 00:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387AB407B5;
	Thu, 11 Apr 2024 00:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B00uN4r0pAPD; Thu, 11 Apr 2024 00:15:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D69C240895
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D69C240895;
	Thu, 11 Apr 2024 00:15:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C932C1BF983
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 00:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5B0F608A2
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 00:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3isXrkSj1Lip for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 00:15:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6CFE06086A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CFE06086A
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CFE06086A
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 00:15:09 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-343cfe8cae1so4581617f8f.3
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 17:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712794507; x=1713399307;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fJJxYuo+LnQKkwWWbqIHU3kgiqgrd0F9M7qgNyvI64Q=;
 b=Y7yoVFA9azOmT1NI3IRL3J1sZl4qv5Q9RRapah2CVbP6hCcLI73RSfObbUe06O5D4R
 8b/W4XFcIYKCJzKE/nvmlcTTVWSEpLlPEdtOELRcZmW5mxuHPT95wx6GeotZGSLEOYJu
 K/03/UnDz0X0hYfW15OEa0RloOuhrS81O+Xw2Be2OTPuOOndQheSY4tmtuRng4WJ+lk3
 2cPh3GlWkp1izlvp5p0MrpmheLcXVW4YS+6JXs4/e+dkh9mlbCa8bxAt8vj9Evpw5Hpw
 WHLdRQdTA9kb32wWT8muDORq7gMfpgGWdoSOyT2vhpFdwmR205n3UTqbM5e2zyWvckr8
 lOQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmzhwrism2FV61KUWpi98IJ2km41Q9doCthI+Dq0iLHTRERrYUxReIwREW/0fdWvcR7ZmyC4mV6x4upYnBw7TDo1ZmXP2QWw==
X-Gm-Message-State: AOJu0Yw4bR5zkmt6o5A6r76KVdaBwx1OmIu95bUZV3GbJ9LLmOxvRZRu
 3fvXbFjN+nQLz8cRIavkZHPjnMC1WshqIkzXQ/+vgVXHxUHkGUI0
X-Google-Smtp-Source: AGHT+IFwgbNPvMuBnn1dhpo5R7in+6v4X2wVxlP4YSn5DsKpibpw3wnN0x6eqtyDN7IfAro8s96vEQ==
X-Received: by 2002:adf:eb87:0:b0:346:ad3d:e4bd with SMTP id
 t7-20020adfeb87000000b00346ad3de4bdmr465597wrn.17.1712794507065; 
 Wed, 10 Apr 2024 17:15:07 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 u7-20020adfeb47000000b0033ec9ddc638sm422536wrn.31.2024.04.10.17.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 17:15:06 -0700 (PDT)
Date: Thu, 11 Apr 2024 02:15:04 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240411001504.GA283218@pevik>
References: <20240403121807.2087547-1-robimarko@gmail.com>
 <20240408223621.39b37892@windsurf> <20240408213807.GA44146@pevik>
 <20240409214656.721dc7c3@windsurf> <ZhWp-ftUZj1_npHh@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZhWp-ftUZj1_npHh@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712794507; x=1713399307; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fJJxYuo+LnQKkwWWbqIHU3kgiqgrd0F9M7qgNyvI64Q=;
 b=nJv+j9GDcHF5TuvRFstkqVzfxiOtWvtGaB2IEDbycdWDVtGu31caQlDCGxklaB/xNa
 PQ9HIzbyz2aBv9bxKBNdwEM9h7wQXsWbU0eAsipWZyE7b350gcPs9iG/7RpLLUugidY9
 6w6L0+9amEqV1Sir/q5WKa1YKVTbAIkMHDmFbVAjmiSB7tKyIl39qU63ZboiZIpAzbfO
 sYx+UH2dYj0an/6ymv8mNIKmGjIwQ7Nzenjz+vczXSecb4tbkdm0//02zpc61LxwfgMr
 d56yFbYMJNuvyZPVlnzikgSWHhNnbYQtUNwuufLddtOXyKKKq++cQxTivPSY5H+fKWXY
 qgzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nJv+j9GD
Subject: Re: [Buildroot] [PATCH 1/1] kconfig/lxdialog: fix check() with GCC14
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Robert Marko <robimarko@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, Thomas, all,

> Thomas, Petr, All,

> On 2024-04-09 21:46 +0200, Thomas Petazzoni via buildroot spake thusly:
> > On Mon, 8 Apr 2024 23:38:07 +0200
> > Petr Vorel <petr.vorel@gmail.com> wrote:

> > > FYI I gave up kconfig update after big rewrites in the Linux kernel
> > > made by Masahiro Yamada (the new kbuild and kconfig maintainer), because the
> > > code changes were quite big but kconfig in Buildroot is IMHO not missing any
> > > significant usability function. But I can be wrong, Thomas let me know if you
> > > miss something significant which would justify the update. Obviously we would
> > > get some fixes, but also major rewrite, which would likely require changes in
> > > other parts of Buildroot.

> > I have no idea what are the new interesting features that have been
> > added in the upstream scripts/kconfig/ (if any). However, keeping our
> > support/kconfig/ reasonably up-to-date is not only about new features,
> > it's also about staying compatible with reasonably recent
> > libraries/tools (more recent ncurses, Gtk, Qt, more recent GCC, like
> > this issue illustrates).

> The kernel's kconfig has dropped the possibility to include files from
> within a choice, so what we're doing now in a few places will not work;
>   - toolchain/toolchain-external/Config.in
>   - package/openssl/Config.in

Ah, you mean choice within choice .. endchoice.  Thanks for info. That's
unfortunate. Any idea which commits reverted it? I'm not sure if it will be
possible to easily revert it back (there are many changes in kconfig).
Also replacing 'source' with some placeholder and using some preprocessing
in extra make target (dependency for gconfig/xconfig/menuconfig/nconfig/config)
might not be as trivial as it looks like.

> and so on...

Do you remember any other problem?

> Unless that was reverted upstream...

I doubt, but that needs to be find out.

Also, maybe slightly easier way could be to use init-kconfig [1],
used in kdevops [2] (imported via 'git subtree' into the usual scripts/kconfig/
directory). At least we could try to migrate at least some of our patches there.

Kind regards,
Petr

> Regards,
> Yann E. MORIN.

[1] https://github.com/mcgrof/init-kconfig
[2] https://github.com/mcgrof/kdevops
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

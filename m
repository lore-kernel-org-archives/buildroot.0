Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F50C79F8B
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 13:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF5BE40402;
	Mon,  5 Jan 2026 13:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVYnHg5K-2Rn; Mon,  5 Jan 2026 13:51:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D2E54019A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767621065;
	bh=K9tqH9XkZ+6VTPYk7wVat47Has/NU5unJ9ebeSDgDrY=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lPSNB1ymn3SVjOGKp9iSkU88PQXhwIxbj7ES5nN7rqZP6VVt/kpXidwzwy734AXVp
	 sQzF9yZsLI9YEjVTyBxt1vyxqUJI0lMb4YBQU1QT9g42pIafUD6a9qOl43WFuR215Q
	 mnMdEHgIwBDSGNFDs/r75QEowLNT4gZl1KxnBiA4HZNgUopUOdb0tktLgfpcoGuj5n
	 4/P36J7Yl16h1UpJBO3cVi5udjtBfNjP2dvmZkekrGfwBULGLjw9VlhPFPhgfK7fqh
	 Pm1qwnUXSWzOJMryptNvQ30+9fDPyznT11YfZAtSDxQc0Dfu1gT8kZGAl+jYYyfwvD
	 cQ4NwQg1rfVQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D2E54019A;
	Mon,  5 Jan 2026 13:51:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B0992DF
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 13:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1ADFA4019A
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 13:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0xz9zt-iFUv for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 13:50:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3790640150
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3790640150
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3790640150
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 13:50:59 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-787eb2d8663so26326407b3.0
 for <buildroot@buildroot.org>; Mon, 05 Jan 2026 05:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767621058; x=1768225858;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BGhdSzS7nMD/Pu1iYf9AdAfmhW4g3qGI+gu2IwwT5Ic=;
 b=ogSrlhCi2qjmcuxw8co+I7sH3YtKD8msRw4+9zkauRsZnNV4vugeblu2febDKDJEHM
 0/cgqvuIvLrey9VLDJKmHogcoaiG9mCzCUyGq6Z5pd72z06m7tenxTFOwr+jQDrAu8JC
 YE+FNHdLXRDutX8TLfdiWRR+UtZP+/Vbl1aEDxN5+I7mrKo87arFVplCi9XITvn/zUqK
 EIjKmdUbZb45MeiIsyK9l5XdedNWrmao1GE5Ow6maSuZyH/CnDcecn/PJMaOupXT7wIC
 jTo+3j5K/Ib8nPeN32wfQHV63VIYFSci7dhWjV7bQjny3r+imqTtYWsVmLDF4qSMrwbN
 DkLQ==
X-Gm-Message-State: AOJu0YxkbqJmO7NJiVxyMO8DCcmcXAcRoWbT2vFj8odmKueY8Cc6Sn1p
 aeRxqmywwk2oYsOBGODMvoGz+QuXwYmndvxFWHSTtKxC4Rzn/eF8kUsDhX93tCdi6B22temxK/K
 400pY8Aj1zJ5FSTK67qZr6/WkMIWS2X8=
X-Gm-Gg: AY/fxX4Hzm+5fI6oe00fW7NEM8H5nLbhrB6o8gAD+xCe6ax1PXkcZrV36u5QVxZdgSK
 NLsydk/9crf95h3UPCVi2HPODAl9JUvKxNbMmligJRmNh8t/870Ykp8ZMSVQFUg7w04lJMkoUZM
 n6YDqrddyVGEulYPWNbzA+2ZFqfaBBGIVYC2Xf2QCaQmMeCmQVU+JsQEeeglKLyckE53K/v6/nc
 QyaYXn569sWpu45QjWHjOfI6u4Jw5QqvsiYFqsYbfJl4rt/fZzPgA0bt+skJDSt8EHP40FDWURf
 Nds3Au7nSPcbVRHI9NC67RjPQa2+5A==
X-Google-Smtp-Source: AGHT+IH9yySQ5KoXQymlBtQinPUlbqsuA1O0rFovC/3vESHQkqDJ/BSXzcsfx61s/IPfJ9d//G9x6r7YFGIWD8Pm684=
X-Received: by 2002:a05:690e:dc6:b0:644:4259:9b6f with SMTP id
 956f58d0204a3-646e3373144mr4816521d50.3.1767621057941; Mon, 05 Jan 2026
 05:50:57 -0800 (PST)
MIME-Version: 1.0
References: <20260105132326.4867-1-heiko.thiery@gmail.com>
 <20260105144206.6305e4e4@windsurf>
In-Reply-To: <20260105144206.6305e4e4@windsurf>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 5 Jan 2026 14:50:44 +0100
X-Gm-Features: AQt7F2rzUXCwYHXYxsKa9VX0xxMTwiTx83ztOVX_-Si9Sck8RFo_fZjPdYz3OJg
Message-ID: <CAEyMn7bBCT4qMbJbMPkPHVuvC7rGM-LcQsNaL8=rMw1790mp-A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767621058; x=1768225858; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BGhdSzS7nMD/Pu1iYf9AdAfmhW4g3qGI+gu2IwwT5Ic=;
 b=HswHzC9/P2rtQKYTcePULZlIpNTQjcKGXgcJU5OMOOWn2LLzM9x219KFwfWdMG/13S
 ssudmxv9d5J36af2G/P9PM39EFMq0DHX9xOx4/8zxu22qt+wH6XB6DU+gwRrdeXhruqK
 GVfYmLck4rRR0+07fvRichcUpFSf4ef5wPP4jEEBYcpC4HJxZJWRho1opNHWzOPUhQNN
 4yOcCNvIAKDNb60VRhCRmtmTWuO6hLWMLPUfpTLL44ONqw2pvIi83TASZPh2jSCVhGxO
 gfBocZVriFGEgolr7lvTbcqC0yl3CZY3qiSo4F+Zh8M/JvgvgdUyAzlrlomJ5JyqUTtQ
 88BQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HswHzC9/
Subject: Re: [Buildroot] [PATCH v2] package/uboot-tools: use U-Boot host
 tool printinitialenv to extract environment
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
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 Michael Walle <michael@walle.cc>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Am Mo., 5. Jan. 2026 um 14:42 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Heiko,
>
> On Mon,  5 Jan 2026 14:23:27 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > +     if [ -x $(UBOOT_SRCDIR)/tools/printinitialenv ]; then \
> > +             $(UBOOT_SRCDIR)/tools/printinitialenv > $(UBOOT_TOOLS_GENERATE_ENV_FILE); \
> > +     else \
> > +             CROSS_COMPILE="$(TARGET_CROSS)" $(UBOOT_SRCDIR)/scripts/get_default_envs.sh $(UBOOT_SRCDIR); \
>
> Aren't you now missing the > $(UBOOT_TOOLS_GENERATE_ENV_FILE)
> redirection in this "else" clause ?


you are right ;-/

>
>
> I'm not sure why we're using $(UBOOT_SRCDIR) in all of this instead of
> $(@D), but that's a comment unrelated to your change.
>

At least for the first case we need to use the file coming from the
built U-Boot and not from the used sources from u-boot-tools package
(an older U-Boot version). How it is for the "old" path I do not know
if we could use here the script from the u-boot-tools package version
or if it is also related to the U-Boot sources related to the
environment.

>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com


-- 
BR
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

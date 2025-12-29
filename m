Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B83BE92FC5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 17:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E37B560A8F;
	Mon, 29 Dec 2025 17:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2yOCyw4theG; Mon, 29 Dec 2025 17:34:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8906608F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767029663;
	bh=pbX6/16W+lumzHORSBdrG5ZGSC0fSNP5OZc0Coh3eiQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P8QVNHGio27PsfLpY46f5q0O4F3HOKbOpikbXXvTkPsR/xnJBBt5XPQGDBLw7ibpE
	 NjUl1mJd8mecfJATRRrkAH+6n9FtzdFYtl5+DQygOTysLVjV37LwgWxX1YzAtEaGFF
	 VPH6QFNptXU+nY65aDrOH8+9ryTM4e4za92a1UVscmR2Mkgdje1qQ2Fe1FnSdLhiV0
	 uFxL72r+z8KIC/1QKRS3k8tK8vWVJuXIyK5yxlylscmQCrWXV4WI973wLjsjl3jcQP
	 c6ptbkKAWT8st1s8Zf54O5ul63ceR5H7okWRmGs36m0kwpNbZ40FAsoW1m3BYsRREy
	 dcVeBz+AWbbRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8906608F1;
	Mon, 29 Dec 2025 17:34:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53BA2D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44FD6404F5
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKE0i18O8EXa for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 17:34:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 48114400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48114400BA
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48114400BA
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:34:20 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso74115595e9.0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767029658; x=1767634458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J1GOuCVWk8NTJkCgQoDwIZgPItUOcy7ErLLL1hhpdDo=;
 b=LaMWCv/2Bg/TLtOIcrBnJhma2r+RzCv/Hj4qQERGrbHkhJKWeFycW1StHllcepy2VY
 eCBjKzdRniQ41q81AdJwt3K+HF1XdQsZxw6inMigccHoRApMSkwaU/63v9Jxk70C21hj
 77hr8NMey+dWrEPSmNykcJS124YpctnslSFUJAqasyiFwL62JwID5ZdYzTO9tBueIY1p
 iry0rH/oEnjWlcdluI4kXI/IJSVBat/hi5KJJ/1kj75yIf5sgBy+ZOikAHN87WBVmPlr
 xN2r3fpnQWodvg9KzMV1QFXQypwKE0DWCF5+0u2+szHiEyWyW4Nn9rR86G5Uni7lpcHH
 D0eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbLrq9JLvA45eTzjlcVFIcASB5kPnhK9FO+dGSW72QFyLV9Xtj5k9+hhUhxXWFw7h1un9qRHS12I8=@buildroot.org
X-Gm-Message-State: AOJu0YybR4k+6S45l5qVQlW9RyPRVvRFwp8OG/B9ngrtE9S2ud6ipjj3
 fhwWdEw+wEoJr6qVqVXNJIcZPhmg5vRYuGsm7dyP/SXKYrrEwbeuBpudRi6XJ6B6uyU=
X-Gm-Gg: AY/fxX4GHr6C1akVhiuw0VCU25ZdSeY5iznh2CUat0Vl3nm0O8nqSKBk21hXmQ4uvvS
 nZHhB1mnTxavGNKC6VSbKMRGF5LR9+wDcVvpxp8d5nWWD1WjsOAyX/lvmPEyEvLkw7hVbuoiqTQ
 1ybkVixU1FkWLSZmz5TSlc160zjv9/WiQKAQA97AH4tRs5DUugBSJ6hOP2qet/KZdGTNHNh9O81
 wM9nqOm2khFl8i78Lq7qhD9AT7/vX5s7d2RBsTgGH83y1GYPua6CaAmqxpkfrHSaFDXgRNJe8Fj
 cpjxgQ8bye6NHP+n3C0X5mwYObnzzE5c5T/G0PQKGOkwfLaylcJZOVwWaBdTturk0faFd4UGkqh
 SR9S99f/2I8I7CUAqyZLmvC7R4kfiTwvr4bJ2y81ePlxLjYjF17NUuYdXN47RkhUpoAMDX29Sij
 2tHyE=
X-Google-Smtp-Source: AGHT+IEc7THRAxMoCpjPinZntGcknkD/ng9LxkHYT7wCZZszr1sCPEWh4nKvhMMgPC2dlweZeOEB0Q==
X-Received: by 2002:a05:600c:608e:b0:46f:a2ba:581f with SMTP id
 5b1f17b1804b1-47d18be1812mr395364085e9.16.1767029658363; 
 Mon, 29 Dec 2025 09:34:18 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be272eaf8sm594980135e9.5.2025.12.29.09.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 09:34:16 -0800 (PST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale via buildroot <buildroot@buildroot.org>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90?= =?UTF-8?B?dGU=?= <raphael.melotte@mind.be>,
 Bernd Kuhls <bernd@kuhls.net>, Gilles Talis <gilles.talis@gmail.com>,
 Martin Kepplinger <martink@posteo.de>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Date: Mon, 29 Dec 2025 18:34:15 +0100
Message-ID: <20251229173415.61171-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229151259.37dfa7e8@windsurf>
References: <20251229151259.37dfa7e8@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767029658; x=1767634458; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J1GOuCVWk8NTJkCgQoDwIZgPItUOcy7ErLLL1hhpdDo=;
 b=Ldr9v7jtQ4JBHpE1EDHWRtfCUhVy/dxZFhjPEr+BXZ+eOvh7DSypLGWcPVBuVsabRk
 ZC1JG62RUK+gzKpfBAzDcYPYk54EDoYPyGbr2J/MX26QQNKg431c+K3eFlpe0l2veLQ+
 AQdi6oSxdHXAvSzA9ZPBkenexp0IDVYE7l7kJe4L5pTKx8Y2Lg94tJdtEhgBvL3S9lXK
 wJMfrsbk59WOcytMOEhAG2ebYqZG/V2/LvCBAghyKCBHmXgWZqZss2IHZ/XYx3u3k8bN
 pklyubQ9f7B8kZCKXQmDq1ld8jCtYZxDE9OS9bi7M7Ml7YF96w3Trb1esDHLECr5MIg0
 Gc6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ldr9v7jt
Subject: Re: [Buildroot] [PATCH 01/14] package/sox: add CVE trailer in
 patches
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

Hi,

In reply of:
> Hello Thomas,
> 
> On Mon, 29 Dec 2025 10:07:06 +0100
> Thomas Perale via buildroot <buildroot@buildroot.org> wrote:
> 
> > Since Buildroot commit [1] the patches that fixes a security
> > vulnerability needs to reference the fixed vulnerability.
> > 
> > This patch adds the relevant information to the patches header.
> > 
> > [1] 1167d0ff3d docs/manual: mention CVE trailer
> > 
> > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> > ---
> >  ...voc-word-width-should-never-be-0-to-avoid-division-b.patch | 2 ++
> >  package/sox/0007-hcom-validate-dictsize.patch                 | 4 ++++
> >  package/sox/0008-phere-avoid-integer-underflow.patch          | 1 +
> >  ...formats-aiff-reject-implausibly-large-number-of-chan.patch | 2 ++
> >  package/sox/0010-formats-reject-implausible-rate.patch        | 1 +
> >  ...CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch | 1 +
> >  6 files changed, 11 insertions(+)
> 
> Series applied, thanks!
> 
> Two notes:
> 
> - When you add the Upstream: header, make sure to update the
>   .checkpackageignore file as well. You can run "make check-package",
>   or have a Git commit hook that checks it for you.
> 
> - Also, when you add the Upstream: header, if there's already the same
>   information in the patch, but in a non-machine parseable form, drop
>   this additional info. For example in this series:
> 
> +CVE: CVE-2021-42260
> +Upstream: https://sourceforge.net/p/tinyxml/git/merge-requests/1
>  [Retrieved (and backported) from:
>  https://sourceforge.net/p/tinyxml/git/merge-requests/1]
> 
>   You should drop the [Retrieved (and backported) from  ...], because
>   that information is now provided by the Upstream: tag.

Thanks for giving it a look. I will take your notes into account.

PERALE Thomas

> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

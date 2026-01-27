Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6A7D2FEE1
	for <buildroot@archiver.kernel.org>; Tue, 27 Jan 2026 20:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C1C261101;
	Tue, 27 Jan 2026 20:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YC9AsNm7yC5Q; Tue, 27 Jan 2026 20:45:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FC44610F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769546754;
	bh=4ekH0ntaL5XWahpDxjpcnXY9WDznjTZO+E0/6zFzYD8=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iBRls31dQtXAto06aKqWDhD7qfipzeU1kFgLUmWbCYSVkhIrQxEL9DaA0A+Gokbes
	 ugmhL8m4L6vIhuXXdlSsLjCeQXZJA/0fOMvNvCG2bpUl19U7UY22XYspgV9RcYcmcu
	 eCXCQ/7zIjW3GVvpqMsRYxHQH2dThpgp8quMWJaNPxCGO9e/cXFbrwR/Rol/24V2b3
	 t8oHrOrPEuZLPwXMlRrHcce91GrJuKeoyRTY2S44VqQ+ccnTz5bioHFo4/0+jSw4DA
	 KeJ1fuw1pxFRaJmxHVA2sDOatPL4zmB6/IsTeXY2/oGIqBF9U0uyd8kwi+E58VwCG6
	 H2GrtMcwef4xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FC44610F9;
	Tue, 27 Jan 2026 20:45:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF672160
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 20:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D32318133F
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 20:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cI0wjyPtMmcm for <buildroot@buildroot.org>;
 Tue, 27 Jan 2026 20:45:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b12f; helo=mail-yx1-xb12f.google.com;
 envelope-from=judge.packham@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04A9381305
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04A9381305
Received: from mail-yx1-xb12f.google.com (mail-yx1-xb12f.google.com
 [IPv6:2607:f8b0:4864:20::b12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04A9381305
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 20:45:51 +0000 (UTC)
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-644715aad1aso356893d50.0
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 12:45:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769546750; cv=none;
 d=google.com; s=arc-20240605;
 b=WS8xvYYfnvtCIrcQHfuglsdX9Pzpt8F7qHgGn+ratinpYc0dkLweaY7obNc2EP5dE8
 yuQTMi97aa5DDti9xhDp+Wo14nYGeSemXw8kg2ne1/LciLZ9BhErPPDRNIEY+vxLmLUi
 D5dSdJJ5HtUY3N6JHkRJ8PawmfN0CZpOPuwIOyZcl+TbAAPx5yXnzjLnhO4np1ZASLAI
 iq8EUhV/65s73v5NzVKdIiqBsMlgQItXEONJoZeDv5467Qk1/RqpywM07KWF/ori2+9Q
 8bLKntUJTYB8ap2F4iQDHV8FGubcFd69xoG+R/Ed0RJDTAVZRQ7/DWjFJn2hUt9xGii/
 taQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=YCuwVTPPGUysiV9He1y0gHZiGPUNBEBMMpeVgMh8kXM=;
 fh=itfsoOKBqaISs+ngHXp6xjXctk+izHM6cFlgXPwv7ZI=;
 b=R8szqfqOLtRiQHQV5Wsl4pvtngwRIT3u1Cb+13CTf4gnfcI403tcRABlpIdFsi6YTe
 rVE+joab2iX4SpmSH6xOO2K3QItOx1fehk4gd9PJHFH0VLx+3bJmOMa4vvISVWXHY49c
 ckWBesIP8Relg+6cclgH+2wRnQzTzN9KymGdy4iB360bSA78guJk+jyyyigGsF9oZMkN
 RAYU0i9VpnS1N5d5bNyANjlTRxak1cxlAgDC1pTPjIqnnuac/cRrPCxiRt0nu5WZL8vf
 1yTNuvxZuApH+LJlCEbuAhhEN8Y33RjCr5i8nw6GqosfgRTB0rnVC6LqRwkCxzG9x4hV
 Aljw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769546750; x=1770151550;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YCuwVTPPGUysiV9He1y0gHZiGPUNBEBMMpeVgMh8kXM=;
 b=dpidxDhERXin8wzSyZOzNJaxUcEXxEfitmsjWWjQGJoBFaEB5aDk3b9KfVF1i+r4M9
 JhipXNOPT/RlP4qLlLzyIRCDjfd/HfBHthZo5m1b1eztWZhUy6oqfVpsOSFS85ZHsLkA
 thlK5ooWDoPmwTU1hKagv26VEiry7/oSG5K/tGbR8cYPLnyhiiaP83SMZ5ZVkQStWYw8
 KP9t3dcENGBdEwm2jZRVQls29prXTgTd0hBG7ENjEYSvKBp+vyURbgclLwWULEsv0zUH
 i6JGvCfCemTLhRnYSe7g8Vz1vWBDiSuXICPHlUljqnPPWhQflWdZHAtZ355XMIGLY5xT
 40Kw==
X-Gm-Message-State: AOJu0YzkqhBbePJOCLky+GrzxwIwIzhKeHpzaw49LxBhIQ5Qkc8RiLC3
 suQztYPbPETOzztDLfFY+lfwfwNnMkhmPXf1lAw9vDnkulB7uFoxUnh+Lxjz5j6biZCtx4+ICzN
 nu9dcgbG6tBvX0ugYkkXQxZernutXgo5aj+dl
X-Gm-Gg: AZuq6aKQQiz9F92KvIV8FnlXRePfKZCnW4/2Y+2xoYp0VoAhMs2IGeFGnzqkNoPG34a
 oOMRopOahbog+VuVo0KExFua6jIVqsF57tgzgJkCF8oStfoU1LD825s6ISVWV6bWmmjB6gdHp/6
 FaVETBBwGdUmxvGRie7e1psjVprXeERP7sHHWChJsilyJHKAOBOZ5au9VxY8xKca1a1k8zQ1bPp
 fEhRc2bT1OnzRr3PtOtKlSQP/dRPuUarWDihZtVyp/H0SlVPzaUYi6hzT+w8rR7n5zz9InzmQnd
 8rRf
X-Received: by 2002:a05:690e:1249:b0:641:f5bc:692b with SMTP id
 956f58d0204a3-6498fb14ff2mr2178661d50.36.1769546750636; Tue, 27 Jan 2026
 12:45:50 -0800 (PST)
MIME-Version: 1.0
From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 28 Jan 2026 09:45:39 +1300
X-Gm-Features: AZwV_QhLjo_HiEeDcvN9WSF-781m7n6slV4Z6GSiNUwFHOHrckGqJ5kFoFPpz1U
Message-ID: <CAFOYHZAeKaF89C8hGkiWz_qBT0Kq4n3bM=tmmSThhV2gBs75Qg@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769546750; x=1770151550; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YCuwVTPPGUysiV9He1y0gHZiGPUNBEBMMpeVgMh8kXM=;
 b=NACeIXUHEonZ+Cq+V4K36LBAJa5GsIMJe4e32DYu7qWcGRpKqvaGJQ7l0C87ro3I9V
 Jt9InRAW5YX2uX3pcijU0YxHiQffW4ND4fW69r/XB7lvGXMk0LHQdKLqkJ6JYfBPtW5V
 qVOHvGUmCfqyezU+6ICQ5haqKJk36I8OETIWeynWZFq7tuBzCYEEdm7vUzf/dQFG695m
 VuCUCmOJybX9FNlrSwBZ5vmm4CzaONHul9aNUwxAQFB3cNfJI4EvGxmPGYiETvisDD+M
 sCAg9DoBj5M+f18y2OMPPprmibjmcuizitVWWFnJVlXOtkAlDHivz1xy/gWqL4VwyZm4
 dpsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NACeIXUH
Subject: [Buildroot] crosstool-ng piggy packing off sources.buildroot.net
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

Hi Buildroot,

Some of you may have noticed that uclibc-ng.org is down. Probably yet
another victim of the plague of web scrapers AI has unleashed on the
world (or just people travelling to FODSEM and not noticing).

Over at crosstool-ng our builds have hit download issues due to this
(our builds probably don't help the situation, I've tried to get the
github caching to behave but it seems stubbornly unable to update
things when something changes).

I was wondering if it would be OK if I included sources.buildroot.net
as a mirror for some of the packages we have in common? uclibc-ng is
the one that is causing problems right now but I imagine there are
others.

Thanks,
Chris
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

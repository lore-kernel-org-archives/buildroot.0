Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730CFD42B85
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 14:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2761281152;
	Tue, 12 Nov 2024 14:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5n7YsHqOdsKX; Tue, 12 Nov 2024 14:29:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2191D81155
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2191D81155;
	Tue, 12 Nov 2024 14:29:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 458A06C
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 14:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23F21408E5
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 14:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSghz6WQDobN for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 14:29:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3E68400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3E68400C1
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3E68400C1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 14:29:14 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3e619057165so3251100b6e.1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 06:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731421754; x=1732026554;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JBKoaoC9a8FxZ7tW7ves9nXEEBj1N1cGPRvMe4UrC7k=;
 b=XJkpdWp2XroMTBFimd2NztE1wYthjZ/qIhbtK+gHNbtXr4WUocgpRYLsqmhjFDkmjm
 ti/H/H9fRPbgnQla33hXXuTyT3Bxsrm1586za/Sxa+UdHjObB/i1krg+t/PZZDni/mZB
 7G43Hyk6I4m6rQ0ywN7TU2XgqDdmSm/xZ6Z+R+KDzVCMJYs+FCI+0nMLJd3bw6LIWdvA
 yzF9y+TrXuuPbsdTsg4KUd343MpMUd6fp0BubdIDlcGJ8s77bD9x82tsb13oy7jDCXFJ
 TL1yahR2mTyoy6iRAc7u2WPmfSgxypTtopyy7e85q2cLMAOjftOHQ9zQmuqy6CGfk8k3
 HUAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM64OMf8IsCv2fWi75E/JCNoVsBf6uufk0i6u5/LZ7RhPPJRSr78oyipqEEwHobeye/PvP+nrcpjc=@buildroot.org
X-Gm-Message-State: AOJu0YypoU6Py8rNTpIfipfOL03s2IdM3FXcuyzBZ2nC04TVa7dNl+0o
 Ko7Eoi940Hfwqz40n2V23LJsLE7F18r6xRE2ZMAkxBkS/WpBfl98
X-Google-Smtp-Source: AGHT+IFamPOJ159O9oLkpOhYF3AVJIGMfFy6Qy5+Pd4dPbwJziac5jRUaT81ZNkS/XCae4l8xf5wAQ==
X-Received: by 2002:a05:6808:118c:b0:3e6:22cb:e219 with SMTP id
 5614622812f47-3e794716d17mr15089567b6e.26.1731421753634; 
 Tue, 12 Nov 2024 06:29:13 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de7871559esm2044233173.10.2024.11.12.06.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 06:29:13 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 12 Nov 2024 08:29:12 -0600
Message-Id: <D5K9SCGHYST7.1P8TUH8JBP2BX@gmail.com>
Cc: "Niklas Cassel" <Niklas.Cassel@wdc.com>, "Niklas Cassel"
 <cassel@kernel.org>
From: "Brandon Maier" <brandon.maier@gmail.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Niklas Cassel via
 buildroot" <buildroot@buildroot.org>
X-Mailer: aerc 0.18.2
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
 <20241109-genimage-partition-type-uuid-v1-1-9f23180c7195@gmail.com>
 <ZzICaWfSt7aJ2y1B@ryzen>
 <CADwxmT=bajsScNg33csd+zBRBEkTyo3YjBiW553Tmr860MKzRg@mail.gmail.com>
 <ZzIVSTNPFHE_V3yR@ryzen> <20241111220010.63fe44a1@windsurf>
In-Reply-To: <20241111220010.63fe44a1@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731421754; x=1732026554; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JBKoaoC9a8FxZ7tW7ves9nXEEBj1N1cGPRvMe4UrC7k=;
 b=QxVnEwqCMPZdhBHlwD7XxWjJ08aUGsZnhvklXEzY95tTiMW6AjzhKNuO8ZQazoW3w9
 KhJuzTM/I27rGytpmUoKeiUQHyP3eBUxG0CbvCjgh8fgV5UKev/yycxi/cnjl+NjsdlX
 501fULgWCdKP2KsaH1cW+UB3dIOiD3t7zpBpQiL3oOM8FCeL5oNZjFRPKuVipPPRPsu3
 ZDH2zRqCbxVuKO1idqv9XWPMuFBb35VwbppK8QbvUkHZL9rJUwbbfeOJjXvTGmwKVn4f
 vmNKuL3VCvIzgdHaEmph3UaEwM4rzNnAUgR7H3mC4Z0eS7n6s8O4eIyKAIwg7hG3L2lf
 yh7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QxVnEwqC
Subject: Re: [Buildroot] [PATCH 01/17] docs/manual/writing-rules: add
 shortcuts for genimage partition-type-uuid
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

On Mon Nov 11, 2024 at 3:00 PM CST, Thomas Petazzoni wrote:
> Hello,
>
> On Mon, 11 Nov 2024 14:31:38 +0000
> Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:
>
> > > I left it out of this series as I haven't looked too closely into
> > > which of "L" or "root-*" is better. It doesn't seem like a simple
> > > choice, as U-Boot has a lot of board-specific settings.
> > >
> > > Do you and Thomas feel confident that root-$ARCH should be the preferred type?
> >
> > For new boards being added to buildroot, definitely.
>
> I don't have a strong feeling at this point, but it looks like the
> Discoverable Partition Specification is getting quite well standardized
> (https://uapi-group.org/specifications/specs/discoverable_partitions_specification/)
> and adopted. And genimage indeed supports those now, so we should
> probably move in this direction.

If there aren't any hard blockers to using L or root-$ARCH. Then I agree
a written specification is a great reason to prefer root-$ARCH, thanks
for digging that up! I will add a link to this specification in the docs
as well.

>
> That being said, having as a first step our defconfigs comply with our
> existing policy would already be good.

Yes I would like to bring them all into alignment. The intent for this
patch series was just to get rid of the "full GUID" to make things
simpler. I intend to have a second patch series to then update
L/root-$ARCH.

Thank you for the feedback!
Brandon

>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB40CD42B85
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 14:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48BCB403D0;
	Tue, 12 Nov 2024 14:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moy8p4SwVLPD; Tue, 12 Nov 2024 14:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7597403B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7597403B0;
	Tue, 12 Nov 2024 14:25:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 687AD6C
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 14:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4410E40919
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 14:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Fd_u7GhUSLi for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 14:25:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45AA7400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45AA7400C1
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45AA7400C1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 14:25:50 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-83aacecc8efso192575039f.0
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 06:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731421549; x=1732026349;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WNvQdB/r5goUoSO9sY1TXwBZHa0CQ7egU8GXjxEzV5k=;
 b=LJoBQQNzYPuZFLVxnItehbhXJSTzGpqxFROD2HnWK3LZt6WR7qLN5UvScz3i4i8kF2
 Tkq3V4GpAWTNZXFStgRor3zVjThEUKrN+SUhK3j3aoJCjWExyqwZUjP7VFw768Ot99Hf
 LVh8g2pkcnp1ITlO69/J1/YrWmXb05Ix28RsBkeA0ESAxQ3LmFCKDONn7+rkOFp8/kqk
 JsDW2+M9eH8tSVQrWaxAlzie3dUN6x+Q+hrRMa7yINF4KdfnG0nwmGTQc1Gf1Uojkv4a
 gOkRH35sZ5ZQKrSBMRiq5l3qD2BSg81Ux332h6dw9580pnYf4BZC3u6qaufnMHgePqHp
 zJCA==
X-Gm-Message-State: AOJu0YxFBHo49cbilTKMvygU7eDV5pCRVL3F7KDpYr6pRWNxBl29Wqx+
 GJ1qwj9d1Vn6ILOOz7bQA9pZAW4mZkfnfGdPmKPjiipPcmde69e+
X-Google-Smtp-Source: AGHT+IGLUZ3O84WAU279/Q2yeF2Co3h2gAO0FiNjwut6ZdGMd5VptQiuiy0VuIWODcvHljUl3aGiVw==
X-Received: by 2002:a05:6602:3f50:b0:83a:f19d:ce48 with SMTP id
 ca18e2360f4ac-83e00aba56bmr1458842139f.3.1731421549006; 
 Tue, 12 Nov 2024 06:25:49 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83e1324be03sm192280339f.14.2024.11.12.06.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 06:25:48 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 12 Nov 2024 08:25:47 -0600
Message-Id: <D5K9PQAPOLYV.1I7J2NAS474XJ@gmail.com>
Cc: <buildroot@buildroot.org>, "Niklas Cassel" <cassel@kernel.org>
From: "Brandon Maier" <brandon.maier@gmail.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.18.2
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
 <20241111221228.211b7a61@windsurf>
In-Reply-To: <20241111221228.211b7a61@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731421549; x=1732026349; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WNvQdB/r5goUoSO9sY1TXwBZHa0CQ7egU8GXjxEzV5k=;
 b=Y5I7TELARSCYCOCQFDv5Q7LYIhFajacs0oSY7dGwm30xBZ0sO/wWzz8ZlJLOs6Uip6
 IC8mTeXz5qSUp7KkwEGdUtz1T0y05bNxwCdsNVtLvlSpaLru2tdG6n0pC1FybkEzhqPI
 D8s4GDfDCLbx+EKy0uIkH+TBF6g/GQ2GOFWy0koL77r4sRZQs80z99yd668LDyI1yKxD
 /67nRNoBDYVFbC1UxnT3oI35BUjR5L4TyCft1kExnrSTZkhEQrZOkwgRmVfvqU0J0lIB
 I3zv28gdeY0kLAwVBszOCxKGs/PzIOrhTMB1pPvs71+xd8EqBOmsc18QtIr+yCDHUqih
 gtqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y5I7TELA
Subject: Re: [Buildroot] [PATCH 00/17] board: cleanup genimage
 partition-type-uuid shortcuts
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

On Mon Nov 11, 2024 at 3:12 PM CST, Thomas Petazzoni wrote:
> Hello Brandon,
>
> On Sat, 09 Nov 2024 16:16:14 -0600
> Brandon Maier <brandon.maier@gmail.com> wrote:
>
> > Buildroot boards using genimage's "partition-type-uuid" can use either a
> > full GUID or one of the shortcuts defined in genimage[1]. The Buildroot
> > manual recommends using the "L", "U", or "F" shortcuts over a full GUID;
> > but does not specify how any other GUID should be defined.
> >
> > This series tries to bring consistency to partition-type-uuid by making
> > shortcuts the preferred method. First we update the Buildroot manual to
> > say shortcuts should be preferred when available. Then we update all
> > boards to use shortcuts.
> >
> > This series is partially implementing Thomas suggestion to have
> > consistency when using "L" vs "root-${ARCH}" vs full GUIDs[2].
>
> Thanks for working on this! However, I'm slightly confused as to what
> the goal of this series is in the overall process of making things more
> consistent.
>
> With your series enabled, some root filesystems still use L, some use
> root-*, which isn't very consistent. Is your series "only" about
> replacing full GUID by shortcuts, for the moment?

You are correct, this was my goal. I wanted to go from where we are
today which is a mix of "L", "root-$ARCH", and "full GUID (both L and
root-$ARCH)", to just "L" and "root-$ARCH".

This is an easy first step to implement and review, and makes the future
transition from L -> root-$ARCH easier.

>
> I'm fine with going this way, but then the PATCH 01/17 should be
> accurate about what's recommended nowadays. Because saying in the doc
> we want L for the rootfs, but many genimage.cfg use root-* isn't really
> great.

Agreed, I was trying to avoid saying "prefer L" or "prefer root-$ARCH"
in that commit, as I did not have a strong understanding of which would
be preferable. However based on yours and Niklas feedback I didn't
communicate that clearly.

Based on feedback, it sounds like we would prefer to migrate to
root-$ARCH, so I will reword the docs accordingly. I would still prefer
to defer updating L -> root-$ARCH for a second patch series however, we
will likely need to split that into many patch series per-board, so the
developers for each board have a chance to test them.

Thank you!
Brandon

>
> Thanks!
>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

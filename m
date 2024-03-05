Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60422C54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 22:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F23DD40182;
	Tue,  5 Mar 2024 22:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZGOoP6LUKuy; Tue,  5 Mar 2024 22:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 058684042E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 058684042E;
	Tue,  5 Mar 2024 22:36:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B2421BF3E0
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 22:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47AB760853
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 22:36:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-VvAN6CmNAU for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 22:36:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BE6560675
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BE6560675
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BE6560675
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 22:36:00 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso338663a12.3
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 14:36:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709678158; x=1710282958;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P7ZC2VakT90ACraRJDEKkKhcWib22y+uwC8pLaX7Nic=;
 b=Vk7PkzBUkR3p9dVG7rpbxU/i/Gm/BZTGHoZJ0WHFnSfdZ4d6Cr7y1iBh4FQntFTx8b
 /g6CbREjj/0uRaJ1kcabT9y8ji0fNOve3W7g3cPT3ZoMdj2ETg3lX7YY/QZ5BClNhink
 JO2IyOZQaBgwQL6fulGQnY4gnB0KWPzePD7z2MGQBDqE0yQqhngANgzhPGqDrgYkMnI6
 XdjhuUJWu+zGRGDFGuE8RcCGdGCcdaspqA0ho3l5uYark3E4UARSaDg64RPYf2wnawaY
 F4lxLAba90EvtagKBu17hI1BcBGRrqhv8ClPBkrbiK2BmzviSaFokUywLBwcXMzNt24Q
 3B3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd023vSmiqmryGutS+GTTrjcwClcMb4NlZK19HCrHSDM353MaFXei5EQc6qFFg+xsbM4M3AXpJmO2pT2P6j17Ki5YRAPKUWQ==
X-Gm-Message-State: AOJu0YwzD8kybTH+bcGIQSUGBV/cXfDZLlwTz99puTHwwqnTlvEoDdXT
 SS72hLwB46xyjCdCdvRbBFJ4bonKwcX7iJLHpSWWJe3bLTxQRQfjQQyQOS1IHtI=
X-Google-Smtp-Source: AGHT+IGxKFX9mNGuZu2JpZpRxkxVe3TQva+5SPQGobaSEnL6Cfo2FGWFOcugPEyM5OuYVaNLGcvRrQ==
X-Received: by 2002:a05:6402:26c5:b0:566:414d:d724 with SMTP id
 x5-20020a05640226c500b00566414dd724mr12616576edd.35.1709678157985; 
 Tue, 05 Mar 2024 14:35:57 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 r18-20020aa7cb92000000b005653c441a20sm6261441edt.34.2024.03.05.14.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 14:35:57 -0800 (PST)
Date: Tue, 5 Mar 2024 23:35:55 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240305223555.GA247944@pevik>
References: <20240305091302.7403-1-fontaine.fabrice@gmail.com>
 <87ttlkzzjn.fsf@48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ttlkzzjn.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709678158; x=1710282958; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P7ZC2VakT90ACraRJDEKkKhcWib22y+uwC8pLaX7Nic=;
 b=V1sdwTthlcedsy0ip3Jg9ORyAcYCfdMVbmAayPuHp72NmdASJFIu7GdSENFBRmrdSC
 3V3rBbSihjhxzG4IS/IK832fdrACaFzWUMriZcDNxgxmh/8J3C9xxIYOCoBkZdmZdwsr
 B1CGJreFDTNiqdhphXLGb7+lkP1iEak9vTSBElebPUTI000eRqrHF6zHWzRVVfx5llo2
 ytCjAEAXv8p1jjmb5a4n1dFQ+8n/OsPXmZ9wwPGd/kkR2LrDwkx0Xeytw4vcsoEnKzFo
 UYZB2Spmd2QVbALx7/wS5iV0qeHxfKXR1cYejzO56d0AMz4AHUpcTxF7ml5OlUQKFUHg
 bjnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=V1sdwTth
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix build with
 BR2_TIME_BITS_64
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

>  > Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
>  > following build failure with BR2_TIME_BITS_64 raised since commit
>  > 3c427c64726560ea1743282a3fdb78f5b28692eb:

Thanks for fixing this!

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

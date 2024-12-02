Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C12E69EA0
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 23:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E632A8175E;
	Mon,  2 Dec 2024 23:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjK1uEl75CQD; Mon,  2 Dec 2024 23:41:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 051C88164A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 051C88164A;
	Mon,  2 Dec 2024 23:41:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E0761DAA
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 22:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E3158490D
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 22:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DOdb32oLAehg for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 22:03:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4414A811AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4414A811AB
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4414A811AB
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 22:03:36 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385eaecc213so1106216f8f.1
 for <buildroot@buildroot.org>; Mon, 02 Dec 2024 14:03:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733177014; x=1733781814;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8nGb0fsD8UcMwZEzY9aP9/GUb6Y+0TxwLbPZW4wWrgE=;
 b=go5qmyKGFXhfA9VS+tzbeuC/s0V+YfPaQjN1MR50orEnOZjVYFoQyFdZUwgeQLyW1z
 5CNKBb9FX+yVFpGLGOMKbG94AO5oW9g/fqTNDORUbiSOFimzTuTb2BCdsDotL3uJ7X2r
 x3QguUpE9xGAj5LpLPsN9Zl2tMsEBvjC7jA0mbT8Nx96XGf3Clp1exNSS0mQID4qiPLI
 V+ngTzagWRRI7gmFJZZMno5hJEZA5Ms/bMVd1/tza8Vit+nwqClcKDiRjhEyNCiXScbp
 1bcZGUi8CxjtbvGVMNbPHEJdcGSL0VT4UUtlXoVJ/hYX0t78nD9M87s8vM6HjCb9nfDn
 dYCQ==
X-Gm-Message-State: AOJu0Yx+OrufCjBKW0z/5vmnTnZXSxReLMAX8NuDiA0fkHaTrCBZPoUD
 MmR66k5aBtfSj2zZsdkpAJyZrGO3KVl2gWworpULG3d1CFODtaJlUIOuJw==
X-Gm-Gg: ASbGncuSKLBLR2EmVDMuuWPLHeM9409oI+IDeX8bDXecCvxHvBagjaKBLzrVeiikQGu
 1hQAjRPh5rHgICr7MG31ISmA13VCWQHHXvDXu9O6X8fM8JkmXi9w3nzCLtja16P5YoJuNG/iELc
 9uen273x/szFocAW7PQv4j4opt2YARn37lYqFA6QBgkZf17qlBGtu6xKkAVzA6/29nuo2y2SbfQ
 Fb3MAGQtBb7H7BMn+5uxDIAFw1a6oDEdZ/P8SOY5KCXcuSv3fRBow==
X-Google-Smtp-Source: AGHT+IGZFMar53xEb+jg2d0Usga2DGLvyxMwDBSz415NogVEFto9TZBw1xbC9Xog+JOkm4WFOv5PpA==
X-Received: by 2002:a05:6000:1788:b0:385:f0c9:4b50 with SMTP id
 ffacd0b85a97d-385f0c94d85mr6030438f8f.16.1733177014144; 
 Mon, 02 Dec 2024 14:03:34 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385d7355293sm12296854f8f.50.2024.12.02.14.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 14:03:33 -0800 (PST)
Date: Mon, 2 Dec 2024 23:03:31 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20241202220331.GA410015@pevik>
References: <20241202215731.409503-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241202215731.409503-1-petr.vorel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733177014; x=1733781814; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8nGb0fsD8UcMwZEzY9aP9/GUb6Y+0TxwLbPZW4wWrgE=;
 b=fgn5QTFM0KGVPekIZkHzICIzEHTJZQB1REJijXCP4+//Lro1fOl9jm/Z2PrcE793eq
 eSiar6LqfkhMco5opr59ATxZYVJgntq1MH/TQTWJddMc1YN5YgtDJosF5a5GPM8sHjwy
 75upPQRnruXIFof05f30MIfmG6yMNaQA/QGY4LQNNmId+gJPKF9Ix3mvG+eqiU9BA8P1
 c0aBfBQR+otkFMhNKCwMB3gSUeTAvcPLO7gCacFLM+mBsNn19N6yp/fEg0QvYoTNts+z
 NmvvA7InB3yU+6lpnKDYqc8EbnJvStbCyATc3hEeAmv1RXVMzArwZvUBY/ArrJRPrvtC
 SrxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fgn5QTFM
Subject: Re: [Buildroot] [PATCH 1/1] package/libcap: bump version to 2.73
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

build tested:

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

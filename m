Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB427C4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 18:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AB2A60A55;
	Wed, 24 Apr 2024 18:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLm2otkI8mrf; Wed, 24 Apr 2024 18:05:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60C5F60A99
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60C5F60A99;
	Wed, 24 Apr 2024 18:05:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90F461BF4DB
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 18:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D91660A99
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 18:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBLk-SZNpjio for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 18:05:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.49;
 helo=mail-wm1-f49.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 75EA160A55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75EA160A55
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75EA160A55
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 18:05:02 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-41a1d2a7b81so7345295e9.0
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 11:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713981900; x=1714586700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L1+u6/3oqNAjy234owyt9Z27HeM/GZ0T718Ioqdf2v4=;
 b=QEwgWo8aVbs91Cv+5dFGqUx369YmQZ3xI68OHh/4grpHJjgQaRFjngQCnYXUAh/re6
 9LO6wFQ8nBsgUIQUww/hL5qRjd4bM3+qBDPY1eZzgQ5mpbuWreEifKIFomQ3kOa22Awc
 soV462Nqw3DqwmLZdbZQa05SJl5DoqFVHTqixnFqf9fsV9XJq9WQJ76T9S9Mx/lLfoX5
 cWfdrOmrBrHbKwFBvcrAFWh18FOR3o5O/r6gK8sxLVOfqaXrSMAumA4nvFKwv5SJ+NSH
 5MGVRAKCxijUD1PNUp2Fo2WQM3wgDHOd6aYfFEVwq52yrBi6Sx5g9IZBiOu9w8hpxbKr
 V/bA==
X-Gm-Message-State: AOJu0Ywl1wCIeDjDGU2XSK2iz9UXZGVorgIDnXZOi7WN1Ad4QL0dnzv1
 BMruTSsPXxE5pkpYlTyD8bFvSGb1j9gCYMEaMiJP0LsJuSORl4o/Pq+iCvyf
X-Google-Smtp-Source: AGHT+IEanRYEFU12wWtPN3kIPGtP2RjqlpQSzifIXtWM3pEKB1tjXdxsk66Fq3EcTfaSQbdU8Iryig==
X-Received: by 2002:adf:e642:0:b0:34a:365e:5376 with SMTP id
 b2-20020adfe642000000b0034a365e5376mr311531wrn.26.1713981900058; 
 Wed, 24 Apr 2024 11:05:00 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:ccc6:3e01:4360:2c30])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a5d4b8f000000b0034b5dc8259dsm5450356wrt.57.2024.04.24.11.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 11:04:59 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Date: Wed, 24 Apr 2024 20:04:58 +0200
Message-Id: <20240424180458.38564-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424175359.37025-1-thomas@devoogdt.com>
References: <20240424175359.37025-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v1] .github: add a pull request warning that
 explains the mailing list workflow
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,


This patch is based on this thread: https://github.com/buildroot/buildroot/pull/134.


Kr,

Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

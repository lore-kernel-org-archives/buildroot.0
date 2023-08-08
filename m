Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587ECC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 07:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5974400CB;
	Tue,  8 Aug 2023 07:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5974400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJhXVEhp5m_p; Tue,  8 Aug 2023 07:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32964401F3;
	Tue,  8 Aug 2023 07:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32964401F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81C381BF82F
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 07:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A3A760BCE
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 07:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A3A760BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OBZJCvLun4yR for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 07:15:16 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 928CA60B42
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 07:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 928CA60B42
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-4fe4f5290daso8213786e87.1
 for <buildroot@buildroot.org>; Tue, 08 Aug 2023 00:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691478914; x=1692083714;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2jcO/XFTo+5gvZk/TFdbjJOuUuZOay8GbSh2HCahWyU=;
 b=PYRVL9yEp0YiMWIsr6sqEzzrugDNSHkkR8maTr5ONFJlW7sLcnA+DitjKS3pUl4TSI
 AO5v+72d/Yoig7OyTHGlzNjVB0uqDOrAIIT2y7df58b7Mms+Giw2RsBNDR9u9yYLcFpv
 TrlyM1+1KygKgT8/ekRQUlU0C9ByAQ5XWL4/Bx2uwPCqlrfCx6hDv5JJLh26lvtgXUn1
 z6oHflshjEttS3ikaezsBJhDBW4k43P6SRlKReNkiL5mqSD2g0Ji3SP8utmYOyRMmf2D
 YR2kUEwo6o9iXOfCBKbqTa+9kYJ6yoUYxIYE527yF8dmQhOa2fdsBzj36NfpVm1n57PX
 sq4w==
X-Gm-Message-State: AOJu0Yyrwx7Tn/GFs5EAzaCKRobiTfQl76zNzk1c6JEC60Vp4bfZFbkj
 vA+/31pRfSgwsseIAyX6qnp/HcUj4M7f7xsq
X-Google-Smtp-Source: AGHT+IEabow1qfQMg/AzyoTZADErWseFQzSzzA7q1FtR/+j3xnUisHN/se2ONPg+HYx31mq5H4+oEw==
X-Received: by 2002:a05:6512:158f:b0:4f8:67f0:7253 with SMTP id
 bp15-20020a056512158f00b004f867f07253mr8596781lfb.49.1691478914060; 
 Tue, 08 Aug 2023 00:15:14 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54]) by smtp.gmail.com with ESMTPSA id
 y12-20020ac255ac000000b004fa52552c7csm1774384lfg.151.2023.08.08.00.15.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 00:15:13 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-4fe3b86cec1so8191739e87.2
 for <buildroot@buildroot.org>; Tue, 08 Aug 2023 00:15:13 -0700 (PDT)
X-Received: by 2002:a05:6512:3b27:b0:4fe:ef9:c8d0 with SMTP id
 f39-20020a0565123b2700b004fe0ef9c8d0mr7978488lfv.35.1691478913770; Tue, 08
 Aug 2023 00:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230808070245.368539-1-thomas@devoogdt.com>
In-Reply-To: <20230808070245.368539-1-thomas@devoogdt.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 8 Aug 2023 09:15:01 +0200
X-Gmail-Original-Message-ID: <CACXRmJhGWC8HC-Xu=boS2Lr0nWDeOxkvOE-5xz6sR5kUVorWNQ@mail.gmail.com>
Message-ID: <CACXRmJhGWC8HC-Xu=boS2Lr0nWDeOxkvOE-5xz6sR5kUVorWNQ@mail.gmail.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Subject: Re: [Buildroot] [PATCH v1] package/qt6/qt6svg: use the CMAKE_NINJA
 flag
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Yann, All,


I forgot to add the "next" tag to this e-mail, so please apply it to
the right branch.


Kind regards,

Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

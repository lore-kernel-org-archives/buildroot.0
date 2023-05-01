Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287B6C77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 16:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99CD161390;
	Mon,  1 May 2023 16:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99CD161390
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tQUz9rURyo4L; Mon,  1 May 2023 16:19:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4CE9610FC;
	Mon,  1 May 2023 16:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4CE9610FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5EEF11BF420
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 16:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37C0F40B80
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 16:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37C0F40B80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m0nd4dvF0iDj for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 16:19:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E848D4051C
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E848D4051C
 for <buildroot@buildroot.org>; Mon,  1 May 2023 16:19:44 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-4efef769000so3236756e87.3
 for <buildroot@buildroot.org>; Mon, 01 May 2023 09:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682957982; x=1685549982;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iWZ0vDHWo5CNiv8OlHQrk7o81JDvBsxHhhTfjru7ZXw=;
 b=LDH6Scz/VQSZyrniSVRKccCt60nEJUJlIX6sqTGxCEq73Oy6EGpFC1oVXgajrxuIcT
 M1IOVKNDxMxEZB8/SrDjJMNNqihsmhqkz/h7+rpqKmJodGn+LvBH46zDye9iFBwxCGlp
 tK4RfnDMUlqYtL0+txF0PyvEhPBXfvhx5GvtnIsk2ugx8X4htZ9kzyUuWizMwW44stxy
 EPsekYPlXZr5KA8L5nBOsl04+w0ZTwAErGKfBreDl/7O5k9lw8a2XPDhKhdc6msIN1pI
 nrbWMIa5nc3YKFJUyZYnlnwt+31cyeNnvrx85GLg9ThdLgpR2XWchW78Sg80FKaxn+IX
 9mLg==
X-Gm-Message-State: AC+VfDywEmfUr3Qn4eJUjuHyYcMPoallyqNpoOurdYFcYHWHEfMGlpvm
 fmzJp9OUisVVSmA4WKFd35Zo0Ki1Q/HM+Q==
X-Google-Smtp-Source: ACHHUZ7GkQ/ZhSEUSmKJM0zGVnJAiMu+ICzw0BrixcGWcXpeiD8iQ47a6eWCJmrMnvds5rQ2U3oUyA==
X-Received: by 2002:ac2:5691:0:b0:4ed:c17c:16e5 with SMTP id
 17-20020ac25691000000b004edc17c16e5mr4321453lfr.17.1682957982163; 
 Mon, 01 May 2023 09:19:42 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 q11-20020a19a40b000000b004efd57ba3d1sm4300351lfc.57.2023.05.01.09.19.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 09:19:41 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-4ec8133c59eso3268329e87.0
 for <buildroot@buildroot.org>; Mon, 01 May 2023 09:19:41 -0700 (PDT)
X-Received: by 2002:ac2:549a:0:b0:4e9:cfd2:e2d with SMTP id
 t26-20020ac2549a000000b004e9cfd20e2dmr3446892lfk.65.1682957981529; Mon, 01
 May 2023 09:19:41 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 1 May 2023 18:19:30 +0200
X-Gmail-Original-Message-ID: <CACXRmJio=RfDY7E+ekja9AyjioQQydcVfCRT1TrheV_OvPZmJw@mail.gmail.com>
Message-ID: <CACXRmJio=RfDY7E+ekja9AyjioQQydcVfCRT1TrheV_OvPZmJw@mail.gmail.com>
To: xiangyu.chen@eng.windriver.com
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcpcd: bump to version 10.0.1
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
Cc: johns@msli.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Buildroot has a custom site handling for GitHub [1] nowadays.
So it should be something like this:

DHCPCD_VERSION = 10.0.1
DHCPCD_SITE = $(call github,NetworkConfiguration,dhcpcd,v$(DHCPCD_VERSION))

And the DHCPCD_SOURCE line can be dropped.

kr,

Thomas

[1]: https://buildroot.org/downloads/manual/manual.html#github-download-url
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDC5C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:10:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35C1761040
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35C1761040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEE9240001;
	Tue,  3 Aug 2021 20:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iAYkJHJlZE6f; Tue,  3 Aug 2021 20:10:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 051C3400C7;
	Tue,  3 Aug 2021 20:10:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 163831BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0466E400C7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BsCQI6tIJQpT for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:10:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B4AC40001
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:10:41 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so132014wmd.3
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 13:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=AVH4l0vvdkpU2vi9FBMwyR/4spJUzhiPS9+9HR4uu/4=;
 b=ta7YDDwpHXtfznwbnETnpkcddrCALTgkgzVaNQW2sZBzSxEuP8nvYduxyRKD/zHKg1
 BtJsMBdxwsmtgmydzebbUbLExA6qhCH/zKGDz5P48AlxAmwGxTs0Jb3RXtndVkqO2ANS
 6a1fBhmfvCilfwMJGFkuyR5fltz3T9wSacjVcTkZfn1zd1bhrW4XVFA2X7UIuYv0TB/1
 Ykimu+QxwqMoKLnvCUgWwiNUQr9yyTkSqMvTQ6kpFmHc5gJ9y5/7s4PfgLxDczjH9rhZ
 hYqwd/adz/XrBriN+crDRNSw2a6fumw60V06aqRqiZkdcCq811ULcHYuAyyPdiqT5SM1
 cwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=AVH4l0vvdkpU2vi9FBMwyR/4spJUzhiPS9+9HR4uu/4=;
 b=kEbbnWMoQ5F5ETDzkcecNzwNC1XCZ+ygqu4J7PnD2ECHk4VprnZc5v/OMdbHSQisgE
 uNqSbQPhdtWNygxmWH2XPFsEGG3yZ/qJFTZWOiQGbSbwj+cxezY21gokD/t6qUCaKc9F
 nf+MeSyct/EZn/YfgM3sRmuTSXi5hxV3jMfxlWbG5iOAhTJc1ARihQcMWEMfV68O9u9/
 LOpke4G1q6h+OgQPG6uH7pT8WvnxiMkScW4L9vv0tfLobyRlYqttUP29Th2EXf2h72pI
 dex0y1199TtgHUleqaJE1QB2bk72f9bBJzpQjMEU2oLfkdaglchS9wypEzKSs1euaCNw
 cWIg==
X-Gm-Message-State: AOAM531xSuYCoeLFe8M5Qv/iWXukTaxkFn+uid7wI+FY4VOx3CXa4w8N
 15TIlDtkSkICL1i5sQV80yg=
X-Google-Smtp-Source: ABdhPJxZQtsMOoO7nVhGIAlg3JiWQXDRKRVtBirUTGfy141mA5zgp7819bRlFxVUTKiNkz1joZAjRQ==
X-Received: by 2002:a1c:a54b:: with SMTP id o72mr6101479wme.114.1628021439151; 
 Tue, 03 Aug 2021 13:10:39 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id w18sm16728051wrg.68.2021.08.03.13.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 13:10:38 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mB0kH-0006DF-6H; Tue, 03 Aug 2021 22:10:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210715212917.484349-1-yann.morin.1998@free.fr>
 <87sg0dtchm.fsf@dell.be.48ers.dk>
Date: Tue, 03 Aug 2021 22:10:37 +0200
In-Reply-To: <87sg0dtchm.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 17 Jul 2021 13:18:29 +0200")
Message-ID: <87mtpyuw5e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] boot/uboot: add missing dependency to
 host-pkgconf
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> Commit 2eaa6d0f3629 (boot/uboot: fix uboot building host tools on x86
 >> architecture) added use of $(PKG_CONFIG_HOST_BINARY), but forgot to add
 >> the corresponding build-ordr dependency.

 >> Add this missing depenency now.

 >> Additionally, the associated test had an explicit host pkgconf enbled in
 >> its configuration. This is superfluous now that uboot properly depends
 >> on host-pkgconf, so drop that from the test.

 >> Note: it hapenned to work, because host-pkgconf, when explicitly enabled
 >> in the configuration, and without per-package directories, would build
 >> before uboot and thus be available. This would fail with PPD, though,
 >> and thus would break for TLPB.

 >> Reported-by: Peter Korsgaard <peter@korsgaard.com>
 >> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 >> Cc: Kory Maincent <kory.maincent@bootlin.com>

 > Committed, thanks.

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

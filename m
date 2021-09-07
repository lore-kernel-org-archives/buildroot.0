Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43DEC433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:37:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F82260232
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F82260232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D48F60BC5;
	Tue,  7 Sep 2021 06:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oKMrcg-nw7Af; Tue,  7 Sep 2021 06:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8BAA60BC2;
	Tue,  7 Sep 2021 06:37:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C54AA1BF2A5
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C22CF60BC2
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fG9A2IBHF8A0 for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 06:37:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2D8960BBD
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 06:37:53 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id mf2so17568076ejb.9
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 23:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=172MvYneP1gGOEU5QgQMkX9Lg4ORxqMzmKvQFdZhxQg=;
 b=ovOHO0qWlQiMMwsgVOZWR9uRapYyBW+UkO0cVF/H/I2dHxVUNvXoZ+9viXohNKRyHD
 17n+bz1p47BCKAANy2+OG/3gdHxKj3UZqhVt+CA9eigvr3MDcUpZWaCo6rGKyo3odZE+
 dp93oknzz07yhhlWHUUCEAPdHNtBd2X3ER0r/8DgnT4fSJ1iNuOng9fnXxCkS300jP/s
 tWJqROubvv9s6JlUyWXkwNueEoYS8t2ZE4lYfEgb28vV0Rb46sQ7wOEYjel3med2/WV2
 8dOCrjxQr75yMSxRQgnEsEg0G/yfb9HLqh02U5UGQY6dqqxQN0PCzTGiqXtyJVCAKWTC
 5AKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=172MvYneP1gGOEU5QgQMkX9Lg4ORxqMzmKvQFdZhxQg=;
 b=duuazXENyzY+1jCR+DJguykTFb/JWPy1xPlXKLia1ZTOHqDT0UsManJhwcrk9xdv0i
 kVyTP4k6KfASc0pBd7vGbSHptQpACodft16L/T/+0XEBFCO70kr5xMoDGGOTC9GsuMMn
 tr8J1qcI3eTXvWi+AZ7R2h2gErzwdDuy1KDTXnYSwk0vX4FVVI46aHXC8TM5ohSN24PD
 SVlVRLNiP+rnmSbEYeSUIAxbVE8JXq4lUpl+IIuqDIr6blcIkhH4sku5w743c7kb/Hkp
 p5ZVsnYy3CPZvQDZtS5R/7CX6EuEJKUm3GYVmy7Pgt4H6yos6fKRbjPG7JXMYGe98fV5
 hxjw==
X-Gm-Message-State: AOAM532z3wQCOw4YINdWwm6Xp8m5XGsvFZ1O+CuUImjygMcaCHxfYZMH
 0hTvTTiEmeiuCPOl9jagWawbMhO5XdY=
X-Google-Smtp-Source: ABdhPJyBalWSK/XUuS/30hG92LShiePOiPIAvhFyTAZmSOuTfF4LAs3Qr7Xti/ftvCJ7FRTtEXhfOQ==
X-Received: by 2002:a17:906:32cf:: with SMTP id
 k15mr17216383ejk.68.1630996672271; 
 Mon, 06 Sep 2021 23:37:52 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 d22sm4960501ejk.5.2021.09.06.23.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 23:37:51 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNUjv-0001Wi-6h; Tue, 07 Sep 2021 08:37:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210824195006.185258-1-fontaine.fabrice@gmail.com>
Date: Tue, 07 Sep 2021 08:37:51 +0200
In-Reply-To: <20210824195006.185258-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 24 Aug 2021 21:50:06 +0200")
Message-ID: <875yvchow0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: security bump to
 version 3.5.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-36976: libarchive 3.4.1 through 3.5.1 has a use-after-free
 > in copy_string (called from do_uncompress_block and process_block).

 > https://github.com/libarchive/libarchive/releases/tag/v3.5.2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4D7C54E67
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 14:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68BE14082C;
	Tue, 26 Mar 2024 14:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5eJVX0y2osVq; Tue, 26 Mar 2024 14:46:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A58F40819
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A58F40819;
	Tue, 26 Mar 2024 14:46:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 014251BF4E2
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 14:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2E5F414CD
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 14:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hm6tA3ZZa_hG for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 14:46:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com;
 envelope-from=bleemayer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8198B404CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8198B404CF
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8198B404CF
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 14:46:01 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-29fb7e52731so4047535a91.2
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 07:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711464360; x=1712069160;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LLJCxWZziZv7lbyq7ELSz+nFmSORYxudGK2vWv4S1HU=;
 b=j2wVn3TqsAp1ZyiBQFWrU2iLHrO3fYlry7S59jzvXu2WW81VUFzpS854dtQxvoTjB/
 vwwNlcHUr22pQLZnX4iFUgIbgEj8vNDitt9zP3UhQgWxuQV2Dtx325hG4/bF+7yn4ZAL
 yblwiaxlVDFqdZZPscjk0ahA3GI+G1aulvT2PgpPiSSZQNGs9nF23uIIMsX6qnT/QE2/
 dAeMWWq2tB73KDG5XKkeJQtWVRPZAyIGFJIu5KzfDqEGxyselbWcDjuF2jDGmd0lW43W
 PWiidXug1UJdiL07NJzc5bcEpQF6TNc4Q85op2OLbj0eQ/kfXiFqC4YsnNmUqpE+05uR
 D9xw==
X-Gm-Message-State: AOJu0YwamkOgYqSsV5w/Co0K/bHoOLXIIByki6ZTleLzXag1EGSQ/gfA
 vG0qJ05qRBaHWuMaeGC0vz3Nv6Ha2VNKsiJnW6eEUV5oJttlg/JvJ4S+CbpW/Rx7qUsiRO5DB4Z
 uiHMyhvxSAVfWZ0pFmKOs193kkAAQkR+u1f0=
X-Google-Smtp-Source: AGHT+IGsGDJm2BE+Fjjp8TF39ljMyCVgpozwyQT9LFSsoGTAO8jQNhBRjJMY7P1Ph35YH/hijq8VWmm9SRhn9TOFmA8=
X-Received: by 2002:a17:90a:72c9:b0:29f:cd7d:2371 with SMTP id
 l9-20020a17090a72c900b0029fcd7d2371mr8396621pjk.32.1711464360624; Tue, 26 Mar
 2024 07:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAB3eKoBtu8-9ch_k9k=-tHocLE8SjYanSotPOM1HOTUsU-eGOQ@mail.gmail.com>
In-Reply-To: <CAB3eKoBtu8-9ch_k9k=-tHocLE8SjYanSotPOM1HOTUsU-eGOQ@mail.gmail.com>
From: Brian Mayer <bleemayer@gmail.com>
Date: Tue, 26 Mar 2024 11:45:48 -0300
Message-ID: <CAB3eKoDnuOTufkdsMMA2CWnq4=Z=CbZKo+qY-ULPw_houqU_CQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711464360; x=1712069160; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LLJCxWZziZv7lbyq7ELSz+nFmSORYxudGK2vWv4S1HU=;
 b=Fs6xEwZibH0MgPAELeqXJ3o5unwEylCQ+mARPVskFZ+hbdLox26Sl4BhTXu8I7wbQx
 YfKjBkf4IDH51DaCKgCTJo2dZafv5pGWFV9sh6KCR9ckBR5BW1/kvNF6I/CupMKUIcQt
 kLyQDxuhQNrfe5q6bmcGXtRG2JBh8g1qlXdnpA71veHm6e4tTUdBb3U+ugIcwB/oO5un
 FbO+j4jITXg3VUzLe4l8qQmh9TchkIKB1hSxmIa73Iv7yM/MPoq9Oj/ZxASMZbmvezv3
 5LyQPnL1We8iTxwT0ONnCOPmq/Se6c/ArA/IwAd3YhDTKvwj3lZxfhX7SgwOIuw/bFKG
 9Dog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Fs6xEwZi
Subject: Re: [Buildroot] [PATCH v2] package/sbase: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sorry it went line wrapped again. Will try again soon.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

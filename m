Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330C8C4345F
	for <buildroot@archiver.kernel.org>; Fri, 26 Apr 2024 06:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D51C980EC9;
	Fri, 26 Apr 2024 06:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJNG6Qhk6rIK; Fri, 26 Apr 2024 06:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8ACD80EFA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8ACD80EFA;
	Fri, 26 Apr 2024 06:48:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 068BE1BF35B
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 06:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7748605F8
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 06:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCcuX7WHN3qf for <buildroot@lists.busybox.net>;
 Fri, 26 Apr 2024 06:48:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB58B6001B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB58B6001B
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB58B6001B
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 06:48:54 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51967f75763so2089262e87.2
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 23:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714114131; x=1714718931;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E96qQd87UMFCY+0u4procXEpCwNDSFLVfWkEmPadc2U=;
 b=Gxm2YkwnF913KqbANUVbhOK7oHefjNB7c1hJ8s8m0xAguQ2s4hOOooi30PxXjzRKC5
 yuIWN5hazA4dKd0VBQDmKciMrAYT9+Kh8LAsDYg7jv73nOHAj6J03fItIK+tDFNHpKlE
 00BCaBF+n+MVIwppjdGCZ2hnq7IsGoBvCOLEvwUofGgNTllPrFeher/62rb/T40clq0X
 vq8aCw02+al/AIuBGdzldwQDbIj8lYD3hDkyuPOP2CJ1JWNR/Aha61DiU7GJ1F73o9IE
 6s0eGoirCzaZWgzC+AnBZeHz1OSBwcGNyz3D6tkph2dT6Vtkc7tXHg6qHiyf0etxTm0R
 Vs/g==
X-Gm-Message-State: AOJu0YwxBJQraSunZ5+eSdmGtya/zbJsUoifYWpGtgkAHBbppN6pMT4V
 /plgbLqMRE4GV3neXBJaQi+ioFSIaVnXgKfH7gkmPIDDG3X4ijpiSNf7KVv878JJISFcQUrE110
 l+lxKNV5XbqwqiHn6urBGf9RbFWmsoDsY
X-Google-Smtp-Source: AGHT+IGgK/NBaOFSGB2ZXvDhO3iJbv4BWKGxdf0KwZxnW7RAumupx1uChBKCGYWgnS+usHmi72Bk6c87EX2VhwoX+2E=
X-Received: by 2002:a05:6512:1086:b0:51b:5c9f:992e with SMTP id
 j6-20020a056512108600b0051b5c9f992emr1292932lfg.14.1714114131345; Thu, 25 Apr
 2024 23:48:51 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 26 Apr 2024 08:48:39 +0200
Message-ID: <CAGm1_kvrSibxCqYCdcggwnbH_6nXuNsjSafDM08G0U-SG3AErw@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1714114131; x=1714718931; darn=buildroot.org; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=E96qQd87UMFCY+0u4procXEpCwNDSFLVfWkEmPadc2U=;
 b=g8Rl2pP9DWYsMhruud2ckKhMAqs38ySnIajq+jhUKlSPiHmSxMDQEVfLth1ifKlJny
 gohmCIaVrBn5DsMuCKR1WoP2UbMIVaBApjFlhXRgf/zbyg6nFlhjtaCGzpNUTb60OcZw
 Bzcqd2j/qZb5cKF5vDN3j6Q9YTWDgJwiSErN99h0m4N8DvhJEAk24iLMziiRGi3lxw1K
 AMt8r52sVAb0ZGTzmg5aBLG/6gXmpcbhUx1/AQZbjYz7U7Eln/rfiaA9BBpFiDIy3XpT
 KGDTOqRvC6l3xgYZMGTfoauydtq+fZIjZbW6fY1fbmeNpMyV7Hvjy8bABmJ08o26wDrU
 W+zA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g8Rl2pP9
Subject: [Buildroot] modem-manager: build failure with NLS and per-package
 directories
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As the following log [1] shows, the build process fails because ITS
files cannot be found:

[25/437] Merging translations for data/org.freedesktop.ModemManager1.policy
FAILED: data/org.freedesktop.ModemManager1.policy
/home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/bin/meson
--internal msgfmthelper
--msgfmt=/home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/bin/msgfmt
data/org.freedesktop.ModemManager1.policy.in
data/org.freedesktop.ModemManager1.policy xml
/home/autobuild/autobuild/instance-11/output-1/build/modem-manager-1.22.0/po
/home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/bin/msgfmt:
cannot locate ITS rules for
data/org.freedesktop.ModemManager1.policy.in

The package itself relies on TARGET_NLS_DEPENDENCIES.

Any idea what's going wrong?

Regards,
Yegor


[1] http://autobuild.buildroot.net/results/3b78fd52cc5a6bf9cb1a938c3a39ba14852c437f/build-end.log
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

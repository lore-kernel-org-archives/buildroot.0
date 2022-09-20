Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7996BC6FA82
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 18:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6726418E7;
	Tue, 20 Sep 2022 18:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6726418E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oSpNRyNTuSYk; Tue, 20 Sep 2022 18:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6831418CA;
	Tue, 20 Sep 2022 18:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6831418CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDCD01BF2C6
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 18:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6CBC60F71
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 18:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6CBC60F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id weZZz_vNFLHP for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 18:37:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A061260F2F
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A061260F2F
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 18:37:12 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t7so5827847wrm.10
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 11:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
 bh=hJyKr0JgP+KJDZLqJl5jV7FYDe6e3dShbq+u9gcLkDU=;
 b=6LDAsfxFXCZi1kQSXW5tma9gm8NIPDKF3sRb/onbow+k+WglcLaSDpBrJxZF8Sl294
 7GW208QRkYzw0WHjFSAn77S6VPGdVd4V8jafpVCcJX0UYr8C5vZ00aTjHWJd+XW9SOrn
 Na8FWqybAMYXwpNfz6hBnoG6SAOc0uEjOLmw1dnEdlCWhJ90uBMh9cOcj+mLMcINvX2v
 7Eibwekkrj1NbTadv9VyxJdDzfb/qLNS+MESIl1+Y63Jf2UvV5KFAGFzVP1mqTub8/pq
 37lrXAKHwAanY8gNLTD9bYu86d+ZN/E/b9DpglK0NbvlJfl/rLawMAre/l2macTMOlQN
 CwGQ==
X-Gm-Message-State: ACrzQf1CcTdXMNPQr4w6oMohrxbzY1DbLZhTSqMKAdga8aEM2TtrfyBG
 aG8rBpCrULH1vQEhh6aAL+mrlpN1MBQ=
X-Google-Smtp-Source: AMsMyM6xZzhqI7EMNV1tQ7uQWmXtoV/dxd4FGRZYAtfBKsr4ITsnrrmTYfSl2ft3jk1O/a4COqmvrg==
X-Received: by 2002:a05:6000:178e:b0:22b:451:9f63 with SMTP id
 e14-20020a056000178e00b0022b04519f63mr5961806wrg.521.1663699030781; 
 Tue, 20 Sep 2022 11:37:10 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:b795:8a2b:1e98:bedc])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a5d56d2000000b0022878c0cc5esm481113wrw.69.2022.09.20.11.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 11:37:10 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 20:37:09 +0200
Message-Id: <cover.1663699017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date;
 bh=hJyKr0JgP+KJDZLqJl5jV7FYDe6e3dShbq+u9gcLkDU=;
 b=LI9lRNWC0sC9NIf78znDzoB7Gul88ehNRbBmyS7gj+9bJFkps+5Q0i9m8M1zmfC3Q0
 WByVf3eOfumHdslo85m/2cXVYagDE0LZ2Hy5pJS7qN5FRc0Pt3rNMNQ2dashmcohKe1Q
 rqsCIxCUqTHwQ9XZIIxCCUCoLyqJNN/R1lHsDIW5C6w+yNg4ismu8R2AKUVmVyP+iNV2
 Y+EYl9Ngjd+LBHbOX9Ia0vyuHOO6oefIuy18byB9x17zadv3hw5Iqugp4WBxV8UX4LLq
 zr2RDnphhA2rCXY+oVRFXwV790VYSd+gzUB4c6mLzfTaPqKM/6URVANrUfpO9Pw8+q3h
 jo4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LI9lRNWC
Subject: [Buildroot] [PATCH 0/2] dracut: extend support and tests (branch
 yem/dracut)
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
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>,
 Adam Duskett <aduskett@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

Follow-up to the dracut addition, this two-patch series adds support for
providing extra dracut modules, and extends the cpio+dracut runtime test
accordingly.

Regards,
Yann E. MORIN.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      fs/cpio: allow users to provide their own dracut modules
      support/tests/cpio: extend runtime tests for extra dract modules

 fs/cpio/Config.in                                            |  5 +++++
 fs/cpio/cpio.mk                                              | 12 +++++++++++-
 support/testing/tests/fs/test_cpio.py                        |  5 ++++-
 .../tests/fs/test_cpio/modules/99cramfs/module-setup.sh      | 11 +++++++++++
 4 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100755 support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

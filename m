Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76488C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:51:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3C360F6E
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A3C360F6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11B7283E96;
	Tue, 21 Sep 2021 20:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ygIEL2xqlnrU; Tue, 21 Sep 2021 20:51:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64D7683E7A;
	Tue, 21 Sep 2021 20:51:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 447B91BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40A3240311
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OmUYwDEiZiTH for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:51:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D98AD402FC
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:51:19 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id h17so1312942edj.6
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UXQef6nBCjp/pW7EFwXHntgTiojCVByqd+I7jTB9n2A=;
 b=EqOt3GfsroIEDJxQNuUZXa0B8BV7r6INF0Tw2uNfKBtTEh58U7/JAxcslWYDY6oEeQ
 qbV7IKpGAG3gsOIE5gTMBTPuJ2LmKipyfD4Z31yn8uCi4A2k+YucnSzImOqZ0mNce1dh
 yu3hyk0U/9h1y9EfyspCzEeKknAjej9GpYF/yJG0uwTbSlwZ8EHotnqIoAmCyKMGzBQF
 UWxnRPAeDGJRdPYF9v1iWl5X1SdNnrNUaDW4Ior0+YiMK7zXVOKLniJgLjNLzL2eSvS1
 ZNRPXdaV13BArKRFwyzuBV1oOk5p1/l/dHFNurUwwfITIPbCVwaPh+M1zexFP+PbFefR
 cVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UXQef6nBCjp/pW7EFwXHntgTiojCVByqd+I7jTB9n2A=;
 b=sou3UKJTSr1nNiIAqwhTG9IB2i+KrkbXNJV8Q9H1OB0XRvNjfwrFzf2NfGxlubDiXz
 ZpTmhYAJE8H9pjGndWQVy/QnrkEixGnSFov9zSOi++s8lAluhv3W6SLga7SLNzDDT6Zf
 uoRbt6iD/mEc5riT2tpjB/pKvzT7CfnYEzyBRdqlj0ekogz32YAk/XuhU+l7G6aHNW8E
 E2IylsBoCebn8HhcuM/NDERU32vrglfLfR8ea99Q4tFIgwM3Nt8Wkthxm16e49otd5vJ
 EXwloPklHHpV1zkFhi4wnf1RdJYi9Hpy86BqqPFNnqcw99PoBnzO01OrrnWkncZrYC2v
 IM/g==
X-Gm-Message-State: AOAM530eFy/VUqP/cu2xdYtUnCfWGpqhp4fWTOEtNk+cyh6s9m8Xu6hW
 1Nm6cofirJcf7jeU5e+lvftL5jt/dTU=
X-Google-Smtp-Source: ABdhPJwrcUg0dn2zoJJ2EC/2GOhvA/3+jTO4JQmimC3cT02o8Kk4JNWyMsIa0N73FUodw4ICXvU52Q==
X-Received: by 2002:a05:6402:5206:: with SMTP id
 s6mr38146343edd.135.1632257478062; 
 Tue, 21 Sep 2021 13:51:18 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id f18sm15093edt.60.2021.09.21.13.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 13:51:17 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:51:10 +0200
Message-Id: <20210921205112.39176-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH 0/2] use `command -v' instead of `which'
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi,

I've tested the patchset on dash as the default shell. But it certainly
deserve more people to have look and test.

NOTE: If accepted, we might want to use `command -v' also in scripts:

$ git grep '$(which'
package/fakedate/fakedate:for date in $(which -a date |tac); do
package/transmission/S92transmission:DAEMON=$(which $NAME)

Kind regards,
Petr

Petr Vorel (2):
  make: support: use `command -v' instead of `which'
  support/dependencies: don't check for `which'

 Makefile                                      | 22 +++++++++----------
 package/Makefile.in                           |  8 +++----
 support/dependencies/check-host-bison-flex.mk |  4 ++--
 support/dependencies/check-host-cmake.sh      |  2 +-
 support/dependencies/check-host-gzip.sh       |  2 +-
 support/dependencies/check-host-lzip.sh       |  4 ++--
 support/dependencies/check-host-python3.sh    |  2 +-
 support/dependencies/check-host-tar.sh        |  4 ++--
 support/dependencies/check-host-xzcat.sh      |  4 ++--
 support/dependencies/dependencies.sh          | 18 +++++++--------
 .../pkg-toolchain-external.mk                 |  2 +-
 11 files changed, 35 insertions(+), 37 deletions(-)

-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

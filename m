Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD6DC7EE24
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 11:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4567461186;
	Tue,  9 May 2023 11:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4567461186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FlV4b6OSrHqZ; Tue,  9 May 2023 11:48:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04E1860E47;
	Tue,  9 May 2023 11:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04E1860E47
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F3901BF29A
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 11:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28A27843A9
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 11:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28A27843A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DR69496_4HN1 for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 11:48:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CE4E84336
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CE4E84336
 for <buildroot@buildroot.org>; Tue,  9 May 2023 11:48:07 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f1950f5676so57618695e9.3
 for <buildroot@buildroot.org>; Tue, 09 May 2023 04:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683632885; x=1686224885;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v+hODj87jB1D7l7v5yEM5NjTjdl2IP4CTtstRLLjsOQ=;
 b=AOzk1yq8o0mPGXhNTWycw66O3kZJ57hWsdms3bphtz+db9TdTycFZxG8JldH65ibNX
 0NkUJD1zTX5hCC0QdvBz4u5/pNdNzYCGGXJyMBfvTyPiyfVZi5+WkdlFz5wozk/yF+0b
 iyAoZbm/f5sKB4HlTCkcbddBsiOrRBAAvqPQdhbzhzJPrWcRQ02Sebt4GyW2uT0Tujm0
 XVrC8Sem0l6pmWC6X61bX0Mw+RBjhpeYYAg7xbKeepJITg+bWAT/V12ydXY9UB41rebN
 kxz1X+z9tU9Lu3hiRSfPqj6MvJztoiDwI4R44X0Pdut+F0hV2cqcG+fNYOAuv/PCOETF
 tQfg==
X-Gm-Message-State: AC+VfDxg1cP8zYUQ9UVhsT11heXPw0aGcA0OsRvdeiNrE1p4ozn7R97y
 Pl07OPmffma9DMvQqmUTgBL9KnVofDE08V/+PzoDZnxq/9T9uA==
X-Google-Smtp-Source: ACHHUZ794k3Pa5aE9qJ36ER4ZWTM4N4m0x5OQqxkgBC9dNxKhOBEGEqq8+0RjqA3p8cwAj6ABVu/TVbZEeEblK8sSjw=
X-Received: by 2002:adf:f548:0:b0:306:2de6:6f9b with SMTP id
 j8-20020adff548000000b003062de66f9bmr8808393wrp.58.1683632884903; Tue, 09 May
 2023 04:48:04 -0700 (PDT)
MIME-Version: 1.0
From: Naveen Mamindlapalli <naveen.mamindlapalli@gmail.com>
Date: Tue, 9 May 2023 17:17:53 +0530
Message-ID: <CAOcd1mo0dRncibAFbShjgkPGOhPab_wd1n=b76r_tmEe=zEoCg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683632885; x=1686224885;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=v+hODj87jB1D7l7v5yEM5NjTjdl2IP4CTtstRLLjsOQ=;
 b=AfHsBqlQTm27piJgGR8gC0YIxwcsiZMDgaAtesJ9gI/o/FsGW8R1bzNs/gGU/DWxAZ
 HwAcuRv++L+LHdre2JdkfNv7MayA7FAUUmyELjCLL1mSwSjlDZkrkD7IkBo1vHrIgVdk
 ByoneePuYMvUf3Zqo5XVqGoMiPx7IZ1w2bLRRBocha108f5OZcdPugf22W17JE8WTSrh
 rnO1xhMWTjVc9RnicHKZolDk+XTpbItMap5Jju/WgH7+rNSEfnsYdIregAk+1jEkdBXE
 aQvhnF3NWcjDcEnaTXRNrF1m5o1Angem9LW5xbfZRp0898/HMss1cjgBAzyG+co0zUGj
 0FCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=AfHsBqlQ
Subject: [Buildroot] Bpftrace support in buildroot
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

Hi All,

I am looking for bpftrace support in buildroot. I googled and found
patches submitted by qais.yousef@arm.com to add bpftrace package but I
couldn't find bpftrace in buildroot current code (main branch).

Can anybody please clarify whether the patches got accepted and merged
to buildroot?

Thanks,
Naveen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

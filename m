Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599FBC433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 21:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4FB860D6E;
	Sat, 15 Oct 2022 21:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4FB860D6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHCT2Pm_eECi; Sat, 15 Oct 2022 21:23:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5A9760BAC;
	Sat, 15 Oct 2022 21:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5A9760BAC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D2CF1BF368
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 21:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25AA060BAC
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 21:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25AA060BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2rMyIyOqZ2w for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 21:23:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF29560B77
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF29560B77
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 21:23:12 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id bp11so12696678wrb.9
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 14:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=keoGaC46gEQ5re2FkoEgyRmJWQtXkQlLcYp0+MLW/wk=;
 b=i7mE5Rjc0Gq/vCGWlM585xFkGsHydziqwCKIJtX5oomI9DuaUCwRefAXGm5zLv71UR
 sJtkATUN0b4sLOKo45eiKkAzcWBJ2tQYR3XYUv561fu4tQrENqc4RAfYROrgEladZZzr
 dO2WNqZ51pb8aQ3SQOr0VaW/Y90YsW6SM8LrIqgu56D+bU7btGjnZjzWxTsErJ2hwJru
 rCE762Q/8gh1nWPb/NzHYDSQanPA8e9/i6wRqjWs0YKNrjOtcy93zWWm5L+eNKai9kYd
 Udr/6XgnJi9fOVjOzf3nvflNIyLxXEBXM2haWVgcnlwOsa70NEUvHXg0OOXbvCWjzyO1
 Pqvw==
X-Gm-Message-State: ACrzQf0TBvKgNrXyz8SLxoDtO54EIhv3gmz9bihPK4o9OJwCrYGGftdQ
 KVU7ITpWzgSlmi0C8YK8iSiteQowcSM=
X-Google-Smtp-Source: AMsMyM5B2stZzAkQAlDmydQvJUlU9a1aDcNEVSJBd8hQPl6+wTp46JFADX5eFdrsOZIhVIQ8Pu40qQ==
X-Received: by 2002:adf:e547:0:b0:22e:3c6a:bb0c with SMTP id
 z7-20020adfe547000000b0022e3c6abb0cmr2320722wrm.382.1665868990999; 
 Sat, 15 Oct 2022 14:23:10 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:a23d:25f5:317d:1e3])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c35d200b003b3307fb98fsm2073550wmq.24.2022.10.15.14.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 14:23:10 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 23:23:09 +0200
Message-Id: <cover.1665868987.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=keoGaC46gEQ5re2FkoEgyRmJWQtXkQlLcYp0+MLW/wk=;
 b=Gcy+iX6hESRC4P9QrFepGvn7cf5xlLgprRT1qBXpPn3FsCXo+m2OlcZ+5mzfKSQWjJ
 AK2jHcaj3KuBA+ZVAO9TiHBMZonR7QLtrxIQxO6GY4AGs/0flLnZcpkHPTOsyqX8RNue
 NZ7paoioLxq3ioU77lD/hqBHfckD0+izZnN5rWpp17U+O0aqL6cOcSsXwIUNz6D0OuON
 mrgcnrFcR8Ws53ELbLNEsJzxSQIvwKW+I6ZbZB+/iXKJV8mMCpNJtC2UUGk1W2i/d1f9
 BsU8YJRRhVbWhdcWFxY4iIRKitF9ws0Gxr+dOAFpNB0R1Z18GFPMC+Ku5WSLlxRTgrVO
 Wexw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Gcy+iX6h
Subject: [Buildroot] [PATCH 0/4] systemd: sort out the conflict between var
 factory and tmpfiles (branch systemdify-var)
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
Cc: =?UTF-8?q?Je=CC=81re=CC=81my=20Rosen?= <jeremy.rosen@smile.fr>,
 "Yann E . MORIN" <yann.morin@orange.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This small four-patch series touches on the delicate intricacies of the
systemd package and how we integrate it in Buildroot, especially with
regard to read-only filesystems.

The underlying issue is that systemd wants a writable /var filesystem
(it will store a bunch of things at runtime in there). A lot of packages
also expect a writable /var. After all, var stands for variadic, so it
is not supposed to be set in stone and read-only.

The solution we implemented in Buildroot is to generate a factory for
/var, and register that as tmpfiles, at build time, and mount a tmpfs on
the then-empty /var at runtime, so that systemd-tmpfiles populates /var
on boot. Having a tmpfs means /var is repopulated from a clean state at
each boot, and people who want a persistent /var have to provide their
own mechanism to mount their actual filesystem instead.

However, for some people, this does not seem to work as expected, so we
introduced a call to systemd-tmpfiles at build time, to pre-populate the
rootfs from all the tmpfiles, of which our var factory, at build time.

These two mechanism clash with each others, and are mostly incompatible,
and causes files to be duplicated.

To solve the issue, this series introduces new options, so the user can
elect to use either, none, or both mechanisms, as they see fit.

The first steps are borrowed from Yann@work, where we make it easier to
change the location where /var is nounted from, by making it a systemd
mount unit, rather than use the legacy fstab, and move the factory to
/usr/share as it is a system factory (/etc is for the administartor to
provide overrides). Note that those two are not strictly required for
the following, but since that makes it easier to change the /var
filesystem in a systemd-compliant manner, they are a nice addition to
the series.

Then we move together the two mechanisms under the auspices of a common
package, to make it easier to later make them conditional.

Finally, we introduce those two new options, that drive each mechanism.

Eventally, we want to highlight that, by default, the behaviour has not
changed, since the two new options default to y, so as to explicitly
keep the behaviour from nefore this patchset.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (4):
      package/skeleton-systemd: move /var factory out of /etc
      package/skeleton-systemd: systemd-ify mounting /var tmpfs with ro rootfs
      package/skeleton-systemd: host the tmpfiles preparation script
      system: add options for var factory and tmpfiles pre-seed

 .../fakeroot_tmpfiles.sh                           |  0
 .../skeleton-init-systemd/skeleton-init-systemd.mk | 18 +++++++---
 package/skeleton-init-systemd/var.mount            | 18 ++++++++++
 package/systemd/systemd.mk                         |  6 ----
 system/Config.in                                   | 38 +++++++++++++++++++++-
 5 files changed, 69 insertions(+), 11 deletions(-)
 rename package/{systemd => skeleton-init-systemd}/fakeroot_tmpfiles.sh (100%)
 create mode 100644 package/skeleton-init-systemd/var.mount

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

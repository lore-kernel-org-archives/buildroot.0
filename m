Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EADC43217
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 14:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9033D41BDC;
	Thu, 20 Oct 2022 14:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9033D41BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pt2c2Tgto8Dp; Thu, 20 Oct 2022 14:14:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A5D241A17;
	Thu, 20 Oct 2022 14:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A5D241A17
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3B021BF312
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 14:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FCD2841FF
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 14:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FCD2841FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aiD2Y-euJuhe for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 14:14:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 660EF8434A
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 660EF8434A
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 14:14:39 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id i21so23644933ljh.12
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 07:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J/ECSHES7G1ii9v4LYFHbhuTcJRgv/q6iTUegg/6QvI=;
 b=HbsArYedopzkPmbDcPdZI3W1dWoKq/ERj8MDXt0sWMbCmFTA42nckanYrqvlcQA1on
 J2SZ3z3DgHTdkcRUjrn5esXwrP2rOYv6oivDDs42MzVxSBIwL6BhRPyp1fzl9t/YgNlP
 KL4l8D5YDlg7GGAUR0Ng3mZuZGuXPwE2QUM0GucYWdoqBU9w4fV1/E2M4xPNB8oeOsYT
 yAzXbQWPZAjJsW4QumEb5PUJMFc9Z9np3G3CmbnrkiLXYeW/BstUSIQbgCAFY/7y/FuY
 HryOqvMh8hxh1X621esY2yZ3gmCrRNRvLEkOTL4pEWDVpCLdDp+7Vh6r4KaH+/7ngeVv
 m/dA==
X-Gm-Message-State: ACrzQf1BJEaBRYI9l0xKEmbzvsn3MjkpIv1foCgLHolR+8hnGFYYGCv+
 oTcGbLtpLP+VUmUhxVrmhq7LyIiI6UHD1Q==
X-Google-Smtp-Source: AMsMyM4SD9izfcWvqOliniRS3vJVfGDQdI3jKjX4PB2SAeLfwlkzzkBzTEr31/9VgqRVunqMoR5IIA==
X-Received: by 2002:a05:651c:114:b0:26f:a696:5a40 with SMTP id
 a20-20020a05651c011400b0026fa6965a40mr5242636ljb.350.1666275276851; 
 Thu, 20 Oct 2022 07:14:36 -0700 (PDT)
Received: from wkz-x13.addiva.ad (a120.broadband3.quicknet.se. [46.17.184.120])
 by smtp.gmail.com with ESMTPSA id
 a3-20020ac25e63000000b0048b969ac5cdsm2739975lfr.5.2022.10.20.07.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 07:14:36 -0700 (PDT)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 16:14:08 +0200
Message-Id: <20221020141412.346992-1-tobias@waldekranz.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J/ECSHES7G1ii9v4LYFHbhuTcJRgv/q6iTUegg/6QvI=;
 b=nKpv1SDkvXswyc8v9S8GbUKQeLf4BdCjHtRC8+eDagJJ80gTyKZLxTCukXObZI92Vv
 ivTnXNRmbFLHpYTbGnixV+xwx5zYBUkGekPaLXi4/YQ75wvuOflic3ceLwe0M6NyiTzF
 xXQKFqDRebS3IqGzCq5LLnYS5OAzqnZilHAdAMg1GrofauxG+8M1TY5cJHo2ZBJcrvMF
 xQcUK/bIP4/hCkyd6Cj1nT5AE82oOnS1RQbpTqAGRyDHx3h/hj3BbPN7StlGqO6W8vmh
 gnKTgHlyItcmTlmxM93hWXwhDV0n5fsJ+0YosgiJQzgiOhJSzPyLKjbSdrdwVCThcoWZ
 eGQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=nKpv1SDk
Subject: [Buildroot] [PATCH 0/4] package/kmemd: new package
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

kmemd implements a GDB stub that let's you access a running kernel's
memory. There's no way to control the flow of execution in any way,
but you can inspect internal data structures with all the DWARF
parsing and scripting power of GDB - without the need for any hardware
debugger or a dedicated KGDB serial port.

I've chosen not to install any startup scripts for it, since it
effectively provides the same service as Heartbleed, but with a much
better UX :) The expectation is that the user will start it manually
when needed.

Before adding kmemd, 1-3/4 fixes some issues around libbpf. The
cross-compilation fix for 32-bit targets (1/4) has been accepted
upstream[1].

[1]: https://github.com/libbpf/libbpf/commit/68e6f83f223ebf3fbf0d94c0f4592e5e6773f0c1

Tobias Waldekranz (4):
  package/libbpf: fix cross compilation for 32-bit targets
  package/libbpf: remove architecture restrictions
  package/libbpf: extract dependencies to separate kconfig symbol
  package/kmemd: new package

 package/Config.in                             |  1 +
 package/kmemd/Config.in                       | 11 ++++++
 package/kmemd/kmemd.hash                      |  5 +++
 package/kmemd/kmemd.mk                        | 20 ++++++++++
 ...cross-compilation-for-32-bit-targets.patch | 37 +++++++++++++++++++
 package/libbpf/Config.in                      | 24 ++++--------
 6 files changed, 81 insertions(+), 17 deletions(-)
 create mode 100644 package/kmemd/Config.in
 create mode 100644 package/kmemd/kmemd.hash
 create mode 100644 package/kmemd/kmemd.mk
 create mode 100644 package/libbpf/1.0.1/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

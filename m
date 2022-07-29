Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046B9C00140
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 00:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F2AC826AA;
	Fri, 29 Jul 2022 00:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F2AC826AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIrRC1R1bFxO; Fri, 29 Jul 2022 00:09:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DF7E82437;
	Fri, 29 Jul 2022 00:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DF7E82437
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73B711BF397
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 460894179F
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 460894179F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kyfNtVbyOS2Y for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 00:09:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFA5A4179E
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFA5A4179E
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 00:09:20 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id z19so3176273plb.1
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 17:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=P0lIc2ruDQ90KEBC4NT+9kRqJVcCmC4saus2pzE2+B0=;
 b=s0RvlvN441S8U+NntZKh4WByLh01YMbaQK8rV/34bCBMGaNTDg6fxxE/xGIJvwKs2m
 fqgHcYqBWQdGgKXEUqvkfQB0lLrQvOGuf8Ix1hahml7V2uQA8TyrsAGFo2VRT4DpYSoT
 r1cjRR/Ey7OXxfXI78Gp86lUT+IF5XocUrjYog3psBU8FipYCeWN0uuNau+eueKQKJHJ
 NLN5QNBo8O2zHMhAfLSLnPkTctGgOrcKEKJxPL9TXkt5RenDcEhjlTcRgT1UuEGNwX7k
 4zdieM2/1KaTD+g5O4qUNQs253ggybeYkYfUo/1XLjDVcKovbBmhqEhL5GMWw9gQrqyD
 AcOg==
X-Gm-Message-State: ACgBeo0c7QfT27vvcpGy0dcuadAwiJBhmwYvPmgRihzw2+wXNcg0rAIJ
 1WKbk8F7ZO7Rrm7eiBFPIlbb9OiJ1Ss=
X-Google-Smtp-Source: AA6agR4VLen5+kMcqSX303s6K4LTaklQiTjb+F/6NwKHXUon7ykl1nyjrdRr2YIdVUOZUcGiQV4XHw==
X-Received: by 2002:a17:902:f792:b0:168:e97b:3c05 with SMTP id
 q18-20020a170902f79200b00168e97b3c05mr1216823pln.94.1659053359535; 
 Thu, 28 Jul 2022 17:09:19 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 z25-20020aa79f99000000b005292729cc5csm1332275pfr.160.2022.07.28.17.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 17:09:18 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Jul 2022 09:38:55 +0930
Message-Id: <20220729000904.1295295-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P0lIc2ruDQ90KEBC4NT+9kRqJVcCmC4saus2pzE2+B0=;
 b=Ng1VE7tGE/f+AyYDFWPbxtZXglhu6b82TcTb8CbB68hgNS6g0KRu8oUKYV59gn2UvV
 Xl4F+N5IaPYjwKPdeEln7kQifhLEwbpvCu+3d8Jbbw0uZkUH/EwerqBHRFl9JXfj+jXj
 IrdlvKR8zqDvQQ6yOgaQRH+FZL21FcWXTWo/ZDYSt8LWG6+RkHeFsChqLG8AADtUXVs/
 6MSNt1NaeE3COwMknuZjuAgkAmW1FgNYRAOjiik057ix+dJx1jnjjiAmvQDWJKN8aq6b
 a0HM3UPaSDCWH4yg31jky+UN7ed7Cc9jIJvriUKrTHwezgYK+uCK/nP+vUV1rFWDxfrA
 0rCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ng1VE7tG
Subject: [Buildroot] [PATCH 0/9] powerpc: Fix ppc64le configurations
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The autobuilder has detected a bunch of powerpc build failures in recent
months, leading to workarounds applied to various packages. Many of these
failures were caused by invalid GCC configurations: building GCC in
little endian or 64-bit mode for CPUs that don't support that
configuration.

The first few patches clarify the menuconfig options for powerpc.

The third patch "arch/powerpc: Enable powerpc64le only on CPUs that
support it" should stop a user from selecting a ppc64le config for a CPU
that doesn't support it. The list of supported configurations can be
cross referenced from the kernel Kconfig:

 https://elixir.bootlin.com/linux/v5.18/source/arch/powerpc/platforms/Kconfig.cputype#L157

Patches 4-5 add new Power server CPUs from IBM.

The final three patches remove workarounds applied for power8, which
are unnecessary now. This should enable packages to be built with
optimisations for p9/p10 where applicable.

I've boot tested all of the in-tree configs, and tested the p9 and p10
cpu types.

Joel Stanley (9):
  arch/powerpc: Hide SPE ABI behind CPU type
  arch/powerpc: Clarify generic CPUs
  arch/powerpc: Enable powerpc64le only on CPUs that support it
  package/glibc: Use powerpc64le instead of power8
  arch/powerpc: Add Power9 CPU type
  arch/powerpc: Add Power10 CPU type
  package/mesa3d: Remove force disable of power8
  package/zlib-ng: Revert Power8 special casing
  package/openblas: Add Power9 and Power10 targets

 arch/Config.in.powerpc     | 40 +++++++++++++++++++++++++++++++-------
 package/glibc/Config.in    |  2 +-
 package/mesa3d/mesa3d.mk   |  3 +--
 package/openblas/Config.in |  2 ++
 package/zlib-ng/zlib-ng.mk |  6 ------
 5 files changed, 37 insertions(+), 16 deletions(-)

-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

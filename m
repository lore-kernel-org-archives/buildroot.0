Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDB8CAC597
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 07:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70CB683F39;
	Sat, 20 Sep 2025 07:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtC0MltHJA15; Sat, 20 Sep 2025 07:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A8D283F5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A8D283F5D;
	Sat, 20 Sep 2025 07:47:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 49838E7
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 07:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46F004132A
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 07:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzLICe8dh3lh for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 07:47:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E89341489
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E89341489
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E89341489
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 07:47:18 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-32e1c8223d3so2350060a91.0
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 00:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758354437; x=1758959237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wfDTfF7DgEN1/+nY217nJ3xOq+/vNfCQhgcaUi+1mos=;
 b=Xz9L+h8ux5BDpUZdFBmyoJA6YRDXgNdV320of1pgZe0CPkcaK7KXRX2t8VpTncSYar
 /JIgAauNXNCgZWMgOwqKV1GXQU7gexsfbLDllwy/iNiBQTFTi/iw4demCVS1ijE46i9R
 cUYb+3AqbCCkcEfwutZEV4l3kWVYvFRYVLsKp2rEp9/8luha4PA2L4uHuZbX5CHbpxqS
 rMdsTrhHdiWytgVrsm5FzghRm/bazXbaIqE5Kg8QirPHNVCktcMRyCAK9r8tdbn9caGm
 ZWN0FQLZijdO6UkXSrQbas1gwf0ieIDDbfobt9WuhVRdicqttMKLZ1y79QYXx2WwAl1v
 gDMg==
X-Gm-Message-State: AOJu0Yzr5b7xgqi3KYSotJVwQ5L7oy9Ah4eP+El+5Cc1VxCb9uaz3Zd/
 p8ODHJ6LhtvK/l71q7U/n4fw/tSD8vhRFnefMTNmVam11EorqTTpOAnGP2uqnA==
X-Gm-Gg: ASbGnct7VZvbHZuv8QTv1PvoVdJgsUj1kEp/rO0seS7wyC7SYpogi1eqbl38gh8AJae
 2QGJ04IN7/WEPIDNap93ZStKzWDDCZicxAeUv4+7Zkr2UHii9JjZ43wJ8vUP54lhfHC8mt35EwG
 n2n/U3Efl9kLHSJuBGaJJl4aiUtcTId8JczCqGUFmHhdKJY55d1ajlulY7cIGEaoqTqp5etptf8
 kNcA2Tg4HuKyRMDd3I1Gac9SBn1JY9VpNcVYU4cWfGIbjocAeU4Qa5SYFkXi7jApp8piBnsbt4d
 bjiIWPgxd2frfbHmCJDSBgpHSiD5YIsHOPJpMUK8m5CNNDESdkHlauMB3rjYKnDsigka4ZTGOit
 A5tb591zgIZPvxpBSpp85zSDB1TRRGnMA
X-Google-Smtp-Source: AGHT+IHGuCsrB6wRWSHJe8D+4FciYD2ukb+OslLygIW3PmgHgjE1u9DdDQL3Rdatye/ZheWwPv3irw==
X-Received: by 2002:a17:90b:28cc:b0:32d:e75a:5009 with SMTP id
 98e67ed59e1d1-33097fcea0cmr5820921a91.1.1758354436634; 
 Sat, 20 Sep 2025 00:47:16 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b551b31ebb2sm3634131a12.6.2025.09.20.00.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 00:47:15 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 7EF67420A80B; Sat, 20 Sep 2025 14:47:13 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Cc: Peter Seiderer <ps.report@gmx.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Date: Sat, 20 Sep 2025 14:47:08 +0700
Message-ID: <20250920074707.584930-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=750; i=bagasdotme@gmail.com;
 h=from:subject; bh=uSFYWmcRBeyf2pQULr4y5AP1WewvnTU9ZkMGj1MxdPM=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhoxz0b8rYws5/tk5ZMrHzvW6++ndn8Ds5kPfH0tPXsCXF
 s85629zRykLgxgXg6yYIkv0Wtldxrx7L5nFJBTBzGFlAhnCwMUpABOROs3wV1wlVe3n3wrF2OmL
 nmt/4uwT2lJ4mjXv+fzUxpveXR0aHQz/1PbcZQ6//XNz4I19bmxl+ptKZ7tzb1+x2CJ969ErbOq
 BjAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758354437; x=1758959237; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wfDTfF7DgEN1/+nY217nJ3xOq+/vNfCQhgcaUi+1mos=;
 b=ZqXocFNtCO5nCMDXzBGWVgwJnkgPTbX56u82QH3SvluUX87mbP41nyV/XE5zBQ8TG1
 OjHCeamFFl6K0P4ueHim0hi4+q+0oGNHqc5lyLTpqs8PscLAglM01Lw39tCsXemo7UA3
 bsWFha7GZEcmd6ftlaXJZK46A6ufHCcuWABiS47nK98bbmsATux4alrO54aCBXStXzyE
 5EIu8CxSYwX1XVHzcwiy4rdlpXmd0onwMFyBUSRuJbdHzfLSkCsQCtnKo+a9VQJJWpnZ
 +g2salwrwJ3tQ19stQqkYPTYr65s1GMMVkbyCdZYhLpOFHyMkYmF5FtvP71rm+UyusE+
 vthQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZqXocFNt
Subject: [Buildroot] [PATCH 0/2] Fix undefined reference errors on SDK
 tarball build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Hi,

Here are fixes for undefined reference errors when building buildroot SDK
tarball on Arch Linux host [1].

Tested toolchain configuration:

  * target gcc 15.2.0
  * target binutils 2.44
  * host gdb 16.3
  * custom kernel headers 6.12 (from kernel.org mainline release [2])

Enjoy!

[1]: https://lore.kernel.org/buildroot/aMjHPLJ5qHp_TTju@archie.me/
[2]: https://www.kernel.org/pub/linux/kernel/v6.x/linux-6.12.tar.xz

Bagas Sanjaya (2):
  package/readline: Fix sdk rootfs tarball generation
  package/ncurses: Also build termlib

 package/ncurses/ncurses.mk   | 4 +++-
 package/readline/readline.mk | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53E2C433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 20:43:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25B11610E5
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 20:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25B11610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0A714059E;
	Fri,  8 Oct 2021 20:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nQbCO4CrL9qN; Fri,  8 Oct 2021 20:43:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 228B4404F1;
	Fri,  8 Oct 2021 20:43:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D62A31BF337
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 20:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF2CB83E69
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 20:43:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHtHph6aUaIZ for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 20:43:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9EC683DBB
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 20:43:47 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id s11so4185563pgr.11
 for <buildroot@buildroot.org>; Fri, 08 Oct 2021 13:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n2bDCNGOWf/lTs42OH3dBGOxF009y6xH+bwRjaYAlAQ=;
 b=i9hYQq0RC8M6D55t+Sl+ccXrpND64uxs1qwwMMrHHi0eYtzDGCth8EGUG1kyopyzRZ
 4r8UC2aI0ynmmm6gTuKt6r/8DNhPu5jw9GJlxLeNnim17WixZ/8EG16IDCeU69KT8mrO
 iH8QF2e3PNjXmNpEXDctJbMHAsiYYd5oVB6UI2zUBGYkoj0/issatO1F3SRAmAt2/u20
 trVi3FWP/JHncqEM6qaEMhyQ1ZhRXDmM6bjhebzBcbse9VHi1B/ZKAmbZqiy8CwbCfW3
 MOoDRIqwH2mOiPWQ34SqS+MYDxxDk68kzIR/ojP6yo1DQQP5g6FRqvru0iJVP4y1Acc+
 4PEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n2bDCNGOWf/lTs42OH3dBGOxF009y6xH+bwRjaYAlAQ=;
 b=awTo6+/znB0Lz4Z2W3qfWQplMn4Yn3SDsLwIcxmW9Q+/9YbhiZX80YYeG+9yjExt6B
 DF5jldxc8klfpK/7uleOPqtNXh9X7hQ45tahxMDcYBML5V7RLOBRQYr/kfuCF3Wf6eV2
 fMW2IwNF9Z17TSIiQlgagX/LcG3AKKUeN23DpjwC9q8WnQ0IrEkJsK5lDixj+VOwNxYs
 pDa4u1u3S456iLFswUqUyVsjDR5KGObvGqIGMjL3Js27sURO5PAPXEf8NmKOQx/tYqTy
 TBhdf76WckxFj765wOsEDwBBNXN1ZRDEDKU7+KAWWkD3jSR7LPF+MvFhub4FXzDutCng
 SLBg==
X-Gm-Message-State: AOAM532ddCTwQkkslaTPR0vkELJgTd4tj4ivwQdc4sGlFciEtfKNjECb
 hY5TF71cZLWVbohclRu6MF/md2V62qA=
X-Google-Smtp-Source: ABdhPJyHxv2FD9glTrzRuO/uqpZQx4ovHMGjla68HqWY8zxn9hE2bii0zY0SAKJb2djDBMjRZiOIKQ==
X-Received: by 2002:a62:7e4e:0:b0:44c:51f5:5895 with SMTP id
 z75-20020a627e4e000000b0044c51f55895mr12155752pfc.73.1633725827016; 
 Fri, 08 Oct 2021 13:43:47 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id z8sm204626pgc.53.2021.10.08.13.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 13:43:46 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Oct 2021 13:43:40 -0700
Message-Id: <20211008204342.370220-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 0/2] package/nodejs: bump version to 14.17.6
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
Cc: Daniel Price <daniel.price@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes include:
  - Remove the dependency on Python2, as nodejs 14 supports Python 3.
  - Remove --without-snapshot as it's no longer a supported config option.
  - Remove /openssl to the shared-openssl-includes config option, as the build
    system automatically appends /openssl to the includes path.

  - Add a qemu wrapper. V8's JIT infrastructure requires binaries such as
    mksnapshot and mkpeephole to be run in the host during the build.
    However, these binaries must have the same bit-width as the target
    (e.g. a x86_64 host targeting ARMv6 needs to produce a 32-bit binary).
    To work around this issue, cross-compile the binaries for the target and
    run them on the host with QEMU, much like gobject-introspection.


Adam Duskett (2):
Changes v2 -> v3:
  - Drop the default y options from python3/Config.in.host (Yann)

  package/python3: Add bzip2 option to host
  package/nodejs: bump version to 14.17.6

 .../0001-add-qemu-wrapper-support.patch       | 76 ++++++++++++++++++
 package/nodejs/Config.in                      | 15 +++-
 package/nodejs/nodejs.hash                    |  6 +-
 package/nodejs/nodejs.mk                      | 78 +++++++++++--------
 package/nodejs/v8-qemu-wrapper.in             | 12 +++
 package/python3/Config.in.host                |  6 ++
 package/python3/python3.mk                    |  6 ++
 7 files changed, 158 insertions(+), 41 deletions(-)
 create mode 100644 package/nodejs/0001-add-qemu-wrapper-support.patch
 create mode 100644 package/nodejs/v8-qemu-wrapper.in

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

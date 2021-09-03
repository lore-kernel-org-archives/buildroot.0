Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8AAC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:19:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15F9961051
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15F9961051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E170880C37;
	Fri,  3 Sep 2021 16:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8z148Rf7hpA9; Fri,  3 Sep 2021 16:19:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D0BF80C00;
	Fri,  3 Sep 2021 16:19:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53BFD1BF327
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43B5742559
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wV1nkVgTcI4Y for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 16:19:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44FC840820
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 16:19:01 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id fs6so3945653pjb.4
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 09:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ueebBksZYN64Kd44ZhYsoz0NSz+2dIxNCb+Xm3Xcvc4=;
 b=p9S5axwy7Yjz+xUF2cTfpJE/Hkz6lljqlpwsa3KE9jJZgenuf+iycuIF6n+7IO7s5E
 7CT0OMmFbKjXBoHokFlVZXfvyxpOkwbtYbDv0UeUzFLsupVVsJk3sl18LVW6oc3AC/bw
 fuHDmkviyWn71e7FnnVCeRz3MWlZMBwUfvk4hAOAQpU40nAolXZrt075TNoeygqMTb6z
 OtRYxkQLfJtcvwj6XXr6DLoHnD/vQksYSHwA3e4SCWEMFnN4hyq3wwBU05o1ZpqxBwa6
 LYLFBZPjwAzp1SHlPdH63hvSiq7fSWExLVHiiBfIAJmDdivnwFxVgKcBxx5Fr3PkX79t
 b4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ueebBksZYN64Kd44ZhYsoz0NSz+2dIxNCb+Xm3Xcvc4=;
 b=dvolnv8H0Un7x6tOBED3G1pITPls1fULrwY6gFi3OS8c6oW96OdEL29kWBLjEi8x1V
 aoP13YLkRpxkgTNQ69VglWAwNTqJDZWFImcta4ODZoTnHMiNWfXnJoUkBewkBn07Hv9g
 bJrJvevdn/GxmwXRgUebnlgrbNy6mazOt3yi5/VkOkhbL4eta5C/PCW51g/FseWcGaaY
 B5fBtgJkl8FBWhxFRnn/3rTiqBUnERTIkvPtAxWyBXnRt4iH2NCMLSjEeJbKCkUu45sn
 nQd7Rk2buA+NtDvOspACxeBPFxjSEBr4vTWbu1aiU6pDYpvwBsBdwnztnwptDMsdx03k
 aAUg==
X-Gm-Message-State: AOAM531PQ88IHPf4QriefbbgAE9RMH5voHdvHPLycS2YxEqbCsr/DgsJ
 S/sNxAESSKKR+34fz/GROfixZHSSvZM2RQ==
X-Google-Smtp-Source: ABdhPJx3g4MAlfykdbzkoYttiTWMXddy3sIg6AI9Atk03g24WwwdvR6GR7QSYX9CxuvV+k7TzUOH4A==
X-Received: by 2002:a17:902:680a:b0:139:edc9:ed4c with SMTP id
 h10-20020a170902680a00b00139edc9ed4cmr3874584plk.5.1630685940260; 
 Fri, 03 Sep 2021 09:19:00 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id u6sm6657776pgr.3.2021.09.03.09.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:18:59 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
X-Google-Original-From: Adam Duskett <aduskett@rivian.com>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 09:18:49 -0700
Message-Id: <20210903161856.1934725-1-aduskett@rivian.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/master 0/7] Qemu and gobject-introspection fixes
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
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

From: Adam Duskett <aduskett@gmail.com>

First of all, sorry this took so long!

This series is an accumulation of several conversations between Thomas, Yann,
and myself. The basics are this:

- GOI fails to build with the corei7 architecture because calling qemu results
  in qemu trying to use instructions that may not exist on the host processor.
  This causes a core dump.

- OpenEmbedded gets around this issue by adding options to qemu on certain
  CPU and architecture combinations, Corei7 being one of those architectures.

- As discussed with Thomas, a new string "BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS"
  in qemu/Config.in.host is added, which we then sed to g-ir-scanner.in.

In addition, I was anonyed that there were so many shellcheck issues with the
various wrappers, and Yann was annoyed that the wrappers were calling to bash
when they didn't need to do so, so those are also fixed in this patch series.

And last (but not least), Yann noticed a latent bug in g-ir-scanner-qemuwrapper.
If GIR_EXTRA_LIBS_PATH is empty, then the LD_LIBRARY_PATH is prepended with a
colon, so that is also fixed.

This will lead the way to NodeJS 14 which is one step closer to removing
Python2!

Tested in a CentOS7 docker container:
                     andes-nds32 [ 1/45]: SKIPPED
                     arm-aarch64 [ 2/45]: OK
           bootlin-aarch64-glibc [ 3/45]: OK
       bootlin-arcle-hs38-uclibc [ 4/45]: SKIPPED
            bootlin-armv5-uclibc [ 5/45]: SKIPPED
             bootlin-armv7-glibc [ 6/45]: OK
           bootlin-armv7m-uclibc [ 7/45]: SKIPPED
              bootlin-armv7-musl [ 8/45]: SKIPPED
        bootlin-m68k-5208-uclibc [ 9/45]: SKIPPED
       bootlin-m68k-68040-uclibc [10/45]: SKIPPED
     bootlin-microblazeel-uclibc [11/45]: SKIPPED
        bootlin-mipsel32r6-glibc [12/45]: OK
           bootlin-mipsel-uclibc [13/45]: SKIPPED
             bootlin-nios2-glibc [14/45]: OK
         bootlin-openrisc-uclibc [15/45]: SKIPPED
bootlin-powerpc64le-power8-glibc [16/45]: OK
   bootlin-powerpc-e500mc-uclibc [17/45]: SKIPPED
           bootlin-riscv32-glibc [18/45]: OK
           bootlin-riscv64-glibc [19/45]: OK
            bootlin-riscv64-musl [20/45]: SKIPPED
              bootlin-sh4-uclibc [21/45]: SKIPPED
           bootlin-sparc64-glibc [22/45]: OK
            bootlin-sparc-uclibc [23/45]: SKIPPED
            bootlin-x86-64-glibc [24/45]: OK
             bootlin-x86-64-musl [25/45]: SKIPPED
           bootlin-x86-64-uclibc [26/45]: SKIPPED
           bootlin-xtensa-uclibc [27/45]: SKIPPED
                    br-arm-basic [28/45]: SKIPPED
            br-arm-full-nothread [29/45]: SKIPPED
              br-arm-full-static [30/45]: SKIPPED
           br-i386-pentium4-full [31/45]: SKIPPED
        br-i386-pentium-mmx-musl [32/45]: SKIPPED
              br-mips64-n64-full [33/45]: SKIPPED
         br-mips64r6-el-hf-glibc [34/45]: SKIPPED
       br-powerpc-603e-basic-cpp [35/45]: SKIPPED
       br-powerpc64-power7-glibc [36/45]: OK
               linaro-aarch64-be [37/45]: SKIPPED
                  linaro-aarch64 [38/45]: OK
                      linaro-arm [39/45]: OK
             sourcery-arm-armv4t [40/45]: SKIPPED
                    sourcery-arm [41/45]: SKIPPED
             sourcery-arm-thumb2 [42/45]: SKIPPED
                 sourcery-mips64 [43/45]: SKIPPED
                   sourcery-mips [44/45]: OK
                  sourcery-nios2 [45/45]: OK


Adam Duskett (7):
  g-ir-scanner-qemuwrapper.in: Fix latent bug in LD_LIBRARY_PATH string
  g-ir-scanner-qemuwrapper.in: Fix shellcheck warnings, switch to sh
  g-ir-scanner.in: Fix shellcheck warnings, switch to sh
  g-ir-scanner-lddwrapper.in: Fix shellcheck warnings, switch to sh
  g-ir-compiler.in: Fix shellcheck warnings, switch to sh
  package/qemu: add BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS string
  package/gobject-introspection: Add QEMU_USERMODE_ARGS support

 .../gobject-introspection/g-ir-compiler.in    |  4 ++--
 .../g-ir-scanner-lddwrapper.in                |  4 ++--
 .../g-ir-scanner-qemuwrapper.in               | 19 ++++++++++++-------
 package/gobject-introspection/g-ir-scanner.in | 12 ++++++------
 .../gobject-introspection.mk                  |  2 ++
 package/qemu/Config.in.host                   |  4 ++++
 6 files changed, 28 insertions(+), 17 deletions(-)

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

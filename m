Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5419AC3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 11:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C8B880BEE;
	Wed, 24 Jul 2024 11:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QznwjwaMnWX6; Wed, 24 Jul 2024 11:21:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19BDD80CE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19BDD80CE3;
	Wed, 24 Jul 2024 11:21:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51A241BF2B3
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 11:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DE4480BEE
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 11:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkFeaVvDsZw1 for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 11:21:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5037780CE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5037780CE3
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5037780CE3
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 11:21:04 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52fcdc2f1b6so159243e87.3
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 04:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721820061; x=1722424861;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o7d1ZFoOXkiaQQxjDBZjcemPWU15YfL5a58y7BKK6OE=;
 b=plFa7co3e8TolLHIDFDlmHlAvcY9jXgNEFhji5BRKb+VlSgWRqjUT5nYUz4INTmJRC
 ONL3Y2b9cwBI9DwXrEDoufFlbCdn9qcT7x/eOuiL1lFNrhtekcXBH9fynJnZkMo+uwrc
 4gPB1BDpkndQ6hJR95xB5B9UOSSNNIXsSfXQHZ6WZQsjhucQ67s0Kd/lg7QklYvjPkxn
 2ZnQdAYIZDetW1xUsdlAtUMETCnIthiNAQITtqfG4IrU5Zxg6NmuYlzjCyRMgr++2rKQ
 sMcTZe0WvTlt/Ekb+O+M6IVbaaHtelG/NyG3hceBXCxCwHym+qAt89RWd9P5O784xTvM
 Tt+Q==
X-Gm-Message-State: AOJu0YxEpqARclXy7hf+VYSdhhxR0ydAycDAJvk/LjNuPA0WX27FUgIH
 RHq8yLceyqpXrdVOKc8zoOieIXZs/bn7zVObQ3EjOlIZrIvOA33yc9rnSFSiZ6GhGws/FIcIaW1
 CJXUuln/292Q5e1VQnttmxH5KdK8d1cFS
X-Google-Smtp-Source: AGHT+IEm5dFA+4KDlp2o2HyMo7rw2qCuepP0BF26b89PYacpaqzB4aILDTr6Sn5SEx8YqE5WmHhNYx42xmBRcqIH/Nw=
X-Received: by 2002:a05:6512:3b21:b0:52f:4b6:bb4b with SMTP id
 2adb3069b0e04-52f04b6bbb3mr3093866e87.9.1721820061210; Wed, 24 Jul 2024
 04:21:01 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 24 Jul 2024 08:20:50 -0300
Message-ID: <CAOMZO5D3LL=gCQt-k5e3350tQ+XULrzhV233q1GZbGFDD5f3Cg@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721820061; x=1722424861; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=o7d1ZFoOXkiaQQxjDBZjcemPWU15YfL5a58y7BKK6OE=;
 b=jI0v2wc6elKlOZLa/DsmlEaHK8N5Ez/2WjT5Zmnc7yIF/LQbrGPUWBdQWQpTa7sLqd
 6KBB2DKuavwjM02uZqggYdXy+Ah56PH82dz7G3f1u91eHOTPJ2RUy4iyJjgLEKSsFoDu
 uWqgziAMfKNDBntp7Xk3nNvmh9Ej3C425UMuiqGOcorAiWTLTDu6HxTIoDbUNCq6awBZ
 Bv50ePY1Z1zx2eDyqYhrkMOgIeJBNcOsc9TY36F+d9XLQrlra/fd7RBnfTv6U8/SCxXG
 lD1VBdUN2J+lx8ut2OQ5RI+04JxViTxO3jhzYuyzHkad6tGNF4dG1Dy7NrA4v2x4iBey
 Nfcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jI0v2wc6
Subject: [Buildroot] crucible: Build failure on riscv64/mips64el
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

Hi,

I get some reports that crucible fails to build on some architectures, such as:

riscv64:
http://autobuild.buildroot.net/results/77e7ee7c478c1f4a65acc3d29d4562d1cafae3fd/build-end.log

mips64el:
http://autobuild.buildroot.net/results/77e7ee7c478c1f4a65acc3d29d4562d1cafae3fd/build-end.log

The crucible tool is used to read and write fuses of i.MX SoCs.

Should crucible be restricted to build only for arm and aarch64?

--- a/package/crucible/Config.in
+++ b/package/crucible/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CRUCIBLE
        bool "crucible"
        depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+       depends on BR2_arm || BR2_aarch64
        select BR2_PACKAGE_HOST_GO
        help
          Crucible is a One-Time-Programmable (OTP) fusing tool for the

Or is there a better fix for these build failures?

Thanks
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

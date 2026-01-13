Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCAFD29DC9
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 06:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B5714176C;
	Tue, 13 Jan 2026 06:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvUXuhhzPYW9; Tue, 13 Jan 2026 06:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D713F4176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768284172;
	bh=+I+dTAGLfNXKknGRRX5ANn1I4oldMEpnUrwfZ7bYiXw=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hxkvu8dTRIhzHd7WV19FmEfppNT+mQ6wtaaM7tw4NNdAx96Zr68D17EB0In03KIpL
	 sDoTGySLCp8cTeu9L5R1k4S/t/CFNvO7WFIseO3X79fZSVha+bwTceROlcw/yBwj1X
	 IGCIHKPUddNUs+7N8nLOA7oqcIuoO//dY5CZyBc/kj8Am7H0xiqZWERfdxSK/nPF8I
	 UcpU+YSPjevxTvYsz0qNSBvosp8qzmyPe3NEcxHgcJBh671Knhl/sn9JPKVRE0WR6e
	 rM7QKO4iT/zhSVefM3zfVro1rj3dfxIF7SY53m7kFdGp5mY/yH1HRQc+kg2RIvQNkP
	 uQGu7mtHiZQGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D713F4176D;
	Tue, 13 Jan 2026 06:02:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B2EB1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 06:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59AFC415FC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 06:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVBgqAACCqWX for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 06:02:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C64C40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C64C40025
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C64C40025
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 06:02:50 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b8719994ba4so261333666b.1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 22:02:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768284168; x=1768888968;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zkl2+lfZ76fzWoGFYXDLy7FjS+3Lv+Un30ICI19N0FI=;
 b=iSBvoY/ZFCRFva9EXkZWepFHNSLwWqQtcrI5vzzZ8sReam0Og/S6SpJS8L6u0e85g9
 9esL9u/H60qFRj2W8VWwL2/bvdANJhEQPd0xkw9R1yLO49R2lRa3WfwpdgRvaH/lSbZh
 qDK31mm7wIlEbcM1tLDsvdvvVvnprup1c8yG1jr3gaHrWmGJx4vzA3Dq86bFMUYpdtq+
 M7o90tAULoDJWfL7odM+0Q+j1+CwBKWcm5k12V3QCoUbLvl0gbmYTqIx/D+YwXRz/Bfl
 qr3NB6U5SZv61CJz5/Oh6Gp3FY2JOLEb52zsAA/wRkMJjp1kfNxsbsfpelUeXzMeITpS
 +Xfg==
X-Gm-Message-State: AOJu0YzSCQnTOMKsWns4musKl+rsqs/ZZOuDIhXZbxEQNo5emWxj3rGM
 8m0g4yKvz7U5bq0aaDbdiCUnMhMA7ZEZss96nCwTmPrbxBUuxlT6EpnzIwSY4A==
X-Gm-Gg: AY/fxX67iLSNX/jkmU0ZSmW8r2slfCq9eRBbB0N3Zp8gxuYmzisrdlyEBGP2nXoBeMW
 eysuS3Vh8DwPH046giiXhHIeY1vzHAEyJDKc8n7Ouaw6FeHqnW7THM6WfIfV6EM0Q0fwPkbFsvd
 D7m/pUgsDsPiRpmiTgHNDQ1iqTRc2Bwo8sDHOyFGzfYYEpIST4fo7KQmizN8PTz2ECITJEczPSH
 +OtB1BKUuHT0CcmIJUgSlTX4XsG5PYdHjW/ZhuE99F3SZHzLUbTHgyi1iTJ8Mbl8hXZ5SZDWasA
 nfcdU/Bo5JEV3bolK9aSEqLZWc5k+Cx3wMVywAhIYmnxXNdGeTvZfBljSl//FsCABIXLFPMFORa
 fTn2xWWUxAfO/tF2BqoOy18bj96pUEgLwjdQK9xUCFj2WlDCRmFvcKsihIKGUHgYE5lEARwPNFH
 TAhPXP3ZMIrpQCI68bWQ==
X-Google-Smtp-Source: AGHT+IF1AnnAvk/O9Rv9dvEtYntYQPFZldRAfwPdYkiFryNo3o7aILfvLVX2vbvEcVYep2dkNCNfIA==
X-Received: by 2002:a05:6000:238a:b0:432:c092:ee50 with SMTP id
 ffacd0b85a97d-432c37a50b9mr24860583f8f.50.1768277888463; 
 Mon, 12 Jan 2026 20:18:08 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e19bfsm41412832f8f.18.2026.01.12.20.18.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 20:18:08 -0800 (PST)
Message-ID: <6965c780.5d0a0220.26d040.f2b0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 13 Jan 2026 04:18:08 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768284168; x=1768888968; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zkl2+lfZ76fzWoGFYXDLy7FjS+3Lv+Un30ICI19N0FI=;
 b=NXq4W5XjGsSyh34rwClzAHTaL9cVMD3Hwb5jg31ZTwM/8lRfpIwGI3BFipjez5vZL7
 F7wrUiq31GvchXDLvmw3RQ5mAQMGakZUYzjTCyX7q7rIpQZ7giAYATKuXDbtXbHMpQcX
 i0HXpHaimVhHtFXIRDO858wBMuVXveTd6ghAOKGkNZBJdyWyw/XNrIwB2rAASqVmbeYp
 9WunM3EAdRYKmzMcSR0Kf1IEz5gDD44Dp0nt3htMclWYrGBf+C5+HdYwfMyQuiUc130p
 wanQbZMx2IDBMMMgo90oB5B/lhjIX3a1mGcb/CTSSfVcEVyC297mmm9+5ar/6lKpRcCv
 kQ0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NXq4W5Xj
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-12
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

Hello,

Autobuild statistics for 2026-01-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  3  |  0  |  5  |
  2025.11.x  |  2  |  0  |  0  |  2  |
    master   | 10  |  0  |  0  | 10  |

Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 2 
          host-binutils-2.43.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d0a1a50d3e5baf4dc41c21e5895e11fe15a44364 |     
    or1k     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/fcc9ec7259bfeab779f19123bd93e7f862760c9a |     
    arm      |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/eed1e2e695d2f1cbb2ef215c198ae30affb0eec2 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CB2C4452A
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 15:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AC3F80CCB;
	Mon, 20 Jul 2026 15:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpElGAArJiJs; Mon, 20 Jul 2026 15:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A58180CB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784559767;
	bh=wTM0prLcMGzQpN7N1sOZ2HZjC5scM2BdaWpBKX4LiNM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fI1asyCccgGgE1LGDf8p5kXIoMMaHfluCgyLEmjCZwDu+qTXkeXxOUTFrJsxO9G4I
	 14w6XQujGgOQEZ7HFJ3pesKsIy8L6qZY57UQbmecGJjl/EVBgdTq2UJamybtbWIQ9B
	 r/71NrlUHERIAlBGFj2AVwpYb55etEHL3plSYbvaE2xIT3lZBMYHu6gvhtTo6RWTzi
	 e6yKmmrkRMRcftxnenQedyO8RH4FOdqYSyWyTlZgh+3lFz/vRtCXleVyhJbwFPABMr
	 CPIanWIBSU70F4Vx5laxg4qmLr1/D4t6PsM+gSpCaObEwaXc8QbO/0H2y/CGqPDqkG
	 9MeC5wqh45MFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A58180CB1;
	Mon, 20 Jul 2026 15:02:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7E03206
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D99FA80CB1
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdQpPDdKw0aI for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 15:02:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA24680CAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA24680CAF
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA24680CAF
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 15:02:44 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-472326ca506so7906070f8f.2
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 08:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784559762; x=1785164562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=f6QPXkr4bBldSXM6rdQDCgdFJEWY3MUNE3HNncFnBoA=;
 b=f/p5X8c4uG4h5hPxzH8w5Rn8ZtFibt+DShFcKus/fRgS3zIKs9krW+pt5830gl38sN
 s9NrbkJnszkI2WQTdFMfIr83LbMfI80+ZMP3y0hmfpQnSuvpYUwJabGtT8K7tcYKCNUG
 Lw2rm1r9rBZwV/zHdYfyzLaOBXOTV18CWfbXraqgl6k/CVmhXxwEY6Cx37611/VqmVf5
 H3HigqFSSA6QORpi8OOGds8ZAtuAgKt7bafYsKLdLUlu0nwI/jEnGkuZ29bIert2Zu/e
 IhtD7bMiDZ8/Y6LlV8TBrPocdMT9XYVUiltiz+ydkeAt45o/IIfGyIzldcCZnnLeqWVh
 l0yQ==
X-Gm-Message-State: AOJu0YzVSd7bPzdjM80MKbYiGbex+5Z/sC3J2ema4r6dnPXaB+hqZ8Rc
 JBGJL5RrrohxFTdmzT/v2dH5s/ZF0cWtqDCIp4XKR8w8VFED4QMypHxvVsteew==
X-Gm-Gg: AR+sD12niQfAGkv5u+NidhmGZ64WJj8sSV+UC223py8Oe+5kmWvsr2BH8H/jMZp0jXC
 VbvViuYpQfTtxMfCjs7S3FfuIuGuxZHUMj3QaYjbHGatvMLV3lc3kSJBHLcFEt+gE5pdVlpPImv
 KyZ20vetOWzRQBeBYS0ioGpEYiRKTVbfeA24/YcCXfJesZfmpxdYpvvARKkjENotCusI/ZDNRqk
 OJWNP2r50P6gz2avDRJknQvXBQPb6t154C9cBc7GJLm31GKr5Hpco6bzQDSDDpA+wUCHMsezhkV
 6qh39YgAt7AgDwl4wySHBtFnpK6kLgRILn/BDNUA5xfvhRMns9TYkDdScVqmDEkk27mMz9eVM6a
 JNf1oW2D6PmU7hZqfCPjKIQhYbe12Gx03l6CBIHRz2ABeCPwPNR1JXcZxexzEVRsGWYCq5hqPSW
 VpAS+8MMESmk/ZMnx9da18vtY4vDzk7gAR1Hw0okU=
X-Received: by 2002:a5d:5d86:0:b0:47f:70eb:f2a7 with SMTP id
 ffacd0b85a97d-47f70ebf35emr8715519f8f.4.1784559762001; 
 Mon, 20 Jul 2026 08:02:42 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ee926dsm28681532f8f.35.2026.07.20.08.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 08:02:40 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Mon, 20 Jul 2026 17:02:27 +0200
Message-ID: <20260720150236.243961-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784559762; x=1785164562; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=f6QPXkr4bBldSXM6rdQDCgdFJEWY3MUNE3HNncFnBoA=;
 b=ZyJUK0r/ZPnpQV7/AuljsSDWDcDqkxezc562adi9fo6w/RvDpen8TRjJhRWkefXGyX
 1fxGsqLK+JCt7/Mo8sRmsr5uADqGcQKabK0DIRIP7GjcS5wfUD4sCfcJQtUjx554MNtA
 UsSin496viWPTcEaPa+fR7xAuP4LLiagawT5SkG5WQ57tgn3ecRXh0bojdl59N7fxySX
 QW1Z5eBIJWjSq3sosr4YhlksKe+CCz3YTkHrrlYWIM1Kp+QcQmQ1nupb2pIvgHKVRm1Y
 oK1dfkOFGg1y/AUJniOc4B+SCCZSIL7WarfmdA/nnbXY97c+f2nJaGlOevEQ/iTcR6yd
 mkWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZyJUK0r/
Subject: [Buildroot] [PATCH v2 0/8] support Hare language
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

Hare [1] is a system language which aims to be boring.
Hare uses qbe [2] as backend which targets only aarch64, riscv64 and x86_64.

Hare seems simple and lightweight, like Buildroot.

this serie adds:
- the host-hare package and its 3 dependencies: host-qbe, host-scdoc & host-harec
- pkg-hare.mk an infrastructure for building the Hare packages
- hare-dbus as an example, with its 2 dependencies: hare-ev & hare-xml

1. https://harelang.org
2. https://c9x.me/compile/

changes rfc -> v2
- package/hare: sort dependencies
- package/hare: full refactor of config of cross toolchain
- change title of commit "package/pkg-hare.mk: new infrastructure"
- package/pkg-hare.mk: add comment about grep
- remove package/hare-hello from this serie

Francois Perrad (8):
  package/qbe: new host package
  package/scdoc: new host package
  package/harec: new host package
  package/hare: new host package
  package/pkg-hare.mk: new infrastructure
  package/hare-ev: new package
  package/hare-xml: new package
  package/hare-dbus: new package

 DEVELOPERS                                |  4 +
 docs/manual/adding-packages-hare.adoc     | 87 +++++++++++++++++++++
 docs/manual/adding-packages.adoc          |  2 +
 package/Config.in                         |  3 +
 package/Config.in.host                    |  1 +
 package/Makefile.in                       |  1 +
 package/hare-dbus/0001-fix-Makefile.patch | 26 +++++++
 package/hare-dbus/Config.in               | 10 +++
 package/hare-dbus/hare-dbus.hash          |  3 +
 package/hare-dbus/hare-dbus.mk            | 15 ++++
 package/hare-ev/Config.in                 |  8 ++
 package/hare-ev/hare-ev.hash              |  3 +
 package/hare-ev/hare-ev.mk                | 14 ++++
 package/hare-xml/Config.in                |  8 ++
 package/hare-xml/hare-xml.hash            |  3 +
 package/hare-xml/hare-xml.mk              | 14 ++++
 package/hare/Config.in.host               | 14 ++++
 package/hare/hare.hash                    |  3 +
 package/hare/hare.mk                      | 57 ++++++++++++++
 package/harec/harec.hash                  |  3 +
 package/harec/harec.mk                    | 26 +++++++
 package/pkg-hare.mk                       | 95 +++++++++++++++++++++++
 package/qbe/qbe.hash                      |  5 ++
 package/qbe/qbe.mk                        | 22 ++++++
 package/scdoc/scdoc.hash                  |  3 +
 package/scdoc/scdoc.mk                    | 22 ++++++
 26 files changed, 452 insertions(+)
 create mode 100644 docs/manual/adding-packages-hare.adoc
 create mode 100644 package/hare-dbus/0001-fix-Makefile.patch
 create mode 100644 package/hare-dbus/Config.in
 create mode 100644 package/hare-dbus/hare-dbus.hash
 create mode 100644 package/hare-dbus/hare-dbus.mk
 create mode 100644 package/hare-ev/Config.in
 create mode 100644 package/hare-ev/hare-ev.hash
 create mode 100644 package/hare-ev/hare-ev.mk
 create mode 100644 package/hare-xml/Config.in
 create mode 100644 package/hare-xml/hare-xml.hash
 create mode 100644 package/hare-xml/hare-xml.mk
 create mode 100644 package/hare/Config.in.host
 create mode 100644 package/hare/hare.hash
 create mode 100644 package/hare/hare.mk
 create mode 100644 package/harec/harec.hash
 create mode 100644 package/harec/harec.mk
 create mode 100644 package/pkg-hare.mk
 create mode 100644 package/qbe/qbe.hash
 create mode 100644 package/qbe/qbe.mk
 create mode 100644 package/scdoc/scdoc.hash
 create mode 100644 package/scdoc/scdoc.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

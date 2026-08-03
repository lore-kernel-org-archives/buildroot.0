Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77318C55175
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 06:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E49314052B;
	Mon,  3 Aug 2026 06:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kr_Tpyf_0Uw8; Mon,  3 Aug 2026 06:59:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB5AF40572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785740394;
	bh=5OS9ipPMH9/GBwZz6RevNNXIszeOC5BMjDKmDoUuKso=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=co8HxHld4LjdlIXS9qM5UiiThEC0QTNXxaq85zWkvH7W3H/guYC9ELFowvk2BHICB
	 s7GxXlsWUowLc4GvN/aLswoaOYYUF4bVQIfqAkb1i9OwmRDGRQRUgaCsyzmeqmg2K6
	 qpvvGi3sSh5IwAoUhr4x7vnrW0KQntn5cJaGyEaQBtI9wMxSWtkGqZQIxuW1lE4dQ1
	 smWf6flbAkFLuOnowBcjdYoC4rwDqiv3A0j79XgFhwjGM4J1mnidxSNDaRkTT3RFfO
	 51wAg+tCMqg4sIROEV3sTS+8P1jY5NKi0MkBtRkWed9vDgrTH6QniBcCyKzh0cubdt
	 3s+6bmlU/4mGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB5AF40572;
	Mon,  3 Aug 2026 06:59:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF57E26C
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B119080C9A
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hL7fHqEwD6Ij for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 06:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9101D80C87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9101D80C87
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9101D80C87
 for <buildroot@busybox.net>; Mon,  3 Aug 2026 06:59:51 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4956242332dso15275255e9.2
 for <buildroot@busybox.net>; Sun, 02 Aug 2026 23:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785740389; x=1786345189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g2kqQ4mcikKYj4BvSToHXwJU9jyco01Tb3JdnL/XbAc=;
 b=bP5YCPubWtqS7EdRMn2M2smX+cLH/Gy92NHHGS3t7bfarX7pBdciEUTwoH2gKdhwYX
 nj3TzJMyFvmVDjIQWOPBi5WdwLQJ7WPxeOE0uVAeEZxs8pM+62BZf+glZRkxBfvyH7y1
 85csxpQ2qKF+UvU4mFzgiBZK+whc1rAhQJ0qqTuGALuDD5VEATZFOiAypMeLH3zVjiPW
 wBZpZ3nfXnQZTnIGE/a308NVXUWCH8Elqn9cJQGFGRZABu+wSjHi8pTBDNVejgDAadh1
 k34tyoqIXFXwAUUxeiX/Q63nzwVPlsfTinRYegoxoaIYU4nsi6Tjn5FjKGViNoUpA///
 znfA==
X-Gm-Message-State: AOJu0Ywie/3kzHoLRAUuVgiBQc0L9gHcojA74XJyZTRTzzAVIy36nUen
 hKvzXQaeJzZj74TDpcW/9UAkaCFxuYeLFRAlDEQM+7tXw1STTCktOYkNP1haHA==
X-Gm-Gg: AR+sD13vKUJAomFhTDVGTMJ9YVFEIYMatMJaK0fQ86mU1pu7s9hVQHr+ewLBLAMXk74
 ajVc32gFFseDpg6Y2qBofuPl+4JOGASzuo3Zf/M1xIF4pPMLZNhQwO77PpFaUEogJH1Td/b+c9h
 bo3bXGSUvcAyCL3JuAPLlPbDJTU3cNOJaYKqLGviNUVuMEKlAdQe/b9SB1thynYDhbF6ICsACx6
 kTvpUVgYT53PtPPHhA6Y2laAjkj5yLjxx7oE1WRqvQzS1fRAQ+8bvfgO21NPTD06Im1sOktZLn8
 rp8JnmZgVBs6Ba0u6B6vD8qnlixoGyYl9jLhCIddfmcnIoSM++K0LdFeb9/FmEnVDTIOoXqDJXc
 jHk8Hnfj/2ytypVUCc4uXqZGnlmt1inpmsYI9AYENNtzO0IQejD2oOf5CSdPmc4ncit4qjJ23It
 n9Ypyl/DWARjD6Hgl2dM0e+PVr3w7RG0MkWHcbb73xi3RmqZF+US0abHhEESy60yF+FvSPYNprC
 /lBO5zjNCIL2DtQwDKaKg==
X-Received: by 2002:a05:600c:34d1:b0:495:7561:a9ed with SMTP id
 5b1f17b1804b1-4980c679d9dmr208547705e9.17.1785740389045; 
 Sun, 02 Aug 2026 23:59:49 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b5b4a2sm234639805e9.1.2026.08.02.23.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 23:59:48 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon,  3 Aug 2026 08:59:31 +0200
Message-ID: <20260803065940.224429-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785740389; x=1786345189; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=g2kqQ4mcikKYj4BvSToHXwJU9jyco01Tb3JdnL/XbAc=;
 b=L54iCUx3nX8PgTVBZ/Murc7lw161pt/+gCD1pPfn1/cJU92qvTBOjZjPhbqRu/25ZF
 7Tf+y9osBVcchC6k1yf/MmxnCtfvjLS4ecZSNFbrAQnYAF+REg6yjjJiy9fMRKSc+u5p
 LdVU3u7vsoFJF8QfVlixNrVqFOmbQDrx3LltNCoYu4P8M0DWjth8EGgpxHSXcp3+e6lb
 vWSpH9eUPBhGHJvKE9CQ/jq+EK8nITJ85l/ZXLaFE+j+Yz3TMSOrwq3QeW6uVqOsQX8q
 LbMXN9Wkjj1NoEMCgvzFXoAgoo7Kydf+cs544ItPk5BbItXuQK2io+yczw2lC30HcR91
 1Vyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=L54iCUx3
Subject: [Buildroot] [PATCH v4 0/8] support Hare language
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

changes v2 -> v3
- update with my new email
- package/hare: refactor with HOST_HARE_TARGET_ARCH

changes v3 -> v4
- no longer install in $(HOST_DIR)/usr, (see https://buildroot.org/downloads/manual/manual.html#migrating-host-usr)
- package/hare-dbus: add an Upstream tag in 0001-fix-Makefile.patch

Francois Perrad (8):
  package/qbe: new host package
  package/scdoc: new host package
  package/harec:  new host package
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
 package/hare-dbus/0001-fix-Makefile.patch | 27 +++++++
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
 package/hare/hare.mk                      | 46 +++++++++++
 package/harec/harec.hash                  |  3 +
 package/harec/harec.mk                    | 26 +++++++
 package/pkg-hare.mk                       | 95 +++++++++++++++++++++++
 package/qbe/qbe.hash                      |  5 ++
 package/qbe/qbe.mk                        | 22 ++++++
 package/scdoc/scdoc.hash                  |  3 +
 package/scdoc/scdoc.mk                    | 22 ++++++
 26 files changed, 442 insertions(+)
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

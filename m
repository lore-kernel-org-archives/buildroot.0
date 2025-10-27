Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8536FCCF9E5
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 21:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F91741098;
	Mon, 27 Oct 2025 21:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBNsrBZu_ce0; Mon, 27 Oct 2025 21:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73518410F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73518410F8;
	Mon, 27 Oct 2025 21:38:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93E4C43F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 862B040A7C
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7GmhYTYKujPk for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 21:38:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A0B1C4089E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0B1C4089E
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0B1C4089E
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:37:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-426f1574a14so3416582f8f.3
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 14:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761601077; x=1762205877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cf4D8n3Z+xjzC95MWSB6C574jGRuzKG18L+ETQLDj4E=;
 b=Bs8AfrnpJSDsehtc/HBUNXNJ+fEKHU+TqkXBeAyiBKiEMMPYIEQ0sVMbnfs5mqvONi
 w38AArnXywm6YVhEYyHEPHByfmQY1dENIjAQ1wBb/JgNceH6kkKsz5K+RQelzeU690cu
 jgjy86Shfyxf8ujdhp9+kPzApTOM7blukKnTi1SeSpbAswA4eKXSdyfgbWn+d7Srv+n/
 s95hvrYcNrIeOofRRgKw8vbNrJQNrdczzEMFdmjQGMwRzpLu2hrhkaYeDcnT9MxWHM9d
 zzaSrjnMuLuJ076k9byHunXOV3Rexo46uvsk/Of2UrzCqCrifEBv4gtdW/+ZTyJ7f5td
 DJ3w==
X-Gm-Message-State: AOJu0YwQs/sV9m2vE28Tt0c5LxwhMpyHIyRdZC6G0APvYrFE5HS+cPap
 iVa6UKCkqNA644kmdmcNcTQNrOEx8AEuJXUCfk4pAws2XPdOLAOXkzqe4CWXv7GQE2Kop4XVKa9
 WP577
X-Gm-Gg: ASbGncu8zy3Is1YRCfkGYlGNpu9c5jrqCh2/ayVN3ATpjLdzAQpPkT9C9v41WCYwKkI
 sZ5Ur2cHDE9Sk7k+AmZPiVACVvSiSyaiQeR7LoQxakIPEv5jLirXVb5swnNcxZLH+TMrJj3eDgo
 taaLnkDVPPlCar9Dfu3hDsNC5suaiExajQKq4u80S5GBYIsUuvA7E10VZSfwLVtx/ofAIkuZTmP
 AOzQNZXSH8/MstPBpzP1fQWT6/ZEDT3qlJiwGhyjVt74feRjSUfGhrfdIh2tMiV0uUXgAcoYI4z
 79eOqMAi4SrGDRpkz57bz/ZaS8oLqO1/qJPkWOGztybVLQW3mLyW5TvZ2mPRgCjVflZOt6t7zIZ
 YIKH2JXdX4Qb9y9/4LNOHPjBGyB1+TuaR0tYpK3H+8ZWDaUZknwatwtrdE4EcbpTYudBAfhyPZd
 hOwvszilUunj/t/u+3GPbbJqSuasDMceW02q1M
X-Google-Smtp-Source: AGHT+IFo21KGM9ahImuR3XK6Lz4QpvM2BTGx3QpY2p2Q6yrUrAYd6JQVRkGd6vJ+PJY4dddaogLamg==
X-Received: by 2002:a05:6000:186e:b0:428:5673:11c5 with SMTP id
 ffacd0b85a97d-429a7e920a9mr1056106f8f.61.1761601077061; 
 Mon, 27 Oct 2025 14:37:57 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df6b9sm17114587f8f.44.2025.10.27.14.37.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 14:37:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 27 Oct 2025 22:37:56 +0100
Message-ID: <20251027213756.64947-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761601077; x=1762205877; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cf4D8n3Z+xjzC95MWSB6C574jGRuzKG18L+ETQLDj4E=;
 b=Y79BV6hDh3h7qRwlqZjo2KS1LSiu2qVUGd7OJxBwIYJatAvs765Xxa+Ssu0FOQAamS
 gMUgXUbbRgeHrFAQ5ecDl7bJsL28/tAch84KjsB0PC5OdIqQiML45ua4mjLRzJXS8tm6
 yTnEEH3hsiCCgTGP0Fjja2F3xxeveGxI1L2imisAqO+SKg4S13yfaPG6+MlsFPwLXkuC
 8Co69+y34feyDk5s03U6KwUL85kfwT+WD+qCx1oY/BDT6SvgsZsTRjXZ/h1qmCydIGv+
 mBFrrNG5R7RAxxWRdaJIKwxnIF3qu4qzJupdNALSH7SYSz9qpYzjVA334mA0wj8rTYqs
 uieA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y79BV6hD
Subject: [Buildroot] [2025.02.x,
 PATCH] package/netsnmp: revert drop stale ignore CVE entries
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit [1] the package netsnmp was bumped on master to version 5.9.4.
This version included fixes for CVE that were already patched in
buildroot and thus was not picked on the LTS branch.

As a consequence, the commit [2] was made on master which removed the
stale 'IGNORE_CVES' for the patches no longer presents. This commit was
wrongly picked on the LTS branch.

This reverts commit [3] which was included in 2025.02.x to set the
'IGNORE_CVES' back to the state of version 5.9.3.

[1] 1799cfebfd package/netsnmp: bump to version 5.9.4
[2] 4a3eab8341 package/netsnmp: drop stale ignore CVE entries
[3] 3ef8c1d0db package/netsnmp: drop stale ignore CVE entries

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/netsnmp/netsnmp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 7cd31ff209..6575ff1afa 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -11,6 +11,10 @@ NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_CPE_ID_VENDOR = net-snmp
 NETSNMP_CPE_ID_PRODUCT = $(NETSNMP_CPE_ID_VENDOR)
+# 0001-snmp_agent-disallow-SET-with-NULL-varbind.patch
+NETSNMP_IGNORE_CVES = \
+	CVE-2022-44792 \
+	CVE-2022-44793
 NETSNMP_SELINUX_MODULES = snmp
 NETSNMP_INSTALL_STAGING = YES
 NETSNMP_CONF_ENV = \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

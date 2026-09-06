Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C7EC79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 11:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0FB440639;
	Sun,  6 Sep 2026 11:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYWjYrs1a0aA; Sun,  6 Sep 2026 11:31:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1A6C540634
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788694267;
	b=CWBUubumx3HDnbW9pyMac7VdjfpblEZjhD6MM6gMNmfzGzoEEEcq+OPOkYTz66/gtkuq
	 bSk2JRHn1Kz6vKCggxQd2lQVYPqaEyAxa6mU78vIiue6BijLZVZG7th0YbE+xnRu/qxJv
	 ko5j0cg+SnpgSYbihilMklvGV2clWo2mhedf97X0vh5Dy7VngJrvYy2vqm6i07z+dFCrE
	 rIHSh+RmOxF8sANkbozD9x15/hl+qiENALet36EpTgRb+muApgD63UN1GjBMLGJk3uUK4
	 dHx3KTUEQ6ELT8R563IMEAkke/E8n5x0dYsqZtEVGvEspEkZfROzev3/1obSacFrbCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788694267;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=P6eekWDquPrw/GJomwgsajlAD+rDem5Uk8C1/INVx+4=;
	b=h7mwSo4zlirABz7dg3GK/Bn4R8yH1a9R/dxXfPBpU+5GHoy6IxYcqRvUYloqXvvNFj/K
	 Z8imQotx6Kxp2OyiNC10VkUxxyaCth/BHRgcA1WEue6Sg7QjGTl/xSnIIfHbcNJfo89HA
	 FQ2oSGRGimVDJO5H6DqMqGDiaZZA9iSBwQPduM26bztSFvPWO+EtSlaCL0Odw8qadMiBU
	 DpJQh2HQqHL4f9IQYdemW6OHUCkjXjchhg4UlBlXF6Esh8hoMrGzJGbr2V7cNvDTMf0q6
	 qT59Gk7nXyKAJurL6aIXyLWGmx05aXhHmDh2GOUiHGIUr+MHZy8J1IgE4Wg9D2C02wg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788694267;
	bh=P6eekWDquPrw/GJomwgsajlAD+rDem5Uk8C1/INVx+4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WPMBAekGEGDN9RH5uFVO2v3O0/oDerso7e3aT+P/kzhuIrGtU+6f5WenED/ZFj5XH
	 bmCmWIdxkUBMgRmjMOnTelIxSr62zh9ULOlSiSutM/FeeMt/K/4yRGvCSLRx5tT/UU
	 ZeiD++InaQt5vBjZFs9ZLcRGoJmhPRVU+hrsYciMLO7eXyKIa6phxOGuQn5mrnz8aZ
	 kVmnNnNR+OAU8GylQmUXqwAsFiaQ6OArMv5KyfKDwckWREbJPmsot27Mla73uhuXhs
	 EMSexynDsVOrMTWEIyvQX4tG1bF5fWvndtsm8PN75srgGo15YQtYUrLnrMsBM3xooM
	 x6Qjwj+6spy8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A6C540634;
	Sun,  6 Sep 2026 11:31:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C49D72C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 11:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51FD880DA9
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 11:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0FiINRHp5Ukd for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 11:31:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C586680DB9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788694263;
 b=l/TfdYJ88WYakadKo7xU9BO4i8DA9xoO95MNc/Kw4f4Or2plVGIHIxRs/2mX9nSJ1f+F
 cl0DWzbeGD5Dtzhh3ydb0MHctzFdKMCEjTsiBGWuy5ezSY5wB0xnk+q1+B/EUyMXH5XjR
 xY26WaCdpkmMlp8ucqo91yMjRFVzZ6WHRidnwAkBWIgtdiHwK4aJ4rnNjZJszThpFIu7w
 tOmnv/WpT6Iw8UQIHggRZ6j7cqJzymY6UZNuFG2cpmvvjEZSnyiLf/xcjtzS3sGeluMj7
 XQbZQpP0p8+bSi7QEEoVpWc6s7w1TTGO82A8u1m7//nEmiva6DbH5BOdfVp6CG7fFZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788694263;
 h=Received-SPF:DKIM-Signature:Received:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
 X-CM-SenderInfo;
 bh=cUNrcPqi5Uydi34inQpbvYT2DbcfGy/XVhdutqzR8ms=;
 b=QsNHPLwGIiYB5oE6+zk494H7rxgX43fcbRLVwK+z4ltRXSR5scet/+MHNv9s5AV1Iw14
 diUmCNpgWdDX/acrSXDevkCHTVv5+K5rj1QM1ivbopaxZH/drDElU0938z0cM7Qh4bnYZ
 dGcxIxo1GJILZwMDAeNLhMT0L+ux2BAXG6ydRH7dVuoogfn9zi6Wqi0WK8pDI6hQppa5M
 IfLu9Fd/d5fD5RxCZ63UP+yOQjmMJ/hFl3P+QEL1UmthVRkPyUe7T3uDQ7YHQwWAMO5Cc
 y3pwbs+ujtaLgZFUaJGjIvFSaDj2VgyNVx9r4DoI3g+jH6aXcuR9lYoJaGtV2ZTp7qA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=163.com; 
 dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=S91jQ5um; 
 arc=none smtp.remote-ip=117.135.210.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.4;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=S91jQ5um
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C586680DB9
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 11:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=cU
 NrcPqi5Uydi34inQpbvYT2DbcfGy/XVhdutqzR8ms=; b=S91jQ5umUuiAUIuW0B
 kLF1vXHZgKGdxvhu0HYjUJrwekktVnsVvSY3qu1V35WedXFQhUmEjLzBaTPNkWGL
 a7cX0+3VUUOnqsv1O9b/dkTypnUlxjyEe4qk0yEqJS6ogARBThBzSgnL24R07nCe
 rSyZZt8QcSXxpP/4VZGbbsv2g=
Received: from ubuntu.localdomain (unknown [])
 by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id
 _____wAX09XsTp1qzH2MAw--.24873S2; 
 Sun, 06 Sep 2026 19:30:54 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Sun,  6 Sep 2026 04:30:37 -0700
Message-ID: <20260906113037.4454-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260904134128.4656-1-tianyuanhao3@163.com>
References: <20260904134128.4656-1-tianyuanhao3@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wAX09XsTp1qzH2MAw--.24873S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrWUAF4xXr15CFyfGFy5twb_yoW8WF1Upw
 sxCw1jk3W8Kr1UCryYg3W29Fy3ZrZ8Zrn5C3srK3Wjv3WUGrWkKFWYqFW5Z39rAr47Cws8
 ZwsFgFyjgw4DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRHlkcUUUUU=
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbC4g7QXmqdTu6CAAAA33
Subject: [Buildroot] [PATCH 1/1] package/chrony: add 50-chrony.list for
 systemd-timedated
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

systemd-timedated discovers NTP services from ntp-units.d/*.list.
Buildroot's chrony package never installs one: on a systemd image
without timesyncd, 'timedatectl status' reports

    NTP service: n/a

and 'timedatectl set-ntp on' fails with

    Failed to set ntp: NTP not supported

even though chronyd is running.

Install 50-chrony.list, following the convention set by Debian,
Fedora and Arch, so timedatectl can manage chrony.

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/chrony/50-chrony.list | 1 +
 package/chrony/chrony.mk      | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 package/chrony/50-chrony.list

diff --git a/package/chrony/50-chrony.list b/package/chrony/50-chrony.list
new file mode 100644
index 0000000000..6b9cca00bb
--- /dev/null
+++ b/package/chrony/50-chrony.list
@@ -0,0 +1 @@
+chrony.service
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index d1745419a2..b2311df667 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -85,6 +85,9 @@ endef
 define CHRONY_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/chrony/chrony.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/chrony.service
+	# advertise chrony.service to systemd-timedated
+	$(INSTALL) -D -m 644 $(CHRONY_PKGDIR)/50-chrony.list \
+		$(TARGET_DIR)/usr/lib/systemd/ntp-units.d/50-chrony.list
 endef
 
 $(eval $(generic-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

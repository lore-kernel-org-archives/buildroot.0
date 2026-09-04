Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0444AC624D3
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 13:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2E3B40BDE;
	Fri,  4 Sep 2026 13:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdcYnUqiHQLs; Fri,  4 Sep 2026 13:42:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BF75D40B48
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788529326;
	b=O30PVjpLpgXufn9TijVYTuR7qZMQP2EaDqzBLK0n0xHpLgD+cWbEkVlw57+rcDGlUA3s
	 3ksJ+VkyhWbI1dSZq86newpiJYvIe9EoC+FNmiye8dJZ5JQb0tBZ36/Ql5L9WE6GvD1Pn
	 kiCXfa93cMDTu91iWA1Sqo0h+Dd8gr8ImKDaCHYdR9BGXIRR1WRQnsjyTrjlIUDREmXNP
	 mKemWot66UQAEJssSthWAIerAxBo5yvJhFzCDfzzDyXvPp+DAwU7OCzkxNhREkRgCLXw1
	 ZL4zZsA3v+KYYrIYxY2yMNGOi/2C/+hIbmMbefl3E82axo3iFEaPXa6oWiPSLu5QA9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788529326;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P6eekWDquPrw/GJomwgsajlAD+rDem5Uk8C1/INVx+4=;
	b=FyVS3EcwhcMg1+5Xbwk7d5hdt4814zPh/OvmMv172wjOmmoTLoxP6Hcpl12aedK6Iw1C
	 J1Jg1jmEGYjVa8ELQ+11CpZuak0NirELsgG/QIB99Qn/pGpa/c6bBaRkBq7612soA2+n9
	 YvUAcxTuFLLZeSj5kywUu1wSJ1s15tB7BC3rfHO5rHh3dmD+D5PHGt/r1dQhCqaUNsaCd
	 psAlXS7E2QaWPZx9kLGBCr/UsCte6p4FDbnVsQuIYzCmnu8dlwnQ7nW4ekiElavYhyRms
	 Sda4CBcMumd7yiuJlVrBDTqBwpXvr9IIJ/zp9/gnm8Dc1UcIJKSfQqBVHlTuF7MbixQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788529326;
	bh=P6eekWDquPrw/GJomwgsajlAD+rDem5Uk8C1/INVx+4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=pc57+N8AZM5zzL9NwQmGzK3gJyBYrPPHtgWpA/+VeFtmbvM7GGtbIOn/T3I9kiu3Q
	 /y4N+Zwh5F91K8qwl6CupmM8XBkfKU7xcjSXYPSoLvOLnMt5r7YYgFAjPVoybpLfI2
	 lugWRzHOdNTgFwOpFkKg6Y2JxJsJWR7Ol4MA4Qf/bylEnSiPc92OJApM051etwWv4M
	 1xntRBoae1PU8F61vgq3otu15MuwavTkDINWM7GvctjZaO04fzmA3SZyHMJssnqnMZ
	 OvHcnTWZDRxZmxUnJkgoZbe26ynJ8u26HQzUpLIHMAor8P4tNwZ9kAz/+ZBsiylTxQ
	 4O+kkXQ2Lt8lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF75D40B48;
	Fri,  4 Sep 2026 13:42:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 34F0910E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 13:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26DEE40376
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 13:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L05Bq6P70Vx7 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 13:42:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4385C4031A
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788529325;
 b=liTszAJUn1TmfCFZgnl31USEcQ428azmCnamT0LPDE2SrGdMA66gR2R90i61g73Lk17i
 5TBkq/3Qu0iDwG0XIhtsT41BQwnqjeTP+GnUAyKacNl4zGa8KvPUmJqChmZSbhUS5ID3o
 B8UsOLemdhzh4WRejXiok246q0g9VbdtRlFP7na3+UqPtbRGqwozhbaHIFEtf3CoxM+yp
 9DMT7rY5VIBrV3PZUN6Ip1kjmPDc1yEMjDEniiQErTvSBA3xdcWKIL4ICdlxxrxyN1Ego
 XN7VdIMguufZqkRRbg4j9O23gD5B6u//M/gteoD9oRni+jiX7yX/StS/wJgjj0vLhGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788529325;
 h=Received-SPF:DKIM-Signature:Received:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
 bh=cUNrcPqi5Uydi34inQpbvYT2DbcfGy/XVhdutqzR8ms=;
 b=Ep4FjjLRuHFva0ZsSilW0hBFOO19TWwpnZUsa6KTaN/LjHdlbAsdHYYOp7f2AirdzfKW
 Mtp32iPagfcwUa97hb6d9upbDz/QVHGnJQJEWCVJNx6IDYbhnasEvRBUlbybhYtfkoxVR
 2NU2KTb9FuO9xX1Fq+WMHfVz0gSPx6QRZjypBqtGRTURCr/irgxzPMsrijj2p0YDbSfDt
 euofKFimS//rdOXVmLYyTg4J5N53aNXXQCCi+OftZicypNqgnfwpkg/UxU1cx3TdEuahA
 43Jb+QCQJeP2OsTvLcLD/iVlBIQqtZKj7vTHEc5D7hCNlsYK38kjzR4RcnOjpyMJWRA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=163.com; 
 dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=dSC2Pwao; 
 arc=none smtp.remote-ip=117.135.210.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.3;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=dSC2Pwao
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4385C4031A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 13:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=cU
 NrcPqi5Uydi34inQpbvYT2DbcfGy/XVhdutqzR8ms=; b=dSC2PwaojDMfDfkXAq
 jXxhzfSUkdODKzHaEnEtVO08zmguM4ovizOMON9q0zF2v4fBRfyHTuieAi4KVxJO
 QKZitZlOsvm66G/X8CvQ5M8C54YIijccyomUTNdW6SPPLQaFe2gEVmKOTyVt8yJh
 nuQ9gg8V0gcSDjg8kGsGKn160=
Received: from ubuntu.localdomain (unknown [])
 by gzsmtp2 (Coremail) with SMTP id PSgvCgAnpZWfyppqFrJ4Og--.43035S2;
 Fri, 04 Sep 2026 21:41:53 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 06:41:28 -0700
Message-ID: <20260904134128.4656-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: PSgvCgAnpZWfyppqFrJ4Og--.43035S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrWUAF4xXr15CFyfGFy5twb_yoW8WF1Upw
 sxCw1jk3W8Kr1UCryYg3W29Fy3ZrZ8Zrn5C3srK3Wjv3WUGrWkKFWYqFW5Z39rAr47Cws8
 ZwsFgFyjgw4DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRHlkcUUUUU=
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbC4QEcqWqayqFnswAA3a
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

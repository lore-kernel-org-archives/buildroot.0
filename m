Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1185DCD8C88
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 02:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63E00407C9;
	Sat,  6 Jun 2026 02:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghFUndt7jDsF; Sat,  6 Jun 2026 02:40:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B803F405F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780713659;
	bh=1cYqsh+PsrhVunwNuM+2aukQqZGG2E/Q76TiK5ym4TQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Idw1hybeKb1rZXw+3iHEoHqkmWi0WcKNF2J2BKF83hDsWqFIerLM7wMBVHBYDa8pa
	 /G2F8LlNV8wfSR+SmpAepyFIKnBE2C9awaFH0hK//Y6KDDw/TkxV4axXn8T+t+yDWk
	 /92KGSj0EdxhcP40yJuqFLrwzwkqPwn2l9rL4BSRdIBE2QAnvRD+/XabewxtkYpBel
	 4K+Z5aBP5CrK5GYIZF0ib+UydYY1SrRDw4dhy3Zt9GbQCkiB0lrqlcHyiAuJAdJRPd
	 OuCs0xkTypHGPYut2sRCwZ3nbb7mt7sz2MPrJDxKyj7PwMkJYyRaaUP+dQSRp1SC3Q
	 oY2/yvILOXVkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B803F405F9;
	Sat,  6 Jun 2026 02:40:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76D05345
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 02:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6858541E1F
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 02:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkxarr-eag_2 for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 02:40:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.2;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 90BB241DFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90BB241DFC
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90BB241DFC
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 02:40:54 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [])
 by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id
 _____wD3f46viCNqhbUXBw--.17644S2; 
 Sat, 06 Jun 2026 10:40:47 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Date: Fri,  5 Jun 2026 19:40:42 -0700
Message-ID: <20260606024042.4765-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: _____wD3f46viCNqhbUXBw--.17644S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF1rAFyxtw43KFyUJFW8Zwb_yoWfArc_AF
 y7Zr1kJwsxJr1xur1vyFs8JrWYga9FkrySq3W2kr18AF18trs5Ga4Dur98WF18WFWIqry3
 AF9Fqry5GrnavjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRMKZPUUUUU==
X-Originating-IP: [223.102.87.76]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbC-Q+wPmojiK8iNgAA3G
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=KM
 MQ1KaIB71yY/WbzecIxEu3dlyPqh4V8qjzeV3JUmE=; b=BC2+Y3U1yawDhovu+D
 Qi2B3URzEoPjkiR+nN4wCPVCvyaDUkuPESTXf8Tjx6DWrJpObR5brZWE2RnU7MY/
 UrNbbCFhP741GC00P2cZEzqK777zzhy4PuofktyGVyy03OGccQjlV5k1GUV6gJAm
 ToPU+36QxwqoWugH90wJqwGR8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=BC2+Y3U1
Subject: [Buildroot] [PATCH 1/1] package/systemd: add clock group for PTP
 and RTC devices
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

systemd upstream added a new udev rule to set the clock group for PTP
and RTC devices, allowing applications like linuxptp to open clocks
without root privileges:
https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd

Add the corresponding clock group to SYSTEMD_USERS so that the group
exists on the target system.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9ce4f8fef2..e4484b9aa1 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -699,6 +699,7 @@ endef
 
 define SYSTEMD_USERS
 	# udev user groups
+	- - clock -1 * - - - PTP and RTC device group
 	- - render -1 * - - - DRI rendering nodes
 	# systemd user groups
 	- - systemd-journal -1 * - - - Journal
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

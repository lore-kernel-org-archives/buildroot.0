Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7E2EF584C
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 18:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8217F80F60;
	Sat, 14 Feb 2026 18:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v482pNhyiVnY; Sat, 14 Feb 2026 18:09:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 009B680F45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771092582;
	bh=/Fqamp3svG3a1kEl0FHFNIiuwn70RZL/P+/bqjTmnl0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bGadCZlfIyYRiGmPoOHSjMcafszK7aeq1hGpSRpiBL0Hr1ZgKWPv4G3Otxi3Uug90
	 2iuo7aI+s7ELW0iOn3UqrzLaT1WO5vC9soVQLhLrUL+ea1ZpTSeAWcSt9K0O7SATOd
	 plGh8uETEp5A9CsAo2jXwb67AMDYZWayoju5wh45EKjLb0A8WFxV0UdiVOfYTcb30f
	 E0gHZe8/1L/Q+iLg95EBGYzMDOfKcjeG6zYZ09RxY2N2fZWpa+YzuREC0cwWAT2wIA
	 K5tTVD3r20PES9iof/p/83QXis5kYO6CN68P1M/a9EHI4YQLoYElQWUaTOjPuRTcmO
	 kPndiuAak1YhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 009B680F45;
	Sat, 14 Feb 2026 18:09:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2475769
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 18:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 210AB80F45
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 18:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AFa8iG_zYwQ for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 18:09:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E718580F3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E718580F3F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E718580F3F
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 18:09:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c3ec.dip0.t-ipconnect.de [79.214.195.236])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 64788A4C0358
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:09:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57826)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vrK5I-000000000yV-3Gok
 for buildroot@buildroot.org; Sat, 14 Feb 2026 18:09:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 19:09:37 +0100
Message-ID: <20260214180937.1864083-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771092577;
 bh=nHJDLyQKs4oHlFVP8Qomg7FMULAZCU9nyF/bRzKmj10=;
 h=From:To:Subject:Date:From;
 b=B+5WYjY3t2eFBXH9J03kLWZesU+uP/SAnQ+3afoLBuNzIPAkWvw3QySJuKmF/fGC0
 UOBjYFGb5RtBJeXIh1J/ctg7+xbsXJQA1Lp1VQmtq85/fn2fIhBkXEmzZAgaM4wpO+
 BGBL1Epr4cKZkTENmgVjHK3kBfcQQYCeMIqBpxYfTjywxGVhEVjWn02tq970tSdyp3
 D+5v8gnWggXYeMMx9XxUTck2ibFkRe22nHBLixCBQhHmrWW2RM/wtCFnpHxUrFy9Rn
 MZEY6iUTWgUpRL1NhEW0fVAVUqf9q+QRHSKsmU/2p0o1e0g4oedumphT5404DChdM5
 wkyHrprpqAWnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=B+5WYjY3
Subject: [Buildroot] [PATCH 1/1] package/libinput: bump version to 1.31.0
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

https://lore.freedesktop.org/wayland-devel/aY56u6fqOsHIZJXx@quokka/T/#u

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 230b29b12b..a942bb069c 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c5169568f337c4a3bda927c42afef3a9d4c891e48a405cba39d57cb4631b9fb0  libinput-1.30.1.tar.bz2
+sha256  af04645cef8ec4ef9b571664828086ea5a610c6f3e872880055c7fe2c9377de5  libinput-1.31.0.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index ee7c2146ab..e018f87f00 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.30.1
+LIBINPUT_VERSION = 1.31.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

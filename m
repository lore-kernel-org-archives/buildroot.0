Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30262FD4F16
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 18:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD5F960B5D;
	Tue, 10 Mar 2026 18:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKs2RXWCzPb2; Tue, 10 Mar 2026 18:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFD5360ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773166074;
	bh=ZwqQVjxiFJKHS+JmNUbK6kFYztxk7bLSQXzr9PnP9ZU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=deSLSb67r7w23uYxOOZfINtFPkHXOUc4vBsx5sJ9k20Baq79o4g1OltZ2Xab6FrIC
	 3Z00WOnJ4aIvbclMIQgp1gLmHGPRQ9SPR1TBo9uTIjMsYUWCocdrFDaGkQPn5RR3ly
	 +gSMP1RK/Q70o4wFL6kXtUTQL+/mdIHNBbsKmHdP6Es7j0EByRduTXh1hfiybQxN2j
	 m1cCewCjlcHp62Ycz3/oQNvasz0q4GiqpUDrBBpg5C16Ib5Yb/aqh4ajMI0o0UCDxG
	 94xMRNUxEVFyJVrRor3/v+X+V8cZGlpDVERxLCT22e+RmFZ2JaXO669XNPbgJAk5sp
	 BSGFrBZKZADSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFD5360ABA;
	Tue, 10 Mar 2026 18:07:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C6BAB8
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 18:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61C4981D5A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 18:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i10IJMkdo8ZV for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 18:07:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F7EC81DA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F7EC81DA0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F7EC81DA0
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 18:07:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0224.dip0.t-ipconnect.de [91.58.2.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4AB9EA4C06B9
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 19:07:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35792)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w01Ui-000000003tU-3JCh
 for buildroot@buildroot.org; Tue, 10 Mar 2026 18:07:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 10 Mar 2026 19:07:48 +0100
Message-ID: <20260310180748.3875429-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773166069;
 bh=Orznmvij9Aezp/ypspOkHai/DqBBo4Ev0hW2CD7nk4U=;
 h=From:To:Subject:Date:From;
 b=tnpCSl56f+b3boWx7FxmI1xks0dJW2Hd8EMBMJAsV9vMDDSijW1p7zvKLxN8kWthG
 kqTtqRSJgY6GiUh8nBmrPFbNIzAvZmaVUtkMnRamukOV4ZE77cmjyuh57S6wqmXm8i
 griVEbKPtRf1xQzksH+wPfBNZkp1tw2EK2OpyjqGQbALkU77DDysIrOz5Iqt+UzP41
 obDVcMpS/F9a5K91RuMOmgCKyOI/lwhG+0WV+XBzMngd7fwU7gpUtHBDWnfSh3gbZg
 Kpe1xTMsHciJ40wuWp0aqJIrZu7Ppyc3+2cuDPtohDqrs1Ad6mVEmNlMfTCE5ET6Cn
 BwNvU2WC2kuqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=tnpCSl56
Subject: [Buildroot] [PATCH 1/1] package/pptp-linux: fix build without
 pod2man
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

The build errors seems to be introduced by a new autobuilder sending
reports: https://autobuild.buildroot.net/?reason=pptp-linux-1.10.0

Fixes:
https://autobuild.buildroot.net/results/6b2/6b2278b7af88cd22ea23d43efb865b2b3ff6eee8/

A backport to buildroot LTS branches should be considered to fix
https://autobuild.buildroot.net/results/136/136e94e408507062d7d57c1a1e246970a8d332f4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pptp-linux/pptp-linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index b6c740e710..e507b14bbd 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -10,7 +10,9 @@ PPTP_LINUX_SOURCE = pptp-$(PPTP_LINUX_VERSION).tar.gz
 PPTP_LINUX_LICENSE = GPL-2.0+
 PPTP_LINUX_LICENSE_FILES = COPYING
 
+# create empty man page pptpsetup.8 to avoid dependency to pod2man
 define PPTP_LINUX_BUILD_CMDS
+	touch $(@D)/pptpsetup.8
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) OPTIMIZE= DEBUG= \
 		CC="$(TARGET_CC)" \
 		CFLAGS="$(TARGET_CFLAGS)" \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

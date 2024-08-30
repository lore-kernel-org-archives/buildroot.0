Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE27CA0FE4
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 11:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0C164114D;
	Fri, 30 Aug 2024 11:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RdOlKKfqx98c; Fri, 30 Aug 2024 11:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E8474112D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E8474112D;
	Fri, 30 Aug 2024 11:43:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B19E1BF2C2
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 11:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 148A842440
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 11:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-l-KnhUnav6 for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 11:43:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.4;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 954654243F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 954654243F
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by smtp4.osuosl.org (Postfix) with ESMTP id 954654243F
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 11:43:36 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [223.102.86.110])
 by gzsmtp5 (Coremail) with SMTP id tCgvCgB3nyZksNFmGfZjAQ--.24192S2;
 Fri, 30 Aug 2024 19:43:32 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 04:43:19 -0700
Message-ID: <20240830114319.4353-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CM-TRANSID: tCgvCgB3nyZksNFmGfZjAQ--.24192S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw1ftrW7GFWrWF1xCF18Grg_yoW3Grb_GF
 18tr10krs5XrZ7Zr9YqFs3AFyfW345Cw40g3WxKrsIyry8Xw4j93s5Cr1agF4fWF129a43
 Ar1fXFnIqr13ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUbOzsJUUUUU==
X-Originating-IP: [223.102.86.110]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXQVLjWXAnAfObQAAsD
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=5O/tB
 AjRyYmq/0K4jblSKtLNxZozuIuofnN8klOvHWk=; b=ccywOxM14CtFwIbAxX5km
 KmULvc3+YI5CmIEjfO/rkb5F1je4PnIUGpzkj/APKDcRUzVxSN3sPVpRajfdDDho
 zlyKN7XVze0bOd6T801S2b/Zzb8bme39jJNFNjA1rR0GoCJCgBDTEBWMg52pHIgC
 BpYB+D7/9JqvD2vyGooENM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=ccywOxM1
Subject: [Buildroot] [PATCH 1/1] package/chrony: install default config
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

chrony needs a config file to work:
  Could not open /etc/chrony.conf : No such file or directory

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index e7e6931a2a..9ed9dcff56 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -71,6 +71,7 @@ endef
 
 define CHRONY_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+	$(INSTALL) -D -m 644 $(@D)/examples/chrony.conf.example2 $(TARGET_DIR)/etc/chrony.conf
 endef
 
 define CHRONY_INSTALL_INIT_SYSV
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

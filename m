Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F062C79FB9
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 13:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6F4B80EF2;
	Thu, 10 Sep 2026 13:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfLCydolyrIg; Thu, 10 Sep 2026 13:59:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D7CB680F00
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789048751;
	b=DYyl0Cg+RUyASHL9cjVZSvIh3A2uZ54O2SAvUX5Jg6i7mNrHry3tSXPcRelJWaZFiyBF
	 HUVp8gQ8+5bY08h79wckGOSrJo+S+A3i8rnCp5YSlEUYZwWjagiDWY+0H/+EUJQnxXoVJ
	 w12Hem0zSj8YfQP7xmTvHn/deEsmG7CT3ZTVNBYW8Id7n2Tc0i7H24aGJRE9lInVhkJ4k
	 Vs8RVzyJZXMAeSMm5Kku9ZuGVH+YjziM6TqCsE7l/p2jP7sVYcZgv+IAgBEJQr76g2IFB
	 6SBoUrEYq8vH64kG/9chhtErpFA3fHmNc9mRMsbazHDYSEMSBP6eif9FYJstXJst3yA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789048751;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yKArS5IANcrPgfAF3aZXyvDDtVvRHimNJbrJoTno6Y4=;
	b=dy+m0TVhXbgEPs86yVkZxxT6Ic0dBgocUGFpeWND90qBxSWC+7yjMUqOv9Hvk9LdoYGF
	 CQWUTtIK56q6PefFxb0nGvkn5KDyUhQ+JQUP0pgoSSJce8sROsi5CrnkixjZRNwIVAmpN
	 TTP93oqAjpZMW4beCHDDANJSwTCJ7AOESUkTMs6dlYOx6qMZyZEQcfFsZocupOvMpwKZS
	 c9nykNgflaHbQnCcPOgtFlscIx5uFQv63f8AVVVRctDECGQt86+hsvQjcqHvU+nNBKGWy
	 BKsr6tqg/LjrbuHx5W4aUjnzHMLiC3/vUagQC8pPila2HFx2VgmerPlmzYxkz1FXmIA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789048750;
	bh=yKArS5IANcrPgfAF3aZXyvDDtVvRHimNJbrJoTno6Y4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aHtJbrwLS3aD03paypXqyMMZGcuP7hLrreEOneLsXc5c5G7haWw5xE9tK8F+cdNus
	 pkH532KYZZTlmlDN0OQS8ru/EyUrDDF3mqxMru611vxjeOzzytp/Peedxy6w7Qxe4u
	 y0YecWesnnV7HHJbFXoHugoR/SzAh4Z+Lyyy/E+Q5rtIkLeYi3UGbdxbJX0Ir1xg9N
	 Pmeoeh1SHvi7joycz3TiTKlK96uMBiDKEzKCMuDrZN4gCIqHkFDfq6KYb4jUBKS4nv
	 u21D9fgptlhryhkp/ZGhbty+RzdC7FpSharwcThzWGinprkvo+/+DCRTG033DtfcOl
	 /LFAetQK6b7Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7CB680F00;
	Thu, 10 Sep 2026 13:59:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 088281EA5
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 13:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEA1340AB1
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 13:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13LP8_R40D1S for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 13:59:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 28FF840A37
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789048748;
 b=QFrxwaukyAMVK+LqKZyOw/I7GnQ+CTTkJ/49kV19jec80gHZpzM9NWIdJhmZV233qawW
 Q2Y2ttTr6sLZzO8TtGzgbEhUczWdwaxJGSuTv0O+S+AwCfSIo8ylNcEEKVnFaWIUgpaRx
 XnHCgO5NUiXY+YWNrscSU4TR3M1LJo3HqVOYKAyVWcpxuv4TZWf1qoj90Kug9Uzw4NoYU
 g55cfqHDhoCipNdVVsGqChulCvAZWbMvE1s02LTtOWGO3kHg6cvtA+sICo1kD/u+ZNBYR
 rQck5pmgH6x7sN8lw8Q0uyxLV0N6jyoI3oeVuYUizneQwx1l+jtxVa9rjhY6r9LVM4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789048748;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SfwcWaZ64cqSTAMnEJLa8XT+NYmo4uMlAdPVWzcy8iM=;
 b=YnyqxoC8Zvz7+bneUysVZvalcAJ2soLeZflkaPEVSXl/VdR0qkCATxuhAW6rOBLgQbrm
 Zs6cfwJz15x8VehWu+xS01PLgvrNpiPd0+BY7XIaLrioAFJfVy/zM5f/oTtgOmhg4P3hG
 znf2S3e07cR3E7YA30n521vh1mRdJ1eCA/lf9o3Q8iv1xUJOGUhwVWzJlrRc5TwAyL9XD
 GLuSFcjtFrTj8OqShFAlO0CZGbHD88gp2zuYN/EIEqkn+OsF1idL9bBg56p9zfxwzytxY
 ytt9ZvQsCZfh0uacFob0+7adSRDB0K6aNdUUHgezvjzHqtN+XUZPqlDNCxqwnxQm+UQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28FF840A37
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 13:59:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8C1C9554D; Thu, 10 Sep 2026 13:58:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 14:24:50 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 6f8312c820c88f5ea01368e9c1153571bf88ec2c
X-Git-Newrev: 4a7136948f7b6392243d6110be1c7b7270751cb6
X-Patchwork-Hint: ignore
Message-Id: <20260910135804.A8C1C9554D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/dnsmasq: bump
 version to 2.93
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a7136948f7b6392243d6110be1c7b7270751cb6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://thekelleys.org.uk/dnsmasq/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 374d0a02e4595247aa15c34d1bc35c5dcb316c7c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 74ee5c415b..176e73899e 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://thekelleys.org.uk/dnsmasq/dnsmasq-2.92rel2.tar.xz.asc
-sha256  43d72b8c129bdf33d17bafedc98823f63e46b5005128066bf0d2a472a32ce06a  dnsmasq-2.92rel2.tar.xz
+# https://thekelleys.org.uk/dnsmasq/dnsmasq-2.93.tar.xz.asc
+sha256  0c00d4e5c97c8306e5fb932b348b34269c9c29a0e7df0e8e82958b407092bc19  dnsmasq-2.93.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index d7ae8a3312..b9a76fd5cc 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.92rel2
+DNSMASQ_VERSION = 2.93
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

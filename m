Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C928C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 10:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D17CF60618;
	Sun,  6 Sep 2026 10:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkAIjR6ryVm4; Sun,  6 Sep 2026 10:33:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 650E7605F3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788690784;
	b=qzQSuwCh6uabTzE4fR223OH1OETdCqyzf98pSsiuA8v/qigfeS1pmkzhwBfe3V4EdYUG
	 tu/oq31aBNOEtaiYWcEQeTRuAxbL4c10zoBvdUj7Tskk2YMbmcROFuw1KVUYNfAj9rFWr
	 biUXQ40A78I5KD2L+T33zWluIleY/V7lOHJiQOil4ooWI+uKJwvlPT2e0iRqhBYDTFb+W
	 EK0AiTmKECjo7Atop3Scp8RuNrroZF/Qm8ZGpRx65Bh9vysB3EpK9yI57pJ7pWDbWoeMT
	 h92x21ojMYwjFX6mF/50xbP4EbDkhngIs8/F5WINN1vV+KU6hwCF5mQX0Lq6UPLjH9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788690784;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=qsmXBZvPRP2FlfZjyybzslNyuFpS82SMJCuYcDrZ/1g=;
	b=InPPdnw5Qaj7wEV5sIAIL/xBs3y0jG6zp6g5aqIHNsuVRhYGXQc3mZ56DLS90gHh0M88
	 jDus/g2IIyTLd4zPiUp/XbO/I4YG89O26eZKgdaIxA/xPV1vmmh9aClcP6Riz4UZ2yX1T
	 UX2FS/3QbqCaGbZlEMq6DgHJM+YupRZ29YtBX9CnIhaIVLXNgU3gLNAlYZxfIgvLzsCED
	 3qjeM/5BLILIQjV7kvph1k9GCesIgo/wVTG28/rZPwcvPQ88ef8IttufQQ5MkV1bTToK+
	 vzTsjTXC+Qi9LaS1CUFoTygg4wCpTamGm13qiBPqPJ/X1zh7rIpHIlWNSuARI3ulPvQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=XJydIOCo;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788690784;
	bh=qsmXBZvPRP2FlfZjyybzslNyuFpS82SMJCuYcDrZ/1g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ieOlEU5QxO3v7EhxPT2tIjwblyhu1FoMhpwgUIJvC8zo37rc2oim/nRMYmsVIvud5
	 ZEzaS+q0PjS9oRuksbwLeqoEiKh8iBZ2Gf7BSCBKufMIqSWdgFi4ssB1zxZZRU2/cS
	 bpk2Fnp/hAPzp2nHDxn0Lv5Ou++IvE2bzu9cBql3Fz8mOXa+bOlNT3VMxbka9xKtnn
	 AV+eTZF80lMJ/Lz8b3DC7doIJhKPNAslGc/Nbo6IGlybt3vOBkx6bcLeg7959iJ5Tj
	 9qjsH0X1uY7BdgXXVYvrCker8ugt/rQi76G0magwOpyFYQg4L2lTrfYo/nnXkp1nO+
	 qJOlcEQ1B5aLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 650E7605F3;
	Sun,  6 Sep 2026 10:33:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DD97990
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FFE0605F3
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlC4VQ9xa6ZT for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 10:33:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 45DD0605E5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788690782;
 b=XEc/pdEdFWfOBLeSzeVyn48sP7Hfp7cs6CROLchi6FStkUwdlAZSX09uQijxlLr8ikaG
 WWsxOTj1xKE6IGBHOnyHW3cdPpQ4CygQjwClzIKyEgA5FrYX6dCPa8hs0mO+pPkMQGIt7
 4yOjJ/bHlZqA2xS58sOTwzrXPgsonm4/DKI3lcKzHI1QcMjAzjhq1w5boPM5sJXLNeZjs
 bLl75FFtsOW4uKmT8W+P26UDg7DsKJx+Ul9pL2nEUSQT1YAUQpuA7BxqWwJPT78zeGlfW
 LU8ML7H4dW1rBwslcrFZzpmFqx4nOwrkq/5UzKBFHe/asF0Z8H1CtNUXJf+IOKFaAqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788690782;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=qIED96ZDtt5HiXKxJ4HSw+eIaRkJ0gUpkLXEV9ib9L4=;
 b=CqxkYL53yRxs2vzvwLogBl8DLGjswEGgMZHBixuLvHcXXPQt4UE7S0JZnocxMZI1UtPk
 JUhrfrm67F9tadrjBGShvVenQwBwmvRwxBcOFh133GqxGM6SKuLMszAIT7Jn4pSbvk2D+
 KvEJAX/UoOxdptI2Dq7DrQ9TOHNl9D7cNQ7LMYIzU8WiBjuU+ULGDw8ejguzjg7fsBZj/
 akiz5gbhN5WnzA4Qd3iiCzeGq+jkihbnPAGzGqa7rSfzgVCbwv+0M5P3d6huTSnJEVr3M
 iGsbFrZJ+wn2/BsagnSS3s/zntQ/SEAVwCKkxNt+QR+zaqgjVu6IBofS+bSuklK8gRw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=XJydIOCo; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=XJydIOCo
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45DD0605E5
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788690778;
 bh=qIED96ZDtt5HiXKxJ4HSw+eIaRkJ0gUpkLXEV9ib9L4=;
 h=From:To:Cc:Subject:Date:From;
 b=XJydIOCokXocjy67R94b2V7jk3J00P2S+sxMmS0noa3Nbo6vdJ+ZEboH4wTPOX/5S
 XUh4NtM0jaCFiQFqiqwbKmtDBWnFWCfgaSqWBHK04FNsnWgQtFBhQKJzeHGFpp68n5
 pu9kmULiwPjk+vTXCMvAk+WmLPAwkwqjSIoh9gEGVV4BqJUOx+1gayIDDMgz+WbtR7
 EGQH96NpPjQ92fZfw+UnSyVa6Y5hRNkMknvpXmiNUUCXLtKEYupi9OWfv/0GqNtXn3
 3K/V6AF5VmIYfQieBzTb0ywL8xhNI4ojhoRxkS7TNDLga7Y4R8hwdFTk9T5Ns4wynq
 R1z7oAXdGQJEA==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5BD66A4C3472;
 Sun,  6 Sep 2026 12:32:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53358)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3ABF-0000000048S-3jqR;
 Sun, 06 Sep 2026 10:32:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Sep 2026 12:32:51 +0200
Message-ID: <20260906103257.3688362-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 1/7] package/strace: bump version to 7.2
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/strace/strace/releases/tag/v7.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 8df107c948..0be750c96b 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
-# From https://github.com/strace/strace/releases/tag/v7.1
-sha256  81743ecf2a5b44186b2f5038afdc8beda7e5c70aed15b4fbfbcc6e9ece24490f  strace-7.1.tar.xz
+# From https://github.com/strace/strace/releases/tag/v7.2
+sha256  4bde6246926890dcee824f6e6ac42a06752f47d77e5097d86e3c0d6d4b709fe5  strace-7.2.tar.xz
 # Locally computed
 sha256  b897cf6bb865cdd72f49fba6ca7b66ad075b9bc51d3cf372923220ce18b5350f  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index a0688939ca..9634a6d02b 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 7.1
+STRACE_VERSION = 7.2
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1018C88E73
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 21:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 287FC80989;
	Mon, 14 Sep 2026 21:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FltGTHuSYiuW; Mon, 14 Sep 2026 21:43:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1F18A8098A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789422208;
	b=ZzMTCJaiUsqtNgr30SAbuftWKG8AL57qyfqL1v8zPlT1KjCyVim0z+t9f6KCA+FURbY/
	 1fvJd1JAn3BPkXh+HyxJjjZosiBihrxSUXZDAAt8dMh1/Ifephk7c9Ut6oHF94CzxwT30
	 DZgbbCzdwJNJUEsFaOqOvuDPJfY2zGmm5vzheBCiyow73DsKe0yabSSczDD5+1arFkOXt
	 DG+vVkb+r0EDSpNeqPMCM+iPdS/typ/DRhRDvno0UW58W2Pee7iu6WsLSQ47QP+8g82RO
	 A/WMPOlnTTrIqK3Qlxy9zbFsyTfblaY/B/TW99el8Ue5fEuZNcl+hcBdGCcZJHIUJdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789422208;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:MIME-Version:
	 X-Rspamd-Queue-Id:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=W41rrOOcyWmUTswyN/eQJlp0M2OwoPhGoh6QAw3n8Vc=;
	b=X1sbAX2Xdd3njM+fS27+efSUNxRzxVeehJvyh2uRmEMw4z/TKWv2ZAeNA/Dv0m0GDVGu
	 zqS6lCdSS2KLvjahEn2Cb/hfaAttjs/14mFl+TR0NuMYuHqxVa2yKcmkPtM2RoPYFy8lo
	 Q+SvxbVQxKAgPtbmA9bqAE3dO6KWag3rtv745ofBjIMHcAk38+2Q47AexiiQE83GmSYAD
	 hoiQRNve0RXgCkGf6DxxT8gCRoLh5cCgoNH7hninKjAIW64z6jZS2la2ckheVSlK0z1r7
	 XVrJsHMoAQxL4Czvr7VrFxbDwByknPDYQuq54Sv1RJZmh7OhM8T/eCZ/SPKmZZs0PZA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789422208;
	bh=W41rrOOcyWmUTswyN/eQJlp0M2OwoPhGoh6QAw3n8Vc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ouRiceV//9Wc1aJ5rF6sKpBdiB4BjdORcgLcMBFTmSvseEsOR5bpiYLNUGbs4AtdS
	 iL6YGwsBUZas2DrVtSosw6YtEpRmI4+Y98pE5VS7QpRhbYpNUKLc86clmX3+HEKDtD
	 CjlkVcv4frPEZTUH82kN62YmqWcjfawM2bOdFwuSePGtulckGwplLZ6oiKVZA5idxg
	 zLlZ2MBZWbLcP6i4jbQMfMUUwuVpeqogU246g6djN1wVJNkqnOwqycaqM4OYzsm8jQ
	 8MPyXM5It+jk20TQGIErFAMmnORnpHeFnlMrnI9t9hLpvwIfte+9W3Hs7TW6wFt5hf
	 f3DBiYX9F8ANw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F18A8098A;
	Mon, 14 Sep 2026 21:43:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69D6E465
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 509984052B
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YgW9DKAmEJDA for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 21:43:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 16B7D4052A
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2001:67c:2050:0:465::102"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789422205;
 b=gzSUJ0p0TsdIWlLKqo+BQGeJcobLRNV5KUaDr7wrhVwQeOXEX8BMDhDlEZUf+YE4tuvV
 0Zfl2ISiNYuOuSe6NpfVczAF+KvPo+dqXx6zaEAi3Qc3U9ernntLF8pfJEQFa54NhG9GP
 9MVJSlss3dM+ItG8xhv7OfoeHfS2kkF14+e7XANFIk1YSwE+H5SGcp5UeC5WKfmpEkYH+
 xeJcTSYqxce0yOhGkVvGDcxC/7z5lgzxsETKWztBLz6q1Q7Z6Vg6WdBWZGgLRETiGEcIZ
 jOxEb3Xqul0vFMHA9zQQAJikmz96gHn3I7JHzpkm2ChhpFj5E+GKzCZ/Pnh2zYDt2QQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789422205;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Rspamd-Queue-Id;
 bh=8j+Z+HVoDjE87Xl2GFNwF9UWoJFZpwSUBBtM9OK8oBk=;
 b=RM2CHp0qCI3VFKNk/dDoIKR79zP3pSHZ8Tit6oCDnY1PXINyiDUQGfmk6LJD1tICFzrG
 kBi2BJ6C31faTMf3nBZicM29w+O0Dg1mlmXrd7BOra3qVS0SW0gZcNrgRtrPb9s4aZ4Zz
 dXvTi7sRR+xsoBOTTFH+44hETdQhyh3zlMMOjyrFNzD9OBCyVa16aFU0/Y5VG5QiOhCfM
 lg4/scR+RJUE6SkJ7s3zr6WIfSqeUaxdFVdDmonY3MkkVMo39ZQ1ZOHjD+zd4KGnHTnSJ
 P1XOZx2ZOmByBH75EzV3QLnVkgYbdPLYsbux7a5PTQrSpY3QNwaNlGJ4Z9TdN8MsbaQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=t-voltmer.net; 
 dkim=pass header.d=t-voltmer.net header.i=@t-voltmer.net header.a=rsa-sha256
 header.s=MBO0001 header.b=vlHvdM07; 
 arc=none smtp.remote-ip="2001:67c:2050:0:465::102"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:0:465::102; helo=mout-p-102.mailbox.org;
 envelope-from=mail@t-voltmer.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=t-voltmer.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=t-voltmer.net header.i=@t-voltmer.net
 header.a=rsa-sha256 header.s=MBO0001 header.b=vlHvdM07
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16B7D4052A
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:43:23 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hkJYM6BKWzKmKC;
 Mon, 14 Sep 2026 23:43:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-voltmer.net;
 s=MBO0001; t=1789422199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8j+Z+HVoDjE87Xl2GFNwF9UWoJFZpwSUBBtM9OK8oBk=;
 b=vlHvdM07ke3ZodFDfSdset2rqTG3vh3dadNba1DJyzLqeh2bNeDdCjlbnp5PyaZbRw5moc
 kfoRD4DzdIlOe9SVAQ71qiTjPLJeXosJiau4ycPyYlf5pElid15dNDZQBEljL22GEIDDFX
 R5+8+bGyfEdbhzKK3zOL8xnvEqvB5HgcIh/MV0lLXWgxP89D9/Zx0c9X3cAK5OnyaMDyHQ
 jz/5xyiBGUa7W3GwxM+sTDfeMX/k9SPvTeeqlOthW3QdnOkCj1bWq0Ari+YObLcN7/GuLa
 r55Dxuuagww3UCPUIMNf/MnocceE3vre3echmDAkMY9thG/ym3REW5SvBFRBWA==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of mail@t-voltmer.net designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=mail@t-voltmer.net
From: Torben Voltmer <mail@t-voltmer.net>
To: buildroot@buildroot.org
Cc: Torben Voltmer <mail@t-voltmer.net>
Date: Mon, 14 Sep 2026 23:42:57 +0200
Message-ID: <20260914214313.3516-1-mail@t-voltmer.net>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4hkJYM6BKWzKmKC
Subject: [Buildroot] [PATCH] package/espflash: bump to version 4.6.0
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

For release notes, see:
https://github.com/esp-rs/espflash/releases/tag/v4.6.0

Update the Config.in help text to match the list of supported
target devices, since espflash now also supports ESP32-H4 and
ESP32-S31.

Signed-off-by: Torben Voltmer <mail@t-voltmer.net>
---
 package/espflash/Config.in     | 4 ++--
 package/espflash/espflash.hash | 2 +-
 package/espflash/espflash.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/espflash/Config.in b/package/espflash/Config.in
index 3b08bacafc..b9d7784133 100644
--- a/package/espflash/Config.in
+++ b/package/espflash/Config.in
@@ -6,8 +6,8 @@ config BR2_PACKAGE_ESPFLASH
 	help
 	  Serial flasher utilities for Espressif devices, based
 	  loosely on esptool.py. Supports the ESP32,
-	  ESP32-C2/C3/C5/C6/C61, ESP32-H2, ESP32-P4, and
-	  ESP32-S2/S3.
+	  ESP32-C2/C3/C5/C6/C61, ESP32-H2/H4, ESP32-P4, and
+	  ESP32-S2/S3/S31.
 
 	  https://github.com/esp-rs/espflash
 
diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
index b64717cc50..d26bb63142 100644
--- a/package/espflash/espflash.hash
+++ b/package/espflash/espflash.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  95f052a272832d40cd69b9f62003c475ce6625f4002f751f3275ddd3344f899c  espflash-4.5.0-cargo6.tar.gz
+sha256  7be8c0737fba604ae0801c68bd5425d89e78f369bfe2d1a73ff568d5a55a7e27  espflash-4.6.0-cargo6.tar.gz
 sha256  811f4d4d7ae8f88090dcd14cddf1982ca75cc30b5604e6ebb636693d9b885788  LICENSE-APACHE
 sha256  8daec6f7e829af4dfc7c99a251986648f718b90589aa819bc48be8ef82b0c12f  LICENSE-MIT
diff --git a/package/espflash/espflash.mk b/package/espflash/espflash.mk
index 6dfb815002..219d02d7cd 100644
--- a/package/espflash/espflash.mk
+++ b/package/espflash/espflash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESPFLASH_VERSION = 4.5.0
+ESPFLASH_VERSION = 4.6.0
 ESPFLASH_SITE = $(call github,esp-rs,espflash,v$(ESPFLASH_VERSION))
 ESPFLASH_SUBDIR = espflash
 ESPFLASH_LICENSE = Apache-2.0 or MIT
-- 
2.54.0 (Apple Git-157)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

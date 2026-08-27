Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C9DC61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 16:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D55084080C;
	Thu, 27 Aug 2026 16:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xMocLKkqn5p; Thu, 27 Aug 2026 16:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787849745;
	bh=A2foQQJMeGLROelqWiqp9586aXwVTEoSOQN3UGytrZs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Pjfj9TBQ7wA5oxoQFUCn3wEWp4c3oXvSHSG3LvLoMtek40137VyZGIl1jUo/cF8zC
	 1t/3K9Hv12aQYV2gxT3//pqTXlIFzoElAfUmEAeMUKtjsZ4dCmWF3YjwKUnclacVIM
	 dRs9UbWbi0PU4pJGw+mvHLnIdUy5DzKVtxHm7GB+eub3nVjym0JoIwYsEy+HMFs0Ws
	 iv/AjnxxZLCl0InGGFNvO3hHIQQWN+Av7AdNqO9NTTZOUmYX5EVNsTxPnUCtlQtwme
	 IiZeubQmin54NQSmqwCHMNVffdtoigVK8Acu34PGlYNU3T42lziB2N6APKZ8QM9X7E
	 zmppfdhDYsLuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 647EE407F3;
	Thu, 27 Aug 2026 16:55:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DEDC355
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 16:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0489A80EA3
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 16:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7R5dlylLGgW for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 16:55:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=MkA3uSZk
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 578BF80EA2
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 16:55:40 +0000 (UTC)
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256;
 b=MkA3uSZkrIJvbpKnvElaHsdErf1JP5FaLKXP0+kN4rkkeux1TxA9o+FtxSOeC54Gvf4SvanZvmIyjEEdV26QqVJ2clfIRE+Jyp+qZa9GIzxXBAIs4iRF0iidKBSBNGIkJvAQQCBHJEkbD7k+PrM0f4nY1C5RfVo7MQQAmRNMEx7MxtfhZm63WpHKU9XA25WhOjk6s2oOyK+xOO6Ra51fJDfUfVsLgwL7u7ADMVvW6RhLBvwHpzYj5StHZJZpEdoaRrtHaR/iQVa4R9TtsyJ7Qor3jgg41DQ/bPBCGXK5Bj7r2v9WRwrWperXEzi7VgLjUpC34m1ZSTqNDd/5BtNEuw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=tHcUNGjyvPqqbSvs8khA7hWNL6iPllaRaJBPvizKtBE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1564002815; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Aug 2026 16:55:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wzdO4-0000000FhF6-3cO9;
 Thu, 27 Aug 2026 18:55:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 18:55:31 +0200
Message-ID: <20260827165534.3741128-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 1/2] package/haproxy: needs signed overflow
 handling
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

haproxy has a runtime test to verify that it is built with -fwrapv:

haproxy
FATAL ERROR: invalid code detected -- cannot go further, please recompile!
The source code was miscompiled by the compiler, which usually indicates that
some of the CFLAGS needed to work around overzealous compiler optimizations
were overwritten at build time. Please do not force CFLAGS, and read Makefile
and INSTALL files to decide on the best way to pass your local build options.

Build options :
  TARGET  = custom
  CPU     = generic
  CC      = /home/peko/source/buildroot/output-haproxy/host/bin/arm-linux-gcc
  CFLAGS  = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1
  OPTIONS = USE_THREAD=1 USE_DL=1
  DEBUG   = -DDEBUG_STRICT -DDEBUG_MEMORY_POOLS

Which comes from:
https://github.com/haproxy/haproxy/blob/v2.6.0/src/haproxy.c#L3008-L3037

So build it with -fwrapv to fix that.

Notice that this message also embeds the build path (through CC), breaking
reproducible builds.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 970347d3ed..f75f18e031 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -15,8 +15,10 @@ HAPROXY_CPE_ID_VENDOR = haproxy
 # https://git.haproxy.org/?p=haproxy-2.6.git;a=commit;h=832b672eee54866c7a42a1d46078cc9ae0d544d9
 HAPROXY_IGNORE_CVES += CVE-2023-45539
 
+# haproxy relies on signed overflow, so MUST be built with -fwrapv
 HAPROXY_MAKE_OPTS = \
 	LD=$(TARGET_CC) \
+	CFLAGS="$(TARGET_CFLAGS) -fwrapv" \
 	PREFIX=/usr \
 	TARGET=custom
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1985F8DFFF
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 07:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D47460F42;
	Sat, 18 Apr 2026 07:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zBcpk5SGrOez; Sat, 18 Apr 2026 07:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA62E60758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776497611;
	bh=hvwdlNAwOGSVtxntRT75wTaOezXJJVXIEzVSJjuGTE4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jel4pLOUtLmw3Ur58UfpEqQfQnVvjBuetWXyl7HjRyKcXVTWXI8CvlvhAiTmGxFZO
	 z+ayBxi5QA9XVKSEV3fF3sOJ6prOd/xbNzKybJqzCxn09TiIqBJfvYBwy4NUO7BjM2
	 EieBUXqqNDOoLkJZGEOkpLRznfqHZnVqSGwtUEU1RdjrFV6cy3O06TmR8amsPWyo+s
	 Bc8n+pDnSlCwhaRIkubh/UNtO1hI4unoXIEbAYeSBoJijWv5hGQGizEQlfxAw3hTsQ
	 OUG3tt/5pzbYC/tq6AswrtpYuPt7zkYUZX+QFp2MfKK0bEvE9OeZzOA1+FbjPC/++Y
	 0FhyYT/kZ+cXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA62E60758;
	Sat, 18 Apr 2026 07:33:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E4C7369
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 07:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AC5260758
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 07:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Pc4mJJSoB7G for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 07:33:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76D2E605EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76D2E605EB
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76D2E605EB
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 07:33:29 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2ad617d5b80so8434405ad.1
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 00:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776497608; x=1777102408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ANUugMYgEIgBaorWCy/eciy9GUbtQAowmKC7IdcIBYw=;
 b=E5hzOfMBDvNNw9R9uPXfKmIY283a6hBCWuq87WNLosgB3NLgINb2Zb2PwlDVsUtI0C
 71FqfP05/3KWQdLwUNqz7gquTayScvihJkR4VPJcwQ0TSRPvpSVra2Uy+ReFRVn6e71f
 QVC7K+kuSG7iNqQz10YEiD6ij+i5ZH3iDIrUtXgTza1KH5qa9tcnmWmg+1Uhq9gD+u4J
 JlKrRHPzyYZI8sSY/uZuxc+XEQQO5vE+ZDJoJsOKc+IczxrD0ZNkA+Zyj/22hI2V8JRU
 3RH2WMobhaQHvdVDsQq7WEmfvM0wj9Bjr2lbGIIJQ4DtbubNGsO1aMXDPQAvCG7bJLph
 MKuw==
X-Gm-Message-State: AOJu0YzeYj2HDq94MWj/7QFu4l/3bE7T1iqN/zH5XgY6IFtlS3cA6tMy
 tVX20P556UvyRjWomauZ3+cH3MDCtNgRpuo3VXgru5x0y99AscgxnnRbwjEQeA==
X-Gm-Gg: AeBDietlIuv/VZbBQtVtClCGEVw8ai8ZHi583F+AAHf4SLUlZSq6txCAG+nxNaEbAgB
 84aQgfcLDP+1zwo9OuZTPZDixEdY2zZutc31pKbvoVS3MRGFO9h5AsETnRXgJcezdFjCBaB2baa
 uvPTJjR65j2mwBTan22+xCPGQnl3TSS985TcQxjWmu/RJdXcuHtcZywvY3Wsn62/e3zOHKxFdy2
 PTJxLuaALWJYhUhpgIcGhyk32ypt+zcE9SmH4uTJRgUGGP1gvdlHA0AIS8RG8GKakltTs7uaYkE
 r6UPAQrRdovWfl7d2Kg4FNCZYmdIR8sdRoA9zXIpmwqPrLCTv4iWWSmu86QXC9qbM2NAdG3kva+
 VBRc2KQTNlimQJu/6me41nt/jms6Tr54WZAua6o4dUIIqtIrX9AgTFcMDBfGFF0xZQSwGdgHhsq
 8cCm2XYMiGy+aPpwR+7/1quPRUCaf/ILFlxLjdf/QeP7F1/YxD6LAObMKo
X-Received: by 2002:a17:903:1aae:b0:2b2:45b7:306e with SMTP id
 d9443c01a7336-2b5f9e85fa7mr59832465ad.3.1776497608269; 
 Sat, 18 Apr 2026 00:33:28 -0700 (PDT)
Received: from fedora ([2409:40e5:112e:daba:4994:b597:7615:a059])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa33486sm50804975ad.33.2026.04.18.00.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2026 00:33:27 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 18 Apr 2026 13:03:12 +0530
Message-ID: <20260418073313.37718-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776497608; x=1777102408; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ANUugMYgEIgBaorWCy/eciy9GUbtQAowmKC7IdcIBYw=;
 b=LYZJr+YPfc1mHId2DDndSSSaoODKK2cT5CZR4VXCio3MbjOddq4peZ7XJI9CfzLwN6
 dsyIf3+qMhKGdmeUXXHwfWFrdO2gfVNp8+ZoXU78qRT7Bwzl06qE3lL7FQuPgp2wl24E
 Hb3LUawZv1ZNoNxvtQP+oxPU3xuRFphOHpitGGthxPTDw8XIzp8b7ysyvNa9GytS2zvC
 KBnEzJvuvyBvxc/x8m8tgbnQZGmXgJN09ae1ayIvR9HzBfoxmwN3TsFB2xlE5EJEEOEv
 CRYj+Qsluz5wttQTfk0q7rRy+xXUN5H5svwKJagsoTaWJxp75P9mNEm+2hGtFmOEBt8/
 1EAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=LYZJr+YP
Subject: [Buildroot] [PATCH] package/psmisc: bump to version 23.7
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

- Fix --disable-statx build option
- fuser: Add stat() fallback, ignore EACCES errors
- pstree: Fix assumption about root PID
- killall: Output formatting fixes
- Update gettext to 0.21

https://gitlab.com/psmisc/psmisc/-/tags/v23.7

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/psmisc/psmisc.hash | 5 +----
 package/psmisc/psmisc.mk   | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/psmisc/psmisc.hash b/package/psmisc/psmisc.hash
index fe146f90c9..646c01b3c6 100644
--- a/package/psmisc/psmisc.hash
+++ b/package/psmisc/psmisc.hash
@@ -1,6 +1,3 @@
 # From https://sourceforge.net/projects/psmisc/files/psmisc/
-md5  014f0b5d5ab32478a2c57812ad01e1fb  psmisc-23.5.tar.xz
-sha1  a16073f459a19288c1ea2b413a84e1b996cab595  psmisc-23.5.tar.xz
-# Locally computed:
-sha256  dc37ecc2f7e4a90a94956accc6e1c77adb71316b7c9cbd39b26738db0c3ae58b  psmisc-23.5.tar.xz
+sha256  58c55d9c1402474065adae669511c191de374b0871eec781239ab400b907c327  psmisc-23.7.tar.xz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 3229184459..85caf30653 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PSMISC_VERSION = 23.5
+PSMISC_VERSION = 23.7
 PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
 PSMISC_SOURCE = psmisc-$(PSMISC_VERSION).tar.xz
 PSMISC_LICENSE = GPL-2.0+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

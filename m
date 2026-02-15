Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B665EF587B
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 14:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24CB16082D;
	Sun, 15 Feb 2026 14:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVhWdMJZdgB1; Sun, 15 Feb 2026 14:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38A2360850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771166971;
	bh=VggSp2ZrHAVZmKtWf51xdzv2oXKKVNIuj+8jCRMfg3E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i9pqzSQ/dSqW4h43KxDCi5nmGRXCMyYl5jSHfLFoeC7Z6GExiRlR87HnSOTkGu5Mp
	 uvB6VgdU7MxfHTO2orTA6CpgV5q5/9VTP/8fe2Aq7wXNVlSrNNFTXOuvrBBu4KtjBz
	 bdtE+D71afFxGQJWFxtFH5Dw0kGFxPYTVnwX6OO1pVPIQ1zAYFvYPSSvQORw1mM5A9
	 gU3bQ6wnSKGleRCrDLAcySgg+ENUXFjO+WYYOm7lbRqv1zlU5lYiWwn3gmbZbPSdIO
	 ylm+fitiWU8yybgE5KhNKrT2zP9xdd/pBLFddMAXIy65EJnH5zKyRNL6pie0ViRDn0
	 ZEJsfca65MDwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38A2360850;
	Sun, 15 Feb 2026 14:49:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24112375
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1215940A67
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJHR0B-t1vtt for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 14:49:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F385040924
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F385040924
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F385040924
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:49:27 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4375d4fb4d4so1912949f8f.0
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 06:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771166965; x=1771771765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WNwk77vsCsTUQXGXjqPHDeu9W7whmQWVFq5SaVcf9OA=;
 b=LBDmqOj73OwBQpwHQZ8MnFYorfH7WinH1wuunSXW5OHW6J5nS1KM4G3cO/pVsMFfFx
 JZnaLhjeFJbTyxJpi4svvPcFQF0YB6bGLqWuSIoJvJIOH1eFrvx5nlUkLoiZL4x03G3z
 alJEBth+RICdUk5sPQTxipO53VHPKZ8AgApXM4AKl5x08sGRpoUxNtwg3QhdkUV+H4+I
 inrv3wKn8xf3JMAjwnKsTNzoblDnLThJ3t2qWy/SqHiNt+/+YeTTfGrFmDZyDdq2Jylp
 oHK6kLz9ZXADoqWuJ3xoSOpbWgyX9WT4J0Bsbc3q8woP7pOjGm6xIXyvaCYoOkPJcibS
 6pXQ==
X-Gm-Message-State: AOJu0YwnmIh2TdbHgMYG6J0wF8yy+nm7zEDuTQXaLnj90j5DyQoRNZwT
 uo3i7pc0aJQqvxjOqzvp91djFrJjsFiewMUfl+vAigvYUyUe4QLPVyOm84v1WF32IZ8uJoRMM/N
 RKLmq
X-Gm-Gg: AZuq6aIZLBfkqGQ+PY2JmTk8ovbnSY8Nyhl0QyyeVooI66KbpvsiKXL0fE77VjVxLh+
 SvhEfk98ahnY/ZmByjbVae2IfvKewI16BhA6nVFEUPM3VC3eqkNUr82ca3wnsI82mXVPtCNN/QF
 2nH5MOgmkbVFV53YBclbDpCJBkxi/ELHa4r7JvO8yY4SDdvAoC8Gu3GcIqeJorNSiIk2Frgau8X
 99Om0VEPlzyOyn2KXJxjuJdxveWynq41M8OqthR6OlHXlOsWxzy9OWRCGjoDJvT1tBBsuw5ABO7
 qXKNsA3gaRpsyEYn3AjQ7kOGjOFwz7YrjH7r0NYvOcRlQ6VePllIQVxmpQ0LDf7ft5QWdesSI52
 MT9HeEZV6gekHwLkhqjIhe8Wt1bsduP2WZJZfmUzqE23Ocmp6HmPiof0f9AsRU6wDOF9eaujViW
 M+rYba5eJL72BieuA=
X-Received: by 2002:a05:6000:2dc7:b0:432:5b81:498 with SMTP id
 ffacd0b85a97d-437978dc4f9mr15425188f8f.23.1771166964934; 
 Sun, 15 Feb 2026 06:49:24 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac800esm21184682f8f.27.2026.02.15.06.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 06:49:24 -0800 (PST)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Feb 2026 15:49:23 +0100
Message-ID: <20260215144923.54095-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260215144923.54095-1-thomas.perale@mind.be>
References: <20260215144923.54095-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771166965; x=1771771765; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WNwk77vsCsTUQXGXjqPHDeu9W7whmQWVFq5SaVcf9OA=;
 b=bmxULxYW+fS7KyY06m6NJFePKx4bahIWbeNzLbkXbZahKCEVASQ1Pkdg1VpOpzXcjZ
 JuXZWZzlrt4DnHg32OXQRfB9eiib9hcEshhQcEsaO+FmqA+R3wjOdyPIQ+wIIk4/50/x
 YHMa0vhA2gbi1LyEqt66wkAvDIYXrC30IBsgBTReHyeRL5NqfXggfWWarD/8IxaefeL2
 88dboCeJjVEW3cFtWwLYwa3zbsfYEYnJ3MqxT77nw1bmFpD0iAGl+KPS+V1Xw673iYiw
 MyDjvwZyLO9XK5zt6m39Es/lk7CxNQEY9cSOG6Y/7mV/rgwQuKjCa6ycQZzC+zEq6dzE
 1lsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bmxULxYW
Subject: [Buildroot] [PATCH 2/2] package/haproxy: security bump to v2.6.23
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more information on the release, see:
  - https://git.haproxy.org/?p=haproxy-2.6.git;a=commit;h=c3bf1ac6709072bf9984c829c3badda5a4e8fa7e

This fixes the following vulnerability:

- CVE-2025-11230:
    Inefficient algorithm complexity in mjson in HAProxy allows remote
    attackers to cause a denial of service via specially crafted JSON
    requests.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-11230
  - https://www.haproxy.com/blog/october-2025-cve-2025-11230-haproxy-mjson-library-denial-of-service-vulnerability

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 42f340fa80..ce5dae17e7 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.22.tar.gz.sha256
-sha256  4c0797f450f997dc287d2c7aafa7a0e5b7a2d71593a2cd58e664e8f3aea614fa  haproxy-2.6.22.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.23.tar.gz.sha256
+sha256  1281d57f25e98456a042c81f32801a106a293c1340b0c06debb2a87d6a7b3611  haproxy-2.6.23.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index f60cb1e08a..51878e754f 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).22
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).23
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

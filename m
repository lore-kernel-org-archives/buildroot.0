Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13098C0218A
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 00:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8314842F3E;
	Sun,  2 Feb 2025 00:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHpMs4xacIhn; Sun,  2 Feb 2025 00:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C0DB42F20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0DB42F20;
	Sun,  2 Feb 2025 00:21:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74C7B12A
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 00:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62BCA42F3E
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 00:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XWo4Haaqnp3 for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 00:21:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 53F5742F19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53F5742F19
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53F5742F19
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 00:21:08 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-21631789fcdso55966755ad.1
 for <buildroot@buildroot.org>; Sat, 01 Feb 2025 16:21:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738455667; x=1739060467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VA8gZ0wC98xrwJAEgWIJ+5a90ckHYW3eNEAxA/pT6g4=;
 b=c2ztW+CirpzVu4CFUY4bt+JJkmm+xMAaBIEEu/XYVLLN7p9bpRrGPBQ6uKJyYw/Hr9
 Ov8rBz+yXqWcIWR0dDNODKVjzaZEInnleRprqCy1sFXZH9OQbPK/SXgmfTFfhLnA35lv
 D1nAEpIMxVH6nTPanm39Ab9dm9G+xs/TSNEpTa1jUL0VZbumNJ4joy+B+oemVcFnY59S
 xcqQ1kEN7jodhzAA2vsIvOHpwzFtFWNNeY3wbaNEIp7jfGatXMTtXZOdOfUO2gkk8LK+
 OXIIu4wZjBeK4GfSfdEn7pW+svSeB5goSzjYx6rT6zzmPyHypXOex7QQf2gGf4crjoxD
 ou1g==
X-Gm-Message-State: AOJu0YzOi8DROY96Eu1Bcxz2rF+hoIShwnl0VblEc8bf+v+qMWaIsY8O
 Bw/3ZUmxNVfUtISGs9ajn9kD7sie83bpnaKquGIabr0w0+lET/wWUx7eJ+1l
X-Gm-Gg: ASbGnct7ZItB1Y1o4is3nEpWcUrrber1ZHTAUOKGjnXeqjIXOZQ95X/yQCs4vLuWvFi
 t4erS1WMGm6U1TLjSqsJK7o5Yle2vtxdlg07LBV6gyPg4w99YSCU9zrzjP2msPft3RF7klhDHMt
 chPveMmBffvb6ojM9uOUSoREYPTvYl4GQNSbW0do9X1NpVUiCwjkQ/b3N1M2WrqAkSwxuTTQAUr
 qhNhsH8aS/H6/H74k1bBPZubH8yoQ8d7xNNywUKzZBfYRlQs8RymMWQAyZ5vE99STWAWWOu4zjj
 ouKtaDkO1y6J8ond6Z0iaeXcQGvHHOC+HPs3ITR8abIPPRGw5OT0D/kvZ4okGbjbzjd8iHTyRH4
 =
X-Google-Smtp-Source: AGHT+IHdEP6dex81X4G7nRCynYVbEPIr2FLtA6/bod2a5FtgaJrOSmA/EvI5LUkGsn+0pHOzLnHeXA==
X-Received: by 2002:a17:902:f78a:b0:216:4122:ab3a with SMTP id
 d9443c01a7336-21edd7d8436mr145585435ad.1.1738455667353; 
 Sat, 01 Feb 2025 16:21:07 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21de31f79fdsm50139835ad.64.2025.02.01.16.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 16:21:06 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Feb 2025 16:21:02 -0800
Message-Id: <20250202002102.44367-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738455667; x=1739060467; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VA8gZ0wC98xrwJAEgWIJ+5a90ckHYW3eNEAxA/pT6g4=;
 b=kK7d4c7OKj0BsRwDo4CAaWwYEFAWmSC/l2RLx1MINUKs1yZg5kFljqAmWo/9lH39DQ
 u2ju+p+BVQxehtptdquPajuxp1GrKwMC8JSj3otd4JeDitjoLLvXStnnLgMLBvLGJhDS
 FQHDhwBmV7rFKvTwYqJJZK4nxDNYnof2FAteodqHfhbPSnttIqlKAdVgGsNsmcK1DunB
 OqiaEn0dkPFZOp2wiVWNy6aFIxMmKupHIdb7fSyDDs+ikM7WvQJLv055JVM+WlWrRkPI
 W2fkRRH7B6QCoy+Bu7YHIIKTta7+k27z880Vp7NkyHNViOF0mrVRATccEROlScO+Jc0p
 Byxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kK7d4c7O
Subject: [Buildroot] [PATCH 1/1] package/socat: security bump to version
 1.8.0.2
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It fixes an arbitrary file overwrite vulnerability in the readline.sh.
(CVE-2024-54661)

see - http://www.dest-unreach.org/socat/contrib/socat-secadv9.html

README hash changed due to version update.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/socat/socat.hash | 6 +++---
 package/socat/socat.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index 70c6e6a8f1..136dce4a71 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,8 +1,8 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5  e53a6e8e8594ac87476fe4ae361bbcd1  socat-1.8.0.1.tar.bz2
+md5  7272fe53d51c63ca0e08e0339681803a  socat-1.8.0.2.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256  6a283565db7cf86292c6f70504c58abb03e29888adeed5a6c5f3457e803c1b81  socat-1.8.0.1.tar.bz2
+sha256  adc07a9c2723527cf6568d2fb96559794cf9c254a4bc2edd36f7f3789e9f7625  socat-1.8.0.2.tar.bz2
 # Locally calculated
-sha256  6c07bae42bf0a919c9dd6583f76cc9020a472652dcdad3e84923074a1f412d75  README
+sha256  a18cf021c6380e8ef212c7a95460aff2d96fe9e2146bb09058651bc3b86f4d43  README
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 84d9cd3cf8..aa9a94aec4 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.8.0.1
+SOCAT_VERSION = 1.8.0.2
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

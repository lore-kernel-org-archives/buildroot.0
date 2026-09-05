Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA542C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 07:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40C184086E;
	Sat,  5 Sep 2026 07:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiVx5BaosDvf; Sat,  5 Sep 2026 07:53:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 53DE640B8D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788594804;
	b=onzNuHAL/3aDazwDk3m4KC/GwDHQ+DjTQPbyBNJz+z5KQNkSMaK3kMupwR/DUnWkY1Na
	 J7fNVVoeRw1GE0wh5yXp+eCgWbtxXTVhEg0q67j3g3d1VYdyQlTi3r7katmmFYIms0jMo
	 FKuWRrA6tshs57FWg9eOrONk9NlJn3N4xmO+37nCyiH4Wl2qomDR8JmkHmhstILUefQzB
	 JG+waGLE3JdhRazBlkUUiioUZEzJB63k/R22S2nBzTKr5TkNXjGY7OPgEZiJnyRq0qezQ
	 H0LaHiE1nFoUQKddE5XklkR5qgWdMT9ZC5f6x2K1s2JYuXbsLo4SnBaO3Begxcb6DsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788594804;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=1g+zLkKgmIdnR4zxcNARboWSQ9oeTsV4HJS0ay3EdFM=;
	b=BMO4Kl8n3wXXCM4iLWeca7NwTC5u2G+LdRfBbfr4nbNvMEW4wUh/MarWocqDbRPcpXHO
	 gxQxWCsbitbYG59K9RtYgJfG2c2k9u72DoN0H52h7eCLaTAaa8xEbaQG0phoeSq5HBPuY
	 hdNGWyqz1NOMRI23JJRBM18WO1hWGuJqYzguTSQfDqg+GRv3jB1GNXZISyfoPAnGOU0YX
	 zi45+W0HkUF/NAaZysJW93LoTV/WmhSmHHA+wy/cFKzXaRHaAdibPYEBQ2B9CnuctEqL1
	 dc0Zd7jFO8ql8GoGYodBOq7ve+a8Cyroyz+PPYoJt5CsllkPUkl78XEeMwd3r45OnLw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788594804;
	bh=1g+zLkKgmIdnR4zxcNARboWSQ9oeTsV4HJS0ay3EdFM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nLBfvOn+QCawYbZJ6Lr98qD1n58jNbfnVP/Z5EzGUwMmkmamXCy4a0+LqhoPYrMX9
	 pBARPXMuhUbSG2TfksLbmo8OMk6KbjbHt4AswHYzbZ84qbROowC+EqEM0g0In+yG/M
	 WuX1GpA4iZC+TPV2et1tcxrJTfbN4x8Yxm3u7OZ+NXue3yTkm4l44i5ykIue1PzH90
	 ZAG1BqdP0ySIJy3TKH/C5Anusy5yhLg9fCBEfiDiYgbWnw0Yadk2NMPShn+6NBkSjU
	 6Opa3wCuiPl3UyIqEAHdF+d7y4QYbm9cikjrrukLTlJb5if0eckfBl3BTros8OrDC9
	 Hx0e72liN3+YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53DE640B8D;
	Sat,  5 Sep 2026 07:53:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D646279
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 07:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46E2880FAE
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 07:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzfdQNMZdcSt for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 07:53:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EC86980F6A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788594802;
 b=GLIw32PBUjIwxTgkNRWK+r3YUJ+efwpc7zdNOFOq0p7aKsf4cGGhX1XJ4gC3Jd9lI1ww
 nGNctShGapPTTG6jiWCXO4LoqIGV2VPCr/bL8+DcDMTsbCfyAh4lbQvPY/DMyz5kQ7YbW
 n6s6ANaoEoIL9oZ857tFiVA7pKbK0jVfqzk6sHLRTcKpvvATdsBps78TKZkbsJeuSx/Sn
 lG6a1FCY1agedLwUMC+3Kd3MJMvJ7tlzDBvZknZbvFdCniPwuJfT6c6ELRcbB5I5R0V8g
 /kwEwop4SVeG6qd7MdqcFWjmeO09ax7DESDmCFA6U9FMrMurO4mmdmOw8LnFnt+pBtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788594802;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=9C4Ikgkl5H0s0Pulj1/Y7v4xB6ajLK2SJxHqgFsQXCw=;
 b=SYeDFWOOzY9MaMVxKZKahUbrFeiC5fxkNfJc/TPg6QyySoxv9er582HUj6mRA5gojAbO
 AZYMqpjhAsGiiHpt6OxJnt3W40xjjgYAJpmnY7Wy4f84ySHkYW24MmX9aNq6LN7My9DDk
 WhIQXODp62mEoZQiZ1ulT5NINI0w1v8em0mWyglRHfGSgH9Dj4aEIvPnMciOaeOolkxWJ
 IuKff/A+hZQGMaluYRqguzW5eEqTEB1fVRg+v0QpCe4q7rCCMIxMqiPrQWda4isgTjvNF
 1sRGKLkGwKtRTne3KXet7xla2Qtl0t9/QlJzluboPDQwV1KQQCG3cwlyzspCWeAin8w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=AH5IdDp8; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=AH5IdDp8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC86980F6A
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 07:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788594797;
 bh=9C4Ikgkl5H0s0Pulj1/Y7v4xB6ajLK2SJxHqgFsQXCw=;
 h=From:To:Subject:Date:From;
 b=AH5IdDp8xwzK5w8aJcmhA1IfYXX6Q7ILBZOBv67RFgcNVYt15pjgwnzQleBArwrV/
 nPCsdkxGbwR8rtdANyoBCb4eCcM8YxXEsrC/l1VXJDsvyBspOGtRP0OPD3EweGIx/2
 8a4bn7hnHJXpIgeRVxjs1hkFBR9N1ckeRFkjAMZWhGnp7XS4OpB/4wyQ2yx38keAQJ
 /MAtqZuOl93lq/sxsLoXe3S3+oYu+fGgurnVeE9T0zeT/zNFsYnBJr4kERlP79AdxU
 QGJE34E9dxanz4r4WBkbtlF5cWRGi1q7OACm/DdgAefZfEGtj9n2guTyj0D4CO1zbA
 cVJuXCrsaytXg==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B111DA4C193B
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 09:53:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37878)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2lDB-000000001JM-1mLF
 for buildroot@buildroot.org; Sat, 05 Sep 2026 07:53:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 09:53:17 +0200
Message-ID: <20260905075317.1183805-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/rrdtool: bump version to 1.11.0
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

https://github.com/oetiker/rrdtool-1.x/blob/v1.11.0/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/eae6f5f5c97266b739f5285c0e75fef91620ec8a

with the exception of br-arm-full-static which sees linking errors to
pango & co.. This problem also exists with the current rrdtool version
1.10.3 and is not introduced by this bump.

 package/rrdtool/rrdtool.hash | 4 ++--
 package/rrdtool/rrdtool.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
index 85e894a642..72396586fd 100644
--- a/package/rrdtool/rrdtool.hash
+++ b/package/rrdtool/rrdtool.hash
@@ -1,5 +1,5 @@
-# From https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.10.3
-sha256  843b7caa2a80a815d44ac5c65daa42920cb64586fe804e36d0bc0783554e0635  rrdtool-1.10.3.tar.gz
+# From https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.11.0
+sha256  24c345b5c077c1b2b2fcbc1a364f1da051650fb6743ad5213096adc04c862ed4  rrdtool-1.11.0.tar.gz
 # Locally calculated
 sha256  ab6b4646e9e01f1ec287c29c351c886c4cb7f945c11efc0a1be9f6e5e6cc5320  COPYRIGHT
 sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index f911d54623..3e2d234678 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RRDTOOL_VERSION = 1.10.3
+RRDTOOL_VERSION = 1.11.0
 RRDTOOL_SITE = https://github.com/oetiker/rrdtool-1.x/releases/download/v$(RRDTOOL_VERSION)
 RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7E5CA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 19:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3E6D80ED0;
	Tue,  6 Oct 2026 19:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zaGXI37a3F7u; Tue,  6 Oct 2026 19:57:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7D71D80ECD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791316620;
	b=d2Je/oxhumHAg/m4O1vQUPYz1/3wBFNVItMI8JTG8nwFaCSUyyzwxRsnjmkXPgsArzJ5
	 YdSy/oPqFV86Fd4OaSlt5QAH6JbvXW0NdK0MxlnN3uDsCS2WtnbXyW4HC7n0tBMQvMm1d
	 gBsH6dd5hgAhwEgvPjAVky1lX787xzezif448OXtMGut0HCVxmx5xkOnBxWELAJJAJ2mu
	 TwNpcaQZ4PMQNcw/zsIIZ+UD3sB1bs0151APuD2EcsRrI7vzdyxNj2ZIzX4Ox48OHNyQ6
	 RXa4rIPa74AUr8PANM32Ap2ovp/6v7aGdqhattijQsiUQAo4hCc2QCbQYRPlvwgiIcg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791316620;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=i02wcpvOZ35hwvD2EzyHrhd6eWSqngsPxU8xKbUy04g=;
	b=cI4kvCKVadzulESILb2Xq7ZInrevFHycnIg5o6ne4B6BCi4s5Og/8GlndvWioEZZ7MHk
	 XrFkYqvdQrcmboGxfbhuGrzt0dRZHxgVibntbQXuLpUyS12YOC8Y76lFmALaodLYaNORs
	 cc0mWILufqHYmlL9QXlyRtergpAytRIHs/xdwAO+XOHgMxeOm6GZQSKbfu/Azh6jcusHe
	 GJVbRTQ2LfewQTB4H8FB2YxgcbHSLrxNeGYERvRENe8F+ekHj9zhDBWummyZannTlKb1l
	 Wfr2whpGV8CKlnIR9NViG6qpSUG5zQvEq2GDLkhvD2BqHkUm+Mjz8Y47wcsLLJqNjDg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791316620;
	bh=i02wcpvOZ35hwvD2EzyHrhd6eWSqngsPxU8xKbUy04g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CALoa1GItD2HLay3DPxcgttAlW5APcPwE2nj7Fm/CMbFA3K4m5HXGqjjO5xE4z93Y
	 O11+7Z9uJ8Yq/N1z0c2QgZq9xahoerupun4XRzS5oj9ryGuSzykUFwtKLn+VeipR0q
	 hp9P8pERErD6kWfzr13vJGEcR/anBsAMRssQPaxZjgfZY397GZBrRKJCNSriyhgj41
	 wVMYmHLFKByXPV4td7amSeqAQsvFqSugVNQXj7GVybac5Wq7wTVxUIAtuhLeTO8s8f
	 EvxtBrSWMWVz2t2EXVwS+47dIxvtXOE7GoEbiJjuYGCI9rCrBwaHeKDFRTR9uGxJpY
	 eaS0dVcbKYFkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D71D80ECD;
	Tue,  6 Oct 2026 19:57:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B33E122B
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99190402DC
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tu2qyzIWfhSS for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 19:52:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org EE390402D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791316347;
 b=Drj5ggn/Wc6Rk7483e9M1xQOS2T4OKTU8z5PRqa1CJ+QicZ6Nn8yM7smJlmB7DyJxFet
 r3Qe6klRC/4MzAknK892JU681UPAeshYOeJPpWemWvLfY6JfNIaDYWb7sAdxWOQGP35Yr
 q5i+SpVSZHyrvR3tOZubWiXtKNm64+H+bbfkj9J63zgocz/DxmjYiTjbPJlj2/1H4gRvs
 OmHf6cGB+S9484q7wnuqdL/fEfPxa/zXPVfHn93nTI03TPSoCE704bTLD0dQ3863QXRYu
 goPCIHTKLVAWrqNn6rW02K9wdH0Y+rzjDMCiLuCg/mTOeXNXRc534q5hjowoIZGC25Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791316347;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=b43jPNS/PaMkmdMWGr16ILvrdgrtM3yZFE+WnLZWkEk=;
 b=kuLjQqp8IoG1oIYU7gGLo2j+qhuRYU9g0c1+/Yk3smCU0+k8Q7Tlc41DVE/h0js8w0dS
 MBEgqwgxM9X9AexV4RUJNKtd7NZFwXHGvGxjGahNL/I+m2EvjU+61qk9k6VnoQG1L7puG
 UudovDfyJJ4nJChvdpEki73pfVPpLEHpcVww0APac0Mkm+FBjavuxJUN3VDHHCYWNakqo
 PmKcSPkREM7aDRCY5kaV8CHabD9tYtDY4R0pcI7fVZOd5X6ELCKFIk7gC4lK/7hqod0Ay
 pjSVtu6xLoPibXXqwM95DBgAB5vU44sSC9X7dmZ59FHRzVKodZfLK0Z5JbJxaNAcRJA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE390402D6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FF848DA3C; Tue,  6 Oct 2026 19:51:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 21:51:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5263a5f220444bd0f3b59ff12c9762e6d89565ed
X-Git-Newrev: 7de1ed77454587fd17077bb724629a0106b06888
X-Patchwork-Hint: ignore
Message-Id: <20261006195110.8FF848DA3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolfssl: security bump to v5.9.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7de1ed77454587fd17077bb724629a0106b06888
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release note:

- https://github.com/wolfSSL/wolfssl/releases/tag/v5.9.4-stable

This fixes the following vulnerabilities:

- CVE-2026-15442: https://www.cve.org/CVERecord?id=CVE-2026-15442
- CVE-2026-89102: https://www.cve.org/CVERecord?id=CVE-2026-89102
- CVE-2026-89133: https://www.cve.org/CVERecord?id=CVE-2026-89133
- CVE-2026-89134: https://www.cve.org/CVERecord?id=CVE-2026-89134
- CVE-2026-89135: https://www.cve.org/CVERecord?id=CVE-2026-89135
- CVE-2026-89136: https://www.cve.org/CVERecord?id=CVE-2026-89136
- CVE-2026-93302: https://www.cve.org/CVERecord?id=CVE-2026-93302
- CVE-2026-93304: https://www.cve.org/CVERecord?id=CVE-2026-93304
- CVE-2026-94417: https://www.cve.org/CVERecord?id=CVE-2026-94417
- CVE-2026-94418: https://www.cve.org/CVERecord?id=CVE-2026-94418
- CVE-2026-94419: https://www.cve.org/CVERecord?id=CVE-2026-94419

This commit also updates the LICENSING hash, after an exception
was added in upstream commit:
https://github.com/wolfSSL/wolfssl/commit/94c657013d63124c7d8bf79b29997f614e21673d

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: fix LICENSING hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wolfssl/wolfssl.hash | 4 ++--
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index c259734875..7098c9637c 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  2f4ef3d4fd387a9b3191d36a6316d69116c46ff69bb9583b6c82b36d7b8ca114  wolfssl-5.9.2.tar.gz
+sha256  7256bfc89b183a75183806c7debfa203443873b0b4a562e1b80d68e01b45ac57  wolfssl-5.9.4.tar.gz
 
 # Hash for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256  84f8096dc7f70cdb6075ccf3722a44654361063eaf3e1ce7885c9875b8465a63  LICENSING
+sha256  d4952a47f020a56e6ee267e0937b5ba0580b148bc5355216dffaf33d5671b960  LICENSING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 779fd2cabf..20244c4e83 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.9.2
+WOLFSSL_VERSION = 5.9.4
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

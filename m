Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E4EC79F99
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 11:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED79380CD3;
	Mon,  7 Sep 2026 11:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qRy7niBqUOk; Mon,  7 Sep 2026 11:05:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D221C80CC3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788779103;
	b=CoOenT8Su+qDy1a+Hax3LkJwhwdoR7wSgvwBDAA/lkLysQAQ9Y+klkcUSWJ5WnQFg6qZ
	 Y3pKjgwgq40LSt9FbR9bE4AnlEkM79ovP87lIuvQZQMH94e8W5D3QoYLiFx6nnJVGrso8
	 2UjZSf6doktMJFHLJrBOOfBBIGPwV9SV076h933S6lSk1oCsOuotWNfhTa2ah57i1rdyr
	 z0zTBM04/UvGwXQHb68X90tM+iiYSXn/uLkuyVvmizyTiXQfb2O1cJgSfv1nDBdetRpeB
	 il20vpQ8qKzhaSmpZXq83nc2KbTOuWhM+wTpcU/PK3M9hXJWaiwiWTCM3Mw4qxn8IOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788779103;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=S54jxA+4xpkov2lhQtDFRdGpO7t2KwsO4xQi98Buu5g=;
	b=qn7Lo82Rg06ZUvK1pfhlLhK/D+NIJCl2lvDv1X4F3phPSy9Uiht96MksdHWEP9YKM72l
	 foOCjzNFH5KTvH5sHW+ASdMxxVmvuemwzDhbBogh8IsO88hZICgbtzyzwY/3XwVOxbXNY
	 7CG1JcY+qj6I6BNHjGm+fDwV5nXLpzSyySYBU/ssD5wWxRQvEz1vVDBYo5FuX3+HPdixn
	 bobgQ9xwBiZYco/x91itsXoJQGno1/Mt4Xrl+O8LW5FHF/Ye3Vj9Yx6vMVbWs2ffSKcim
	 Rs5t+KSUGvszNCU7xqS25wlyL1eFJOJ0odbquAr6qGIlnxsjl2y/4f2ElD5PSXWuzbQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jPQPqPDI;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788779103;
	bh=S54jxA+4xpkov2lhQtDFRdGpO7t2KwsO4xQi98Buu5g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FK5iv/l677m/r7TiR1FQaJNIyW7v/WdkyOiLy/uC/kgbVC0ZN+RG9zaAbR9G5D2jI
	 F1XsonQt3OgaeuWYZDgdkuLpHfBb3stmR8bdh+ybof/kpoEC2B8enXRbAVKLYkffwq
	 mTdpvcFBUmXvM39NJSUAPw26X9OgkqnYp09oWnAQgABsngFsJdRRtV2sRLnV7j/Z1N
	 mpO8AgIybN5RHuF+2c4RCWBsFOBlv5z8ygnzMdygoAOomsNnBvULpbLSi3BAeUJGH7
	 jXXw+ibPTXdbpcf8K16Qjo/HRLNWomxuTM17R4fsLZh7nIyIBup+nFgPQPYkEEKSXG
	 bIryFxSwl0DBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D221C80CC3;
	Mon,  7 Sep 2026 11:05:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5B529CF
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 11:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDCBA80CC3
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 11:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtvYL1-jlqnQ for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 11:05:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1C77E80CBF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788779101;
 b=q9lA7P2SHifugyiIIytJ1itNcNkJTwNohiKPOJFqSGpwAxSBcGoODW37795kjd9t5TSX
 +jxR6rECHqFVTQcQnBpZ8vzX0KbMvA1W3T9asgcIzx2UpmTIgP190STfTiYzrq1TRuj7l
 S5DujZAVf1Fk0ucfP4ut9PfbY9c1inGzc5kh1IqIpNRrn+ZwPPtmV69Wk+wlGzJgnNFLT
 1XI0l8dPaZPRADrRlQ/Qp+L09sYlNWyH93KHZeFU5eOETzZU7QYgJdlN4jBIbrU+RtcEn
 g7N4LG254GwhBL3stjbAj04XuUj49NMCZ1ZHY+YStthNfhMvIxpc72a/Fll4R403+ZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788779101;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=NmZEgoi1J4YP5uUQ6ZLYaHTlVwyROQarBkNJ3lMeOeQ=;
 b=eEvhiXKTkBmQDPv0qYd3p7GVeE7ukHdbcUloZNfYaW1mLyCbOEaOnGM5MYqpyH7EmCcQ
 rkhZGYeSNYclT+NaR0SgBJBHWsJaJx/cdIn9p0ZBacVWu7oBb6dPG4ge6RJsX/s3C8IKG
 NYb+6MUJdbBrNsREtTmgEmObf/xi1a3+JuEQiofIS+gZMYwE5KgPXWWOnmTyMPyqMUhvX
 crDXQPGHI8WLwOVUVKRd3s7vCHWmqL2S5IxEvpaD7I5NKwb4HnD66cot+8xdkOvGBJqdB
 XM1eStTy3O7a5GNGxLQ74isASZ8sXQX9V1AwMuJfWSH5aeoQ4QFwMxidO4zdAe0eYyw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jPQPqPDI; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jPQPqPDI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C77E80CBF
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 11:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788779095;
 bh=NmZEgoi1J4YP5uUQ6ZLYaHTlVwyROQarBkNJ3lMeOeQ=;
 h=From:To:Cc:Subject:Date:From;
 b=jPQPqPDIzRpejAYNx+NgRxPcHIwxirMW9pTt8GbTVTQ1r/OsGoYF2Eo5TxkuJ8wJc
 AWLvU0OoAJXGpo1o2KPYlbabJOQCsdTAQ+AaCAKaKUDoWT1KExgDYcqsrnIMNhprVX
 tRtF3IhrHu/6JaDAIepTZUCjRyx1qKkOBusQ/E3uz74MCjZZPvxIZVXo36eTJ2q2rS
 QZkN8cQdk1xq3OJQ4YrZtq642Myx+7daFFtYJ2ILsuARV+dA26u0ASUNNe5CtOyfkF
 jkFfvLK7uvTu9QK89/VUrcSxvp13ocLkNwKr+jU9vA/QyZbqdQRYcoYFDhp1N/79Tf
 r/mBvloGT/wpw==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5FDEBA4C2E1F;
 Mon,  7 Sep 2026 13:04:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47114)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3X9j-000000000Rh-0czz;
 Mon, 07 Sep 2026 11:04:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  7 Sep 2026 13:04:54 +0200
Message-ID: <20260907110454.1071513-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/libpcap: security bump version to
 1.10.7
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

https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.10.7/CHANGES

Fixes the following CVEs:

CVE-2026-0799: Access M[] safely in the BPF interpreter.
CVE-2026-31912: Mind the program bounds in pcap_offline_filter().
CVE-2026-31911: Fail opcodes safely in the BPF interpreter.
CVE-2026-6244: Avoid division by zero via pcap_offline_filter().
CVE-2026-6554: Limit "ja L" looping in pcap_offline_filter().
CVE-2026-18313: Fix a memory leak in rpcapd.
CVE-2026-18238: Fix RPCAP_MSG_PACKET validation.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/a136fab26ea3ead70f854ade16d2a9d29d01e2eb

 package/libpcap/libpcap.hash | 4 ++--
 package/libpcap/libpcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 098b059fdb..87cc77338b 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.tcpdump.org/release/libpcap-1.10.6.tar.gz.sig
-sha256  872dd11337fe1ab02ad9d4fee047c9da244d695c6ddf34e2ebb733efd4ed8aa9  libpcap-1.10.6.tar.gz
+# https://www.tcpdump.org/release/libpcap-1.10.7.tar.gz.sig
+sha256  0b394ac90dbc0a9838ff97468e05c9c9a3e873dec2514cd58db65d859d296e31  libpcap-1.10.7.tar.gz
 
 # Hash for license file:
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index c4feee5766..a501ce2962 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.10.6
+LIBPCAP_VERSION = 1.10.7
 LIBPCAP_SITE = https://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

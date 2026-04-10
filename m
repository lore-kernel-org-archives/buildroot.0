Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BA7F36BA9
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 05:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C21560BA2;
	Fri, 10 Apr 2026 05:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5Wt7qRKH3ZK; Fri, 10 Apr 2026 05:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 719BD606F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775798091;
	bh=L/G5NuyPfJ9KEhKCp8XgmoomyB4ARdv/ohC/JsDmCfg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IQTU0oceiVd01COdiIUfkUgfWhp/sJFDrEABECNzoA5PU2tS/S0NO0Fj9LQxSKso4
	 AxEH/J+a0nzoAHp9V7zXfDmcIKzfQoKSldpEeA96Y16WlTLjw+DZmFb5vo+/qR88Wx
	 04cBOLj92c8vK0x+rYeguTslktJHOsRuw2vZhJ8IbLYXUMn4NtMZ4C+t/VnBKvHAyo
	 PPJI8pb+bjaQA8YdOuwqzDnrtIRKdFYOD/K7tKylbf88LsKFWLOFFU/el2SHl2BL/D
	 8OaGMbFjIY99PfgrjkXI00HvDIw/yutH5cjHE6Z5I/Iaik9RZqlrBZtQ1MaJvrU6jl
	 /PINhqjmvnqFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 719BD606F2;
	Fri, 10 Apr 2026 05:14:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B159237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 05:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CED540CE9
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 05:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07zGN8uRRNAS for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 05:14:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 31D3740CC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31D3740CC5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31D3740CC5
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 05:14:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a090a.dip0.t-ipconnect.de [91.58.9.10])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AA4D0A4C063B;
 Fri, 10 Apr 2026 07:14:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44882)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wB4Cb-000000006Ey-13Ed;
 Fri, 10 Apr 2026 05:14:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 10 Apr 2026 07:14:44 +0200
Message-ID: <20260410051444.21302-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775798085;
 bh=eicdazlR2BNFXQVNd4wU9zfKA5k4ij52Db/O5c/tvaM=;
 h=From:To:Cc:Subject:Date:From;
 b=Y18nsBAA0LQBACBClwochl27bHou6glifR0IyLqDp1zDqi3YVFIm1CX5R1/RaBTcg
 fnN4ILYRNrdwWigZuTqSyaL3SYzJ+ZA+2R/XXjtLCHPqvSg3hEXH5FDlO9LoVXFz4v
 Gx4yzQsWyWPgV5j747H+rLslGkGqOcLpmMDGS1/dAvbb7TiUSdViy6cQxOzBTNOCEy
 U4Zkue1Y/eWrl1pHUlhkMYlO2CNmgBw/U+t8pjuH1OuUr3SQN/K/hZZtMjaD0jmkwW
 l67Wg3YuoyWE0VgnRN2OCsOlqKLABK/Sj66HiDVPv2w/biMcfWcrPvtpHg4YGXBCJc
 RSPBAiP+XQ0xA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Y18nsBAA
Subject: [Buildroot] [PATCH 1/1] package/libjpeg: bump to version 10
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

https://jpegclub.org/reference/reference-sources/

Update hash of README (changes not related to license):
https://github.com/libsdl-org/jpeg/commit/5eaedb78e0e78dbff07f71143eb21f9081e2cef7#diff-2b7814d3fca2e99e56c51b6ff2aa313ea6e9da6424804240aa8ad891fdfe0900

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libjpeg/libjpeg.hash | 4 ++--
 package/libjpeg/libjpeg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libjpeg/libjpeg.hash b/package/libjpeg/libjpeg.hash
index 5c223b4e3c..4af81309e7 100644
--- a/package/libjpeg/libjpeg.hash
+++ b/package/libjpeg/libjpeg.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  04705c110cb2469caa79fb71fba3d7bf834914706e9641a4589485c1f832565b  jpegsrc.v9f.tar.gz
-sha256  7c25493a9f64fed34d01445467341bda77bc1cdbeccbe33558659ef173fb9ff2  README
+sha256  8b9eaa13242690ebd03e1728ab1edf97a81a78ed6e83624d493655f31ac95ab5  jpegsrc.v10.tar.gz
+sha256  913af09f785683accdf660b85dcf27fdd567d4ad649daa95cb8771b040db79d1  README
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index 2eb64e83e7..1b23bccc65 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJPEG_VERSION = 9f
+LIBJPEG_VERSION = 10
 LIBJPEG_SITE = http://www.ijg.org/files
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = IJG
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

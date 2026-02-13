Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9346CEF99DD
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 22:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3065640955;
	Fri, 13 Feb 2026 22:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPlSOkQFHCBF; Fri, 13 Feb 2026 22:18:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F181E40981
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771021120;
	bh=/SGQiQrj2ERsboctyp2rFDgOR6yqbFDGjjKSbggKjsI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vm7Ehyw5cJpqxNw/uuj5zmz8GWvdaO0xiVI8BCv4f26DfEUO06s+aiCBoqGFDJBS6
	 m1K4hSnuWUp0KyulKqUHTKSqUPXJ8wVRCqsER/rVPhq85Lpeq1Mw+8gqk7EisuZdUf
	 TYEnB/cKG0wGEGUpWnVuYc0pVibRa8Lyd22gmLX6+8cCPnTHqPVUBGLvSZT4yRXfRC
	 WyCX8Dr/HizQP7i4CRIQb1IskWVsr0rOYvc74ZhiP7ucM7lV+2OTU4uS8LeZHBB6oA
	 cik1nnfRY2heBf64sokUSCu+WTHMJAWpfQN/ItDVPIo28/do2X37li8DgoA9Tnrbmg
	 GL2NJ5dXC9MKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F181E40981;
	Fri, 13 Feb 2026 22:18:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05CBFEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 22:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0298B61273
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 22:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSanNzB0hFdE for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 22:18:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66DF860715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66DF860715
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66DF860715
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 22:18:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c3ec.dip0.t-ipconnect.de [79.214.195.236])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9D52BA4C03B8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 23:18:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56334)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vr1Ud-000000005a9-3Qo3
 for buildroot@buildroot.org; Fri, 13 Feb 2026 22:18:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 23:18:32 +0100
Message-ID: <20260213221832.1177432-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771021112;
 bh=bEF+cPHxtuakwR8gFGrpzdHNmYxaC95QXlWOM27Z590=;
 h=From:To:Subject:Date:From;
 b=ZZVQqQ4iKM54C/ASTVw4A7cfU73tJHT+oMkngkvuu626oDsoev1FzF9b4SYcnGzBo
 gWjLnc2bhkN2FkwYma/4LQ6ujArsOj+3brXh092ZH5cfXtlh6aEHETRcilOY5oOEYq
 9N0MZAg8HkTFXEk1gcDsY1ZogN+s66TTPTOOKHQds9nmg3QsW0rW7ECi/+PHU4h2XG
 SjH5+h3lmgqu1x+FwnzMl6brvkovJs8D7D4i4CpDZK2BTNCB+zpCgwrbTcb2xhYVgm
 n3aN1X3mKQW/woIZ0lNbZGnIATEQUqfNX6hq+WKEbGNWYiDL6Ts2N9sUsF5+42pwan
 ztmOpCyQWMH5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ZZVQqQ4i
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18}.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  2 +-
 package/linux-headers/{5.10.249 => 5.10.250} |  0
 package/linux-headers/{5.15.199 => 5.15.200} |  0
 package/linux-headers/{6.1.162 => 6.1.163}   |  0
 package/linux-headers/{6.12.69 => 6.12.71}   |  0
 package/linux-headers/{6.18.9 => 6.18.10}    |  0
 package/linux-headers/{6.6.123 => 6.6.124}   |  0
 package/linux-headers/Config.in.host         | 12 ++++++------
 9 files changed, 12 insertions(+), 12 deletions(-)
 rename package/linux-headers/{5.10.249 => 5.10.250} (100%)
 rename package/linux-headers/{5.15.199 => 5.15.200} (100%)
 rename package/linux-headers/{6.1.162 => 6.1.163} (100%)
 rename package/linux-headers/{6.12.69 => 6.12.71} (100%)
 rename package/linux-headers/{6.18.9 => 6.18.10} (100%)
 rename package/linux-headers/{6.6.123 => 6.6.124} (100%)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 90e2bf73cb..4352943b52 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4b493657f218703239c4f22415f027b3644949bf2761abd18b849f0aad5f7665  linux-6.12.69.tar.xz
-sha256  a616d4b5a18a9097e2df8e03dfd2ba366ddfc1321b16d648651dc512b3e945b1  linux-6.6.123.tar.xz
-sha256  9766422a49b9a24ea911ebc0b4e7d1f3d84fba3bc374387ae3c4bc60bec6d089  linux-6.1.162.tar.xz
+sha256  143e8bc76cc41f831b51aa5e75819bed55bed41f299d35922820f1d2d2b02600  linux-6.12.71.tar.xz
+sha256  a7aefb9f8e9be2314a66ccda708257d1c2dc04e68235cda987879597fc89794e  linux-6.6.124.tar.xz
+sha256  fd2d033321bd15e0ad5669208b6e43f3f93ccecb059a512ca6b913ca940c38ea  linux-6.1.163.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  01c0d3ae4c138a51891cb54d21374259fd07bfe1076e06362ec0ae0a822fbd2e  linux-5.15.199.tar.xz
-sha256  b990ed34261149542f932e5eaf1ba58535c5d48c147ae36bc2747c65e54d1046  linux-5.10.249.tar.xz
+sha256  fce4b1c86688880932ba8f755880cbf390a89453464bfd90b9a1b01a121c2998  linux-5.15.200.tar.xz
+sha256  47754da223a9f264b917be5d575a4dae03fc8777aa9e1b00473e973ee997d529  linux-5.10.250.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 105f025729..f7effa8edb 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  303079a8250b8f381f82b03f90463d12ac98d4f6b149b761ea75af1323521357  linux-6.19.tar.xz
-sha256  030115ff8fb4cb536d8449dc40ebc3e314e86ba1b316a6ae21091a11cc930578  linux-6.18.9.tar.xz
+sha256  d6d377161741ada2fab28eed69143277634a2aeb5e3883e50c031588ede48ede  linux-6.18.10.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.249 b/package/linux-headers/5.10.250
similarity index 100%
rename from package/linux-headers/5.10.249
rename to package/linux-headers/5.10.250
diff --git a/package/linux-headers/5.15.199 b/package/linux-headers/5.15.200
similarity index 100%
rename from package/linux-headers/5.15.199
rename to package/linux-headers/5.15.200
diff --git a/package/linux-headers/6.1.162 b/package/linux-headers/6.1.163
similarity index 100%
rename from package/linux-headers/6.1.162
rename to package/linux-headers/6.1.163
diff --git a/package/linux-headers/6.12.69 b/package/linux-headers/6.12.71
similarity index 100%
rename from package/linux-headers/6.12.69
rename to package/linux-headers/6.12.71
diff --git a/package/linux-headers/6.18.9 b/package/linux-headers/6.18.10
similarity index 100%
rename from package/linux-headers/6.18.9
rename to package/linux-headers/6.18.10
diff --git a/package/linux-headers/6.6.123 b/package/linux-headers/6.6.124
similarity index 100%
rename from package/linux-headers/6.6.123
rename to package/linux-headers/6.6.124
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b9c86168be..09c6cb724b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -464,12 +464,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.249"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.199"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.162"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.123"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.69"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.9"	if BR2_KERNEL_HEADERS_6_18
+	default "5.10.250"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.200"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.163"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.124"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.71"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.10"	if BR2_KERNEL_HEADERS_6_18
 	default "6.19"		if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

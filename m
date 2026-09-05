Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C9BC624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 16:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF050605F8;
	Sat,  5 Sep 2026 16:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxQROo9L2tmK; Sat,  5 Sep 2026 16:15:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E8B3060606
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788624904;
	b=JSb8eVCSfugxkeSSSI/FZ8Dc9JU6L9ZLagptF/qzJIicTPAQBHIFYKGavtQy2sHHNE/s
	 hMz1o7TFv98VJhX7e9MFPO30l7MtrpkPKhElUFqNrmmDhY6w8FIEf/2JTyhc4l6EVjkUJ
	 jXT2ZOlXkUeXqdvYLyvMQUn+8xPO6Bax2+Ii/4VGgZPd6CBc5OB+v5uIeol3c5lEfgbmj
	 vZd69Nle3TOOca+X8sIEZxNFqSFggY4Os8Ag94mtc9pcF1c2odIzOVoiGRKjcJg1oioqn
	 HLUpHFq0alX7Z5xZXGnPPvcyqCU9EnY9UWWZWWDBsSIW2BR5ocwhNvviJYYPXKCavUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788624904;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+vtQVptxeAixfLFE0xX/+XOO/jbiO0ez22tHrIXhmsI=;
	b=VrgRcw1qzooGFPbMYzYqWEZ3csjjQ7jF82JTNSzrTg6X3btiPJdztp2ZDgU8XkwMXpw3
	 afXhL9uENdrcqQXDRRTTL4exZVnYKV1FsaAMEQ/kIlXEsW3ZPSfNKdYjVolKBw7TjPzHW
	 S5nehcpqXaOosftA61d0vE5d/RwAkSFpnAM8ksDQtLewWFcKlXXsnNFvVqAP8KyRxLoy3
	 RYTKqxfv2u+G9BX9VoH7IRVppVkVCxoChGk+BFm+GRQJtGc/ZPro5ZGXpzj/rulxk791x
	 pABOYpvhfa4Vx89hF3nuNkZz40RXB+pq+FKzFXul6u4DMnrpZ0N6vzNoMxoVNzZsWSw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Bl9lKbuT;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788624904;
	bh=+vtQVptxeAixfLFE0xX/+XOO/jbiO0ez22tHrIXhmsI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=V4iITIz4Nd+6QewgUyBxe+fmWaWkXc0YS63AhrWwv63zFts1k6hIOf56Yqn6qj7ke
	 eb2thgUeDr6+V7CKMadD59vODSLH9hwmJmKym4OPPJpI0KuUbjdEdkmP6SyuxJzGYG
	 E5xlzUYPuj8ZIaaz4X9NqJpbGhb77uv6vxsr6EeWtkuTwJ+0dFnnvtJsTabXfcTtNI
	 NKbG3gSEZiE/Wzlj9uEBlI6/ohOcHqU5Y3qjnrF4KZBhux1ROHe7A7Lyypo1fAY0G6
	 Cg0rU/Gwwbxh3glWLymcajsuVMnQZUIK6iF8G1b+vumJ83CzNvdX/3QaBL2Ad5/3qN
	 PTd8wPZJxzFZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8B3060606;
	Sat,  5 Sep 2026 16:15:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA764279
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC83160606
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TklYkPvRxS7u for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 16:15:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5B316605F8
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788624902;
 b=X79tbS2ZwwOnbO8Fa6+/tq84KmC6Ei2s0j0mfLhDHgREeO/Y/csQ0l+/DkZWpWW3JOlv
 aExjH5Q3NNDGE9ju6VAtlg1WWs98zkrUipipugI2PeDlZ2nxqt9fc4GnR6HgqmUVQR30G
 oVxt/YVofAuGlu5f31wDWjeBW1iFEXCHtFDxEaawD1UCQCbIS1H03+kS4+Hm2/vFR6vYL
 Qe1HGVhgozvAa2jDwsp7pycjHDYqdpxJ9dl650Ui7otI0wPYS2qSNbT5O0j7AKS9YCpfa
 LJ8tgNXpbST1DIZ4qumzmF/EqkyBFqFJXD+oJW8PjVKLgDbSp1GoLDmQWgTE6gjjSag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788624902;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=JXPYFc3rREwcjIcA0uqJffxrwSg5gfHvnptN8Oqesh8=;
 b=AocF5s5GwtBqcgkGT4PrPksIfyG1JOfl6J/QnjX/gtjL9rYh0Oj4f1DUDDa7BtMXu1b1
 fkwox5nqQQ/jHCCEzyKocNzcE7HNUCra2bx8g7S4dFDqXpgTGx4fZhgNafDTBB1o8FXzU
 NzRkOE8NIatHUVMVnJtbCIbTzOPtlxG8QA72UxjG2o0cIRCTalMoJ6/Ys5wlarrCMjtKR
 aj+Xmb6JBjYWzFVJ7/xPfScyXXnpxJcZMIM/KLR59654NxRUnokOjMDOTTVEVtB0HkIWs
 eYMuf4yMTQ9JkXiL1aeY2+Kz7HX1N7iOHkyNBrlnPSmmf13Dgx2o5YW4/NmkkduN57Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Bl9lKbuT; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Bl9lKbuT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B316605F8
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788624883;
 bh=JXPYFc3rREwcjIcA0uqJffxrwSg5gfHvnptN8Oqesh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Bl9lKbuTYkhNnmGGPCwiQbeDE7QBmAztSSPcUKhudqD/xFN9hEjtcgOZ0xP97Eg7n
 RyBToP5Yi79p+IfX5fdZ0fRn7Mq93Ak4y/3EQ6GrPgzLUQvvVRvDXCg9NhReARDYCW
 ZFQc2SJ4nwt3Af3+obcZ4RUrU3nOBywCrAdnD/iK1EXKS4Zv17VfQ22m9mDysAnGVS
 TOXeInw2Al4M7qstNkaG1HdHgIvt/vUeodN4WAqHpv5aB3qvTzykck59rWc+yLUkTW
 OXBrYNRd6rAiv96F6BHPHB8EGguX8YbPd5Bkk7c/vF+8KaqmP9iWh0c9eF0F/EN6ol
 Xp4gh6yTsUGYA==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 32542A4C310D;
 Sat,  5 Sep 2026 18:14:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37408)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2t2Q-000000005tA-3VvQ;
 Sat, 05 Sep 2026 16:14:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 18:14:41 +0200
Message-ID: <20260905161442.548037-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905161442.548037-1-bernd@kuhls.net>
References: <20260905161442.548037-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 2/3] {toolchain,
 linux-headers}: add support for 7.2 headers
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/from-6.17/linux.hash                          |  1 +
 package/linux-headers/7.2.3                         |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 5 files changed, 23 insertions(+), 3 deletions(-)
 create mode 120000 package/linux-headers/7.2.3

diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 3c5e96ef4c..3aecea4fad 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  8ba259e8e7b13ec6ef0941c8a39ad90b24bd4a4d6c0010ba6bafb794550ecd03  linux-7.2.3.tar.xz
 sha256  614d95fafdcb5cce2b6620e7edc6afbb606bffd4655405586815d84687841ad7  linux-7.1.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
diff --git a/package/linux-headers/7.2.3 b/package/linux-headers/7.2.3
new file mode 120000
index 0000000000..a4e1d3ec9c
--- /dev/null
+++ b/package/linux-headers/7.2.3
@@ -0,0 +1 @@
+../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 433fb363ee..365fe11931 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_7_1
+	default BR2_KERNEL_HEADERS_7_2
 	help
 	  Select the kernel version to get headers from.
 
@@ -55,6 +55,10 @@ config BR2_KERNEL_HEADERS_6_18
 config BR2_KERNEL_HEADERS_7_1
 	bool "Linux 7.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
+
+config BR2_KERNEL_HEADERS_7_2
+	bool "Linux 7.2.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -133,8 +137,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_2
+	bool "7.2.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_1
-	bool "7.1.x or later"
+	bool "7.1.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_0
@@ -479,6 +487,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.12.108"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.49"	if BR2_KERNEL_HEADERS_6_18
 	default "7.1.13"	if BR2_KERNEL_HEADERS_7_1
+	default "7.2.3"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 128f8faef2..ad73204b14 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -684,6 +684,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -697,6 +701,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "7.2" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 	default "7.1" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 	default "7.0" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 	default "6.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 003887f025..721fd272e0 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -178,8 +178,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_2
+	bool "7.2.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_1
-	bool "7.1.x or later"
+	bool "7.1.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

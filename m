Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98570C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 10:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69593605E5;
	Sun,  6 Sep 2026 10:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0w4qJGZ5frn; Sun,  6 Sep 2026 10:33:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6E9C8605F3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788690822;
	b=Z2fLwLpLYZCFHSpqSXog5HToUMiCnPF8NryAdTm6YBomRapcFKYHdr8Vuiz3y2dNT8tW
	 e5aNYfEgqMTL9twaUO4r7q/yZIgjmv0t56nkQN4ddZA9eegV2N0Cla+oIBvbXnPGkab4w
	 wrjHz8gCCjWDWk1yQKcb+cATczqmJB989E9Y7j2e8tFv6xbsEo8IrZ2nN0q5VWqHfE7p0
	 yeTU8US9W6fe5p6DF/qmdrK5PJaZ4FpSWB18oYGlpSn0YcMxooYX5zUyXjjAsYuXUC+jl
	 YOwuDTIq/YmtmoDHbIzKozT9/vAMYQzATvYfB87tT9hOX/hhkONMUYBzt3qH5QQv/zg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788690822;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+vtQVptxeAixfLFE0xX/+XOO/jbiO0ez22tHrIXhmsI=;
	b=hRKkZa9RtiupNlsU020P1bAedO2IIuRjBNc8BU+SZv0iOKw2Kf/+6SLIIKSb8vfK1+oO
	 OD9OICbv7NHWtqReYJ+8o08gfycpNAOEo0bKVxP59kNu+Izf6Imv7GQISV1at8Fo0R+pw
	 RvORq6Wm6TrbDD0In1y00xLbvb5hkRPe8yuSnSd/blru52vKzUWrm3htA0T8x51bv1y0q
	 BlSd11s8BJ5/eAktUP9LcOAlrDNYYZg9CaMYE46V5OoYV1cBbpceIa/hH+cayrXgNo6yi
	 eXBOZfujiuvcMWTK8tOA2WhyPcmgqZlIIIlZnSELUzvG1jK6pepkPuCfMWhlT2GuuFQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788690822;
	bh=+vtQVptxeAixfLFE0xX/+XOO/jbiO0ez22tHrIXhmsI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NNXDKgEtHwuIp61Y1POxqueMBOe1vDFmTuZDTXmeH0havi9rD7yZZP2Yk+T7tiWsv
	 iQKT0l5nhD758PiATodcIvmeVALmTQm4B/QpXYMBep/9ikNM/1uhGPm7sO3zRqgXP2
	 Qnf2U4semxtRf9bF78YZhVLfZqyHTkEudOvFazDZmdLGXoXTKlUTmzKLfk0TCfCgUX
	 iZNcgjstI/qGHc8Ws0e3eVDwS7mqcYgoLZEwGVH4mo+3Y6uQltI6yD/c4mGdMShsIC
	 jTrSNtcCwexyeHticvCCPzIYCcMK9VBY4yKtsVFV4Q6L1wOL2Qo0TDe7K4T36tnnPM
	 rodaeWEbc+TCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E9C8605F3;
	Sun,  6 Sep 2026 10:33:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C81DD3AF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADFE64061A
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyNzhw_q3ANY for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 10:33:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6C639405F6
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788690819;
 b=cJPIhmrNMrohWYm24KzEziFqMbkuyIFoNuy523P+7aV1xL2Chmh9q9ItfG8MWKDjtlnK
 TcweTgO9iX0zP6MAhDCX417pDAvm+TaxlvQnJw5RcSaO0OhJ8zAcfidscqvYRhcKJK0ZL
 2bm1ZzqYq+ehHCtNLWNoqyP9FNgH+LBfSavgkNVuXhNjhuhgBWXF4iopnG+TA0ZnuR4vk
 rFeJQnAAz2jPmCupY1uNOkcSIJVuF68XaMfmCuda+59J08zwYhx7Ee7MHIaqUsm6Ob8O4
 nyX7pkJOnh2YrxFqQcFs1TLGmVTSmELor7L58mJWOBKLKzGf8lVPX4qz4yCuwQxXQtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788690819;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=JXPYFc3rREwcjIcA0uqJffxrwSg5gfHvnptN8Oqesh8=;
 b=DUFPKjV0letkSOJssYEpktSiToeDmf/kTLss30J4ftWNbiwTMqPNiWVwpD306kxbhA2q
 iryOzJhCBHQBcMKftiG4C2WCzQ8Q1MV2zd6DapDnGQT6N2yWQ5XKnAYEsFgnicot3xau7
 5lEH2rMAxfb0QdG3PaSqng1Ul51O8r8xg71XjYhopFHe5MBVX5BgRLbUbaHBOs0qh/eiD
 B9/O4b7d7CBLe4gCSvZBC9DUXbYHVvrO3LGgXcLQJ8whlpnC4Wq6Q11FYNZL0G0E59Obn
 lGxcQeQ/lXqEkQCmC7nnP6ICGLU8YTAMylna5/baUAN0yWba00N5O7coCx5p2flKKRQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cY6XkQsa; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=cY6XkQsa
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C639405F6
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788690781;
 bh=JXPYFc3rREwcjIcA0uqJffxrwSg5gfHvnptN8Oqesh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cY6XkQsaDAg4ovy92oRHVBuyqpJ6ot5S4VH9ppNI6VQissmK+7OlDjkZmOwA+Xun9
 lYVxFHmNC4NL4WmsDvTtD55LsKZXtijXvWnn7aaOOf2x+dwbCSphdMOhRT9utMTqDA
 9liBOUEIqrWE2EfdVRNjcyLLbJP5G4o5eELU49CeUINK+QUqziAgJmopFGR2dhWBWJ
 eqdQIxXKkKUNLClqV2GHdbNupF1PcxlU8JCN7iYn+/Hs5FrghkBRsAuU1EYjJcox9m
 l5HZxfw3gJGKfpZyz46naIBODddnMK06liNmPadRCv+qOHQmV2WE15IxnLw55t7/mG
 pGiajb73fHE4w==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75CEDA4C38E9;
 Sun,  6 Sep 2026 12:33:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53358)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3ABF-0000000048S-41qD;
 Sun, 06 Sep 2026 10:32:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Sep 2026 12:32:52 +0200
Message-ID: <20260906103257.3688362-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260906103257.3688362-1-bernd@kuhls.net>
References: <20260906103257.3688362-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 2/7] {toolchain,
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

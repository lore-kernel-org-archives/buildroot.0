Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F21CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7799860A68;
	Sat, 10 Oct 2026 09:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkzEl-hfwhdC; Sat, 10 Oct 2026 09:44:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 82D4160AD9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791625467;
	b=ljLo8Ty47Gr7aLgAfgopqgTrDrFP2Z++on7PVngSn9PXlLas72vVRarQVCp+7RCCgBGv
	 blpNIrrLAlJFCgeILSDHYfRryYX6f81OsmZvQrQbws1tr/d4feijF42PjpOQeCA8WsWQ4
	 OogJe216W0+kXyhlE6MLyUhmsdisELUsT+0dnXu3jczht6W/80Boc1meQtpXQiY+sL8vh
	 99wyG0yV8r1dzAzm2A0G/eeUo7T9fIhnJYaoK47lxLwQwFM/De9zbBwbbRU6oygPn0t3L
	 Vlh3ajsrusHib/fkB77csSfwLQ9T8YO6ngyfY9yJFdzG4mt4lpvzraIwJgRv5YAqG9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791625467;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=//vouJ0xYa2o6KeoKYi7DUBHDi1towHADkKPdNa+LnM=;
	b=tDz86Vmzb5gPgzXlUw7se2Uni6hKBx8mjbJj3yLakIc6Agfzir4YWePLnmZ+galLhjd+
	 TARmhNiscsqiNMNCidsNoPlN6EW2t7yHlvLRmCW9eZ/CDJKQQfvX3UnWFqPJgytd5vkCz
	 klkJUffgdgIPRtb7WoYx8Pn5/FEtGtYQ2WLQv1YUWKifChxJfUk/ATAn1biUsPa3Y415/
	 5XIiQKX7Ciboj2Za6jNkNDvsrx2PV0iVZiiiJnSzsqfkCkGPE500z5F2RSB0uVMlbr4Zt
	 QH7TJYqwKzMRfoDkeB20Nfm1V6Dkjz4EDCuETCLVtdpjpaq6BpecEhRhxvwqxCJTSnw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791625467;
	bh=//vouJ0xYa2o6KeoKYi7DUBHDi1towHADkKPdNa+LnM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jHWhJND6cuSo+95Z4g+AUnG6VM/qcU0EQID9ijHFJbO7o5Xc8tNGab5WIulT+HZL2
	 WGnPul0hiOottz/p7tE6OfIikeOs0/rYC+Psnj5AeSKqJiHCYfMUi3DjaH0zOFzK2u
	 bSEvIVZ93Ia222wCEEkjV0u+yWL7akp8kaRyj1WEfj7enwy2IcHKKteDCG0IMvuRqb
	 mAa+pES433pmumMSfZ0+k9FIyc3OiXT5rvRwJpgw10w34Pz1MVlrghXbRDWrYfH6HP
	 7maVHoRLzY36lY3VZiUrsJnTgSb4wtTEtP5S8jhcZgGon3PLe0m9axlf+T4Mw9aWwt
	 8j8sXY1Ptv01w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82D4160AD9;
	Sat, 10 Oct 2026 09:44:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B22F1DE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EA5E60AD9
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POizld8uUVNf for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:44:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5E72B60A68
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791625465;
 b=ZnKPKaDD4eoCbSjN1mZmqhxlc5A0NtZyDK9oigD1+Ds590lV38IfN4eJDVUKAn3gNWv3
 KY+LbTDz3rnOXp9VNIeXg/g8fbBhTmw2/WkPVxiPcojVfs+klqylw/ZY1drvOWdaijdIz
 JixwioI8fwrnyTzfpf+Wkv1LrCZw70PCUlUVjaA99h6uufZNTmrZf8ST1SBeX83Zg1kDw
 t+oBKBZ8PbE9GVaU96UVaTW46zD44+haMt1Tu2+cr7cJlTWY4kSlymv32BajbCluhw///
 EuHl1Rj6w+zuGS7RxEFMVC/S1E+ODPWXUHkBVbCgNMrC7oljLVkRE85RbUv4wzEk9TA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791625465;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=W0q8ZcEfel2s6+/xcrvhDgG8tcwvf+nn+YvN3P8L3Dc=;
 b=GTrTkmDrv/EQ89ybMrZIcuCAoXfH1QSXRmej1rFWWnu4DXM2SjWbKidNSaslXagT+mtK
 QyiyZfbK7OZb9dYZbITzqYiPbMr5aewXC0SJXC01r7L5efGttBaxfsb2VkdkDsX0kkv2M
 cGS82yw1s8He6NOOfyzhzTnBw4vYw+9HV/YhbOTFCfi1HvSZn2JTgQJnQk/JWwYUBasS9
 QuN7GRvmZGa9iA1EkX04hU3BaQzLzwQY+Evjg0clFnAfUJoSPdqwuS5RUDrHSBPvH+zN6
 O5lo4mMexStFhPCDeZJTltiDLy0X4GwD3DXnLfPStZKxLh1saF6KZboZUMdFzFgaDbw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E72B60A68
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:44:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29EEE8FE45; Sat, 10 Oct 2026 09:43:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:43:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aac023e8eab14f72df75a4b5513927e76040b182
X-Git-Newrev: d1c4544f1539aeb73da97edee765d6df83248b23
X-Patchwork-Hint: ignore
Message-Id: <20261010094307.29EEE8FE45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/socat: add support for OpenSSL
 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d1c4544f1539aeb73da97edee765d6df83248b23
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ith-OpenSSL-4.0-use-ASN1_STRING-accessors.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
new file mode 100644
index 0000000000..6c53500d02
--- /dev/null
+++ b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
@@ -0,0 +1,35 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 13 Aug 2026 07:00:00 +0000
+Subject: [PATCH] Fix build with OpenSSL 4.0: use ASN1_STRING accessors
+
+OpenSSL 4.0 made ASN1_STRING opaque. Direct access to struct members
+(->data, ->length) is no longer possible. Use the accessor functions
+ASN1_STRING_get0_data() and ASN1_STRING_length() instead.
+
+These accessors have been available since OpenSSL 1.1.0, so this change
+is backward compatible.
+
+Upstream: Submitted [socat@dest-unreach.org]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Downloaded from https://github.com/openembedded/openembedded-core/commit/aa435ebaaf7446ec07a88586f2de4109e02a2d38
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xio-openssl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/xio-openssl.c
++++ b/xio-openssl.c
+@@ -1898,8 +1898,8 @@
+ 		  case GEN_IPADD:
+ 		     {
+ 			/* binary address format */
+-			const unsigned char *data = pName->d.iPAddress->data;
+-			size_t len = pName->d.iPAddress->length;
++			const unsigned char *data = ASN1_STRING_get0_data(pName->d.iPAddress);
++			size_t len = ASN1_STRING_length(pName->d.iPAddress);
+ 			char aBuffer[INET6_ADDRSTRLEN]; 	/* canonical peername */
+ 			struct in6_addr ip6bin;
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

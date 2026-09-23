Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A2BC98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C129281367;
	Thu, 24 Sep 2026 18:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XV6c1l9h-EUs; Thu, 24 Sep 2026 18:58:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C4AE58132E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276322;
	b=KYlwl8dSxf//VNSYQODXsdUx8pRerD9f8+dSAbccXOS84KNrYzS7aa/90RsWJh7/HJCp
	 6Gdt4IYJDGDjRVATi4skNzBBY/rrP9V0IiRPgyCWG3v7Y0F9lsUq20b8dEp0CTFmLjJII
	 gq6jXJpEnMYEx7XOWhKr6i4UJHyBwapY8+II52rd9MAgDEAwe2ZRJZZI1bg1FYcDHV9zG
	 KDIFcXqACEyBv6VYYUZCSWBBypm1Q8u0us/md56W+n1F38BpF2FfVNOW4/hCltq5YgRHR
	 xVbfrFd0yOzE31b1FEM59s6s1dr+sJldGBEVO06bcrkyEvHhQMqYILf7+CPrMZqNJcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276322;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YHm82ATDgpiSJud16pX59Uh5y7T9e0rnsAn98fDeBfo=;
	b=TiS5vxXwwGAH5nEFjqucPKAnhKMy5TgVF1WnDC9BHhXl/8APkG2vYwY8mPAsKIZiDF4o
	 RhvGU41Xg7T8KwLXraQhCw2bsKxS0P+fp5brwvX1cXfWUS8ffMwTvbG+WmV/eIV+4Dsu0
	 eOkE4Qzr8A5vVVG2sF7wpMDwVy9jyxrcPbaK/WWmmEbVk2mx8K2YWV+YrTfWMr1IpmMKh
	 UThOjxU4FYcJiYFtOfvvoZEYYPhsYeRKBYRwTZrJsIWU4ELX12mKJYjLhL7eQLXTMVOVe
	 9ztEAyfMXG6O69vhTjhCkSqdr+Tuwgl/9UCvCjzMScGON1GJTHsA8IeEaugcGgsGdbA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276322;
	bh=YHm82ATDgpiSJud16pX59Uh5y7T9e0rnsAn98fDeBfo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RD6yh1W+exzb5S70gaHV7giYjGIVfCDCOArznbHAlZzL/bs3OEUcl7GjXyYUJ+G3l
	 LJZFlnAN5bKO/bI0QXCGU0HcMyMg/wXOcecm+SuC7Unfi0TSOnyZmYqFrkTeOjLynb
	 tDR2nM3jsPUqynBunte6x+o8waiAmYXmIGvx1X2qyO6NOJmKSFk06NXEmQ8bmftWAV
	 f53KVudPQkCwUUoTPMBIGNZ5HlvKEvpVgip6NjUT1io3uOhPh8nTiOGh+Gq75KRt53
	 NSxyvt5jT5LIOVXdKbKkb9tMmzldvG3qXOoxKN6c2YIzVELg189IprNYbiGJdb5ukg
	 zGxEHLBoi6Pzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4AE58132E;
	Thu, 24 Sep 2026 18:58:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC4A9328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1A0181235
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mfGVcbWKwtL for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C78BD8122D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276210;
 b=mhhazGG/NqIpCioYIhEFhBdMMD3AlFSrLA5qxdPf1br0tiOEnCZBJO02RQz8x7aiReKl
 wwEz8oqpE6V5jcTdM6LFY11sSfpu5BV3H+2+yvTA34AEX0xLqDX0061EzOVVa2YsfVLFe
 8uAbPgYuyo12300fRF9IjI+qH65FKU15rULtW09Qvudnc1Ykpp/x3r/A7WofM9xqPN3zm
 hfJBloRQ4GBmws6Z9Ch46WRRcjFibAFe6bsuax4Mb4m/HD32KKvh00m7dTNdJYLMXQtha
 HyteKJvUudLVcHg1Vbo+RQam6qlCqG0oncpgfy+OoZk+s9FrDOpJh8t41NycFQz3KuA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276210;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nES6DgYe681MwfgSuPy/nSBxK6HuuUo5ObVh9rFw6lU=;
 b=N0viGV5f41gLtA6586cIv9U69np7VnyoCNSKNF9QSycygBULlo42kynaSoVb6yK2hdRq
 RDQz4paUt5PKmPTT+72Gmcl/RyQM8GSadf27XAC3orJooGwOxr+oAo1ODeAT37JBjzU2I
 NBJgddeAPe9el1B1x4kyJrurTtt78WD1LTq9yxo6bq0GvKlkJiTI/xdZNkZfZ8tHJf9EM
 up/TGs5JX+PLAEDkFvhg3/+nqIbtwVizyrKiCSD8wQtb9Sa+odyWiE27xZwJgBFLKlgan
 4Grt/KMfF7ly5cgmWq8kb+WKjDN9p9wi45G75Ioq3jfYfdUL40RCFlaLY4I7K9wmRUw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C78BD8122D
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B5A88F0CF; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:47:09 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 28dfc9a5d99cadf81a2f0af3f77b203ceb15b4a8
X-Git-Newrev: 874dfd0e1ae5693d961d94f17cd2c34332ebb191
X-Patchwork-Hint: ignore
Message-Id: <20260924185540.6B5A88F0CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/netdata:
 propagate gcc version dependency of protobuf
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7789965011492789113=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7789965011492789113==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/874dfd0e1ae5693d961d94f17cd2c34332ebb191
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Since the bump of libabseil-cpp in commit
76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c, it requires gcc 10. As part
of this commit, the protobuf package was updated, but not its reverse
dependency netdata. This commit fixes this issue.

Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump to version 20260817.0")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e91ffb1afbfab37a6fab61d01619c8759ccf8162)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/netdata/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/netdata/Config.in b/package/netdata/Config.in
index 527d4d39af..2c7d456528 100644
--- a/package/netdata/Config.in
+++ b/package/netdata/Config.in
@@ -23,14 +23,14 @@ if BR2_PACKAGE_NETDATA
 config BR2_PACKAGE_NETDATA_PROMETHEUS
 	bool "prometheus remote write backend"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_SNAPPY
 	help
 	  Enable prometheus remote write backend
 
-comment "prometheus remote write backend needs a toolchain w/ gcc >= 8"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+comment "prometheus remote write backend needs a toolchain w/ gcc >= 10"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 endif

--===============7789965011492789113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7789965011492789113==--

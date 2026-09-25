Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6171C9830E
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 19:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A34A60D6D;
	Fri, 25 Sep 2026 19:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVucy-HBGphQ; Fri, 25 Sep 2026 19:58:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9A9CD60C09
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790366335;
	b=UGkZZCTHDwVglhYOtnyLi6UYTPIcGtySotjKenIls/rSDPGC31VDikcuBeZDcuBnonDc
	 Uo/HBLwNwam/8wMdHt6qdFJr871ar9yqSUNb36SRZ24cCQViqVOvZebwLyujg0sYzTW48
	 w4rwPX5AjvfAxNHp1lqLSbGy5l1BsITEH57kldhKPKqN2sl/a4IZftES32PHQoX/FlVrn
	 jG7R+aFLgcDnXX9yrJ/Jq7qozxu8THc9kz/fiICMPf7kGqYx4Dc8VfEco/4lEWqrIYOjJ
	 9piCvowuA1CdCBEuA22FMVN8ZpU6zJA0BTjWqACprFVRW1rvR16cPY18eJdU+qo1dBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790366335;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rIV5tYp0HslN/XBEXRvGlpARNf6am5oWPyjcWcC9GjU=;
	b=GktEhQy48XZO5H10prFcOtx+0xBoDhLDNfNLa4Kn0nQkPhdnieiAw/rusG4ZMKhcucdq
	 WdeB2P8FXAkOA7cfyT5DRODrKqHWCi9z35PVn7UiTiB7o+BWJiFPPx/UHEAfNmG02lrT0
	 6bXJ50lWlWE6sGZrJrRWFp7hZpPEHu/zUN8W5ne0w9yrw0gnwmR69rmsbCJa0uqQ573Nj
	 yE4Ve4g4+thJw3lUT+v71OZn8EzBsxvRV7xwNaI05a76Ri9LpTk0QcOmCdHR/6eqDnKLb
	 uw/wE8e0QkQSj7zFNG6apYU+PQ8ojybLCdXg2QgEEVSCDCmVbrnWa1qJy0ccb7iHLaQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790366335;
	bh=rIV5tYp0HslN/XBEXRvGlpARNf6am5oWPyjcWcC9GjU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=it+bBgZY25Xb89Sy4yZy5kAiYpXc4JcOsGQPLRbYjVSWVGDXgXkN7NkrYmx8Filj7
	 MOij59qzaTa9ZySj12gWr/aswtia3ijhkRvaKJ4ivLiJXGf4+pa1YWumj7kub1dNsO
	 5gaZmtXLZquSBY+GEmdPhAw8WzfDe8epxf2KofiBZbuLM4l8IHHpHwn0zMLrZ9juv1
	 GQqw4Dr8vShwkVOIKr0XxWKKoPJcx9nlkh8y4BcD2MJXyI5J8jxuVar6yaqXAbAV0U
	 Zm/+3zAqbrjbUmlGLtHSJA+5TZBM1zCmVECTsxZ9OdfJK9fJwH6FJwdWGwjivDUeG5
	 5if+K5Ieo79eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A9CD60C09;
	Fri, 25 Sep 2026 19:58:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8080E22B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 19:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E0E6400D6
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 19:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4o4ROae_FG8J for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 19:58:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E4CA44007B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790366333;
 b=Zm5w+GCA7pHm2x4NGjJ6WMStD6vM6LkEbBb75iKy+R2l+Mu3sZXVgvIp5fVWb+PicJ5t
 NMgdKkY4D8xmKeTd09GMCHZp9CT9c2ijDR7bYpIt7T+kU4ZYJG7ovzytX8jhluVZLquU4
 LLLLWHEFwP4jPdIX5fkjOI3xsTDKFx67uQ8wsfUWKFfoqmJdPgkZv+BHOuGJVfg8XY5mm
 DprU9djMeRb0TYpKbnMJJKEtowM4jFuJk3RFj8TleS0I7fZNsXLwEt/3x6O18RAEWJI3Y
 zSZcFIjPli5Iy76PSEZhFXVw18VnB3G+tKg07jkPQqAFE6V9astaLW8hh+rVzbCeTGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790366333;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=7h164Sd1Mh/5+0OOuc+LVIST8B/HKariEwyXxAnFiD4=;
 b=irpfQ4ZcIaQV59XDQvDyuodKluSOvv+8sPJCxM+K7aDYfTxHnx57HtJXbEkcunQB5oW9
 dfw/3l8g5noo2qzggxg1MWZOGp6MvOHXEmqQYd2cotHQJKGqbSwJwDuKRM/6L/VjWWxZK
 P6WgIS2C0mM7AowE+xRr5NlBM7Yr+HTowiDl8ziXji+ZjAgczzJKGOZiaw5pWBwp+R8EX
 rOtSUxTHvBmfO4TIYIvbFB38uPPCq7q15p5SdmnyYR5MaVqq5Y8MrYUXEimTpb85lujbH
 laRfTWIFNnNMvZ+4jp9vDCk+unnQyw6wl+Nx+CsltAIAROliqw3Y0KYoDhX6SgeJQfQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SVRq+vx1; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SVRq+vx1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4CA44007B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 19:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790366327;
 bh=7h164Sd1Mh/5+0OOuc+LVIST8B/HKariEwyXxAnFiD4=;
 h=From:To:Subject:Date:From;
 b=SVRq+vx1/JOd4hh3IPf6zaKYH2H1ODw9IRM33LcWqoX7kMATdZ6clxMFH80ybbHdw
 11DAjUckx8w4TQqE8GsJJtk6lBGVvwxl3k5xD7O7iXC+yq7cSHMAeUacIjFEBY965P
 R18Vyzstd6yJ9v8oolC8ytPhf/sJoQ8h1kS8MALmRr67afZLUG5L+uaKWo2FV/Pbpi
 UqUZJnn34/tJOIngsAHgJM6TKE9/SYjBRC2iU4wBo7HKv6f5cuAx5s5vFIjP6zsCq3
 ZWxNgibVZ90SVp/3Uld6OgpCdoNgai5QBCNOEgXI/38euv92Mgk18ZtoS9v8kMQ9xS
 4Wa3Q6PUN9ODw==
X-KAS-Sym: v3:f51bdf72230551df:bXIS+ero9+aRNSEsM67qKvTiFbb2GH0gJ0cdwP78uQugt
 vDm+k6wvx+k3fTWNWklqqpGtkKBUzHRVZXjKRv3X9ZHhRkAgzy9//q1Z78W7Yq19svBoIN+j1dk
 wxWp9lZ8DTcB6GBq0iKvZIXHc66G2JVbUJget8RMHNuXsmQrC+o2zwibt8ELvgqq/guZNntO/z8
 dSivNhQIWvJ56D2RdQlmCNDLfRBlGaqWIYddzUH/OrWWJ2SGrel+CXFuTkD/iuu/OkJ8k/+2d7v
 pcxfdNO/saZYnEDd81hOhQAi7t01NerSqeC1QmZ/lnPfg7ZTLi3TQoILbGDvKSZL9rd95ojQ==:
 MymnI7Mb+9Tbu4LiDsenJvG6YQIEAJPkDMQvpLFZAKaRrA4Zq4HVCoDnvSaFRC1ED/+wVB8G3Tx
 v1xarHSsWsYFapdojstC3Hmerq+gveTJfCVCa+MUXxvxw1A/Nqw1JQ8f2vLym5nUbENWl9OBNCY
 pcD0/GuEMot7KoFdMW0yWycqeptW3GpGzCEGrj/Mbee/EpMQ66VaorvJYmcIiHBb+HBfZ0t2Mwn
 FKLtpcBl25vwA1/PtKY+FChanwZ8T+Jx9QhANAHkFWniUTX/6lxPsT4whgAyBd7/7p+OXdONrr9
 mJSd/kz9WTSdlQHhHcn+6zdmkCUjjqSUceeUP7LzHspmoZTXGisxxIMN5CsQO5tF77iZSdfxzTE
 MhKRKel6SupP0HOTHUwxfqxyGPdqhLfcbAlrpxvi75zBwJy2VhAnaHW6eTAIiNlpnntSUPiwLFB
 i9ecJaioeWNJCm/IJaivOtsmXyI78EwTDZ8V0s7p69KU4+oEPtEn+9pJlC41R8zm3BuldOoDd4m
 N8+CmMp+eQZgShzTAbcbHDj4C6zka7rJyQIAQUjEOIyKnaalMgw0DtpV5fPJb0Yrr1DNEHYjC5D
 SUDCLQ==
Received: from fli4l.lan.fli4l (p5b3a055f.dip0.t-ipconnect.de [91.58.5.95])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D1259A4C3350
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 21:58:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59574)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAC4F-00000000883-1Vwt
 for buildroot@buildroot.org; Fri, 25 Sep 2026 19:58:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 21:58:47 +0200
Message-ID: <20260925195847.3565381-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.2.x,
 6.18.x series
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

Update the latest kernel releases to:
- 7.2.7 -> 7.2.8
- 6.18.53 -> 6.18.54

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.2.7 => 7.2.8}                     | 0
 linux/Config.in                            | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.18.53 => 6.18.54} | 0
 package/linux-headers/{7.2.7 => 7.2.8}     | 0
 package/linux-headers/Config.in.host       | 4 ++--
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename linux/{7.2.7 => 7.2.8} (100%)
 rename package/linux-headers/{6.18.53 => 6.18.54} (100%)
 rename package/linux-headers/{7.2.7 => 7.2.8} (100%)

diff --git a/linux/7.2.7 b/linux/7.2.8
similarity index 100%
rename from linux/7.2.7
rename to linux/7.2.8
diff --git a/linux/Config.in b/linux/Config.in
index be3fa803cb..291d41b897 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 7ed646686c..d5e874c113 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  4ac34c47db2540ffb2713943f8d891ff1702e0ba6934525a493b7d1cad43145a  linux-7.2.7.tar.xz
+sha256  12e8d5a973d1ad7c5a5c69882e4022b131ed715db7003fdcd760ddf8c3e51941  linux-7.2.8.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4d6fba95c2244b08a7b4144a4d38b9be4fb31abb5e7682ae40bb5cb11374cfe0  linux-6.18.53.tar.xz
+sha256  9df30b02dd8102bbd0be52556288ef6889ddbe7f1ddb96fbf847d0becf3eacac  linux-6.18.54.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.18.53 b/package/linux-headers/6.18.54
similarity index 100%
rename from package/linux-headers/6.18.53
rename to package/linux-headers/6.18.54
diff --git a/package/linux-headers/7.2.7 b/package/linux-headers/7.2.8
similarity index 100%
rename from package/linux-headers/7.2.7
rename to package/linux-headers/7.2.8
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index dfad885f1a..88ee7ab17a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -481,8 +481,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.111"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.53"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.7"		if BR2_KERNEL_HEADERS_7_2
+	default "6.18.54"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.8"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

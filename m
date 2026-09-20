Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83896C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50CE46073D;
	Sun, 20 Sep 2026 14:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xNGZQgJKZJQ; Sun, 20 Sep 2026 14:48:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8040A6065F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915715;
	b=YoATEgTaVZCQlPZGVjbFcAs0dav/oP+zPl+9Q4BS7lmODK2nvUNzWTwemO87gC8O0ce7
	 WDtefKVmSA0Qn/jopzKMQa22QZ1AyE7WRAIydNI+NP/Kjww7IM2vuJwy3oON9jH+0FUbe
	 NvhkTC0EIoppXG8MfKOzE7r6acqWFNzr/RcvT/pNJ9yTmRhK3BbAHTuCPsjnyksVi1jYa
	 CWFtEjl+DnreBpb9php3JOPx2zRuELzTCKgwL7bahDpEhkOVO2sSslC9GVii0SciiuBkK
	 7RCtTUbdUciLQNr3sguw+lX5E4fO1qdhuniBVs37G+SZyGrz1+9HianXyEO0TMuZMPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915715;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aRiVEgXoDjtm+Fe3Y7oEt6VWwLbN2f142nxkkTDc7Ow=;
	b=W/fENBiE0857qi+O6dDoCP+7/LRHpNIZKBqDUibc/mC6xJ2v9ie3me7meG8l2nBBuoQu
	 Fjr+1BcEwMiuU7UQX9aZxKTA0Un/zddC5ibHC3RpQbZ+ZUPaP/yZ2rjVf3h+UKdIIwWNr
	 8IAfKdQbWee/gPtHvQ11m3O4cd3rOyedvLQb++F/27FXuY5BQVJZQ8LC67IdP+VADxLXm
	 IQL/aj8fdkpBu+2Hre2c4Zy/cM4QJiueDHjBtGjHozvdS143sGf5ywASXNIvp0LjbhgYT
	 TWRD8zzAuZSr7kOcKfiHdfkKI2BL7ZKpHNkW5t2SlgyjI/mKkHbe99JEIxfr9vA46Kw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915715;
	bh=aRiVEgXoDjtm+Fe3Y7oEt6VWwLbN2f142nxkkTDc7Ow=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RhV84dUinPAts38NTvM5h9XRmCqgfKK9b+I+WVh/mHouZOgNVPNLmV0rAPgWD8owc
	 ikJi3O+CWbSmOLY9uFtbSO2I8oZshFx4qZPMRHqyXx/JUNZfJYD+yA0ZB9yH5uSWqu
	 JQiE7YPdNdlwiwsEFe68Vd7gXDKXx5WX0FvszKklCcZihAlGSWFGeGDlBAqzwwq6Fv
	 Pupb6fZ1dCN5oFOAUNtAqlABZo9ouEQHiu6MUflFnV9Q7gf396tvKDAEAGG3K5nmj5
	 gu4IrBIp8Sr7Ove6YyTTS+X35b6zipZF4Zx/FCjEK1iZHQhCSXD56IE04yQ5IKFIGq
	 VYacMkeZO2Alg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8040A6065F;
	Sun, 20 Sep 2026 14:48:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F9B024D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7129680DD3
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElPBVf2SZLjR for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:48:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 99BBA80DC8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915713;
 b=kLQuMOKAIQEXl2SBVDofwRPmtX4FwYHxAncaXMNr5tIihwmgZzupDwgPsD3Mnpd0M8Dm
 6fOuGidhfhPsEhif+FNL0zp4FWi5vbP3a9yVsrbmbPNO5GWMw8lmVXyxBG+2H5aP1o8ql
 9XLHzpkOX6UEjHCGqE3AJ9BjyB5meVWk3fxfCKgUVU+QrFt9RNwGnW0vZSlNCWZ1PtOEv
 fD4aYstzwEr+x1kacD5upKI7IqBcuvzmmaEBzmAVoDV8qusoFo7vPabeW+NIGRXKrcfQz
 y4ReANuWX4UjvQ2C6ipaG/1omxDk5caNZn+fkZrOofJ9tL1+pBmAhacZAr/QoEOaxYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915713;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3O3DnL6LfnkCgxNFRYdPkZcCcenVZCICDFGJ3mUv5tg=;
 b=tfHW8KtDoZ8QatbDMiCh0v0taBdI6K1HZgCR059IWGRchgQQWK4UvhcsqWMerKDXfR88
 P60bacxRPyyAX5sh1PeIFkPgkqL7//na2yGHxgm9yijqA7ehog0Da3o7MFEm1V5UrFk07
 Lm4uSGaDl4ohgAkarP8YFBQb/wy0ux6BsGdzdRBLJ2YLGqmSg5icERKDz9cQAK5YrrfXm
 EaAiRhJDLm6CpTCrax7jiLTvCWeAbCFcEj6jq4bRC1e5yYaMZbzUrvcb640ay4vCHzAjS
 DMDqo4/PKPuzgJ8z1EII3Lh2QxpGgwnKnnEAq7LvvsYU8i4qO9glmouyyVyYAVns3Og==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=p0DtigJU; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=p0DtigJU
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99BBA80DC8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915502;
 bh=3O3DnL6LfnkCgxNFRYdPkZcCcenVZCICDFGJ3mUv5tg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=p0DtigJUp2PYLko2SN6uajEY7qCF3N5xNUNZAdf+P/VmTMNBAOPEvALZdoUAQt8Ul
 wm3EEg2Ai0c8x3NJ2JrPDbkMVjE3MT9HqrldqAAmtVBVbtJHMklqa4lQGKwPZpMt6z
 C1W2q07uz+OuGiX4LWRzgItA5rJn+2phA9cwVrXz8BXQ2eQD3jqUGFNot2owLrVsch
 fiUJ0O8q0rI1kOsCwGUC/NRjQakNRHt2DMLJDl1jLq+XX+lYlI6IsfbdSK7u8PmfO4
 faa9xETWe5X5HA65ttAxooilsH7EwuLzg3El1dYSx9oavsdAqtGEwzPO/SDC/mvL6u
 m4j1RpXfwIyzA==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:+OdJGzlGczPuNNq582VkKL3CgZEYYAZYbGHfomwCBksqv51SDLIVHsqy1OTNUyCLI6bRpMtHxJqVCh4WtcqC00Wx6AHWvZRwAwS2+AO8IIZQB4sP1rsWStr4PkEeNqaU0l1dxT+n1xUWi2j1NNyN4Tzz3Xsk6XSfJyNxr2Q1pR6YjUKJLrna/B6bIY0K9NSGYCwP84m+L+XXPThKRgomgCh2gp9cPj5YDFIT05WENAF9nphbUacEDrkoGRznSOjRWwlpDLMbk6o8t8XiDnJRtUaQnmcJF1c0NbGCgkRk4YMSGJmTcIYFj0sVzsPvgJenWuijtiIuFqEBt6lqXWtDGoYcxS2Chj719L2EVOt+tXLKvq/C/0iHfpC4mITv0PjyOXXSbMRLG5Wgs8BQDQla4pSm4xYULALYiEPlPn+TJVFsag6zy6amxHchDLoAxI4CdjlxqPEDsGPeuhiYqFqo5qo5SEM/fjXw4wavvVYmW0uhpPTBiUC0FaVvODqYmFi2Cvjfsd6D9fOBNsUh4fYM5MADyjPozVG3JYm5SHrzcJshKCp+x/GTtGYx8Mco9G36zJn/JVx9QEtalGCPufWZHK33Bk/D9tI=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1AF19A4C4873
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imh-000000000hB-2OlT
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:41 +0200
Message-ID: <20260920144428.3009612-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v4 20/66] package/snort3: bump version to
 3.12.2.0
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

https://github.com/snort3/snort3/blob/3.12.2.0/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/snort3/snort3.hash | 2 +-
 package/snort3/snort3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
index 599818ee24..02ebcf85c9 100644
--- a/package/snort3/snort3.hash
+++ b/package/snort3/snort3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  9465d19b0925088266504e8962e97e55359bafd6a19f66b4169dcd21ef1d8ec5  snort3-3.11.1.0.tar.gz
+sha256  43000d6b0e0307bc1a735874d00deb61e8b6a96d074f8cc9b2fe2cde0058720b  snort3-3.12.2.0.tar.gz
 
 # Hash for license files:
 sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index 273aa56709..a6f296a062 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT3_VERSION = 3.11.1.0
+SNORT3_VERSION = 3.12.2.0
 SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
 SNORT3_LICENSE = GPL-2.0
 SNORT3_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

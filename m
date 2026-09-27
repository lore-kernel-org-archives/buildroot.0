Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698DAC98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 176656062D;
	Sun, 27 Sep 2026 10:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKKLjxW6NtAN; Sun, 27 Sep 2026 10:49:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 307C7605F5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506152;
	b=L85+Dj9BTDgp5gh0++xGQ0EiVafp325Y5s+qsmLXPOectD4BigDmQod51gyhbIFmVSuH
	 yUGkpSMGnUOlu68CI6szPAWJRE34WKnJicLbppkeQ+443RIYdtukn+HAzIL1rIT9iRZhQ
	 LC0YXID74a8/lHP80pZ+UB0LwzMcL62gtKJQteWrGx2KLRIRlEJy/SMqBdHie/BSnLtoQ
	 aqaZeLyzw3+uHYpX1nXH3AT0UR1YWO5KrsHE3DSrIF+GnDQ4odzBkm85r7b88znZx0iJu
	 PXOONzClq9wSmVzi8n4+hJdspqwx9GdNjXcMxsY6a7+EmXh4YZe72Vyj0N1lFyV+iaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506152;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aRiVEgXoDjtm+Fe3Y7oEt6VWwLbN2f142nxkkTDc7Ow=;
	b=GQqdfRAosjupihreQm73b2XCUy9Nz/wDer7/ACM4GX5EQXDJJCRAtON4gMOrtSKlpVfp
	 ncjgX5XTdXFKnD3sLhmSwUoVhmvazJ6H15acxE8IEdi/NKeAlAHWEHTsZKfKDL7fY1rOp
	 qB52JUn8+PlYthtsC0AJvQX+z6VhMk5G/uGlG5iazRTuT4R//rJ35o12stA2Zb7KOxbGM
	 qMIGe0eVLstPCni/FQ1A6dPPa4L+IyNkTYqCE/pKbweNtU8Rnv26xyVnitCyMWkcJrkl9
	 nkQnJR/eTIPecSuvmuWy3l4KgQ/uLqUnYcoM959txh1tlafTeXTHmEwNNAqhvk3yE7g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jJys8U3F;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506152;
	bh=aRiVEgXoDjtm+Fe3Y7oEt6VWwLbN2f142nxkkTDc7Ow=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Q0wz6pdHCnc3rvC4qmXstnPQCJjPZ2ikEN/3bx1AVrWSOvW+wY1LP1avuIFFt2K84
	 nx3FatoMaxYqNnYXUdhRi8Fjw1YGbA9v7Wr0F+i7gOtDlUrRis2hQlZDVDkz7WESEM
	 d4hzRLoLpuxGfwlDaouRaU3Z2DdqUPwpRtc0ur/yjT1HmYjt3f2AodGYa/o8DgbfkS
	 MyKK66/XcVqTD5Z6ukg2hzI/bu0fx5rws40Bh6GdzZ6/o87TSv3amTkZyhkiqcYQCa
	 /i4gmV7rtIqwkhcO0jFCOvfSCpRfrJZlxYeVIH6f5oushoUSQqkHEM1YqoWxEztU9N
	 xIIQbH8cOGQ+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 307C7605F5;
	Sun, 27 Sep 2026 10:49:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5141335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA292605E6
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fABuOdYtjvrX for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:49:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D7277605F5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506150;
 b=q3LjwuMgRWF6hQyF2pn966M4io6ph1nlDhTXB3uAFxmDMgQbJBUkTT4F1tWpkphwJT78
 lkWTl0au3Rjalt/NNzOAUDS2kH30LLkGul2pm0P5eVCHtPRZdmmh89zTDbFXMTnxY0T6x
 S7Wh2meIddN8YUB8QoYzWHhelQFT5mVJ1YVw1WTJDjiW3ZCFiOWMKFM2aXODs77+1D+2s
 FjjqxxukjYpZs0Yjjr++oXgmAK9z5A5dHu1pa3AF3y/GO1IMzX/0xHl+wXNBXZVEZ8a5r
 PMQHmBq9isBRrsVuwzHj+j+6tIyWstmLeGcK/dvUDRIRChON/3sXRqqds+CnJ6ipqQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506150;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3O3DnL6LfnkCgxNFRYdPkZcCcenVZCICDFGJ3mUv5tg=;
 b=YXWYB0JiQgcI18wmNxYWtR/NZOX+NsjHy+x3ttYcG4vHX5Scr5yUUKVj1EPJHsTdQ9Iv
 cEBb8c3QCYIHYK8HwR0CteOS2X1u+B1AKX2LJAnpiw0ys204kwEhT0g4h+KqF5E35psM3
 5NeBQrnmw8sbN9o02bA1i3LrW5grWctfcEFvsFBz6m6t0cNo1D8G9hhWO1uaaFXbaR8pn
 fJ4Ywh3PTYpvTXesSfdldrx3sDS/sAlYltGaiCsWkSCbNN5n/p+kV4QeQHTxZ6+qnwf9f
 tXr/f4ESKyYoGk1dXCUWsTbBS8v9U3JnmzxJ8Tl88dqSiD8tmRHHcBUhXpLbW4SSFVQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jJys8U3F; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jJys8U3F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7277605F5
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505842;
 bh=3O3DnL6LfnkCgxNFRYdPkZcCcenVZCICDFGJ3mUv5tg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jJys8U3Fz3tdQpTcMrfaWXDHpYnBDg4ePVxvvxU6cATl5YAp5xSf2ZyX1gFyGpcG8
 xmb4RVaxtF4xR/sKK7m210cIRyqatoRjCofyvYz9gZFr9syM/8/FA7FwZD4IAgQkGu
 5sPOojGM5WcRXBEdTRMCwbwJIWfq60nb/VkV1IiWsa6780wVJ8MK+42xaShUeSyKbb
 6HDFAl+84SSGjRUe6+aMPwzGzg/4/2K1/XrYAUQVTz9V6nNOQdItIi3N6h8bS29Qt0
 zaQ73Ixx8Kvdln2zUlhkLd44C250Gnn4K9EI1QUBhsRJ8xuGcBalcbvWXsLJwdOkCu
 +8Nafz1Bsa5sQ==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 1KfvYPiNPqCnsvL8/+6FRXLYHuVN2G98SbKl8hZyQvo0NPKO0ZOKUBJ3swq4UU+g8xoOMejXv+R
 TMhbLAmVOadd5l0Has8K1cZ0gKGmAQSNYK8OEJ6NpVT9q1mOkxKfu3FDArVkdnQU2suvDe4FWUL
 ZyOQh7EWio12gYcMZfdG3A9DvhCWuDWulvMPBxf/d6/gNrbIQXOj99yxQS7Sj1YFmwsYTnlm9AJ
 KFoYYqP6FgmJRgH+funiir/g62mwjBcUGfETsTUV6LIikIKMsJ0ntqjDrc+XIlcdooN0lmVN6J/
 utuvTIKAtHXXK+sHPGt2DwaNnZlBpMHxraImkAxtbZyUBHtwHQ/8K0QeRb4KD6zXHGpx3Ozbck9
 BGwf2OsFnZT+MQPp8t4q4sdpgZS2WGy44VTk0wjU/lSC6CuFhVtpy6XTirNlX8DwaK55oFMFZGn
 fGFCfHZ8iNyPe0KL8LJiz6FVAmU98sKa7uvSBhYvqTjuKqrS087qDJhzNLEEjMQ5c+Dcfjv7izx
 K6Hvw30Xakvj40fz5BFq7wOOZ+RcfChTatcpCJO72BZCvUbL3lvv1RQYAqEIw2Q00oITAZWGbOe
 c00OgKzhJ16NMTeyx3nq3FL+q34l6sE7M3IURCbeIL+Lvi8fQUPJWBT0paxDjawmmTXyMitY6u/
 v/0KHGkcgOB7JZTaKbgAt
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6CDB9A4C4F8A;
 Sun, 27 Sep 2026 12:44:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLc-0000000007a-0hFU;
 Sun, 27 Sep 2026 10:43:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:12 +0200
Message-ID: <20260927104301.1801638-35-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 34/82] package/snort3: bump version to
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
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

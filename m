Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18089CA600C
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 13:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A4E381213;
	Thu,  8 Oct 2026 13:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-6OPQPQvYqT; Thu,  8 Oct 2026 13:23:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B3543811F1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791465827;
	b=T+BfZeEdqtlJKaIYry94IaHQRqayaU2OwrKvN4qXPYr8ZtGtf/+EUtmAvPPzjqLdSO87
	 nJeCsffLVJiPgEiR+3jXgCiJHahrFTA3ydGduisGNAY0Fz8NqAl5M06kM8zJGq3yRS6H6
	 hM6nm4GIjM5Hnz1cWdHdP7kUbjfNBDc53yiTxlaBBIDVMlVI6Rzgm7nOknw2KMmzDwSY1
	 tIY3vexa8w5hDNhtRvkij676DUsF6sVuKcSUlRbVFbYV86lHxva7AjXySYwg2JoK8QXGu
	 vsjiObX3I21wWhX9bM0x7VKu/uP0NXXvVDaixzDEs2N746E/wYy+uD9Z5eMphfRmmaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791465827;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=erX1QyzCTmnXqr4WbzyMaQ04iPplQKMXQkhInhZ9+ZI=;
	b=ab3nMn6yFwtKc1/N03L47HbOi/6X6rQDGbOdBI5COMxwHnQdcTNKLR4mbJzYx1oYVAmo
	 qSAAl5oQDEI2qb676aZzENv2FhMPVOT+PZaQFW+bTlVHJfWU8TY+YY8GVDg/krXI/6uU9
	 LskIuPHxKXthQtBZp6eeHSwkF1De/uohOIsjx6I5CrAJplrPCVkXrWNcfHzULF64jJX/z
	 ZsDZlxYSmprlgzf3+yQe/tDniML8d41YRfir4hLb0mgjKIrxIVHC8CtBdN7FX0iFIGaDx
	 utSl9KQY1w56C3h3JsyW5dQScVxHTS+wocKrrt9t792DXDAzqMmgQZl8wEs76Jmlalg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=YRHoqhvK;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791465827;
	bh=erX1QyzCTmnXqr4WbzyMaQ04iPplQKMXQkhInhZ9+ZI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KXU/gblq3n8FZ9vhl7IXTR6eCsmwwRUuBMsG52uwOuNaprvNMB5wb27RhrCcEsS2j
	 b2llLi/U3qLgedayHkVuIHh4IUyquCj3rzO9rJ8b0WwAiyvhvreIpeDR30W32BGGny
	 PvWzhahCjRwiPIs11KEJYAiarVtKpug1W8zG0FafcDweIvN+t74B081esxubISUE3v
	 NDUDT4tNLy7Rku8gegKVV2LMj6hGSQYsAU9s3Qq5HagydUerrjzTfatWE51jMYfzal
	 C3sTefP3brfyQX6pxztB12gQx8QuhlvVP3d3/f9htF95oGcjliHx4zZa3W9gn5dilO
	 lP4zcuBUJbfJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3543811F1;
	Thu,  8 Oct 2026 13:23:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA25A34E
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 13:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFF738110D
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 13:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ZsVWRkIcez5 for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 13:23:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 364A98107D
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791465823;
 b=jPZNU1L9MRSC/CtM5k8rDu510C1n6uO1oyu8G4iix/5C8RQmga3YVEsW2MmWhVAvs6iD
 GJPPGaPXVe3Rt5zz1iiZ2t/2cJWVwJ9mpy+M4ih/rfHFytegum34JQN3x5rEVCj5Z7Jnc
 xukotzFwtQC5OGtnBueww6wz0ujNgjmtQN9d8edwAOLwtLkJr1NI2scqRJSEVGd108vB4
 hBDvVGhpoevCJJz/RXggMkdaYkthtNntHOeyzeMl6+5JRssA+Cs3N0Avjr0VQcnp+yaX2
 j9z48UIBAJzchLGIAUkjcwfR+aJUMPc4ytR1mLSwtPIIVmpR29/strvtqIt86SPg6WA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791465823;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-CMAE-Envelope;
 bh=MV6JcMtprV41lH3fzYyv0MuF0u67B92My63x+spcOZQ=;
 b=dy5SwZdJ8LhTUCIkINpm5aYXA9fNEB2D7vqr8WRzgVxhGmuQyDguMdIgPASYxazPF5FA
 qeSGV5gtbG3kXsNyMpKP5vJf70ZYD6QVdQ2INJq3FfmwPWRGLR0ijCWvP2C8JHy7e/6+N
 AjYlofIa1w2omgJsamv6DMOdF3GQ28bYfDb2TJTCkaMp2EdPqg/C3mrg2OANNmtVgf/K0
 DuVCeCmjZg4XR38Mm0IZHeyzZ7ozHDngoFGcFaVjd1UtKWU+viplSE8HvLdxfQ3ByLXVF
 bzQ610oWlbw2zvQ+rga8EbZqjaM6vrd2lrfLU8RounXmoGcWZ3d40kVgX3sl3dqmfig==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=benettiengineering.com; 
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=YRHoqhvK; 
 arc=none smtp.remote-ip=62.149.156.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=YRHoqhvK
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 364A98107D
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 13:23:41 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id Eo5xxnFCVN2P6Eo5yxx7xM; Thu, 08 Oct 2026 15:23:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1791465818; bh=z8spH+praoBeXaBdDT/NeidYp6IOsDVnNqYJeTOENgU=;
 h=From:To:Subject:Date:MIME-Version;
 b=YRHoqhvK27G0b0/tL4hCicVwbDpHu9IvxLVdaMon5y695wn2WAv/97pc7cuEdi7k7
 uK8t5/CkhRn0N4exW63FCnccyrxHqX8tNU7PwGfkRcr12YND2LcsRwZrjv567eE3lh
 ifNvIL4N5dGcd5jaSNJfjHL4S9mZ5jF3/QjGPs31PeZusBLzlWU4Ud4wYLlLtZrE5i
 rsdySs9PEQW8xZ9Cgvtq5ceBEbufjfCTxrDZbvcijMivisvMNr2pmYCRV6gu5VPUaQ
 2E9IFaDarUyTuRZ4e8xItCxCQFdkWV1UyLAoPagL3t5OSTrc3cuEA3eJnJn0jdT1FS
 nhIP8h3HQ6OLg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu,  8 Oct 2026 15:23:37 +0200
Message-ID: <20261008132337.3883254-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008132337.3883254-1-giulio.benetti@benettiengineering.com>
References: <20261008132337.3883254-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPlWFJ7CnRqXcoPPv01fUtxZAGrvsuH7gseOT+XRDRrp3xWNSPae5Fyc95leV3fY+KmDSLwTWbuL0vPncZJrPCBqvMM2fWN7GMES3Tpdc0xgteANkJVv
 WqJ0KfvyoFAC7drtFAgIxeOkwcs3GsmGX39bvS1zQ5dWSNPvUTNGyYhSKzdS454m3jJCWfZjdPyfY7pXP0jiAkHSTfG9fjLAXGAXigwOAFOLuFDMUMBywp0g
 Lc165UlIn9miiNDabmXOqv7OiAMRrmMWELwqeSyvBEVO+NTy1RizhkJBxg3XKmnAtT11ZM9FoHXWDsHCh8OHiQ==
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 14.6.0
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

https://github.com/harfbuzz/harfbuzz/blob/14.6.0/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 0d465e7c6b..da30d531a6 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.5.1
-sha256  7e2fa4e8c7c98e8d8140671f5772542afaaa6acccfbd746506886b6d85f7f8d6  harfbuzz-14.5.1.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.6.0
+sha256  d07a007327277708a2a73ae437887cdbaf282937f6d03ca5467723e9099af586  harfbuzz-14.6.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index f8f512d5a6..556ae3db61 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.5.1
+HARFBUZZ_VERSION = 14.6.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

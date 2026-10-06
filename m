Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB213CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B72D160818;
	Tue,  6 Oct 2026 16:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xjzx1Zpwc15o; Tue,  6 Oct 2026 16:39:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B807A60B2C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304765;
	b=nWaX2J7+LnR8sIbSnyTpBdnY6HRvSBbsn34k0JNeN/X2WNFyfgrxFVEOtz1Pm4/Hw/ZF
	 z/jR7OE0HERcx7kSCa+860ATmce7glbM9QTHi7krsLx2U1k/KNG7b8zAiH8xVn9pMYWOz
	 +dRp1G37IlLIHF+H7LszJ/82y46v2qSJj4qyyg/2eelNVAMwkpL43NBARQToC2X12VKHm
	 ZX3/JHbq0mkWh2rylSdGZdwqhoYymBZuu1ow7bSrYRI1AZUluK1y3QQld19ONcJDaQpFN
	 Kz5qXCV5Vm5uv4hbUkZ4pt2SP3bkQvxrOdqpfchWCo3tSABrNC/pIXdVwji6ajxJ0gw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304765;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XvdpiigyWHxLQf5slVekUF7saI67N67UgLzWE3yf6Os=;
	b=pC3yMf1RIhqa/N92mx4HyO1nSONAC1LamDds8Wpb5OtTdcld1t2w72jyhDVbL6JFCbGi
	 5h3ke5O43aQ7FpjIgaYmp+I4ROMixFnl4lSRiIImlMAOhwfQaHWzlceJNbLsSN7tpvmp3
	 Qq69VFIyVzsx4C2vM3/uMYczqmpturWRC7eeua2q3rLk6xUSjdOEmYrc3uGBpk1EFr9dV
	 kUNc1LG4BIfZtCNNkdO0c8usXopPnbZFgUVVM22kw8FLmMfFWO53zEBWPgJMrHdHUEabp
	 NU+GkNn5MNEhnoN4HdWGrc+c7BeiNr2lAPe4O5pHN72RcXpaR9vvdvuJK1ZBYlyMtlQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304765;
	bh=XvdpiigyWHxLQf5slVekUF7saI67N67UgLzWE3yf6Os=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YjInHxQd3kB09xqkc7CBN1llH5V3fatHQvBYpEjWSZq4awS2PbceXfzVO3jsO/lMu
	 GfqHdPzL714cBoXNoqMPQudTAHVf9/RP49P0UbENuzlM1xJOYXr1OQzvwK9LE5p3Pt
	 XOJ6h1cI/ypyT40kb9p5UguW8yFod7v3G8Yw9cakmoR8wwBT6Qgc2Eq7kJ2kx6jh1o
	 ErEFUZJZjmik9cMIslo8dhnUGjc1Q5gIvXjY/N8E3Ix3kfGH8IUPjd+yUrFX7CfkSv
	 44qhh7IDvXrwhWjRTjG6eW3DP55iMr1TNbbaXpaMQOC75boS2FQSeK6+24Zshpl6Eh
	 Uk5rOXOHE5SSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B807A60B2C;
	Tue,  6 Oct 2026 16:39:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AF7A317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0CA240781
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lkRZXUaPkCZ for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:35:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0E63840750
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304539;
 b=l505a0e/0ylcPF7ZBHUf9lSdLlpJHivncPxzE+x8bACDFWYgXyEN/a0BBmJR4oEDAmZT
 hLhHIaYKtvPen6dp1cIz5fTGEkWJKbizPjSTRN9V8+x2y+cOfBxvon4RBprD/FBfPAyRt
 Gmw8a7zt2QIkjDBFPKTCAEwbxSnhbxTehL/vHiPbNPFHDnCos+lsXknbrFSpAFv31e9ts
 M6aCYEtLlc+miMzxEiBt5D1YSn4mtTA0/OtX+iaZWZsd9/648JvGgY372vvluMZJ5tPH9
 arV8Or/Xv24MwH3dla92dhGK9ECgrmR4yRbHerb/zqeUyfUZG3hmECFXWouLSnGlsaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304539;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Jw/B9Dz6WTyYc369jn5fCE56tPjRDnJFzVtOFWdp9Uk=;
 b=gLQrffspKKBUZ9LlTQkEW8jRMegsmBxM7juES5OmhoIv5Lj836UlXva8gV/a+xH77rb7
 eeYAQAeNfCMFYdo/D6/HYVCxuCLfQ9DTgfA7wSmxtQqysGUkZEBwSUHauKsiAfPKeC8qS
 rlxN4y0UvUT7UNFlzZlr7bHmRI894tKZqo1YQ/GJB0KcAWuN12IPG+o+vuAVp02VdORCE
 b8IcjrrrELVMgwboSC/Jl/KYQBOMlzkGv5ofG7egQyKh18HPUT53ozQ7/fHpEOkJnvbCD
 eKr9FxAoTMU0XJJin0DIIplNMViNW0zA0Y1+UUhu9agp4zksg0ApvGm3yDHZlsFOIIQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OIz8Jnmm; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OIz8Jnmm
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E63840750
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303712;
 bh=Jw/B9Dz6WTyYc369jn5fCE56tPjRDnJFzVtOFWdp9Uk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OIz8Jnmm+MaxyrDtRyvhuhWqXiC8xsC7XdUj/xDLSdbv3psLDwKiUIng6/cqn/XzG
 MdifN1o6Xwte3vKeXOwYrK4gBCFX51WpqyRGnQj7ks9o0SPlgGopl2OHaMHMSluKim
 by/7DDUYNOu6F5DLcVuYcaFA30T+HAYu9ANUjs+aP4DhvHR8kqnMhi6aL91Scw+DZi
 JpJKW+dyz5U9UkJoHG7waFEEWib+LpqTix7rxVnS7usz6fSkG7I9wcAZApObGXcPV7
 CDdOMFgWdlz7nclTFCUg8N1R5cFmvUCvdU56DoPxJqumE3JyxWz2G2vBg6EjZK5Mkv
 QDWZz/4rqu0vw==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 eugJW+lvDHuwfMHq1Nc0maEA3KZVE5MK8H/09zqqUBQhMrNLYU1XDqjMhWZGFkEdVfh0X2sZ6X3
 /rwrp4JOQ6jxRkRTljgocIU+eV1jWfYLVfS9Kf+PlA8ao0qqjpMAXeKZyxILknMxTDibc25ydHv
 exgrHEoNYcwW2NAxACIkAxfH92QfdPNpf1IyYYkmla4Lsf65XHc803B4MFpXItK10gruPNKJgTU
 0nlTorA+npSOzg79szNomYln2zL37nCNn38vVh1Qy67+E9jk43ecqZjVqcsGAuQ2LzL/Lf0C0h0
 nxhz5xKsz2OD8a4I6kcYAsc1wPkq54ityYiPEZqgImmeCN+ZE/tbc1PdNJNK9kVaIRmKdLHT11l
 BxxHCpM+hjiyL1ZrBcBlLo4AII2RIcgaEBkPrMBDv04GlIQkHScQD1p5/rxwzvNgl7bK1rYHePL
 Y36sHVXTr47P8tGXSYyWfrvkxp4XMzkFFkMnheL8VkUumj+Qvd+1YFXDvjLTRTtycSBu82m/gDt
 oiwzePIlTYKT/L5pIDgdtVD9NeMWnMELCAT5nb8jK/sN3x5SPvlHUls0s+w/6BJpu9AO9dRILSy
 BQq6Y1YKrrMK8S4XXZ3qTcJ7NtjH7DQXn8huiTJpzm/TBIwU
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2AB4EA4C5553;
 Tue,  6 Oct 2026 18:21:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7um-000000000ir-2yOL;
 Tue, 06 Oct 2026 16:21:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:27 +0200
Message-ID: <20261006162106.3439373-47-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v8 46/84] package/socat: Add support for OpenSSL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

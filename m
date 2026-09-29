Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E2BCA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF30C81086;
	Tue, 29 Sep 2026 18:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaqVpcjEztSa; Tue, 29 Sep 2026 18:41:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 29B5A81087
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707295;
	b=GWt07wHsy+un9EnG1AY3XHiMizDTD27zdTE8sY7xW+pWU7ki5B2oj7yW8Rnr1HgVlymF
	 zYRzksVNuXaarPSP9Zw9y/t1e4kK98M58boRNFpUr/e66SNjsQofK5cHR4+6oWU8C4Ty1
	 6XjVdtfJzBWpC9wnRgZ/CoAyodbG2XnDzRDUrUGZNxEb3pvwJ95+9dMIhmkOM+qyIUwxL
	 rc6c77nX5znPEdJJdqrGAD8rPYBbYWxWa/QY3iM83qAZFLM8BeN0rsSRd+VtSJwNPQlgh
	 p7S4AamFNmV9PGz0IomfeHHVqTXolKWv43t8QmF7RSIZVUjEwTkS4GNRQf/rx27TUDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707295;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=APMEeJWwHkUFyxNol1AzX4j99pdxDFtyzuT8HKS1noo=;
	b=Tyz9pKh8Eal/Xv2AjKW19mElBRyVZR5W6GhHdFssnPcxMetOiIMs5spgqH9pUrODtF2C
	 GfAekn8KQukAhUGY9fPR53LHB8Qcpld7/va8JxYcVm02XgFGxg6dkJrFkfTX7DqSm7QaP
	 5na5gF/jHGg/dbKS2D6Cu7LNhaHBi1LW0Dvdr8I6yjul0rDTgfDfWOR5w4H8EnzFL5Pg/
	 Eh0oA6gfTwm8thUwX7kLoX90x59VlyLJHftyQyh7IRfXNhRbqcnYeKhcwUkMaJ0UuyBVJ
	 t9oazVhu88+aE6BiwdjDJgjo2Jv7U3CkckosGoXqT8AL/luPGlqGxgBSTqZTuhXFeXQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707295;
	bh=APMEeJWwHkUFyxNol1AzX4j99pdxDFtyzuT8HKS1noo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kCmLEJASlcs4+uCxZLG+DqBY3rP1TwAaNHbyd+Kc7pv+LHLQqa9gGDAtyjspSvfcF
	 FNslCa1g5Tcou552zSieSkbrDAgrylszdDbiWEeFDuw6vmGPzlE188WTNPkkZCORME
	 E0S1tk2nM7P8Ps+72/4yA6GAcGf618gB/2UMkDK4BIrhQH539szd1OfV9/qWEz6stQ
	 GRQdoXFOWB4p8NYGc4nQRD5otxYIqz2uXxgOjeaGxJ6XLQdedQDmRrI08XknEB7vAM
	 bSkYBvxTtFQUUSITIiYpZDSdZR/UV7g+S/0bJIwESyGOFdH1H52ySL0RsYXdcykxXM
	 2cdw8wsILcH0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29B5A81087;
	Tue, 29 Sep 2026 18:41:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F36614C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D0CF60812
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jv3qXZq46CV0 for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:41:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E9F2C6080F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707293;
 b=F2eaGvMZCeG/jrTszpFv95o3m0E7JdC2WrMjRBo7ec67Bq0uZ/VerLlfVw+L6EfjvMLX
 6tMiUn7smL0o1ew/QweMdOCimFRni326B/1mk0Tqpc5go47i18MJCOYJktlQR4zrdVboA
 ZZqv8yBa9sRQIs/Bd+jXznLzZBnebarnDgPmNIUduGfLo3QhdxtbpLLxlp/OMh6m7FLyy
 93RGsS++IUbjy3xhmstpWyIf0IGRd2+7LFePosqmQvIZzE8IKgaA1G5w8MtzdxQyx7bce
 OUFtpwOIQT2S997z7PvWUy5G1p6knWIlNH+hThyQZj86wTcne+JWOvSypaXKb3tPsog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707293;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=rSOkgmBOoWu4bjgMWprz+RHU2OpugtGvCwJmbkO5NBM=;
 b=ELifXhXfKJq5A/6qcQUJxLMWUDcC96FbN97shs5ciaxqpRXHMR3rnbzbmHsA2ZXYpIJ2
 8h6LfTB70gcSwJI/7assMz4X3CSGieNZdkJij/XFiSRTD2vFvDgC/m4uVeMiaLnNUm3qd
 ziN22oTM72ILMvLR8WBl7W/X5vVZeyykH1+vOeazsAfp7ZifU8Kr1nFQSZC9MARrecMK0
 WRz78ARbxUxyWrCJGUdfFeqEy2mGuBP3sICiWyxHN/nCVzW3FyDNZd8V4ux4MCND5TG3+
 5MAeH1RxSzIQyo3Y6Wv2ISFc0Mj78kxcnsYgqRol7SGhR14e3ZIhyCo10zu+wZo+32A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Pi2VlStl; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Pi2VlStl
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9F2C6080F
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707025;
 bh=rSOkgmBOoWu4bjgMWprz+RHU2OpugtGvCwJmbkO5NBM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Pi2VlStlTXxHI1X8KvSd76D/OV92eQcqmoH5sf/A6FWTew9VoAWfbbJadVobzwdFP
 LSUkoTGt1UM/LAvTkDjAh9duygYYlLDHvPndQS3ro0NmlzBo1BMpfTNrypQjzKUnfC
 /v7HEaF1Fz77H+C4WfBylybUY64BSfwTv3o/7x7emOK6YizHXWpG/IeZyJSfHBaXLf
 6ovlQMm9e5RsC8QS9kaBnSTgVYm8rWSUasoHvIjBStw8WMb0Z9MbeHbHmlEaQmSk0v
 PMvxE471eEbAYNFySGggEgQHmTfo4fh3sBrvOAP7dDem9BXSHLt9vPttGSKsc8rn8G
 qylvTxrmAOVdg==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 M1iKb7/nf9gDurR9XCsmXNg4eFNvTufq+qVxr3xx/WRuEOxIaWL8XjoLI/1znku0/M9QvPn96Xh
 qPZfFSkn4AgMYoipX+G0xPNSBY02kCtmSFxCyjqsns06ImS8nzsZM6VhyFsXN0vvZvC/Eokb76j
 Z1WJMMMHz1IYLN3cOCOmobqo+luEGAD/VjVKecnm2vkOXR2EK6XdzZKaXNHiyVLda1/D5I7/apM
 AfhtmRwPOwDpDDoRIz3WDMdy5ro7MyA6denKP483v4KJYYUJw/xFr8Oz8iPHR8LcybzP/Pbvpqd
 0hbex6/EOC0NmdCM6Svwo3tIDVnAQk7h/2chXSjvU027uLCU/kALje21MwAk+X3PEYKJQ+VXQfM
 ZYV/UuUokdvYpIDC1Mokf+Z1xZCZrZSBxM3r9wa4pvE5hUZBFHFo/Y/inpX5/4jcFENgoipsdIK
 ggXV1S32tDCmtBRmBb95mtMxxAj3+j4xPMig5dsQDAbN/1NPSeIHi8PlnlqDilY1lkm0MuokHVo
 av6S7YlwIXBCsX+qSbSK3mIN3LbSRvmV0UyZxByt1b2yKgwiDH1izZx64X5L35VEOEuE5tsVq+C
 qPJ9gFaG/2aQ4GHBtpI7ByAmmhVbvcQdsWf/t4drnGRuwyx/bwkuAI5LHrsUoDQNN04SsyE2Epj
 K6BsXPjLH5JfhfxZVxg==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8C8FBA4C51D0;
 Tue, 29 Sep 2026 20:37:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgf-000000006Jn-0lZF;
 Tue, 29 Sep 2026 18:36:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:16 +0200
Message-ID: <20260929183607.1849293-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v7 17/66] package/boost: test needs exception
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Johan Derycke <johanderycke@gmail.com>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Simon Dawson <spdawson@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 5ab351d8e4..0f52bbd475 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -373,6 +373,7 @@ config BR2_PACKAGE_BOOST_SYSTEM
 config BR2_PACKAGE_BOOST_TEST
 	bool "boost-test"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  Support for simple program testing, full unit testing, and for
 	  program execution monitoring.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E43CA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EF88607F2;
	Tue, 29 Sep 2026 18:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXBfCTxKSz5c; Tue, 29 Sep 2026 18:41:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4A901607FE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707269;
	b=YpCWKscOfWk1BWvDrtniT6HjqWT6Gs8Ip1OG0CYuzpG8LtxNLosA6YB6o5wxvAJUu/0I
	 i/UQpswarhL5KBKtiwD7oW1Pd2Oj8j31jS7Pkrl3wED4h9it0e8TiGK4IYLOoELGPHRgW
	 ohJnBafIDTTZXx8Ey1eUOcRalRSfVaEk3ho+FOv6hdYW0Nedihvx2n+j8swXOsnGVRIeY
	 1nJYhmTn2Xhu5xLkiKKGvWVdrrEqSz1ewbUhsV2qIeoEeV3rZ3x3qzE5mYjtM3gEJSeGf
	 4MEMNV3/e34YnJARrzoMsolDKXRUHC7XvTGDWP6QYwIyTLtjOe6KriF9ma/OB/59LhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707269;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kaU1W7G3FM+CG0CxTsjQzZkJDEBCPF9D1ggLgdHBnoc=;
	b=p2WDFFNYRg7nMmsNWrPS5PZ7rL0BcyPv1QaJ7c8I2pUjqB3oGSciNgGh3eybnip2x5XI
	 j84mEJFCS/z5ltIEAi8X7I6Oad25065hPHi/s9N/lLY9vj40cjpzlCvrp7AWKDGLSpkm6
	 o+Xe1AZWu4ev8g3yTP1rLZ+VfdPoo092iBtdwBrxC1O2eMPu7VVnaQ70RYsKq2dCslqtM
	 Ux1/rIufOPjn+y+5YaubZ8xwldRPKCFT4RtrTjQAZWnspCguI0fRKQA38BCY8z4QwvwIG
	 GNYa1xcmrUnwRAIZ9hK98UqwBHidZfB8yCMmdFqwXgu4AFFdfhDuj+XsmRUHcB6n5UQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707269;
	bh=kaU1W7G3FM+CG0CxTsjQzZkJDEBCPF9D1ggLgdHBnoc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Yeqiuae3/4Nup0fAS+wZHiPI1LOyf8qIz26D1cLMRMvFJ6pKd5BD3tIKUiUS9NK2D
	 NXEKQFPC94fxznbtkgor8A+nCtw8QXg3FXWcOZFIvpYGQ9E6Y0PPziL7wy1iv6kjWF
	 P42icNkwbJDV6Tm0oF8tqQstAJnsyniszSKPC3JjmoNgSLwTdpIGFxTZWy7oqNJwvo
	 8/pyT8JVEvQ9x5Fr5ELP+RgcWvrdFmK+aWGjJLGJPbUmFEoCz5kaGa+jf2jjmCD5Zo
	 yWKiNg72cd8jQyzF91on1m8p6+1yJffG2tuRm7Igbu0ulh/opU06besCYZQM5LXMUb
	 LYb+9qXIcFSWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A901607FE;
	Tue, 29 Sep 2026 18:41:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B58043D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B05381061
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANp1ek2DjySS for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:41:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EE0148101B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707267;
 b=gQnBR7sooT3Qd7/9GbvhRXaYWyqNsqUtzSkjOVzot6L+IbXjOihl2F+xa9GIP/FBTTRo
 aKL67Cv5kV6Sq2yyfKGsDr6aeybX7RYr6G4IpkLxUKqiQEZnt8PSyEh4kFgPqkhbswJ5s
 UC66JBCMzb2Bn628jrCmmJtFz11rP6Y9JM31gJ2DUI8S22tZh2gax3iEcRrRzc7cjNGGe
 K7LjcZzXKro3I0G2Rhr38f3KYjxVlejiWwmqiWTS886bUdGi0iiad3bhBmh8FCoxxyXlm
 9/qk+PH2THZAUgkp+I6o/cFYqvBoan2H+ODRrT9YA5EaES4n0g/i5hK1XT0aIS2iugg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707267;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qxe9Yb7y8zVHYg9wVU3Eg7lCeAQei/yozIxacRssNrY=;
 b=sVf/HN41ppswe/HA8lO89vi9RR4FwGLfX+ZyWl7u/ykx80k3BGi2Tg9dEvYvJ1Rnecc3
 RgDSspoCtT0d9e4pAxsDiLtGlbU+MQz5IlOujNlub6WVCn00jfG8GGcxecV1xwWIv8pYE
 2hTelKub5lU9Xj5sGYX4pyR9OMvGHVLhSNDZLyHbhpstwDw3V2JP8mW97YLOt/Z9WOkB4
 K+I3Re4q4cW9sRwy7XIcVQaaqZvJdAsyJizFQEAkkUKHgpgyLmEbVO7C2FJT1Ny2DIiaY
 ylsBHWhFiH/pzVDMBjmsTLuyVgkKqXOW6U7ho0t+2fWYW9jmWh1+5Otk2SaOmLv0sBg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cHPGHYzT; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=cHPGHYzT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE0148101B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707025;
 bh=qxe9Yb7y8zVHYg9wVU3Eg7lCeAQei/yozIxacRssNrY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cHPGHYzT3CeLsNfr+jgRze8e8nOA7BkjivvD20ShJIlSu8T0xNxu4qc38CmWDLtTj
 XhJSua1Ono89BJLG82mrFdxulhUsjynUNlrrE3pdzDp2QQhAnjkr2gDXhi9mLDQlSi
 iKLllmcsFszVMtYk1v261AZ/4VxR/eBZpe5wvjZNrv3Jx1N8inD4TD2zZbHMHDiD9a
 1BPcfsrQX1pSpW0WJ3sUTcOlUO+SXDHbGHjM46phfEYh7UArc5YS9gqH5buufI5oxG
 xCC0OiZKXxNNtw8ON9PYI5ZfktNpxMoGW0h7pVvlJHaafWapCvXnxd0MeE2ZshSdYu
 oz0PnS/I/Dtzw==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 Cr9AllFI+/maat+xHBzSXzplKq2no/suwin2PTQFebwoqEtDOEsrq+Mb0UYKoeZlW4z1qsLeg5u
 yGSf4UqpCkE5ABhg8S1cIrr+aX/AsWVwaSIpojpqfOmf01REqGwr11vsJu36UN9v/5L7mufZ2Ek
 9Qb6xCgEvogD57USjphDi7FWm6ZpnpD7j25YHlo2LSQJB5bFc0S8TVYsX/rtwi01981PGdVvMJt
 ZHOWyR/RiaFPXA82m2U0fTIGCB0AouQocKJM38Que8GnRht1YTX0YpUYb+irtCecPmlExXhwQlF
 keL9KaNoRAQL+RWEyk+gK2mVnNLyi5jAUhGJjbtncgZlFiJ0QJy1N+xmWFKLOa/1A9qN48cCDWj
 GpOF5gc97UafyEWAtxWZ/DK88rwPfv4ky956ImpELvM0+U16a4c0hOI16Aay6u6sOkCP3Sl9V2R
 ORn3Bivv029+7UX6EWs1j8kIPXimSihc9erIyQ3Cn9uQldp9BaLWxmb/u0UvsvbfE0aAkmRMlOk
 1CUNgtzHhgWDHUUyyKnUNe3/Y8yk6gJ8uga9S6/5/M4IdJMTlKgKNKITXVO+kXwPU/GEtRliiuF
 xVvpTXBsG1ueSpfCHNV0WpAoOg4xfi/pfo2hPN+pe5rykaLfNQEd1HwhAzVvsHDcnZiUlv+3Ir/
 8n0woJDLokizioHufRFCPN4VPSkedLeezHnWHLQBmJogJ5H6PgsbcOAe7Vdtk
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 098AFA4C51CE;
 Tue, 29 Sep 2026 20:37:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgf-000000006Jn-0Hy5;
 Tue, 29 Sep 2026 18:36:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:14 +0200
Message-ID: <20260929183607.1849293-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v7 15/66] package/boost: math needs container
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
index 63c50d9835..e88f497f6a 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -257,6 +257,7 @@ comment "boost-log needs a toolchain not affected by GCC bug 64735"
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	select BR2_PACKAGE_BOOST_CONTAINER
 	select BR2_PACKAGE_BOOST_RANDOM
 	help
 	  Boost.Math includes several contributions in the domain of
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

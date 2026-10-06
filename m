Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341DACA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04E4C80DEC;
	Tue,  6 Oct 2026 16:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbedBtGByPHo; Tue,  6 Oct 2026 16:31:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4356880DD7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304293;
	b=ZEOIUHar2jH+XPbcTi9zsIX3jlNFPfEbbTnsdg9ieP2tUfvyvBD2WkHDmOvcqcQ492J6
	 j8lYTCc0afrQkajuRfxuqMrrwtU/JXaAVb2AgjvCN4fI/XCol5wLIGRx+2AlbwlVKdbXJ
	 EiuGUDibDen4GJc/IK3AWp9Y/cTtKy03ljZpjMp+Cf3V0UECWHOLS1puy2PA/WtlK0Yr6
	 pmR7q+cuSuhjGmIwPhSsme6rJtjjUbIBKj86qiSCje3B31uNk2wE+QiG0ekXKvpC5s7tv
	 /MH1iqU5T8wgzjF8BhIlt1WFozU2zJhGTkNmzp4Dlb8XT7LkU7tzYz1rnpEFL3BJAnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304293;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AIYRLMVF335t9xCY2eqDbTO0cvxrC0PVpjrlE8NwbNw=;
	b=s/mEQeEANLoAHUhIZg2eEbftxtGuCa1oxIGBCgxVcpGWVdYYs7j0Nhsni3NWR8lP9u9n
	 0G5GnD+jlme4x9xz9bvjTItJ+dXKWJse1diqgIKs3n30nOSimJOFkCuCRHrJnaNgooH61
	 vgGsG8rlmuU2twAPAFbk/FvXbB6fZIM2EXJ3ggHqA77g1GAmsQl1dXB0nuPcQwfiliwNU
	 G0Rq5KsS7Gcnk8Oh7JZ+cG1oDkt79J5vArbudTQ4vb72l+lnz7tZQSsQakAV8mrHR1UDM
	 rK9r9nQjSxcuDw06JDXbFz1iDJh7jRFJlCC3+UTUJKhM+gKupJj0xeG7b+fYUrGH2mA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304293;
	bh=AIYRLMVF335t9xCY2eqDbTO0cvxrC0PVpjrlE8NwbNw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mwxpStN01i9CLzpnPzL2HgDkq0BB8cTVAQjN7SsK6SeStMpv8BMHPTjr7ygW4InYa
	 0cNRKRL8lEsyW7RWaZPejIfrfvDg3LfLtntkHK/dGAsbLZ/zt+LWppQ4yUInco2+z/
	 s47mOCZiocZ7pdmc9zh5WlKvUar7zOJaiucXxsAbvzlIErsCh6Pg+/0xbYujsRZPP3
	 rdUZzuRGXYLpEZMgRAeIbSTpybVqxtYp99TmAu1RfHuxF5fSvSO2SKIzudz1e3X2Cu
	 Zx0vXr0YpodM0iSV5sDoxpyfA4OTN/5eg+T4v1HXGL9urVaUA+7iWclxunreSSBGcH
	 YJmEHwQSEGM5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4356880DD7;
	Tue,  6 Oct 2026 16:31:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63E51341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55D45405AB
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id boWrGvf6Tmw8 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:29:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9C8834054D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304157;
 b=WixAeMdPeh8h7b9cM9XlWoliadf0nu2U9LGAUsXEmKZVM9G+t/pgHu4hPRpJbduR846v
 hvX89sn0iwu7antwh0YceaUttA4xcucVp2gvS071hr3NAwxb6r7T3imzKQ2IYTqnr6fBb
 RP5WuZrmZifGMi8kkCKIe9zmo3dNE+8nIV4jxdVfN6wnc4jzvoRMwpqoDAUHYKJoCXjh2
 WD6EAbdc5iik8iJsMVcK81vorgk7bkx57mJFLcdyzGJlepbmjIQC6yu0+7jGo6OKdqsyd
 QIdB0z+CSwhLuz1nIkq44ijIkfyRNiXcFDMbBMIFKRNwmtxNOB6r/USLsheutqQ8c9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304157;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0WvuyoXdPZkowHcARcKEdBcyHC/6pk36qqEPbaWwV/I=;
 b=O4JMYli+gqzObM9WnMdYoHGOaR3/+j4tQjU7mkaX/Ja1jHgld/5rISxVj2tCdi5csB8T
 QbtOJzbRCFjvCo7r4tflqJj0mp24yTC217qwT11oIXYrN4dsOToZVVwnHIVVUHnZoAedV
 wGahOkD/pYLkzKZGOvBmfhjhqTaLcWdFPCYCxEa4rgdE0qqBthKkQzZU++lbCJfTYLqYU
 y6MTfPx8thJHcXZRaolN32qcZqxSOFENXrXfd2cmi4cB1k3DUJdXuuP/tkJI5LIEgG0AW
 FVTm8/Ju+MJ96xXTE55NDHJ3/xYwdQ20/EWxOg1994ktGgFpAZgIqvFZJdL1LCjui+A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DZz40MnQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=DZz40MnQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C8834054D
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303707;
 bh=0WvuyoXdPZkowHcARcKEdBcyHC/6pk36qqEPbaWwV/I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DZz40MnQp+g0Y1PY85ug1K/Yu8FIN7BqgxVCN7DlYO9L+Yh8APVsNGmesWEUcTpXW
 uBg7ywxi+i7Bpljr1RqlsjGjgm1SbmDUZC/SSxDzaiBO2R1KzVGGW7ZXh+d/pQI9u1
 oZWIA68b8o/lCBMp3kSc8G/CvZyz53amsKehtI+ivJQ5bSJ0CDFwjomzeYPz6kVg0V
 6RKhqdPXfbeNWepVe5l5mrJvMe6X2o26Spw9Q1m9yI03q8eyamXs52B7sUoMwsCII0
 uBLbG0nsodVooF2o7m4tDiqZP3ZI+GkNfbvX+TeJN3FACXdakzLANktC25mf2LEX9n
 2ubjq61BvsZrw==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 GmqMnwvtILDUiBCQ4C6s5DMbTGZsSqceWsCr5d83clofihXCxNOivWkBCwaZGez4q6z45CSQSMx
 vUUA1m5jnLNE+VZv/pWvD4RCR2sKuIaxtfz6/a3NnPxVxaBqFwLruGGRWMijPJM6vTrV3Hkf+s1
 PRTUWQiixS4QTp7mYC24SGgTgi/jCET3swrH6bTaMKBesHJXX0OH+n0D32gtNPeyIWlVrGVZiX3
 B00ttzB/TnCakmJ1J1yu5VPONl2oD5cT8XhGsCtsqMsqJfqjtKouFudffNUs+JuKUeTTGpqz77p
 mcnLDaRJz/RwEnEf+aI7wZOSPD1Bm+C4OXET/vMtRXg1fuXSaPH+AeZF6JNyzNYgqJbqxG73eGo
 cMEeC3aZnUtr3ckz6ia1riFOslyR91QhU/5QONObZ2Ogk1PD6FbFb8NlXPbKnv7N5TAIWKdzaXb
 VfbgLfr/WAAmbYlaZ7IV63SfunfOTd29Ujjq1kZGsWwTjd0mJxQbb+SEfaUtUG9hrkpX5fotSlL
 lzOgULVllEwBp2oL++w9E8v30R2Xuboy0nxqs3zb3e0fEvHQwCp1QexRVFxm/YYUrw1t8CUzTg7
 JyjrXFkb5V/6/CkJj7ZFhhOXtPMqnCjSwppqsn2ElT6rXc2HLkKqXWng2aoWfUn4M8nJgiNrp/l
 NRjTvtHjX7TDrCg==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 30178A4C5414;
 Tue,  6 Oct 2026 18:21:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uh-000000000ir-2cB5;
 Tue, 06 Oct 2026 16:21:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:19:56 +0200
Message-ID: <20261006162106.3439373-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v8 15/84] package/boost: math needs container
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

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
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

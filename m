Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3397CA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70A9760857;
	Tue,  6 Oct 2026 16:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vpn_Te9oxMef; Tue,  6 Oct 2026 16:31:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9D30260852
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304281;
	b=NHTCAuAAX8RGOOj+YnTdMTzfyRsckCkQ59Zy45cx50P6vHe5DbC1K6y6VJ53X+twO1t5
	 AY91q8DDesEfph0kDA8ZCaOo9oPBnGxGVIpDTMbnKdGqf9zwRJrFGGYQ6TpthOc33UFsi
	 fCLmIAwwqtFf6dMx0u4KmF6dGY+iP9Bv4lM8iuwheTS3o5461ErbHNY2dS5zWY4P8EEz5
	 ePSHP2tX27EHxZqrRlDyzERpRul7Jxr8uLyR28UxyntqXgFeWKnGzVRKn+cv3PBQNW0j3
	 UdCOB3jFPJGNNle6wEidzYxupjjfZ75DzLXgAR2ixg9eGQ9jPrfjyP+FV0+pOVVXgOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304281;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FnuJF4SLToGPMhS14w50us7G5Sa9h/6x9+6TFsoonH8=;
	b=RNPG94k/DBK/y9jUfz5bd7GLNt3l2IGy4dgrJzBaIbEdiIAiXj1wyUD+Cx0fHyB5aoT0
	 UEXd/9WfMKvfntd8Y1cEYrnZWGoaYVNBHDgvwjMhN+s5g0pqAX+bk0OsgX+RrYMYspMsE
	 X6kgbuP5iALjiLDx73a1X1UItcLp1Mr1SF17sNtKmg7KTi6Cy7phtkH71zNFH2JOiqRgl
	 hmJv45zbPPaDfxY5Xjat+NjpxaZyEtLJ1jwWCDr+RckCPZqTHuNOlZhJ1IkIF0MBCZWQ0
	 0oNVJ+MqMaip2Oyux/zJKAPw9plBVibz8w3RWcXTf+lfhano9/0bphE86OM61hRNqqg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=VMX68Rcn;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304281;
	bh=FnuJF4SLToGPMhS14w50us7G5Sa9h/6x9+6TFsoonH8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fZiJjqSeYAO/sFWL7a9rHe1Gcc58cdP4fg8iKuyZEHEi7XOL8WZk47aliQ5BjSaq1
	 aW6/xx6O2+gLnkzHvY3/ut8TP1HZEJZdf0toGMXu2Mslj5U5YRzyUT91U6cyX8Y1sX
	 rAjwWIzOVPxXIsaFALx/0HThKnYHHE1UPtYOGBGsyN7DzkY0S8l2Ewnb65/3CQeuCt
	 YbpNJYUSQSPxRD80d7OGOzV07BP3zJTARPx4Mtah9OIECnYscPMd3cshuVX2Z7plkc
	 NyKYpUhte85xZfbAG8XVYSCpdpq2xV99zrUEGQXrl0vn4Zx6vh+WKh6Rjy7JeoLhgg
	 rrCm2g3LWD7pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D30260852;
	Tue,  6 Oct 2026 16:31:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75210341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B593606C0
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZG6kH9vVLKE for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:28:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 96144606BF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304096;
 b=eD1K/n6itXKdpNkJBnTmADI6Gcji0oHvzuhFMEOVZVExIczy/xvcGnf3jfctrM/svHIq
 q4BxFxP/lQwKH8zD+cR/pLcjaGHnPAUy7I4toekIW2GKl8pWpfmB7X4wAAEszpqW0wkNi
 AU4lp68Sd0rWSRiHbOYx6tXA7vGCoH1TQdBUpOCSWBkMadJXiSOmdbV3H3qu+LuCxi+O0
 CyTpDHlI1QjsWNdnG65neXAGN6qodwmJbRLcLypUDc/g8cnm2v6Yg/SKRMzFsyspMmJhi
 OWcabl1VLM3bNQkm9Jm5lP0Cy9XC3Vc2QkDtPI4RRhhQyIAWtBaFN7h0u+ZMWC/6drQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304096;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=NrcHwJteL3n+JSmnZTtuGF8Ru+su/xyu88Kn2SVwme4=;
 b=VmX2bhSm/c/7ooqLeZNzdZkCBJVQCa9mgoHsx/JqM9F+wVHLQvHyR83sKoR0tSnEHxO9
 9RsjozsS8ITSz+u6310HC/e41Abkr1XybXqCmsBVdU5sxCpNpXhghLB2p1WmGqArFM3ap
 XV/HcC0R/b6uiShUje4vEO2oBdfrfwZQTPKOV2V3ip2QorwMh/UDMFtFjRFkuaxnAzynY
 dzbW9eJAjkqRv2SlI1kaEQu3xT79Yp8UpGTOO5qIM5OEAWEPXhMWDGbLbbruHMLF6CKL5
 zo2lEa3xGr2Kuw+VMaTC/UliK0gOUydCrZ9NQLQsVdq7ZixFy2wH6fNEPBk5bvdHQgg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VMX68Rcn; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=VMX68Rcn
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96144606BF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303706;
 bh=NrcHwJteL3n+JSmnZTtuGF8Ru+su/xyu88Kn2SVwme4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VMX68RcnwLYcUPX0R69qUvXP48uzEaCE6d/AJE0WpECTl/HuektZekKy0a6g6nLMi
 Eg6mCsLig//YMkSHG6YHFF8obMs7vcnF2HqcMcde5PPZoUmCAr46fr4ZB9y9mlR/Fg
 FQlPzp/KEWqbieXT929odOY3QTrvH7zzJmqlTQTA8zhu+YYKrUb50gadVNI9Z26yKy
 kc7sDTbEBsutmHdhPU7WxUxW1PiDMDXX/X3YMzowFM9QkzFaNaZDd6Fi88FdnQd7YD
 JKumSygrDXkK1CtgLBIu3HVX8auCyMg+WAaizKulRhpyqCXzHi3FMtNOg5KFCT1i59
 +ckYZ7VNKF3Yw==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 47alCWTpz6164xUxX03CLRaBF3SVXyN4HCyOh4bCtsGWwUOGqQ9waoV4YBvSujEfiLtNsvgdwMv
 +e5ZLTOc1FkneePHmX6h0st4fHBUGwhhtf4S/G7nH357zgta5Zl+FW0hyv+r8ZV4WULOYtMZELj
 sZu3dNjmRKAaWe+O0/WSb9QV04pMsvHXKOWii2L8Bus3/VHqUMOuKODY/Z0a+zLk3Cgttm9pZyd
 YxQsYQOqZbN5B6OPsVgGF2Tmc8hHFG8I4C8sAaJ11BaFy8hoheLdleCaicZ1Cgw1D528Nxqmf/g
 Lyu8SGgHbK5Roj0eptGOIDRap9uzVLo0Wp9Uo+OL+adexEjtS5ebxQKx2EVe3QcpmcEOJ8F3WJf
 mkTj3PoeQA+EyNIYn0lfyZh5LfVnIwwrwMLo8nl5rhh1auNazl1u1zmDOhMiwyiBS/OmR7L0RlU
 teiTaaLAqC6w1rQgYwZ099XEWTYpQWF9eCP9+CfIwtKln63y5QlzhxMELzw12IIPoPbE25vpdD/
 CetS0ChBK9ebQhqCNVvuQEYglVN1cV0DVNXdEVu0+iMN/s9IUDRcY8C2epKXTN/TDtqOAyrKObs
 YH7+TmntL4gzfG2PcYqwZj/t1hm6I7+DnfsAIXPlac3au28=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9EC2FA4C5384;
 Tue,  6 Oct 2026 18:21:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uh-000000000ir-1UrB;
 Tue, 06 Oct 2026 16:21:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:19:52 +0200
Message-ID: <20261006162106.3439373-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v8 11/84] package/boost: contract needs thread
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
 package/boost/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 70e99aef11..929a9c3869 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -90,8 +90,9 @@ comment "boost-context needs a toolchain w/ C++11, gcc>=4.8"
 
 config BR2_PACKAGE_BOOST_CONTRACT
 	bool "boost-contract"
-	# pthread_condattr_setclock
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_condattr_setclock
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread -> atomic
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Contract programming for C++.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

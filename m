Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855BCCA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A39140763;
	Tue,  6 Oct 2026 16:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_93mz75PnSC; Tue,  6 Oct 2026 16:32:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DDCBB4074E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304336;
	b=hg9VW3gW+p6lzz8cqc8T3hRc70p2R0yn9DBZprYmZXWQjU6ytLHyJqtEyH7CeL9NnQsP
	 hDJPhVPKVRZjLRQ9xeSYjZZXoaIEDAjK+DlDkpr/5fxqcpXDSpgIOmRrAd4UMXq341AXW
	 8+84ZCscSTHB5/RZltd6eh4/07rPS89kVZK5FwTWdpIFK3we41ZuDLlF5kiNGPVXBe7sb
	 UlPTsLmFLAkGa0nV9q+guRjClhUHjpw5C0wYq/UWKYppIs9V7CV3zWXrksXH4tiTnLsSe
	 rUCH6oZmweMDn8S61ZCbHp5RDxJfEDNkiZX40WNa8rufCJ5D/xE/NsacSdzFdpfPJzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304336;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qQiuKWQTjW0iinkppJer8c+QFb48DlUuMVJFF6Fs928=;
	b=CJ16+DlUxLd3t5CatJIf+qcj3kLWCj/tziNadh3lnGlniMwDCf0sB5+5zLRzA9R1aZQA
	 x4rl24QMXmJlmaT5u/qUydvz9vKUX3KnlyB+0dv/6EWMQIzNGyuhFEI7+dwOS55Op8/50
	 t5B98rtSQeataBYd1W6KDcPCcLD2i4ynT2+9yYFYhkGp6388lCQo74JalaudRY381/llQ
	 l60E2XtdhbjOc1+nGbk2yMfaKdt/iEu0B3KkNlPEkzxREL3+CZzvJLoqJ7WZ+ZiEDYsb/
	 weLj2PF09DsRTGwzhecLseVkU14JLkNG5m+IyP91pu4Tldd1J5EQ6hskgCJcaM2dxsA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=cC+87ZXP;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304336;
	bh=qQiuKWQTjW0iinkppJer8c+QFb48DlUuMVJFF6Fs928=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mVOYbJh3LG5vmSjOzbNJoFpa+TcyBO66U7LGvww0Th1u8nUfaDIpY5fwwBNB367Vc
	 H9TVM1NVGc7xSxYP6xev+OXvl9i1q8UEpBSFOiBzFhedNwZcnwHV4CK1iR7lgZb68L
	 MWdTP1vyOQuTMLov/aVDw9KBmsRHa9mQnGkglgNvB7iJizalJ92PxxHoCWvUfmOc2t
	 /NkcQP1p7tpmEMhl9diRgzPI8RjvGZcsDGt7/5KZ6Z6BUHOu3qMmI6wCG9EJytLOwA
	 xKR6/V6XkU4k1K3+E89rBMfZavqmCmtgk4bVVbDn6Gswn93plWfv/2O+VUmgx9z0gM
	 lu0pcgFh+yEGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDCBB4074E;
	Tue,  6 Oct 2026 16:32:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF4241D2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91E97405B6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ntnKFwcGvKr for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:30:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 96290405AB
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304206;
 b=hqchAvjSUTCfe0zCytsjTwg+hvkdJZUsTqxGxHiSG3r6A4VXmmcbGPsn5Nrg7qhmEXuE
 F74JglM6G0efPGrbCKu6emh9DR5nzXg93Y8iCAB4aTml5zmAUciF0DZ4tizNXvwQ1j9M4
 F1rJrvirx1mrOo+wo+waTzU/16txIgUhz2m94/7oC8Qt93NbbJBdP4KomVjmKMducSFOM
 KigpAK+teHVXY6dzTGKfVAe+HlqKXbHhcTfssmeUgPJzBkUK4td32TJNbdlVxnKbqlYmo
 rM6n4RKkAMqupnN2pb36GmIXL0TimPrsFZsGsHHLKTLtr+qX7hss6NTerW5e4Uf3u0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304206;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=v3HJ3mitSvwktQSaPCjpUEhJxAqYavoZNZmm+219tDs=;
 b=FSYla7s4xE+5OrB9WSMEDdKpKYjKqKgigNlZsOBBuRXRVt1t+MqVzjqUthfKd67e7QBr
 nISK98AFCLvfzkj9Y7Ug4WsBie5R8A9m1rnM18l83e7y1ni2YyAvgJ4wd27oGzAsAunh/
 endnltlHfgpycbCswxHXugEJx//pLCfBl9ny7nRhygtXZ0CcOS88FWkULE8h8mEftJBIN
 X2BklNAhDJBFT2waieMKYMPXJV2gVoEJT1ohg3fqOvnp2UgZBpC8B2/pV5pMv/Q0gWXmm
 +L9rxnV5mGq+dkcmT0nlKjg5r9D7HobkZuXIJWEKZD6JQMwIAgbxitZ03g8zT3a0yIw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cC+87ZXP; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=cC+87ZXP
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96290405AB
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303707;
 bh=v3HJ3mitSvwktQSaPCjpUEhJxAqYavoZNZmm+219tDs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cC+87ZXPYwzgg+LhoLqKp+BQHHfO3bxL1nOg5Bx655UnpVqmxKx2/An0hSZyyQTrz
 CiAiqXwsz4ns8X/nSNlJHOwZ52tWaTPUGEil7J43yIqd3ElWcYvj4Y9xPr+8+Ztg/3
 op0SFeKhJNCGWjULtgt/7+ie0QJeDWjQGIYL/BPcQWgu8vFNh5YvtqrwbWfI+qYaJd
 aqSljYT2J7tdzbBV6GxguHNk3yAfjnErlBGinUIMx36yZXGLP4uvCqWp+etx+avMXW
 LnrvdzxXwyDT8D63XpnwUla9NtAfSmd1hqy5k45lHQxB6zKohRotblcEl1Cl66KRnx
 O8yd3lzY/835w==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 LPX2IWH7EPmR+xhFdpgp0cx3vXU9gSzrUjbraIKsvqsK7zPz/5GgO27gF9v3e0YTiNwlkJo1jju
 iFpQuvsATAggcLcJ33xi196/hlY5fH44rTgzDxwiO7sakfCXiwFIfUkpmdwTltzWlW0HjpNiYSv
 gW/BEFM2hdyUGs9TgIxjuuAXzYTodL9EYGdLUk/g7GZPsjjM5EltOwg4dpYeiNsd/Pf3tm1IJCs
 GylbAfGLLPpa0jx1aEAfUVcKjPwq29kYl3o/fJtwMo1817Exh1LczU9GbZOZOLOoOtKQFKxTDzI
 WZ9SPYyZmQW4BGYOFq7d/Z/Z135fjy3Z+vALcJwU0wsQKsanaEcTL+R/i8/x8kCRzSVl48p8P8f
 Wg5/f6hDg88CL2EkBR3w8c/Be3lM5cn6HmHQQw1TyrnmQ4Jinf61wSDz6Rv52/NL8lBjBWmQSEc
 cWwB3DGMHAgJe8qXt3QgrIokTj1H9ztCYTXCgtk5ueUq4KZ+qS0Q8KhORkmqqR1ixXGH/8bDYqu
 ex2dpEm5jmVrJcJAeUnrL+cDsFVUt15D+Lc/HcQzs+2xRC0QSedYd3y/RlmYXLgI0PGZPhQvWIa
 wuuZNfGep2HjZXtK3UFH67AairPx5G5Lrs+H2UK1/Zzdl1E=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 95A33A4C5449;
 Tue,  6 Oct 2026 18:21:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uh-000000000ir-3eBD;
 Tue, 06 Oct 2026 16:21:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:00 +0200
Message-ID: <20261006162106.3439373-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v8 19/84] package/boost: update locale
 dependencies
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

- now always need thread
- charconv

this changed in boost 1.88.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index d4626bf79a..93ba15df50 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -217,10 +217,11 @@ config BR2_PACKAGE_BOOST_LOCALE
 	# https://svn.boost.org/trac/boost/ticket/9685 for more
 	# details.
 	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)
-	depends on !(BR2_TOOLCHAIN_HAS_GCC_BUG_64735 && BR2_PACKAGE_ICU) # boost-thread
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
-		|| !BR2_PACKAGE_ICU # boost-thread
-	select BR2_PACKAGE_BOOST_THREAD if BR2_PACKAGE_ICU
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # charconv
+	select BR2_PACKAGE_BOOST_CHARCONV
+	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Provide localization and Unicode handling tools for C++.
@@ -232,7 +233,6 @@ comment "boost-locale needs a toolchain w/ dynamic library"
 
 comment "boost-locale needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	depends on BR2_PACKAGE_ICU
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_LOG
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

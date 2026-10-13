Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A143CC6B10
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E0616079A;
	Tue, 13 Oct 2026 09:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zABi5xnLaaKx; Tue, 13 Oct 2026 09:43:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3F50260794
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791884592;
	b=smMYz91c5V9UgYUEHVuceYbCFJv3o8m30vYckbm6EmCyfDlSSOLymspxMB7u20Fv0Z6+
	 UYuJHU98tmw0YODrLL8BBmCKaMkWYWN86Sgsj+NlVE0nJ7KgiBa40av4PqtQQwLloMFob
	 +zyoiKqkT/fNwqvP40u2+wRaT16ni/7LDmXmnfs0Czv3dPEtW+OdourjbZfgsGUmOliCy
	 +ch8i8Hr/Wk8i2QhvWbXz9L7kIlR5ZHyAD+H3fNjWdeY/8iY8YyLGT9jzMWNsLYmNzprW
	 7u5GNskWs998gTixfCBaXgMr8hDUAXL3vau+vk2qMYI1aIj4D110q6slT7FPv0iKjkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791884592;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=UCIC5EVdxVpGpM5oJlIDqrGKoeTzYY7S4gn/7TYoMIM=;
	b=Wf9MH4QhJtQWruLoF6rc20T4iPiQUYYrE0JIhOlxvmEbPPvrHcDh6wnYjXxmanWuvDMY
	 Sa1pIuo2Ztf6vYlhWBwrVHWLtxCqMT1avq0vC92qxLaY3K1ymsARLD5uzgZPDz6AFr5N5
	 4+5NgYVz90LSeXQcPFCANpVB0vVNcvoNPwGdsPez32e6GDCtFNqm9fRI84GEBLIQjLo+6
	 Q0a6XoLS/ZWJXyuM964n4wsJoTec37yQTwHyFllZW7+sxmmWwzPRy8Li4m+vcdbPU+Cs3
	 BosYIvnw13DRMpGqeqKktfcXc7rSZu12D/1scnJTFflp7jeLfbUiyZ8V05kkkoIFJiA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791884592;
	bh=UCIC5EVdxVpGpM5oJlIDqrGKoeTzYY7S4gn/7TYoMIM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ozmSQzCgsdwQyOqjZ9Coz+1DnBx+W9Q0WrUhmv7AX9KoTCczqn7N1OE5mKHqWc/hF
	 ewuAnjtR9k6jiRHq/GM3d0jmCPxQewxTQkgPIO3IzCsnPhqoaRrC5AYYj2OD8AUNEn
	 VRaRgJWpGYOWytL+EexqAXDFo38J3qlBvyPp/bWcLd/vCNtBhbYmD02yLYZfoH2oZ0
	 zqqzEfYvM3vACkPgpkZsOKzWBCAXufhGigdJk02r4wE00j62KRzytHwbqCWQuNQlVV
	 s5sjoc0j0hwDBCgL0IUltzagEMTz/ii4WeTyyby1RDOF9lChpsFMBNn+EM0Y6pJZw6
	 QJlNSu1iW/xMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F50260794;
	Tue, 13 Oct 2026 09:43:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D58D3362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC31C80B97
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sW2TxMpQ3v8G for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:43:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D61EF80C71
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791884583;
 b=rPnfGY7YZBkHkoyMnEOa1qM63beAl/VadW6CiJETOMG1eYn3FWPUS3rgqQjfwxkywJcb
 Tee9Nu1chTBfsodlSrib1XKaxHMrpnhY/PPSK43fqZ+UIuZrXfUNOVUSCA0DGLK55fshA
 poNqECanljLclHYrOY19k8hawnWGMh0mIeWwy37grsXtY3KGsyM1OzOTU4kS5DeqtsoWI
 +FOe4Dx5rhpeH7E3W183I9SzuyWZCYaLbkpvcKDHxNdoshcljm10KOkghiCo+1SxYFhCr
 gXWQ+VieKNMOcfqAqiX9atb8/OcWoj4RqRMPLyzJzcR/jZqpTqyKkCg3IXTJprBhCKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791884583;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Dzkl2cx62uCS17kdPVuqk5Ae/VfjBDbZ1oHKiWzaTd8=;
 b=EYkqEkXK6HLz1tQHVIkjHkfGgc301UVsmTlIFJiG/t8AFwWNwDJGVxu3PeuNTkjkM4pO
 /wO8dQrX1MCUIeBEe/sGj1xrH7ZhXYkM1qd382OYsgE7R6AEHh6wuTY+6tUd8Lj91nuR2
 dvHVOgndMs6R0P9VYzQNGzXFwti8RhZTejhuT0f9ASJKtjcsRaIKDXyXMPK2HMlh3SdAd
 oYMpJjQjxiXn8zyuiC30d2k0zQx0ju/8Pry0C/LrXb9p0JI0eIHCaaWRH0rGPCk0ELGDW
 7N5szkccWudKIh7FpLFfZqcIlpCpg0S4zuOx/RD7dOf+kPkcx88Oc4iKzzdUzs19AqA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=STRN1skM; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=STRN1skM
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D61EF80C71
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 09:43:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a0213948d3so16741965e9.2
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 02:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791884579; x=1792489379; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Dzkl2cx62uCS17kdPVuqk5Ae/VfjBDbZ1oHKiWzaTd8=;
 b=STRN1skMxhog9gOCB74XqbHOPJNelp/0RRaOm7vLTeQuNQdU4o3CsIviCFLLcDDJbP
 yg/Gh0BbIRbMVVlU+AIYAF7bCgpXvw2kelsGccZ7oHJsFReC/0MivpXRUM/K49K+muzR
 /VSWpUCNWldj85yrkW/cu1onuoMbH8kSepyHov2WxoZ5gZzbNULwlUKzI8AlJAtU3jMj
 2zOaOZ9VED13Pm2/VMsU3YNA+O24qGNs7jUmgGlUhkvCC7/N2KrFQWPvUUQ8ynbGEaKl
 vAJbRihis503qcdApIqSW0vw3YrrQiAvLIKTMSrYsdG7jqFKdqPoM3uWt/vNtlQNbaQ7
 3lTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791884579; x=1792489379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Dzkl2cx62uCS17kdPVuqk5Ae/VfjBDbZ1oHKiWzaTd8=;
 b=IL3DclFj1pbIrEvISvfuROjRq0lsPmjI/8xGjK/eejoLrhVvB893joUSGA+xabUfWX
 yZQ2/30rQOgIk2BCL+trIl7ZxnB4bzyNJuX1W23qnbOdsAzqJis1g+ahC/P1E5BMFIqY
 abuImXb+hZ0ALJDeCu+t14UokUyIn/xYdjv6lRQWh3Y7IfQWFQvss8ac/yqKpi4/hwfY
 DNbYQlCo1rj5j2rg2GpragU0ZZcYsZ/6kbO6ZkbhmxEwZ6OQplYJVR0J0P01HsRtSmrX
 IL88tcTuI85B+v/alOPXLsT/ilGH1rAftIF3r7LGhZ25v91vDNIWOkovfsk9D5LplAGk
 DMDw==
X-Gm-Message-State: AFq9FYIj4fohRFV6SgjkHDI+52XEVaCgy8Jjk9NFF2+IVu96TNGQyL11
 oX3/EWdln1jbgycMey0HlYKPlrfOnVVyl7fbspqv/uw0tplqvFJR73LqUjZeug==
X-Gm-Gg: AYBFou0kl7pq47EIxwxidNZJX16fXCDBWY/6/VYpPBXuCh6gznNn5JFePKmvHZPvYVl
 VYJhTIdEbAvta3JJlqCbvahIFo5GfZS4cMAdb/MP8dAYYvnYPg6VAcA25aWFL6QUASYcFUUgst6
 bD27WyQ07RYPlrXbqo9NItBXqWtDsPw5UA3asdBr9z7PT2lolsF5BXZNggQI/uwZd4HzEhs2n0H
 8BQlDvAPrPYKiv5IqrBsN/OCTJ4AoZkq3MWtDFF2v95PHkpk/bflt0SzjoH/03Bgj7XBdl3N7hj
 REBeRo8+NRd0ngA0IBsXnU05ii5fTytAFWnwVMM30581f+lymdI3zFKtiEmJX2NGK+3w7bv7ELn
 LlHy1d6djb28KHUw/bav+CK/fSd44fYHHquB5rxkP5cvIZjN+c383WM4Xcy6Cg8f0dv72JBAmf4
 CJ6yHfTkWY9cX2Oa1tZNIKcPC7nFlvzfD1LKNXVdpEkzAh5s+LkyFTtRJ/brWWsq7f7RU0Wcu85
 g8aJH1GGi8k4sN2/wNPqyq9K+AkJ5r99vg6g6x5GxPDL+B6938=
X-Received: by 2002:a05:600c:609b:b0:49f:ce78:356d with SMTP id
 5b1f17b1804b1-4a18e4c9944mr223631665e9.30.1791884578913; 
 Tue, 13 Oct 2026 02:42:58 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1972eaed8sm238665595e9.1.2026.10.13.02.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 02:42:58 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 13 Oct 2026 11:42:41 +0200
Message-ID: <20261013094252.96761-3-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013094252.96761-1-francois.perrad.86@gmail.com>
References: <20261013094252.96761-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 03/14] package/perl-http-cookies: bump to
 version 6.12
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

diff LICENSE:
see https://metacpan.org/release/OALDERS/HTTP-Cookies-6.12/diff/OALDERS/HTTP-Cookies-6.11#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-http-cookies/perl-http-cookies.hash | 6 +++---
 package/perl-http-cookies/perl-http-cookies.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-cookies/perl-http-cookies.hash b/package/perl-http-cookies/perl-http-cookies.hash
index d5aefaf83..3531c8203 100644
--- a/package/perl-http-cookies/perl-http-cookies.hash
+++ b/package/perl-http-cookies/perl-http-cookies.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  80017e7e56bdc8ba16dea75789748829  HTTP-Cookies-6.11.tar.gz
-sha256  8c9a541a4a39f6c0c7e3d0b700b05dfdb830bd490a1b1942a7dedd1b50d9a8c8  HTTP-Cookies-6.11.tar.gz
+md5  d5cd1ff70175fbc44a0cc7018ccd9525  HTTP-Cookies-6.12.tar.gz
+sha256  4e460c4bae76285bfc726f641349402fc9038fcd9ca0f33346bec036d73876b8  HTTP-Cookies-6.12.tar.gz
 
 # computed by scancpan
-sha256  d864d8998d1ce086dc35e5644fbfcf1b46dfd08b0ce8d76d3e32bf86e6953ac3  LICENSE
+sha256  ff475f885983812d894a319f652b2e9361c4df9c2636464707198d9687f6a10e  LICENSE
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
index 6d87bde2b..db3cc4be7 100644
--- a/package/perl-http-cookies/perl-http-cookies.mk
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_COOKIES_VERSION = 6.11
+PERL_HTTP_COOKIES_VERSION = 6.12
 PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
 PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_COOKIES_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

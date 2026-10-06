Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E7DCA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E89BB80C73;
	Tue,  6 Oct 2026 16:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxJ3fcydoy1B; Tue,  6 Oct 2026 16:31:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3844580DB0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304297;
	b=UjoJVmvAcicVmtycOVgjAIeNtqI3ym4t3OiKc2dpMsqLDlrY4ER9ieqqN7fVomsclwJ+
	 3uVFZjyABfRuQSlAjcD0le2x7c4id7UG0QjR776jUyu6jLcaHB4AFqyiZ8Kc3S+PL0aXY
	 jXcUq6SXGsLi2Eh0awEDumYKa1pGattQ50SifcZN8iNdmutT44ZBTRmyS0nAHwrRHQi4y
	 ySXMw8YkZ6WMmPuxnjCIuSq70bGO70VQXwg7mZuVKB8YRothtl6M1Ear3htE6WgfV8E7H
	 O6ZCIuUOclLHVT8ogskF6jbhJxHMERU2JoGZMpiQdFtwcdRN/xVboY/0DnhDxwGF4rw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304297;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3Wy3VL1CjwhiW+QZC+QVVqFPvk8KFWVI7WFHln+UpVk=;
	b=sSzqyMw9g/8F+OUjFicC0NENCeASwOba/COpWt/UdRgd/PPwLxoiDrLui17s5pRW+nvd
	 KDaRJiD2fex2eKwjRugOP2IdbIWuxdzWlq2d+EuobQM/8ZAcxLPeh/bo470dKqv4BD4K6
	 B153qhlOjksPC96V86FW+J/Gg5n9o/w/OduIHqOM6nqIObVqu9GbgrbEgQFc8lVQc8Md+
	 CwhH2ds4cbh5mNmgXHiw+vUzAeBU/5O+OTjBg7I/MzpQBoTpj0uldv2cJGpaQ8YAhWVgo
	 yw9gD1fk6pBi665YdQVyi0LAXfQ3gwXO2S/ZwHXeMjoc7VGqTZfwn4iIXJIWNKwpevw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Zog4cKgu;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304297;
	bh=3Wy3VL1CjwhiW+QZC+QVVqFPvk8KFWVI7WFHln+UpVk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=elxcXal/7gZcjtG4JlRx/sOIkwCg1Vop82NRqYZdix+r6WF0LOWuwjwiqFWu9Nx5y
	 k6U/mY3pnqX63srFoKCW7OWKNh9EjW2MqnHYEc4VMMD7ONeX5tqjS3uWLsddJ3ZcOx
	 UNRhKIGodyr0RzHnTbMImzpID7mMJQRETQyffZU1/7SZ61mN9j3LiCTy5gHT7n6Hf/
	 g3tgilroT9euaRTne8lISjioW0sjtA1sKF62fe0dFvi0jc+hUOin8hZcG6ljvLbjmH
	 4mzZryRC0PdUSdgs8XjXUhgbJVHC5MFSaf9bxSfsPYm8fDV6HK2/hzt7fnRPdA5D7c
	 tSlaR2qqmw0uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3844580DB0;
	Tue,  6 Oct 2026 16:31:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E733317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F328880D96
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXRKDF0xk545 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:29:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 42FD480C73
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304182;
 b=NWT0AEX4MZgIvAYW41F5LZHSf5JWT2GjqzwIChPEYsChXxR6Lju7ACkmvKQgUrgyHIaU
 /N4T+KIELDfvk3dOkO5lLLK2P4Ulzy3HRlbLuSwhwGJb3N65YmUpa+l6SMZ7aZsLj+icu
 bTHXnp4EbEkA3aGz9A5LxlMLJ3ioNb+jh8D25EkIw6HU36eSoxVA/osiZkRFy78dgzzxS
 Mqnn7kWUSN7cF2rdBCVfJVF34XlAAiUFFN5zfosXmqzFneZvJJxWV/TV2aWsOy2Uz4YpV
 t1fTwe38EPJMRg/T2QWfqFS39651cWbYPDniv9JfBClLCKffibr+epB8bGZscPR+WFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304182;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=i5XiGAPsKdY11RY09V++pXGdhW/RHw8I/ZwUXdhX7f8=;
 b=bPr3N5q1Mj0O+bN6FAUA2GdpukZdvGwSg3hDneleICcBvZF/K3f0EuREM/xZVeaQItod
 jvO4PKLc2bY1zIbTzu66godLo67LisQDnxYs7tszLlni8DLv8B9zDzdtmhA20RzxP1ZL6
 2WpPxRxc3Tq1oUB8T6S3C5LzGx508rfxIGbgSPHsQ4dq7wVlMZtLHzKCqBIaE43x9f+oJ
 Hw713f8jetaqKIu31OsV9zXuQ8w9kN11vgwatPyK6to+uWn/rHAAAjr0Lo5p9lGzpa9nm
 PsZB4GDV+JRwfYnw1y9uIWtBxCKIQtK11e9DiW5x4KMyaXyvwqmTac/gN8pFtFbhcLg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Zog4cKgu; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Zog4cKgu
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42FD480C73
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303707;
 bh=i5XiGAPsKdY11RY09V++pXGdhW/RHw8I/ZwUXdhX7f8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Zog4cKguXTtr4O3t9cNEj64JKL1WqLbeV50hZpRSSMF5xvZvBNvbZiWCyFKiLDDei
 m7gKn6uQIbnNlt8JR5xlyYMSh+gr5goWmouZ9oZttB1WpFu/do8xJiRs7grTy9BhfA
 gdul33GHxNDC2ch2xmgGF7lqENt/mdcjQ/ZilCZ8us9/IzOGQc7b6s76j275XPXJ7R
 +r1iaE6kaWiKSO82zAPQ3nr4DEW6ozpu9dSIvRe/AuNyaXledDNnXDwxyYnoWsFtIh
 JVc0pODby6M/VrmoKBFQYIvuKamXi99nL7wGszvJcV4E0pwoR+BmKg9wmlZzHjeN2E
 84uhwJZ9Fi/aw==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 KHGe4PjaO/FUGY5dRkZoiuwu4MEfPqoBYVqiJSgICfDQc6Bxabn9zUMV2mq0HD40OL0c2He8tbZ
 BwndEnSMoNlgnWM6XA9IlLOyC9uDB/N4nB1k3vwpWGMYLzfXoUAjCW7Fx4qU1UJfX/mW1ql4gU2
 8Y1qvzKIMvZN5atvli7oqjGKK3N10quA7mPLt7AYXEac+lQYoFjBzyjI1Uzq/cKGJ4SoRA1UE9G
 J6Ts1pfXy44UYRza8VUyAoKNghbqD5NCgMgL9TxmvbjAbQWl3/u+MsGG9DDg5URA5qn3X/DVqhX
 HGZcZgx7doHq9LSEtAN7uLbOp9OXRv1ES/TJETu6rn4pp/ogAqiCugv4A65TP7hRhbYNEaGV9YV
 2B971zHDXyT7b6nGwnH3fDilr4dFpjB0fyZeIO88XZMa7XrJUfjn6jK8/tzTj7AXcAUFL4rYLce
 Qs/RaNFykFBxA1OykhMsoWPjT83lc0jAE4hAH7xbVAwfjqizgMBLWWSRW049PMowSBV0wloz/dP
 QKz7eWh5d/qwn8CuGToa6XulePQZZrav2Xfu8AJFvI0Ghub16Lp1FcY6eDV2/dL0d8YT8CBkhHh
 C5JjpS6nmcyy3Q9olWqHATc6PBrigBe2xQT4Mtg=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 61D6BA4C542A;
 Tue,  6 Oct 2026 18:21:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uh-000000000ir-380l;
 Tue, 06 Oct 2026 16:21:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:19:58 +0200
Message-ID: <20261006162106.3439373-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v8 17/84] package/boost: test needs exception
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

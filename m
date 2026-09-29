Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A6ACA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58DCA60820;
	Tue, 29 Sep 2026 18:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXnokyIiJC_L; Tue, 29 Sep 2026 18:41:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7AA6360812
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707308;
	b=l+snMVpEBRmq8RLmNNYi01nIOJ17dZGtaJYAyTJcmaKKbKx0OGWG9q3Kh6SG4mw+6fxy
	 cg7rgc/lvrgPRacdofUnMSFSvnlBOmAXpoeBKA9RrZNK7ttggCpE6dGOsftDsS8t3zMfw
	 jUGeaIG6RYRQ9Mq2UHMIe5SZ+NaRCSu7cFWbiLv9TQFKLbyoFloVZ/L80go2GXGZ7TyKM
	 NcKfxka6eDiZmFFrKwmHeIs//8pS56B+eyU2lE5FLt55ZxE/Hyg9fuHOFfWVjQ4wP184c
	 xZLw8zknbmuefb7l7QvRu9dHOE25Ywnwx/XFhKBOwOAPlGH64STsKEikQ+dKJOdhf6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707308;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uE7mirJLQxzqjnEBTR4Y9c/PTVvWba8JHTpPlB41+oo=;
	b=K2T/R95m5ctrPQCgdxwMZ//VCDhXHzf58hCH8MCaDWLOZegqasSxrJbvhRNyuy3/xEGX
	 5VvoA0uq2a4WsxhT3BlJ51nsFmqRYbbUDXzpxnYZWnsBuUtsGsUMs9fLnAnHuTTCMPu9q
	 bVQz1U9cCNGq5nQLtxZhBzJ2hMF2v0EO+UzgLXmDQwS8rKC5lYGj2n66pxyXI9XIzUH/c
	 DIhKUxDEGkeEvQV8X9e39B4RuTkgj3LfClU27nd0q6VdlkgYjDTyIMlU4TePdgtEaMgF+
	 L4XOhbppcuEIKvCWh1CElicFtBQBUXNRIfxIjJ1ATlrmpzmhiA0bsUjdKhquilGYjPQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707308;
	bh=uE7mirJLQxzqjnEBTR4Y9c/PTVvWba8JHTpPlB41+oo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IdSOGSVgpLM0yOZ2j8drFKis8Smr7ij2Ul68pUXYiLl2DOCkzjvxMZCuDxohfK5ak
	 8jWH/ZJcU0SCB8+BfuaHTLWGJ93myDn9yFGqYt6BF1qUTa4Yl7BpD6nuDuoX+CGy3m
	 TFYDcjeu7qyxy2yCLSzYxYmkU7hj3BO12FXJKc+3K72Or8ezY5FDcqL4dPs0owkInn
	 TjAUtgghqZkyl9yNaqoWmRdj8DYR4pj7gT7K8h2titrIxM3TzxtUYSKODvesPIK6te
	 OFqViwzIqwj4Q6GhaadUAe7o6Llo3eIQmyD7jZZy4m7/4Zdh/r2SN+bqdRUaaUyaUw
	 oKS4S8cmPTdIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA6360812;
	Tue, 29 Sep 2026 18:41:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8467C3D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 765F94032B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJLFdyVK9UIC for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:41:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C017F400D5
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707306;
 b=Y0Fsge70wuwXEyvRrYC2w0k8yBR1yAsA2IrdlwevvDWe0N1ZM34GSenWjKdqBw8+9dJb
 G+J6JvMAu+dkvnxxBVnxTrDk0vl0ytLrfHgi6ZmBGRnXDjZc0etqzCu6bpz8xlPiml/ML
 Y3R7LgTp6tT/6DQmJ/55Yb0dahIfqW20XK+sz32XoEoCG62WqrAEzf/nqFihx8lWjr+x7
 leDsrWt0Cx7uI9b+h1PjGymsP0NZAtq2sVWudhnELPkSKnmLlSWXOU15xobJbot0RdhjZ
 s7JxD2eRPayctx2DSofHVG57QO8APe3IXaPXgDmxFSszFSCmroptYdHjQCwWhi8FCXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707306;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=xWMIyQzn9FK7kTmEWv9QNGRAACnI/u0GgN2ryvoE+Qc=;
 b=L6kF4QFHyyo90f8HylkUPHbtHoOqGE5rL4oMeQ3BMk1/EQHqgE7zriBxXI8oHTnj0+qx
 1KoSZwwTIjJBmbdHKHZ470y5BJczHEvD3eif8+MisB5mIy7DF/asTjdNWKmWbsTSsrUDa
 8CS0KNn4TkAJ1HySQmfVVUo8Wez6sLtiz0/yWumndQIw776CwweHrVlN8zQzKsVlvevUe
 NLvwECeA/OHndfMcAd9wlgWuTGJacuYaPWWB8z8VsJeuJBGqcQMim/MJ9rq54BVVPDmPV
 7n58CZQ1A5t0qRTscTJMzNFEn49taFmZZUJr+pb0Jr8G0kEns6JDqldUKLYmWMcWh9Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hzTWhY+W; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hzTWhY+W
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C017F400D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707025;
 bh=xWMIyQzn9FK7kTmEWv9QNGRAACnI/u0GgN2ryvoE+Qc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hzTWhY+WRimvv7TCZ9YazGGBcB2gmmlPtljz3xFpn+5yTqoZ9xHyowB0jXWR+XmZD
 6iNFrbtntdoLqV80fiIDApoQAX8IpgT22YDsU34zl4fotyAt1xsRqXcJ/HAeU7qirw
 B5ONi6UqW2rtwP3h83s5VOHpStpG/sjjZ+5KXUNx95sDAsZBu8uWLlYgPkUbWAYKxY
 syzalg6eqSkuCahZX71cHnTAmkMC2MIYCWDAPKLik8sRHaVAZ0qp1wMjz+2qgo9inp
 CxqIshlO9qYs7J3rQainJHOtI0OcBEKy7x9jwfEXDqE+dLcYTIhnXPzs8XxGwLa6iH
 TpMmz7yI2Ilgw==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 bBdIZhCkgz8eUnmCVPCXZGli+93nleRYHPeMASoUISEl3dcUOgSEHTAcaXIfsR1rbL9ZP5uoTwH
 GYIB0jnsw1v239ENXVBSnsI81Ktf5yrYPM+eVPz6kVNWzAwSZmG2jyugrjQ3CsDLWRf+STpgKO0
 r+Bp6zue53sBaB/UiJKvGkTuLjWHTG8R1z/of8Nrb6ysMQDJEdhVP6VMwC4RO63EIsk7iN52g+X
 gEQHHf7fIXt5X0hFI/NmhTXnPN1UGQxp0m7PJs74p27OMBw69EVfYs+y/YdMTUHTaPyU2OUMFch
 hg7aymK29tmB9u6FW9NZNdm9XDLuLHitdLak3iMT3OZJLs7m0RVJ6QM1rKfLgQqCfFa+30SJ/vJ
 eh9YQrkUKTX0D12+dofYVDI/djgGY27jcZ6N+foD96QbpDQ6oi7mfp+lOXx6PxYw0JiJfQwRaqL
 srXvMeZ6+QGMe+88Oezof5H1XIxhWX0hbbAXen2ETSpTHMv+01fafL/8Y/RP3mq/wJbu6zW3uaT
 6I92SvAubdLXNkzua+ZzfdGikD7pOl1z82EcOtvj0NrYvbMAIdkEfsunCNfaOf2X8xeHfYvhI/b
 AyTAVe9beQRToT/th5W0T1N462q4bTRf3IUG1aA3UOMUlJ5dLqSVea+gBzYU37MyBhOkDotGKXV
 QEOrPzADHltjpKjSJMA==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7AB0A4C51D2;
 Tue, 29 Sep 2026 20:37:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgf-000000006Jn-10t2;
 Tue, 29 Sep 2026 18:36:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:17 +0200
Message-ID: <20260929183607.1849293-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v7 18/66] package/boost: wave needs thread
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
index 0f52bbd475..d4626bf79a 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -432,6 +432,7 @@ config BR2_PACKAGE_BOOST_WAVE
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SERIALIZATION
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  The Boost.Wave library is a Standards conformant, and highly
 	  configurable implementation of the mandated C99/C++
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

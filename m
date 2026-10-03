Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE985CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1B5C40FED;
	Sat,  3 Oct 2026 07:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wiXE9gtC6t4X; Sat,  3 Oct 2026 07:16:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CBD6440FF0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011801;
	b=MN9DM46EEe8mOxWRY5YyKFO1ZoHgrOwE289vIWGaPEIPIJ0fdy0l8ziODfymPtPuPp3q
	 kbBwdXwroJoBXC07nUGB7hAiWuGDXCk3y2usiFIzGLaEUjUbx5s6IA0PC62nMsdIESlsS
	 XlbLpRXpPAp8MwXU+uHiUsUNS9XVenC5apfQjCX1Z/ZpGMgRKIAI26zjBoZtmH/B3MGTm
	 xFVzaPmf5jCgoAvOV/qVwHI6R9DIiOmkw626A19yxA0z8+vzkrwOHdOKvsaNm+G098O3C
	 j9J3vqD20eq9x9E0qM19T31nmiOFZqvA9uaTZGIp5h4TgKKRnLJFb+EpQmMlITuoaMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011801;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=o57K3oYl2OkfTdwauQSNyii8RfEtPAQMogodI8en+N4=;
	b=BBjuObDw+NC79jdbDB+e1AtD13SdPNjALhvr7p5xkM5DY1o4pfQJnxdLYUOGPbhaNQo2
	 DY0lNCpexekF2JWE0Ti4KE6rfmc0OT7zLFzapgRLra0MYXJJAMggpzwoc+rdThcvPkU0g
	 CbRN5uuhjz0G8ZRkSMCATrVHl9lDWnL9ik814TODP2YpwnDumMT+/vRs0RFtkbSZObHaL
	 uk9AJL1N37TGTC0oaA57DBf3T72zAX617Qew/3Hsne1JmKhqDXQoP++K3qR7IDWmrgiO5
	 L0BFVsKdbxt8/o8p+POoAfUGwNJX8dvoDYMgorPUt+mnhmBbLO1C9KkFARGx04oEUUQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011801;
	bh=o57K3oYl2OkfTdwauQSNyii8RfEtPAQMogodI8en+N4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CKmJen1bYZyp5exkjLE2Qh6+By9X+72dUGqStb0JtXjH+sKC1GHY8fgDVrbrQPyPu
	 v1cO8st6iXjoERyE6FKoskFe+NYR2FzKx87DMaXw5dsOBiDUy4jKeQQPXs7LR0b9l3
	 h6f0F8hC1RsNHBDgZxNXinFNBt7f3sDmzLFBNc/0KcklLRpOqTaG5fjgdIkRHr1U4+
	 FfyEEd4X70PpzYhgIVwU9UWYsaB4wXoV6dTmyoUSPeOo8luuQLmFplrAMNpNA3Fw6x
	 zhb4vdZEiesTRckft7f74yCeEc4WVmLMAahl4JMh9/P1D/uNOZ7ShnPZZZZD7Six1g
	 E7iGa2laH6TKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBD6440FF0;
	Sat,  3 Oct 2026 07:16:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DBB8234E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD4B981178
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nARve5Fa_tzQ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:16:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E6B3781096
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011799;
 b=TeQ1t5WPVBm8ZpGvf7kosrennwNA7khvk9Gylf3GopMrgEa9+AFLIREJPuD4b+47vq1T
 4VzrwZOxyTW6Pz2nmr9Zq08fj99v/lnGYbdf7PIRKSWJ6Rs5uFAyBGdPrplxWeNm3W8yc
 QYurvYpRvYQPCLoCAm39+dStC9yxjpu1OkY3FEN1Tnm4GviwHxIivCXJEDGlkqLrNFbFk
 ICXUzQQgkOVka9xW3t4zwkjVcq+LZjvJsHFZVt9C1tV7T284Nb3ITRJFmPdanQ3gzyFt5
 IM5JL4sz406HU5MShnST0IHjx+WTLNZoigwJ5a6XlF1yGZAmYaCfyylqnLHlFJ8jpWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011799;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=i+d5s3g6ZyCq7qyL0JOOBmSRVB8RUHJuGiRM8cU8W40=;
 b=VSbIDRkyu149q/75BwxY3pQv9eemonSAmjvXrZZplBy95SPsV9dnse10jpieAI3w5/Bi
 /XFa3uwmJ0+KqR6tEJP5EV4zfc+Cj/z+bWvRDJGbEiwV6lWbueLafbxyf/Ya9DjMDtTsj
 PoO5Uvw83rWSXkAawDflpxR9BSs+TSwdjkQ3wkT0gAQCijS4EYK2SFdcrQetzrSLI2dEO
 pSWWU8If5/VGujZYQjz8/NGjMg4ZI1d4jto692p4cFygZ80VROBR5f/Ujs87Bvxx+GCai
 9KVwwN8UaUTfCrUuLvs3UCCb/B8z3DOErj+MwRaapWOJTY7ggxjdWZs5p2ij05XftBw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=FNKFn427; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=FNKFn427
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6B3781096
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010935;
 bh=i+d5s3g6ZyCq7qyL0JOOBmSRVB8RUHJuGiRM8cU8W40=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=FNKFn427N/1M9UGfksFCVxhehlZTwHkkwRcZXifq67aY9ouoZab5KY0X19zN/zdj9
 49Vysk28BGxrNksd8kRhmtie1mEbV7vAcl1KWalOoJUNs4DgQ1fFY3BeK8jx/7jtR2
 1XzoXCOTl1vsfNNJkip1H4171oQWnKJ8SHnsE6uIibotPSlWUvDOull1HauRu9RYlX
 hs/5CDJuOt8SoDgqftvspN5/OzbBYfPE28PpHnslSrm4qA4LpE4TqYcI8HXtoN/sY4
 3zbN5+1aMBONoWbI9PJ0RXslP7oI9TsTfz3cJaESnfZsdnWtUnBWM3vvESZFPRHu7/
 a9zHmsRaV3TJA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 P5LNWjPyER0AB1NDUqN4WiF2xg1TcoJ6mkbugRiQNDrNqdj2FOVw+tOK1Q87HMzd29slnofvASe
 0lZsWcwNRv/R8PRbXfb8w9NkCu0+j78sNXuCCJFPnvgjjfq3ACPB1vmnAVoX0L+C9mSFgOkzaZo
 T26UhSKkV6zYARIv8XaeNKWIpsndlw0Jpvl164SPa7sgVnUIzZCkkD6TtT6+zDcs9ghInVusnJg
 DeWy8amPBaQGPrIxJm34DVlNqRXwtJSax6s1ywu54UAvMXLDzmj00XcjS6q05LvZvlLCqU5pJl+
 UNTIlQspos3hjQhMw3g+pa5sVNjwYvQ1tpvVouaraAp/5QeEg+VAfImrppp8NFsFH12q0mjOaCD
 Y+SHLWHbNRhoTeDnVtt87OD8J6+zBXIpg0Gm78zx6ALVovJ1T/Z3NuQKeC4i5/q8fRMp6fGqfyV
 s61JaIxc8VKEeV5YCw4gpchBMZZEOYuLMsYVNIKXAVoHUGp2uvMHI+en3qD/ztRmpIX1/nbj4pb
 vSZqvZbg2TsmTs9sBCOht7hr7jUnCXeyHxx8+E5+dwsTFEw+jJglZdSJS3PP0na12vHw6Agy8J1
 hmBHJ1kGcCtPZOQxloVadIotsSmnh+anaSSXl7mkQ+GosBngdEcOTXD9kN4cm/y2
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8CAEFA4C5462;
 Sat,  3 Oct 2026 09:02:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkc-000000007Zo-0V65;
 Sat, 03 Oct 2026 07:01:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:46 +0200
Message-ID: <20261003070128.1295458-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 014/114] package/python-cssselect: bump version
 to 1.5.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-cssselect/python-cssselect.hash | 4 ++--
 package/python-cssselect/python-cssselect.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect/python-cssselect.hash b/package/python-cssselect/python-cssselect.hash
index 9e7f8e6244..e373b88d57 100644
--- a/package/python-cssselect/python-cssselect.hash
+++ b/package/python-cssselect/python-cssselect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect/json
-md5  3aca561a6fe4e51d2993e0a0f604e30a  cssselect-1.4.0.tar.gz
-sha256  fdaf0a1425e17dfe8c5cf66191d211b357cf7872ae8afc4c6762ddd8ac47fc92  cssselect-1.4.0.tar.gz
+md5  465a7b6af9ea95fdefe5357301589b9c  cssselect-1.5.0.tar.gz
+sha256  3cbe82dd7acbee9ba9e5723b5f9e4749826912f1fb31cd7f92aabed5fde15b15  cssselect-1.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5c8da9f744e0afba81a48c9b5dbe73048f798b3287d6f1af8a05ee08ebb10892  LICENSE
diff --git a/package/python-cssselect/python-cssselect.mk b/package/python-cssselect/python-cssselect.mk
index d58aea52a8..283a00947f 100644
--- a/package/python-cssselect/python-cssselect.mk
+++ b/package/python-cssselect/python-cssselect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT_VERSION = 1.4.0
+PYTHON_CSSSELECT_VERSION = 1.5.0
 PYTHON_CSSSELECT_SOURCE = cssselect-$(PYTHON_CSSSELECT_VERSION).tar.gz
-PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/ec/2e/cdfd8b01c37cbf4f9482eefd455853a3cf9c995029a46acd31dfaa9c1dd6
+PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/8e/5a/6d6fcf922709391fac986f0a03ad4546f4f45b94d10aeb6c1ee041599993
 PYTHON_CSSSELECT_SETUP_TYPE = hatch
 PYTHON_CSSSELECT_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

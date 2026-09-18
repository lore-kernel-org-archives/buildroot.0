Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215D0C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D691C6064F;
	Fri, 18 Sep 2026 18:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hH3rPoqwQWAY; Fri, 18 Sep 2026 18:45:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 01B6A6083B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757109;
	b=oQFLPUhSisZs0S8mE1ZyyFqr99DvwULzokqK+yrzd2jBSRK/cuiEVtZXLCMK/wVBc8mw
	 4ds1Kq10pa7+5HNNlCszFFrxsxIOiNQsSsjuVZi+mGR18NMLkJbPl9Nh8Ol/KuIlvqOsj
	 BoSSNIBXpTdKxeavegNBb3O6WrhAVHXRbHOaVhFoXZASQ9vCa2+K4ZTSjbFU8ll99YC4O
	 FYJuf5+tvBM+7HUBQFcjSxHCTn9J9UmZopJ4Z5X4nRQTG+oVNxrrNeq2Y24d2ahb0n/0e
	 mIbLP6shJyGAez9c9+eUOhymqGR8e0qcoA5tHxbdCqyL8djuIOL9aJl7nbwPyFcXkKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757109;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+YMtYojRHSFImfqYeSwrtRl5pf1BSIsi+gppB0P+/Dg=;
	b=DSKRAI8Tr8e50mx21P3vrUS8R1NdNYIs8JEQrD8TCPpmI+2j/OcghJSnF/UZeYDJJqSz
	 CrXgDi6NhPyMDYEpEARule02iKvFuOhjqToymkzy2q6Pb0rEqZ0ZOJsY16sxRhdfTDnh3
	 LAAhkO/qWhtd7l3IweOTOpJnTRPjxCHwnQd6KWHu31LJ/8ij5dPqmkAg4T184WebKIlEs
	 q13p16SOA2/x4XLibyInOTrsnnd1gNxu7tqpZVvFIbWnJ03J2NUVK9x6L8KDtgx98T2l1
	 Xb752hoKPIyP6e/3tobC9g9SN/bjlZV6eXmvuBLui9y0kJu6ZFhjuYqjNsDibdlcTIg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757109;
	bh=+YMtYojRHSFImfqYeSwrtRl5pf1BSIsi+gppB0P+/Dg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bfSZebs6w2jJCgbrF0u2TcvwHOHq4SkAyd2rUiaBlYsJiFUf0sBKjiTm4wUQJr4iY
	 QNvfdx3/NR2N9aoSVnA5nuTPfjaTGeZBMFLayzf+v1pO/sYGVLuwD2+To0ytPgLW7E
	 ntiFHAC8LWzUmUqfbP9KdyS965URYERYoWzextr8WlPCIvnoimdMmJ31EtEfMqsNPX
	 NxP47r4xcWGbL0FtX5r7HEdjI5inGRCB3heDFciW4OSvjT7BaivwWTRnLWT9XYglBJ
	 HA8E2U0ut4RgqSvOEF0s62RwmrOPUTTXZ0u7K/DYMY9H4ekTEv/Jq6EfVwznN/FSl5
	 UAQKliGeKUcXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01B6A6083B;
	Fri, 18 Sep 2026 18:45:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11D9813D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03619812C4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adCAuhjUfd5k for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:45:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 10D9B812D5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757107;
 b=DtfaoF4NGWtkljxyBl4Be6n0z1h7jCGgKPq+VEMsBrPvu3/0laXaMLy6IIdwpEwbKcwQ
 l2rZ6SNGNtjXjt9Dzq/pzvigMC5WakEdFnqa/pctA4GTbC7CpeDl5urQeGr6b9qAwyxc2
 5klp+NRaE6zHVUdM6XQp7Mue0IyU9w2y4nY585qR0D//pFUiXrgCzPnF4b9v5vGAc8QVd
 wuJo0GLh39Jv1VG2bPVoKKHwcqBT0GUwkxfTtZo4VZED7JT5S++b0XLaLs1CvyojjFuvy
 Jzqn8JnTDMh6LnjxE55LzR0kGPIqQReqtED85bOKbs+wlVHh1bj4DCTpdjaFMoeLLug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757107;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4KBj423w2Xc6RaF3K0QKADLAXRJUHEl+jVNFcgMSorU=;
 b=N02abMuqqfKwwOYSXI4MtPK99wvxn8Qzeh3NEeVlqJfrShHcAnqd83axblpVV0QhyM52
 xJ5UZ4hO3zqKtBJybMv2T7Fo2H52Zm8fGOYiTsGPt4rKWEnEYdgN1+7DeXxI0ZOyT6mcq
 uF1IpyekjkDVHLbchJirydPtgxCrpmKbC0tkou9QLVXWlBZpNGPoqAicZVcN6P3RpQmH/
 TfSKPfhAq14wVPrY8+/qurASI00TNwMCqJhdB2kC3x64/3jvkBIBRGIBv2dTY7DKvRN4o
 d0EvtgmwhKLprdr7jf+p5rE66HuGhXdDd9GjOcgn7iOHVibOSG92jwdPfXNObke/RVA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dwSqRjhu; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=dwSqRjhu
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10D9B812D5
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756921;
 bh=4KBj423w2Xc6RaF3K0QKADLAXRJUHEl+jVNFcgMSorU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dwSqRjhuhYJdAlPOQqDZm6FwcWRF+5UoHO5+yVT0QYpsbAdm9d52Jfr4EkCEnqFvz
 jeSVTfvmlltAavgB6+CZorzhOa0kISPKIJWWKYybhc9CajRp7VPFj5tK4kZqX0iC4O
 kIC+IBrbSfBM3S/JSXGewjxuDflGGhS7tzOO3nvds8iYUy6p+T17Shzj6z5O4MJzmn
 mZGEe/l6s+HkT848Q7ItC5kw4Wk29EzSxIuH11KlRJxQDERlyQpWqK5K1eetmZhcC8
 9FDRriJ4pktsC3wYFj76nIabn7BcFYsPoRF/+O4hTzDwXRw24s6iiwgrfayXmilNBL
 J9KvGgJpF4mAw==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:Dgo9fiVZ34BRpclYT4Rr6StX2kk8AboRQg3OsOYSWIlZ0Zt6zGqDeXS3q71yNALoKnivn0K2PaC+ItC5sQXFql5Xi2OZFXtVhnJadfTBEXZuRJlIGmOB3IE00GLyubuECol9XDgOWzzfOVAQs41PTHvjXOBTpSHOTTgNTUt2PRUqYeCVy4oWfmNL4apqR8379Ka/YTCBp881joCMjQM4D55TqGlwYvj3Z/qr49qyf+PHRChKL4EuplDy0SNEhWtuGdLC4Fz6NU9lSv6NxH5hPg8z0i56QU5yCisxWxGz8LaIB2Rx0vitiKqNkXe/8gRYgIkjWesuANbaPhUkE6fGF/Z9jvAihQ9lM7S7zOuILxhJFXdUPi7UL4+VgJW0bmxL1eTlchUND7GsM47CdFcFMlOAcH7kYuQbpblYY5XLlHlnw/6IUIKjHNDvyIiGPLnKm2o06v6SOYqR5blGcsHax1zBeR8STKW7JGrgquIq2jLD/Z+QknWorD9kw34VmWhk3AWAjFHMChlYmjspCQ2dujjIYKu9StrT4DwiiAPFQUvE5j/fgXXrcQGCNlNWyWDMNa9Vutj7FR+1H/1LDKJ48OFCodgeryKe7Wj/Z/Au3KjYRW
 WkGnQGQjAuXNpuhH4AZscLw7xRV60Rk6m0p4BH9nnxPPpzXXBFuOQhQ8pntx4H+sVtHNV+j+QyrXRABaH90w1Vz0i0TJG5LfMVAjYyGSzjDHfPb0oP
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E8488A4C470A;
 Fri, 18 Sep 2026 20:42:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWs-000000007cB-0mhS;
 Fri, 18 Sep 2026 18:41:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:40 +0200
Message-ID: <20260918184140.3631274-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 18/77] package/asterisk: bump version to 22.11.0
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://community.asterisk.org/t/asterisk-release-22-11-0/114073

https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.11.0.html
Security Advisories Resolved: 0

Switched to tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/asterisk/asterisk.hash | 4 ++--
 package/asterisk/asterisk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 1bd76ef865..de4da24559 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  373c98f4d4a1b923b42def0aee03f4e36aca9d1c244a8eeda646da8a97f89663  asterisk-22.10.1.tar.gz
+# From https://github.com/asterisk/asterisk/releases/download/22.11.0/asterisk-22.11.0.sha256
+sha256  3bd5ee040509a3d3cd9b1ba9520c18e6ec0a7e7981ca68c457dcd36ba3c54d94  asterisk-22.11.0.tar.gz
 
 # Locally computed
 sha256  04b2eb1f0f01aa0ad1945b167171843448a51aa6b7c3e806496d434f13a112b7  pjproject-2.17.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 8d03f2bdde..7c5fdbaaa4 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.10.1
+ASTERISK_VERSION = 22.11.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
-ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
+ASTERISK_SITE = https://github.com/asterisk/asterisk/releases/download/$(ASTERISK_VERSION)
 
 # compilation with the external pjsip produces a non-working asterisk, which
 # segfaults. The reason behind this is unclear.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

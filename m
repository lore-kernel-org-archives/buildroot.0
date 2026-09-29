Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31A3CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87A5580F4F;
	Tue, 29 Sep 2026 18:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZmUGFuezitr; Tue, 29 Sep 2026 18:21:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 571A980F10
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790706089;
	b=hTlSfI9WyWFFhGvW5Xx+oPsj3vfksJA1txnD9oqzu9KJUJ42Wv9Ov7VTNgDuP6f3Qpo9
	 TJH1f72nfjboQzeF2FP6C9qRI1TxohMAYf5pJAH86taorSxxoQeJ/IrSuaLXJYMoQI8n9
	 oKuccc9zTaCSN/1f1/TFFsig7JkoKYyqCO/HgepxfbA0rGZ4Trit0vJINydbGKHZW5u02
	 aPEk4kn7u34qB7/XKqy014I9D4OROwOAjGi9kC/Hjn73vdqzTJBnJW0/KuJeB6UR9WwyP
	 acA1yOM/Gottb8iI42dhl/8JPbpeFh99Wpkw/1xwFOvNajKeWTOpDZXOa2lXp6e+FmA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790706089;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lqGU6G8G39/oEmjab8XhAosfOETs5iQCobIGkoqdtmI=;
	b=PDSo1waFBdv2NDwshfpGPMzQnQr/XFbYVsEWSA+S6AxG7jLOdWRH4G16XcukxqHU63fh
	 uOMpCSLscpP1Unlhgq77RJb7Ulf+V3PG0PEhWmycZoFIXzfFpL/iFOfgfhI/2gSZY5uFm
	 W14k8kzWrmYGfJASlcPCKEQuftwHyU0LdSHI8+/H0O2jA/Ztsel1j4QIj70XO1xvzWI5Y
	 vTBg9W1ZbIOE3o5efAr38pmLhZPNZwwNeznJQaVr5lNb6nwpXHsbfnnCWD+WQk2r8N0wd
	 J1QURhHcFzDYS13S1LLr37hlZeJhu6pD61Tp8FJEpQTHg9YLteH5VmeQu0AQi0qLy/Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=FX6K6wsN;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790706089;
	bh=lqGU6G8G39/oEmjab8XhAosfOETs5iQCobIGkoqdtmI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sY7/gfqYuGoqrxgPcl3j++KeIM3XF1nlwPr4NqdZgO68DG7TV3jY3KqhFKPykB3Gp
	 1sH1Kmr2P9djIAfv4iBeYtTiRC1TSbvI5tZK6yXzyCT5tN8yjctSTn/2cAteg0h+hE
	 zrOUAhkIb9LIP/2mIwvDRshS8kwn+KQ+xJPjx/IfYsJQL3eWMpy6G1RmHWglr1zURO
	 4wJ3a9GfJ0KpqbOHsO6il+4p5onF4Q1cKpA87imQT5phz5zs4VqiB+zP2WW9i68v3E
	 wQwi7B3SkqvTqZIFS555xCiWSKVscda70rgCSm/bA73cLoSRiGZI6G9dUVaoRuqdri
	 BKMar+wFJ3a0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 571A980F10;
	Tue, 29 Sep 2026 18:21:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56D7E282
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47CA180F22
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xcrgcn1aUqRu for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 472F280EF6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790706087;
 b=HckMBj+IfMDG6rg9beknIZU+Cr5a9NJQ6JFfwf5FZe9ETyAczo91emXD6L79qWmgRMLR
 bTTns97eM6s/rOeh6xhLzzPbHeu2hB319VDPnQm8NvaUgkgFw5GP8bX2hG0bpaGy58BWP
 /p8xoWX7MH/FVxD334jft0vOT3Kl2N6qlEC9HhEkhGvt/S2tpL/lDe9/Fe3l2B/pYhcBD
 7FBLDqmZ9+iokSY1hqh8VZUKTi/o5YckGKQO0FdK2GGtf/TfhOlny2/ft1NcIJ/bjCIEG
 GNcO1zK4noTLhosuzAPgYIHXOL/heYqURfKBeSw4KcHGvUKeumASY4AL05y6rpRBekg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790706087;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=K6nMi7kIkGNziKBZLe+5ROjVkG3NYUBL0hTKS8LCBLo=;
 b=qq9bqY9QrpaCaBT/KjuJcBKQ9ccHr1VeX3oetjtry+9mnIRku8+OD1eI7smFGQx0A3Xk
 7Mi0GfK93aGRK4cMm0YV9VyX+FeuXN0rgGPuZSd1HdMelYQf//pPhSzTWGmqxkBvtO/Wa
 RcmRtiWnL80ne4kttKjtB59BqVTIXLG+DADfuMjsu6oP5ik0XIHJj0rvWb6l1R6RFLYkM
 8y/qY/SCRzbzaMUDsE7PUvO3q07nOJGXLroj8uhntf7uLxeAbOjoQ4yLwa+MIrm6BG9Qr
 M7m8o8sB+hssuAQBUxZoXywYm0Nc6nhp8IJgbjLCHj6kV0MofbQ5iWMQBSefQQbEFPQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=FX6K6wsN; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=FX6K6wsN
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 472F280EF6
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790706084;
 bh=K6nMi7kIkGNziKBZLe+5ROjVkG3NYUBL0hTKS8LCBLo=;
 h=From:To:Subject:Date:From;
 b=FX6K6wsNhcQ2J34sVxjRvzRyN8DeIhV0d2ep48R35nqnIzIAqnPCKjhMe3Y7kPiTb
 TSguNdP7f8sntTx7RFQhymhcb5lFPyg9PCz0RrMeG1SRTvOmHL29M+hS/SO50VoaWe
 axDNQDunlv381opDatgEYWQaQJByuX8Bo+YHX43enyZJtFAJ0eFsTHwu9yrftUuOO+
 SGipvvMiTlNs+kJScMezURk3KwrJ2Y+UTVTlQZaxbx9wmydOggsEUuaNgao0doT6wv
 YBcbwdcmgX7cuTmQgcb7AU9nz+aNjf3w7smwuNpnMgqKWnZXQ4l3DuQK368d8VuqWX
 XvcnzAnzbNjhg==
X-KAS-Sym: v3:f51bdf72230551df:XlbV1xsM9GhhOpGFOeGT7yjLYIRo+Ux2tKMJwbjwZIPB4
 tw7NaH1G9xZqQ1LHr4YaUDxs8j/tOXbQDw5vtyWGUyB1UvAeq/pKfKqp2LC21Ztek9ts3xIX8l2
 VtEos2Kj9VryTLjGT52DAP5L9McyIbu0p/LVdwUkL9R/ycqj71Fu7d6IUVktEQc6c/aUZipbD3o
 OPpLtNQq2VudMXFmoCkr+D8lmI4UK3t+ii0Ut4yyPGfKOb3V33xQRVym9iroJCKap7Tl2ZMEVPo
 LxTXWQLrHZithJpcLiGNKCoVlJqp1XnNxQ0JZB0mXXgPvFbuNvgDKl2L0BmER+KWCtXYXc2w==:
 BOoOnQ/p76l34/zyhnuLlllCI+hzKh6GWOfpoee3kyW5uf0GVCUSaXU1nV1E7lL9vzEObIi15yq
 qCDrDJ31JsFGCrEq8LZSO44+Yzv8GpATOwZsr1BD92jDrj7LuwAPDjFKICen485hLzGkfgtpq0g
 0/W1EpUVEAHD652KT4HzppgJ+FiFtjDNyf9YU5MXfuF0LBFV/Kg3zAQau7ItDwL4a21B8jfK3t5
 UckfCNCr4Tu8MYstNAGVeDNaIS8s2KhtTOOmLftrwzX17YWtrUIJelzvf+2SsHqR3dhZ9Q2eP8V
 y5IFLhxKnNjDIW14VOUgCJwsgBfEZDjLdPa3f8ZPeqWZaL3K/nu4E4hGphSWVv2fUmevkC0nEpY
 +bNI9eEPBJEXd7JxHTaMAXJH5R56y/REdryeGw+GWOjDBEBuDmYHT5gffxKuooh1K5y157eSrw2
 ck0MxgMjvqLrx053KLZ3qtiSrybOzbuIYkzaAEWVKyp09lg5CWPi2dIQoTCAB9Qf3WD6662AfQJ
 27O4X9Ewzs6+y21+FUrtAvlitoE2x9Efd3iRAwoqhHuDCWW+GqwZ4qTOgDwEJYMuPe+YH28STIu
 6OLOfxGqek16IwtsrEBwrKO6VTBZcSv1b2WFrsj3wdltO+4=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8A27EA4C514F
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:21:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51052)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcSB-000000003gd-3wZw
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:21:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:21:24 +0200
Message-ID: <20260929182124.1843719-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/pcre2: security bump to version
 10.49
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

https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.49

This is a security-only release, to address GHSA-r9hj-j2rw-4q3m:
https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-r9hj-j2rw-4q3m

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/7f6b00c6fc3e1b174f043dccea4e226f93f85adb

 package/pcre2/pcre2.hash | 5 ++---
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 90991322a2..3d75858727 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,6 +1,5 @@
-# Locally calculated after checking pgp signature:
-# https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.48/pcre2-10.48.tar.bz2.sig
-sha256  b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b5146491d12003f2c8ed  pcre2-10.48.tar.bz2
+# From https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.49
+sha256  53c156e1ba416a20da8e65395daa132da0d80e76910424caca3fcdae7831d384  pcre2-10.49.tar.bz2
 # Locally computed
 sha256  197d8a73ffee0d6b09adba2f9c677b5f5aede24edf89258a68e48248d010d811  LICENCE.md
 sha256  5f216505c0f6ea3273caec89e766eef93cdeb7bbb0c429f9360116d7c938feeb  deps/sljit/LICENSE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index ea841f482e..a3e74e32b1 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.48
+PCRE2_VERSION = 10.49
 PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

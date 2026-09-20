Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D825C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A4E460639;
	Sun, 20 Sep 2026 14:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAJrqv8OQW5J; Sun, 20 Sep 2026 14:13:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6AE796063F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913623;
	b=aJYP1ZO/InQ0QxcAqq/IAGirsTxwbJ/w/zTwgkPYeLcLDLkZ7aQgt1XdMRZa6vEwv2d2
	 QJEvdZkKYRVYgUJecIZNmV94cT0Bcup4CkPUEVTMcqUth/XBdZFzOs88b2TyuM8ayqAT7
	 XXk8n0e/wBERbc8xuJUNqnn/4ZfDcACvcNJ87FW34RPWOpH3maZRnCXqNZnom/m1Gp7MX
	 hPngkODugG7XEY0+CJz+IvEhZlDtPZrxIBF4jNoeD48rJKMk4hCTeiAdX4xWlhTq3C1/j
	 5T91DlOguLy6eBQQX3HHPa5XnVOaQ2lhqvbL71wFX80rrN1Hho/Sty8NaBrTkUev3XQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913623;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=z+AdxNtlsPj3RpuClS5bTZOoECb0K8xDh5ikjbTSidQ=;
	b=tBWpE+KEXYweWFil4vMDHNj1tPDPwM/mGVNTu7AQiMsX98d6euvkrIdD3edU8234wpFc
	 zoKFgOhqnEYvtZKSf9hVbgsWaDaRwxZuAx4rAEZFqE5qDgDDpzrHNdeHcsg00k6tcweIU
	 M28yVjixnhJ2Mkf2auozekn53WzwVsdR8M9F+1i/WXco4E7qszUmMB/6tVSi1D5ScFed8
	 tk4J+ZRZ5kAAqFZ3VCFxvxBE7ZJ63j/LwSddvvA9i/nSQE/+UN6Phb0aJkgGOlno2snOt
	 Cfr6k58p269jfYhAq5uv2lx2QBENCLPKFZm90NNKtx1SF04YpxCglWxKqqOUAKBQzsg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913623;
	bh=z+AdxNtlsPj3RpuClS5bTZOoECb0K8xDh5ikjbTSidQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dSbAbSshHbyaOaHjBDYb95tNqDOHgx9bFIe0kptTzIbv22E2X3ryxv0tGs8lqHZu+
	 FGW39GnsaFaHTSEdJPcYK0DOWPhF0EXMWeMv3L4MkzP3FAR/hW+GwR/z9O9aPn5UPt
	 3IxPJVKpSjCgjCJVT7c3+7/0n6KXhS/QIBE+HaOVLabesk+hMFIEs//lYJUtK/pG4M
	 hO2HtNGpqDbIn71d3Lnv8c0We+/5ivS2YBA1DnZiW/l64g7as1REeej/wUq3dI+oJ1
	 vFJMDWYIibG9SUwKaFkSxztKcPotI+IVBLvvfWgX9exSKRY06rsY1g/3tsbZ9R0mnR
	 3fFkAe7I6SBxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AE796063F;
	Sun, 20 Sep 2026 14:13:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0545D37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF6BE407F2
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HG6ptFrTYaB9 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:13:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0AFD540619
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913621;
 b=JATjY83nRMeCblZ0OpxlOBFtSUZ7uQNsAWL0NFF6m1c2F986CfmHZcO61zYjOQV8nUgJ
 x+dYOJrfp9wbHqSh38hUg1azPFfIdLn/SMFporcUFZmqF6kj5E+V5wjKyunxQtQc14oNI
 /CtPo2iPxTVtqjUZRJBmJ5k2D1ZoaryHF/6fo9In8iA6G5X4XuHJCuzzyn8QLmk5ajL3A
 8FHYEYiumKTTRMHJ106EfZprEC9fUIUXsUnRbkuOMTjfYOTQSjqWP+JhabxKE1aWrkYUf
 4TcgbKQa4fWhefbBFwwWQoy0VuFKWVz0M5WWWthMbNW085w5Hd3iohHHno2sLiQXWHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913621;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=t+wAoYYHyKtV+Eq97J1+gkp81w1F0wH1jS1vowMZLFg=;
 b=b3YyQCrT3MoexHZpmSQx4hzSt+Rcx6C9Jkj19+IkmAgMXf2HP4yp8iE4uSilUjDvBTev
 /9spyejmZi+f67ZzzVuKoHkIboSYzibDQQOBSzYu3YLMgWOKrR9O8i+Ef9w5k41VyAFVv
 BRAd/J5aclzM5h/Qo14XiNtPTrHJRE1vO3gbGmdRW9VhcAGhKgdjBZCXoks5dVQIR9tg1
 tgVu0rEL4/xPr1HNvDca0W6gTeJi9EFHqPSRTRdirJy3nCIVQcs61p16ievC0eHnSA6HJ
 5RWJVZrikPKEHUNawixixXh3TPULWCedBWD0Umt+lLfU/h6VVyesE0pU8AseQsHI9kQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=iBQ5uR9i; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=iBQ5uR9i
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AFD540619
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913235;
 bh=t+wAoYYHyKtV+Eq97J1+gkp81w1F0wH1jS1vowMZLFg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=iBQ5uR9iuphuaZZKu2zIL2e/YxiEtkrkz7vUKU4GnOX/gwqmV3/XQueT27Yu4qoh8
 rlhAKUMz7mTjIOwpNFr7VZj4tWMYE5WNBOX9tre/ivXAbvsaL/J6wFNR8d6TkzlXXg
 c40iDuV1oULqPBOhlVeBeAmdGa1ZRWTFBbSUcAv8Fk1kRUIm90sb8EuRQC2zmKLI4q
 Jhdx+XssrDvSJlp4i61ox9+hx2XQBhA1PJaxft9iSMvyEK9+vQpS+No86FslF1D42g
 O6iFotHZUnsf8S6F4jVQRDdLalhDtmOmKQjgGnnQXA0S4B59r2mPrBQ30N5WWVqBSN
 a818RuUJ8DUjQ==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:b4gjZYOZ9Uh8Tg8FAWNqDYcokieb0yMKvzvidQDyYWNx4mBCod3ex7SxEjhpkIeIuJ9N8vyE/caAWVk1KyA9OX4HmumffYkETlm9cgKogrDqxB+QY6orHY3MU0q1s0jSo3aa71ipbKeIhZh/lpr20cny0ZS5HusXneziV16pMm8+qMQV9OmXxML1VTsNevKzlZNPjWBcWuf58vazDxXqZq9jAy904YxOAztZTqisauRaf+JqeNoOkqMzVfCEYbKXU0bzV+5OBeAhKOw6N4oc9shnbW37gMYcpnZc9joliJIeQUaWs7vU5mxmezS8VoCYSWJ7K5vHLSq5yq3qY7fkAw6ER7AUHix7iqxhGLMIBStNESrjcNyhr2vZkVEUptetoYtMdhRuZheIst0S+yn9EURZe0hXqSIR3kLUWujI2tote5QdZ8PPTQtFQqm6t8ZQ3VjGqSq/fla9Vk5Ddj+KL+Ym6WBCJwSS9Qu/OFz5PGWZ0U1lsgtvIEvOszXnRe11D4HUrPSqwfZ50JsvRRf57lcV/riJAygerlMFp46zA+hw2gt2Doahc100HzABqb0ZIFCRPpwZGUDBCDPJkY1WPQVhrlE+085bwe7wBO7Dn1hIfV
 +8s8yenxu0krUvIsHPNPX9jzO9T/phpk5jc6MCibi3tUGj8K2J2C0fo34pK10TmSSl6NTFWrA=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D628FA4C4872;
 Sun, 20 Sep 2026 16:07:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBI-000000002J9-0xAl;
 Sun, 20 Sep 2026 14:06:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:24 +0200
Message-ID: <20260920140605.3005461-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 26/66] package/ca-certificates: Replace
 c_rehash with openssl rehash
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upcoming bump of libopenssl to 4.0.2 removes the c_rehash script:

https://openssl-library.org/post/2026-04-14-openssl-40-final-release/
https://github.com/openssl/openssl/blob/openssl-4.0.2/CHANGES.md#openssl-40

"* Removed `c_rehash` script tool.  Use `openssl rehash` instead."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ca-certificates/ca-certificates.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index f5675b754d..0f88df3eec 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -36,7 +36,7 @@ define CA_CERTIFICATES_GEN_BUNDLE
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(TARGET_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
@@ -65,7 +65,7 @@ define HOST_CA_CERTIFICATES_INSTALL_CMDS
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(HOST_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(HOST_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

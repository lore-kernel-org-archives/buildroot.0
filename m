Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046B6C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59CA96061D;
	Wed, 16 Sep 2026 18:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBbvWe5ad7Yg; Wed, 16 Sep 2026 18:39:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AD2436062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789583996;
	b=YpG8V4mReNI/+brPEOU0ZRT60BMp8xd8gf3oXmEGujAgnTtlVCd3U64dPd8MMI8kt7Hb
	 /LZoHFIXbpus58qKkREA5VQyofxMfmNsJCX8Ip0rXqXfsxnHxBb5erqvyPJ3HSbS7ptBD
	 4IRx741VlEzpzkEWeAevu6wsHal8s7dVtZvw3zNUBb9bwgCVzmzpsFuRyiDmvRRY1btD2
	 2h9UGrasL/6MJGuhY4REp/OJVvihMg5zqNrcwyJbjA6DtR15TR8/T17FlmSEF6z3yca3R
	 UO6bSoZFelpXFxa1kyGrPKK30jhQfVHOfrYI0Eeg/iHG2meWSUYebt6/0a7tSZVpSRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789583996;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SPQhJBpyPoX4eqs+BJazYcb5kKKe6LPL+K3ZkAX0U4c=;
	b=TO/Z0WGz/3LkHzWIrHfsqAqQNCQqpspu0CjoOayhB7VmT1hS84xNeGKVNzKIS/ndUYGI
	 3ovnIR2GTJF1+8+P2sFgxCep3ZNdCl9nFGRRak6DY9mkoig++Y9SKzt48xoWwFOjY/gNM
	 pT1hUVH9agPJ7jX7CukrzakLJQY5NVXPjND/tCVUTnCMlXDHdESl4U5twvRld+Lgt3GKc
	 hKtxgdNttCSP4Az30ot+0WSMS7o1rSpjQrEPh3fOKgRNDs0exYpR7/MdDzccxZeVtpP9W
	 1gOnCdXSmQsDd3WBxHzwFbkustO1UleGkslOwwCqvkm1GZTKc5gq7k0sFBshIF7h4jQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789583996;
	bh=SPQhJBpyPoX4eqs+BJazYcb5kKKe6LPL+K3ZkAX0U4c=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ts2r6Qwy99zZ1PJs47icW/d4L+ZAAm6VSbLtDvw+f+s6AFYoarGLaBrDMK2Huow6S
	 zY9stlB47oSA5IgzQ96BaKmkA+uuGg4NEvrUXGeSqVhAP+Xj6t2k5KsExLlISczULn
	 pvO+dqRiFsNE7Z2/9FR1OQhX3JAZ7kbDLdMxcS/xpJh4iFNbgQXX8DigM6KMhZRuIq
	 wyd/Ij7yjezJbfdAcHw9dNy0oW0tVk9KsuVB8yRDu/+Lqq4hmf4TxwkW7MsAu7aHg+
	 vyby7lwa7rrclPiZSTr4GUd1mBdlbkuH80PPl/zxRy/K/wEZStcXfOrPtcxAsLEJJ3
	 iWehBDyJmZAnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD2436062C;
	Wed, 16 Sep 2026 18:39:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CBCA47AD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD225404E9
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cjKSdLHMBqt7 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:39:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 65D804037B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789583993;
 b=ToH3cYQFRUgUMbIGgx7CL6UzVvjd4AgbVF5YTneZND9yxpNHrQc+jC2O4lHOKMg1rp2g
 vnLnsYTaOr4NCoAxHAzzYFlO7cYqzxiL5POvsMcWKO4W8TYM+BEBrRS7cKmu52f7PJghz
 ObiUGZwqhFImmL4BYxzmmgD3GW7Alr0H94SQ2Wkr3hnsTTf+lFZW1kBcCe+WWpbGbGwn7
 3atafPXYD1z5V8wslFrnsSJKl3/wDKEL+lgxDTqQTRWkrSxBEnyitbSUEx5U/nLWGahvU
 AFIp1UZGOJrZjgj+Pv5Z1mVRVlq5AwAowHBSBTgKj0aoUpBUV2Q1m4XuSfkP7iHXvDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789583993;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=vmDLroF0k742+sdlK1bVqXoKoe3DanHnkm1tTX1Ws3U=;
 b=mo8vgn1R0tjvwm6GXbgCKlGMGUYzGOqkBlXsS4kASy0pnHREZ547NIUqIpGztXyt9p9V
 wP28k/Dia9ukTfXrR7Jm0kzxEMuj2GY22zP8K35hglh+7yAe3b5n07YjfQ+yswP53fvN3
 UPfG4PiMFyPKSOk2HzLQf6HFqJrQ2r7tSTOyu6MA50iA50QE5ZbEbZLt79UyRCtAzYHMV
 kp/WJp7+P8bF84VY/e8887zuHbxf6fFHivEGUGrfocN7NXa4ZDF7eSjC3V681CGcCHU1d
 8hKpIwueeXuq8M9dkvk2SAeYdzrSex6V/fyJ13XOBiKijh9Lku2bkVIw88xu0e951dQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KjkJqDM5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KjkJqDM5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65D804037B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789583988;
 bh=vmDLroF0k742+sdlK1bVqXoKoe3DanHnkm1tTX1Ws3U=;
 h=From:To:Cc:Subject:Date:From;
 b=KjkJqDM5e6AiF3qxZIOJF50FoLQHLj3tmCnFsc5tVhBzLw/km55yjMFW1wArnZqb6
 ZKVYe6BAdErAupjm2pkXlnwFjGHyfbd81uh3Fba8Njfq+JFmDoP1sGmkA1OlbL45T4
 WgRt3+x9y1AQOnoXq87AwvA0EMrv7h3wROEtZrb5BJXKxWdoadYvU4vBtmMjRb+at7
 LJTgD4zszUPBkcqz2LQinQoI5t7XQ3H2tHZryP631/CFzb0+oFWtJGLCv5GBFRAKD2
 05sFo5EebQHyd9xj3WySKMmmigorr0Xm76l3pvnJwhcfQwbfTuUz7LXSikJFW7sKVn
 ITAdQSXiEHQrQ==
X-KAS-Sym: v3:f51bdf72230551df:WCmC+EFxKOsYvV2nsQ8bqIBG3BRUXJ/i+qkAo/N5/IsfhXO2QvQfgQf7IeRTJLy3YHyK4Q3PnQ2j+Vt9JHYHJwj9QyUoIe5FgeHlUtauCsXLd40CEcAlnTbGgMRZF4fDdJnrCfiaX8vrOXFKY2L56Ze+KTmlTwNI3rqbRTSRJ/b7TCydS4qxEnQz9IrNJnFOoTiwgB+q4LyU1jqd3PImvNbSdlGE80Enhd9QrGRwwWbHQktuGm3rlcwVpEIYeRNcssM1Ro1i2AD79TE9cVjaZIz25VTG87CHxBZVsnt6333khjhLeF7+dYEyWZEcCJSuMgKteJcqHD2oSy3V2gP4Rg==:J/oiK/wOP4W1WjEf212HzK4GTBt+lPBtjwkX4MsULiLvggDqrH66xFYSFK5wCl/ROOokKyJZ0AcfRHATfJYLBPDSpzBbiZK5wZuugymwCOYhIZXvVeq5hskwLB9q9Nv6y+Qc4TUFDX/WYkeIMZQcABwZagoN6tw3ek2sjWw20HheuEHtGN8Cc5lJAdflM4/eGVG3oMJz18folhM+mNBO6YGUImoEVng4FPcNZGDhDvfb5N1u7+OVPOwVW2ye5hZs8TvKEByQQgR+WX2pBFcAFrJYxXLLHAqwZADEUzmqYjnhDdSGxSPjHwKZtslPHm+YzOn+PB9fG62tHRXt9jhWJ3gQYcDKKaXqz3OGSNBRH4x1UQuFJ0/M/zY3WF8fG+lC4976jz/xIbALX7Mmek+IL6yz7eLf2D3xBu8WPkLXiRQpUR7WlZdluUDT/L9ufHiv0bmfCjRA3j7oqPxIvqqEf+hIPMgS37Y4C3MLe9P4HF6OzEHEHQV2hae2J8XGYDIlh7nqE6CFwXNEdjBWbfg4DCD5q0T3Z8/fl9lqVyQ1ExJ+C1QttcumyV3c3MyWZ7YN7xb4MRUgu0HHVBzJpmJcA65FUEAjut+vO+ar7N8fa3bP6K
 Xj4O8XT+j/LMiAFco0rheAvKw=
Received: from fli4l.lan.fli4l (p5b3a0ed0.dip0.t-ipconnect.de [91.58.14.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B305AA4C3FC2;
 Wed, 16 Sep 2026 20:39:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53016)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6uXr-000000001LB-3Ypg;
 Wed, 16 Sep 2026 18:39:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Stefan Ott <stefan@ott.net>
Date: Wed, 16 Sep 2026 20:39:47 +0200
Message-ID: <20260916183948.4069138-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/unbound: security bump version to
 1.26.1
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

https://nlnetlabs.nl/projects/unbound/download/#unbound-1-26-1

Fixes CVE-2026-81642, CVE-2026-81634, CVE-2026-82717, CVE-2026-77955,
CVE-2026-78227, CVE-2026-80225, CVE-2026-82720, CVE-2026-85501 &
CVE-2026-77860.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/1665366ca9bbdfdb6f946cea8aa8715716cab704

tests.package.test_unbound:
https://gitlab.com/bkuhls/buildroot/-/commits/22010cc83461529031ad024e6a778233737055ed

 package/unbound/unbound.hash | 6 +++---
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index a6bab2218a..5a0a52a7c8 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.26.1.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.asc
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.26.1.tar.gz.asc
 # with key: 231018690C4D903EF419146AA144323DEAACDF45
-sha256  77458a7156e275c0b7b17fabcb357cb12445d95cfcb26fb9bb7d5ecba45e0b63  unbound-1.26.0.tar.gz
+sha256  35a6dc0e425a9282c3426d9a3043144011bf0534aed4b73ab62c52aee0af1503  unbound-1.26.1.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index a3a1baaa94..d6886d4a5d 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.26.0
+UNBOUND_VERSION = 1.26.1
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

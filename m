Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA1BCA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6F8060824;
	Tue,  6 Oct 2026 16:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5p7cUo451CCI; Tue,  6 Oct 2026 16:31:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EF17860877
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304300;
	b=DWZmrrmw0ZmUPVV/GeSxr/PSsYLseVDju1hG3/ictrentF8YSsGBT+kcjoHfvBqdiEM2
	 lvaZwahui0UBmuo7TGFSm0YCEyQ8+8OvGFkAm0aggyy+y8ocsXiHCocPBsSgl6c/1L6h7
	 13LWR54H3zUnFP9p9MLMmLFywHrSdnJdDFje4T9viqQd54OjaU+V9sbHYu9f3a4DcQotX
	 G/2hDTeIIKSFuKEEZWXbwUnU99kiEJnZFZ0apNUhv7WqVuDs50CkYVnYuyOE2xZbSZNGl
	 1QT+OqslDb8H4kcNl/xu/EeBgvUsXPqRTUcbBogOHtgWWbBmLVUN3K3B4E9g0wK5K8A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304300;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+ebIa/97GeSbindws3/FDw8izLV/33n7kcuZcsINwWs=;
	b=EKbHm3eaT1zeUDBRnOQuhfzD3xgd03pAkrLa/Z3soL3rb/OUTSIa571DubiH2txDLdtV
	 yhTl8UII8fL8+y+MBtR4/rtJfCPBtogrrscEeB/ieOd3bWwYQ7tZTVbPX6IT0mpybDib7
	 tbD7Y4Dea9yBzZidgsLGPmgK8epFi9x0BUyBbi3k1dfz0Mdp9XhSPhEjNvBjawEGysOhV
	 eosRJcaPiAvVJn3xaU9U8wpgmtzvJU6xxCe5lTKosp/xKJQNqtRhzXEqLxi5m8UIDZ4y1
	 WugvSpz0XwwyEohX/2KpFsH16EhayvVhuNO9sY8nwxmGRxB7IQ+Sl22KaMaHS4J6imw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=dvgN7Hc4;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304300;
	bh=+ebIa/97GeSbindws3/FDw8izLV/33n7kcuZcsINwWs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=REmmqPbA/zrzs3dYYgVSbElG2oM2RKf8CYxYWa62CezYrijnRG4nvLoulIz1Mb6aF
	 lSsERhXyCGstbiRjbg8x+O3yB/W6PTIgzETF+zx3zFT2vo/4NfxC8AcAQEzZ1YJMwA
	 C9GRsyFDdrymXcyM3MgN02T/j4rvuIrHTo4pw/6Okbnkgt1PkM8MKkFhzZz9RCiqZ6
	 OzhE6nzlXMWgEtMmvLrnrQc6GvB6D+U5MnlXYv9yszFIC4HgdXvsTlXJ7XJZBn1sX3
	 EXssaslNR0B9UiaKQOqMsYjwES81q13oQevpKK3H9yh1dyIclhWbMkLgfqph9ZheO6
	 pkAjNBI3Gx1cA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF17860877;
	Tue,  6 Oct 2026 16:31:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 686B0341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F0A4607EF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vl-WMWy5tKdE for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:29:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 555A86078A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304194;
 b=aulVmmWv7d43HReFxm7nn1Ms8klLy6FvMwgUFA/3wboX+7ZOoAPVsy2IwIVs3ZqhNGtn
 KiB7NbbMYmvyorc4tJOkatjUJZWALc8iPHc1863ZvWGdfMu6lgRGNZiUoebd5UhCD8psO
 K4EC6iOWGotQmk+Q5J7aDZSbGcRqKEoXr6DwjsOEwhtXsheCzn0GslIL02LJxS+qNMiD5
 tJ6Hgik/M7+EGxKyF/hPYEFkcGTmexF4wWoC+PheedceNmPurjPP947zxWB+Z0kfdynmB
 RtTpdYJBX9G8h5DlDj7jGnc4RzRVuO/mFyFTyXS8qO5aGCyYmXQ7hdd2WP4AItQQKnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304194;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=kZoAzm1mhdLy8n5g+86+N4/aP5V6VmqflBgL+lNQycw=;
 b=hbdkEefEqTglXpuKTIv5qIXPRG4ALOrLPjhf0HXhGHaOaPmGsOY/n936q6l9r9aN7qDi
 gUXeL4Uuz2WZPSd6+rmn3uAkq3PNllxyF6aRWipGYlq3laYKDOZaKVRwPY0CF+aCZhgi6
 fXNykS62fT2gMqJFQUAuy2poLnOL2WpE4DlU2P+PPFLeFdt1U3syokuXOHWlvqRVJZGzQ
 /NTLZ3caTUWBuyNTP+i9K5WIYASLfJLuUyLyv67Hi3eqC8+fWxodNyh05eYeB1EgMTC6C
 M0oUjXGEX6v3SGPEF2RJ2bfRzEnW3M/ohs22gSUZlIyTpZZrO90WcE5uAAaEItIskww==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dvgN7Hc4; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=dvgN7Hc4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 555A86078A
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303707;
 bh=kZoAzm1mhdLy8n5g+86+N4/aP5V6VmqflBgL+lNQycw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dvgN7Hc4I2RKnXJGCWwYCA4GOPh1YNB3NyMeiYppYoaYw4e76s1tKwCvdFNJ7QlBT
 vsCEdB9FlesOmYaS7UKX+/+Y9q8zcEq95amqWHWhpY9H43Cd9mgD3iTYMyVlki70vR
 kkqXYz9BUs5hxHbqo4SyOs2WFAhVWvjlNFGkvHAHiPlGPqkEnaXZybYqLKAFhpbfHl
 1+V+d9kuUHiCqRjh3Za53ul5hZPc3L8bfL24gP0hAOMF+bZYDrkaijKjsvJV0T542K
 2vtGdlF5BeIldw4MB5/OfD32kUq1OH0gXvBfcv7YGV1cnvHuENEIsYZRp2ZQhcFCyD
 Cgh8rjyagfJdA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 RZSnhcqA3pP7XYTysnniLYuJSuBNzrqyhaqqYBfmoNh7pihC9uboC1YFnVY5+nIWmdEDbbg2aCB
 7KNXr9lc7QDKjS0ny4URi7tcowlsnhIDFA8B8RHBuJ1IM9mVXNENnm48ST2vvR7pzXwGYJbx/mY
 eoqRujSwGVoQgqvCfZiSvG7+c7RPwlLzX0UEx6lDJAaRX+iHE8QeDUmzz4aSICP6m9IggtF3k/O
 hkqiM3GXwHgp9yNTQOsftILisjywj+bSPIVjgEXnjH4yEZ64r+VPi0/hkggSrx3LbZZz2aM/TID
 tL30W8tPZHBy19zynV9pRnTTTWhFa27qx1ttfRdIQzfzRTVNdWZ1BMmViPj6IzzYPxPNUP9DrrL
 ASL2nOALR1w9FfrSm/jDn5X5vcHSWN/og+cvBSIiRLkMIaxwBVfPKz+JkbsrU9uFY8105qkSIll
 qsXg8dy6zs2pH9AEgFDKK5QSuG4Ib3hD2yEubgD40GKc+v4WT/E1lmqpBqyV6ze3DFjgylOL1Bf
 uUg7B2TQAdCDvZNHOtxfoKHZ1DfrF0x8RfBjVqfQCqnJZqZN/nHpnaQkk9HCifwzVUWKmc2Cj+u
 lHFbyfnvoxLfnobfZeQ/ZpTuAIM1IT+lqIbip3kDLpzKoM0=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7C380A4C542F;
 Tue,  6 Oct 2026 18:21:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uh-000000000ir-3Nn4;
 Tue, 06 Oct 2026 16:21:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:19:59 +0200
Message-ID: <20261006162106.3439373-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v8 18/84] package/boost: wave needs thread
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

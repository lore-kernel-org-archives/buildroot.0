Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6517ECA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 306A7607EF;
	Tue,  6 Oct 2026 16:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpwHDFjZmMWW; Tue,  6 Oct 2026 16:29:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 34260606DB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304185;
	b=sS+xgYLrAbJj7mve6pCqoOmzqVTQe6eBJPVTH6NF56oDqMsHe888t5Qlj6PpyMkoT1xz
	 6dCDaMUVFOJ04AAeQv/QkG/EnDmNlOdaYRqLEuiJ6fLrelfLLs+wHdHkBtm6sz/MUw/G6
	 68KqffdXm8ym5IFIuKm/pe9zW1rVAfdSRDvjjAoHSqF4AHunHsQLCWKIkkql7Y7oPoNqu
	 UE4fout4+MTEMhaMMip0h9tpP7C4OZph7S54Bba0c5Yi6v/kdGz8tHYDQklo5s7lo+zzC
	 LxNyyR6Tskrxojmqs6vrBd9hlNDMNxeVcuRfaUKp4hv+K9U9qo1CL1CYeTmuK46hEOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304185;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nlOtvmdst+oCb769zmCOS6DHYlsd5C0Bw8vPz04wQmk=;
	b=e7EiFf0LIY4BYP+glMJ3NTmnaXit9CXa8S7nJSkufZuQcDtOTsgXH7yVDrGD5WGH2HYL
	 4xar29zOqmPr8AExthXJCbJHu/QlzS64P2v7cp5ISWpjIoYh/2b5k+o+p38EV6XuawijM
	 LEzQ/riYNRz+OnJIVOc0qqYdz2WntuzGp0YvVvHfXJ83utNtcag00xMddVFaEnlAMEjLP
	 EoPGQceYWJFTUbAq92HOhElCWL/8sYyLG2Kd9RE9Z2IiSDz6nbMc1m/bgZYY4LYZmtake
	 PiIwl+n9GSGg+Ir9rGxuRUIiMIcOwehHgX/hpxG9Rev7yiGI8dFm2cQzoQWGYY6nTXA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304185;
	bh=nlOtvmdst+oCb769zmCOS6DHYlsd5C0Bw8vPz04wQmk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n98Nx8PkTIzsqtE9jnGofhJ605kJX0sVcyI1/d0mhRGFjb3ydkMnVH6UXjsQOwD9o
	 KZUSL+OUfhreefr1kV4cd0xA02vqigu3i5ZvJjWSmPpZu23gNJLsV17l7+aKWTIptk
	 Z3ptLik3Xwxb2jyT/QCS1Kbt6fTQqxm+iz/bsFYjMYqAfXZnbfBs54rfhKXJByMVWa
	 5jjkwaD3Ukww4cAOxm0762uQFutkFUrsELCe8hInkd20aLeDvvTuXP8lAZCOnqfn45
	 r5jgLRycWjC4ZTD+zDMTf5VyNgV28wPIi+OZu6p9+2gFc50XoAZv+Hweif7hKLbwhy
	 ZnSs6eGhDTXsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34260606DB;
	Tue,  6 Oct 2026 16:29:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63722317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49A0B40274
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ks05Mn-in-vR for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:23:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9E32F4009F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303785;
 b=PJ7G3ado7xb3Lqu4czpyFpuimkyid2eSfUUEa/p3ZLlDOko0YXZQsAD2ixI4tR2zqwiJ
 m3gA8++4mRSX3EVGZp1WerJ3iFO2D8LNheF0SwjLFMBDP7u2oIekO5mHcCcWJykJCiNKn
 GgJN+kuM9yalbEM/i3NcFu9P4TyV6lhyRew6Z7HHDspG/XseHyC8Lki2YYKircB9k/s6F
 k6Cc+5pCQKeO9h8XVcdcp8Q8LCHnp/c3X+W/Rb0/WyLDHwDdMDXkwucjWwftICuMRJofY
 eajhGY3t6yzyTRGbW8VXVgbJhZAVP/qHdV1F9OId7io78nechGoihh2AfcGUTW+cfdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303785;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=pNZBPyZeOlBaRCbAAyVSNvXj1naepQ/zMPBj6+ASrAc=;
 b=FXR8b1623PIjKwvY5UoYZANCWCymx6lo51sUHLVB2XXykzzGZY59VmyVTSNuWEcOJj6V
 LOhcV4cth9UpIMPlOI/zpKbQniSZXsLAIZK2kp++Xc4xHm3er4GbhQo5SrUrvbY0dL6mP
 2Fmcu8dod9ALMDJHegI9zeRU08D+gIjfTQDXtv403sBvUnpKg8FmOkDXQoI/fT4bSdMMR
 +4sbPpR3SDKW3+ggUoU5Jvu6ka5zRoag8f1JZfoJrROQ51CrHHH9Uo6Rps44Ep6ozAi8G
 NPUZNVcU+TfrsFd+/hAAM7ZHn3Tv54LoPv6MbHF4N/N5czoqsE6Hm91+uwu18A4eg4w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="VDiczj/8"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=VDiczj/8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E32F4009F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303702;
 bh=pNZBPyZeOlBaRCbAAyVSNvXj1naepQ/zMPBj6+ASrAc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=VDiczj/8MhP8jIfdGsole58jx0G16V/5ePoUe7kKT3vv+Z1GcvfEiGAa8YeRAgj/D
 YA1bHYIehZilHME9Ft6OLMQSs5HkSPamL42VIVDmx2JCiOkHzZ5dkWkey7puQTlqaw
 Ns5/nkGT7RC1PjO8XxZKpXMiqDQG4DJ7hxvYrH83GJK4DNyfvjRu+l07Lnogh22b90
 iRwHFl6ZkiUZVudWGskZbq0c/ESne5QS5lKh0PjPhhYFYxu2FZn824ZI7m1QRrJwb0
 maXbsjUd0+qpu8l02x4W1S4h17cQWi6oole3FQsuuUZDK8fm4mTbARl3NWvslqlRDC
 GJHS9vbLZrFxg==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 yh2GQDoIV5MPcNeXRGos2eBDug6/TM68IAFFyCxGHLjmjxhtoNGhO8JJxB6fCVyEIdvsn231eZw
 r4d8lfn1KTmYhM095muy8LRWCm4UJEiKeVY8cvd3pQfEaj5WEC2JfKccAgg9FQC2BvMEHzMMXbA
 14/5x0jx8kJ5aBUMSpimaFf28+rFOkyoAesH6aXnDYCY+6ac+Ai4ZfO8XMS7+q8awng6Pf1i4ik
 JsjaqMsuHLwG2+b9mXgVeiokZ24uAXiE7rymT6R8bgIR1FLn3F1IWN3DkR/9xvGUQJ8HeqYNoJe
 vOqda42N+qAjEAq/N1mIq8UvOynT1XOKKFlUkSEme5QvztXbQq1KrzmY87MD9xt16N/6J5awkW0
 lK6rMMivfd2zu2hOCaOCvdfZ3H2vmJGt7ydToJIw5ez+efABegJnYvS6UnzzrgQtZkIWRl69T3I
 Bozh1Vi2igEoCwDPZQD+13nSVvQ1nRNHVmh5tgX0oOsFNqpXJCFkMjqb+RWCyxZaNa5hR1QMl6J
 sdlH71JRo6N6/HE7qoSysoXfbbSW5pzav6myhMvdwPjybWgISBl4cCz2VpeE+4FwGwdebU/UK4j
 TwMWRQ==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 38BE9A4C3F9E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7ut-000000000ir-30tU
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:21:03 +0200
Message-ID: <20261006162106.3439373-83-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v8 82/84] package/kodi-skin-confluence: bump
 version
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index 9cde584da2..9974b4a3bc 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ae7177ad7f06fdb38ba0e217b2ac3e4375cf29a7792f2eaa70003286410521a0  kodi-skin-confluence-b049aa8b6bab50518de72783efd219680047d6d9.tar.gz
+sha256  8043658a939e141305d6acd426a5a5be3a35ec1b94baba23fde069e4a1ff0f00  kodi-skin-confluence-da60e21de4a87581a8526c9409625e9f21cc7a33.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index 31d6b37380..2a83eb5994 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SKIN_CONFLUENCE_VERSION = b049aa8b6bab50518de72783efd219680047d6d9
+KODI_SKIN_CONFLUENCE_VERSION = da60e21de4a87581a8526c9409625e9f21cc7a33
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

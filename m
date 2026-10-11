Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8581CA9ECC
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 21:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EDD8405A7;
	Sun, 11 Oct 2026 21:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3otXTrUeCMw; Sun, 11 Oct 2026 21:10:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0BE7640596
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791753039;
	b=CFdurg1RclmjtQmOnvA5uo/tkwYbcL9fr/MNJoWExV5WPuyy+qzP/BUib59ZHQ10Ette
	 f9AJI38HRfz+jo88TKFj3y85D1i6NU4HeweSlOnprmI9WOxAkSvSFXJq3RLPg0HenYBEr
	 gHTqQ8PcKQblh0IMMFXAHz7VALgnOiqvdojC22VAjDKYy+HVhPCEpkN9ombGoAVtvYcfK
	 +WNftRt0fRS4yd7sUEnTcFTcKaUNTl4//GRu7l6H3+prgur/U8yslcE0GNsvSa+/Rh9Os
	 GwSufbiXGZXoWQMqgb0E6XLh59P2wYJh5uIeFMVUaen8/wCBF7q9605LEnQQKx8XJHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791753039;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=e8SMzpDTTCv/JIpyFyy+HgfFijoXt1sE1JCZhfRP2/k=;
	b=cSWsYGWVR5YEbJ/DvxBJDQBGokV6+RRVkHGgguCO3uFViECt7yhYKbNxR/+vpbjHhbSm
	 ARVjF7GiSslWCUqI6EsqhWFE0xmdQBwYxoy41ASwlcenhTjjkd4oK+BAshgDTqnrTYCaC
	 JLoyWzCBR0cRmYhyhKehicixzT9juFb0U5sWYBS6Gx6iQrcreKWsofAODrNE9i1AZCDzK
	 vSjPfO7LXO/YqCDhfnrUs5GC3qswJPMKGxEfLbrKrpv5HtH++fWWdIWob6H086zVwfOe7
	 eIEQrI+Azpdjd2nHKeUXxGPR4SCs6Ob2A2H1J0iBNCJ9GwDEz7Ncp2R/qihaPnJxDMA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791753039;
	bh=e8SMzpDTTCv/JIpyFyy+HgfFijoXt1sE1JCZhfRP2/k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DqEUghw+IRfcgCzVJuJeOiUzArTv1BgiEih/QDBtJUBulCp3AEAfS7zH8PdFv66i6
	 KSMj0FjPZSOV0tu8LYSPsm/gZEwERQlYcQVWXYMv9EV/w2kHHH7YhVHdtZBmbhAYNL
	 74oughZM1WtOarNhH3YHmP4vnSyYQZB5J98fbrPwjyQbtJxOwdRxd+quKZrrAt+iJF
	 aMSqF7WGcLH8qAEeIJa6wZTwCqIjeOOPwUifYOZ52yCfW1hh9Cms0NdbpgzMh/uKbn
	 iMuVTLI3+EivT9J2jN226yKBGpRkn9ryqMmF77qgC2ysXYFFYJAS3kkuzqx10SU/BX
	 RA3fa/6m/o0tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BE7640596;
	Sun, 11 Oct 2026 21:10:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCC132E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C33F180A90
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hpTpC8QzTkO for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 21:10:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8672680A96
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791753036;
 b=GAYp61eO7lS1yu/kZayoCxmF2cnwfq6PU2qNHfx2VNUSZhaQj1KTXheFQFP2mRZeLo/2
 ZZvZEtsybCxnc6HWzVstqiaze/lXeBkQUwkhPS9DRdZcO46/uK0pJyxI0GcED0eKKjlDw
 PcQGSE/CFcayRqPyp/MeAEkPw1Agv5G2uhCp/zH5c3UyWxgQXb7Aiu8vGT+ppt/KDTdoB
 ESilLuHIAz1HWDLjOBttoahRblE5kzFXW0Z9lMf1i8CkP3uiXVjS9DFSysyKQ7FNWtRVg
 c8/R5qFnc4XRiFzDB1V/Bw+kJqAdWlZy8EGCNmTFGtL3ZiId+GuJRwIwncHhJYJf7wQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791753036;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=WDEuteNgYZwsT/KiDEW9dwNWpAe5ozc3Q4xM060Yv/g=;
 b=qP0QRx77PizXoOfGomGcPoaikgNbEmiDCQWMFPgQe5oa8F8O8m/YAJiHZZZonk6mmK4P
 Hets+Vk5G8bgN9D30sKjydnTeElZLALedvuAXCD5twn3vM4AFSxWsMagZ7ekixBIEdK8j
 AL4YsIDWWV+VNG9jZqkQeYydALrAaWAkDZUMHGbznirG2S6Xm+mB8JDLlwN8v7umZfJ6j
 14hxZlKd1YqB5iFV8r0HGIRIIQ3udCV+GlmPlmuQtvIe1FS03/YixGrrWaubpCYgHR5eA
 4NUdVIO0UsMrFJd7piuUnbrDzcyOAbx8dFJHdU0zNzgOw5CRcp0+n4bV778Vi/LuvHQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RSwKQttj; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RSwKQttj
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8672680A96
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791753030;
 bh=WDEuteNgYZwsT/KiDEW9dwNWpAe5ozc3Q4xM060Yv/g=;
 h=From:To:Subject:Date:From;
 b=RSwKQttj2NdDofDC+ik9mtNExO9gZ9Nmnx2AXJRUiqG4VTj1YrqoiDzXctdqI07XT
 7qwUc5IidFinCF+Y7gd08Jv+fJk74gv7ap8j8PobqnGxNRb3Ls7C9DRDYLt9wT8qLC
 x54BWhs5ivGBY8lBjH9aPiOnuFQdZIMeP4VVXEWnW6uf5rfQzBDDJ9hCCGTfQS3wsU
 cpPAfvP+tRvt6yoTx2I8ccdXQkoCG3qB9kTH0dJqgXSB4Ry2cQeP1kDrzNgAB5vbZX
 uzNHs9E3mvZoHA/S0OOICp3XfVfLRoqXELCXJpQV3ChtWTwCQ6vMbgJ9Sl13Icd5WF
 /PpXTzAqeAH0w==
X-KAS-Sym: v3:f51bdf72230551df:VaSIygN26tRTcaTb/EyYrv4sb6+zYFp15Nhrd/fFNy83A
 60RDr/uV6GfHn9UeTxRsNMGnaVATvOo+IpsfYypuRGjf3+lMgMO1DcknbzMz2Ay8hRsz6fd/oZQ
 IsWZE8aP5Vcdb87V7YRuKRBpFeaBCiOHelxz0VXSYeG5yWTqGOm073rJJXbDpom7vnfGnzTLtwv
 RZtWc1yAvvmvBvsP9NJCeoTFy/0+pT40ZAPcL3iv2NXrVkQh85/nN9tu8atOBQraCJDH2/Yyo5K
 EnSdVxMi1r/cYurcH1T6eQOh/ggXHEvrV0K7N3YdA6S8sKz8ts6r1C3ZSTs7Zv6H4ajmQ9qA==:
 RISAsug5QQR8dwxBtp/DAKutNhvFKYYlZy7lq6NZx2FtYSgGY9t5bxJxc84EuVVpIg+vKDMXik8
 L7xPcTZZ1Ez1jkmoZcseO5urV7mVtNXZfuuRrm6xFcY7TigzIqerK5TTCqkX/puSBFZ/jRaiqxP
 FPaOscVfKlzQvTBSzqQlLclifnRRwP8la8sO38RM0XSjtZseGdTG9bv32We3AEnPFRCbN1/FTW4
 Di/3n+M156BFY+8NNJDdxFcXPmyzZSx/8wL5n+T3/hKYRp8fLFd3NCuw+QOjJ5TIWI85mSlz7fE
 Kh38vjPMzbD20VP7kJH5FmpJpWk8E6ZEA+4/Ye1qBMeCBQZIsFRO6AOHZXev3OfqKVDfJmLnCHK
 bWulPKYzy7l98MOsO9LdYxsc4UIWgbP1xeOeAT75Ci6i+P65v6EG3Mwqoy48itCQDACTkd32E/c
 UnmKgF9rG7nNmJvO6Ft7vnLtA1/EgCHI4/QJPtxUZ4cB4wqgqhAfUh/QU1SOIcwFUHr6esEScXG
 /cUFUJ6JBxEF+NVO5o+0TDCsfW+PJOG0qfjaPIwHruKk+OQ1MaNRA5MJvIN42nQ5tjpM62YJKo3
 fTZt8g==
Received: from fli4l.lan.fli4l (p5b3a0509.dip0.t-ipconnect.de [91.58.5.9])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C6F8CA4C579B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 23:10:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44532)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xG0oQ-0000000027y-12qW
 for buildroot@buildroot.org; Sun, 11 Oct 2026 21:10:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 23:10:30 +0200
Message-ID: <20261011211030.2702714-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.2.x,
 6.18.x series
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

Update the latest kernel releases to:
 - 7.2.9 -> 7.2.10
 - 6.18.55 -> 6.18.56

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{6.18.55 => 6.18.56}                 | 0
 linux/{7.2.9 => 7.2.10}                    | 0
 linux/Config.in                            | 4 ++--
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.18.55 => 6.18.56} | 0
 package/linux-headers/{7.2.9 => 7.2.10}    | 0
 package/linux-headers/Config.in.host       | 4 ++--
 7 files changed, 6 insertions(+), 6 deletions(-)
 rename linux/{6.18.55 => 6.18.56} (100%)
 rename linux/{7.2.9 => 7.2.10} (100%)
 rename package/linux-headers/{6.18.55 => 6.18.56} (100%)
 rename package/linux-headers/{7.2.9 => 7.2.10} (100%)

diff --git a/linux/6.18.55 b/linux/6.18.56
similarity index 100%
rename from linux/6.18.55
rename to linux/6.18.56
diff --git a/linux/7.2.9 b/linux/7.2.10
similarity index 100%
rename from linux/7.2.9
rename to linux/7.2.10
diff --git a/linux/Config.in b/linux/Config.in
index 21c93f89a9..95c9c83e07 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -182,8 +182,8 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.9" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "6.18.55" if BR2_LINUX_KERNEL_LATEST_6_18
+	default "7.2.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.56" if BR2_LINUX_KERNEL_LATEST_6_18
 	default "6.12.112" if BR2_LINUX_KERNEL_LATEST_6_12
 	default "6.6.158" if BR2_LINUX_KERNEL_LATEST_6_6
 	default "6.1.189" if BR2_LINUX_KERNEL_LATEST_6_1
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index d2556506e2..3554a93713 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  b4c5dfbe51a364a6c7f03869200f88c8e1f77403539005f14b7fc6bc91b8d8ba  linux-7.2.9.tar.xz
+sha256  2feaa70453e91f541be6a5c9078d8168e081af45a3d9718054850538cff2ebf3  linux-7.2.10.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f410638061a165c12f42ab871d2f3fcd525515359b5faeee80969cff84524df9  linux-6.18.55.tar.xz
+sha256  4633bbda2ab95eaf2a7af4041236451d6759c72e6946265531af4b3aacefbf89  linux-6.18.56.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.18.55 b/package/linux-headers/6.18.56
similarity index 100%
rename from package/linux-headers/6.18.55
rename to package/linux-headers/6.18.56
diff --git a/package/linux-headers/7.2.9 b/package/linux-headers/7.2.10
similarity index 100%
rename from package/linux-headers/7.2.9
rename to package/linux-headers/7.2.10
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3cf2cdd4f4..f21f543f7f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -479,8 +479,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.189"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.158"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.112"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.55"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.9"		if BR2_KERNEL_HEADERS_7_2
+	default "6.18.56"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.10"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

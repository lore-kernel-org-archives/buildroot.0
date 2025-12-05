Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E75D339BF
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 19:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C04D884A83;
	Fri,  5 Dec 2025 19:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3euMASXcF6E4; Fri,  5 Dec 2025 19:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D863384AD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764961251;
	bh=PKcVqcdLjrjsuGXU0A1hF2P7U4uhL0DQAS2oJWlt2DI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s/Vc3MenQOMjHltGv/DJNYhYLzqJrwxcQf5WzOVIG2CpCSMZwaJPYVwIF+axgu75q
	 iiVwsmNxR+g0jZ/RAqHNqIcqEeG4vYYl+tJDT69fqRsvZ5u5r0+A0ZuwPDTXyo0Y2P
	 yDU0v8bSEyHtoNDXqiIxl0rAhLSstAT1zQjudxWnos7MUhNazANeW9aciE7Es76UYz
	 xmvZybT0i5Hv37vofNQwmfsKVFlpEOsld4J17CXtziAWrPYIB113ur5mNFPTMHibIF
	 Xuzj5izk+3bBqObpAnXGtJ+y1o7JBIyPnQ73QduINTW8gqlbub/WtKJuVH9WgfcmWP
	 uG/U+gsSGEaOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D863384AD3;
	Fri,  5 Dec 2025 19:00:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56BB4199
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CEF96E3BE
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qILXcOkCBQc for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 19:00:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B96EE61CF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B96EE61CF5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B96EE61CF5
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:00:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 78204A4C792E
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:00:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33664)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRb2f-000000001Wf-3AMy
 for buildroot@buildroot.org; Fri, 05 Dec 2025 19:00:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  5 Dec 2025 20:00:32 +0100
Message-ID: <20251205190034.1839192-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205190034.1839192-1-bernd@kuhls.net>
References: <20251205190034.1839192-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764961234;
 bh=gYrSpFYtUFMbKHYIK+rADKsBKUTfzJyjwBJxyRSK584=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=vL/07fDH952BaH6dEvpLHLU2hHo5N/PdEXBDXI1HK/IbttSA8dN4G+hXxECKcj9yW
 gh6stziIxRBeL6GOJIhjCxx9mW6seZG5eg6BiDSKrl6F0Lm1K/cj7nheloRFcyrvbC
 06r9HBNwYXU8XqygFK/T7n2N7rbjZhqGHHoY6LNC8+j2XdenMW11Op8l8iYVZdKn+5
 wOxATwZQEHVPeSa6GjKzlyD1qOy/6Bhz0pNfCIxlvOI2M6+5KhIXcWUR3MGRNp7Rfe
 zpwpt9sXhaTU4WuoYqJ57vmk7d8xomYycUS/S66dkTsdGKuyoXGAKj+WMeXXM2rhVT
 ykdpErqUVJdJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vL/07fDH
Subject: [Buildroot] [PATCH/next 2/4] package/matchbox-fakekey: switch to gz
 tarball
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

Switched _SOURCE to .gz, upstream does not provide bz2 tarballs anymore.

No autobuild errors recorded due to previous download error with
matchbox-lib.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/matchbox-fakekey/matchbox-fakekey.hash | 2 +-
 package/matchbox-fakekey/matchbox-fakekey.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/matchbox-fakekey/matchbox-fakekey.hash b/package/matchbox-fakekey/matchbox-fakekey.hash
index 3627b13913..03fcfef6d3 100644
--- a/package/matchbox-fakekey/matchbox-fakekey.hash
+++ b/package/matchbox-fakekey/matchbox-fakekey.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4e2fdc9bc20df469d53885c40e104122140131e06d4c184902070ec0b0f2ca9f  libfakekey-0.3.tar.bz2
+sha256  d282fa6481a5b85f71e36e8bad4cfa938cc8eaac4c42ffa27f9203ac634813f4  libfakekey-0.3.tar.gz
 sha256  3271662131760e9b30dd92495a0ea0b598fc457798cc67948947365299dd607d  src/libfakekey.c
diff --git a/package/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox-fakekey/matchbox-fakekey.mk
index 99921ef8e7..4f32cd9378 100644
--- a/package/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox-fakekey/matchbox-fakekey.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MATCHBOX_FAKEKEY_VERSION = 0.3
-MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.bz2
+MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.gz
 MATCHBOX_FAKEKEY_SITE = \
 	http://git.yoctoproject.org/cgit/cgit.cgi/libfakekey/snapshot
 MATCHBOX_FAKEKEY_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

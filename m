Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CBBC88E65
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 12:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4579E4057A;
	Sun, 13 Sep 2026 12:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpXqypWZZH5K; Sun, 13 Sep 2026 12:35:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1BC5A40523
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789302925;
	b=pIfwBk9GFj7yAyR0Hmng6+APMuYrg+6VNomm7HQ9lmbb5KHoi9fNTjNj91l449SOu+n6
	 8C7LbJx6MN7xo6bxYy2eKU1pb6j6/qJeHV4zB00QGwYWcClkgnSwQsGQ749l5YMO+bxzQ
	 lqJqgKkFuYIbblP4noKaV2P05HUK6wN0LgTx0o6h8Lwq4RYRxedK0P8G6KvrMa7YM+2P+
	 nVnFJBDzu4g6hzML2EeIQ8QjVy4suWGbcrmB9VCmMpRtEjuSDFDk/u35UrPOkd6+dlEur
	 DMNZ+CwT5i1aMYW4QP31OIbAn53al6fU79TRJm5En9Uj6eRQbUl30+4yFV6RxBSSA1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789302925;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Ofj3m7pKK7xN/PXqXJkc4/X03e18205bDve+6WimUco=;
	b=Ptux0S52pPlk+yPFjpuCds6WXMQCxCDKbqm5lGngx6ed317IyEbfk+C8Xoan1UtzSh6u
	 N0iIX1Vzp+w8QTEnCvAZb1bdJ8aPsr/MD8qsygVBPNbIlfj9xt75MfhpwPzK6ckzeUR9C
	 wy5f72VsOTupd4UWSA09Ujp43/suSLDvxAwRShfvTH61Qv+IWOgoH/DwUP0Qn0VT6IGwd
	 P7th1ZYRrJXd4sykPobl+k70qGPH2lwryvPXSZk2WzhdRTu65bQKUCtgF8RpF026gqlzR
	 HCtVUEeo3V0dbWNfdYMik8VQR1ljJQ1eii/+UYkfAwQlz8myXdKPRXLfrSz/pio9lmg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=bnIlW5QQ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789302925;
	bh=Ofj3m7pKK7xN/PXqXJkc4/X03e18205bDve+6WimUco=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i/esd1ufExtK6X8PgNyiRzBAraqNUA2Er/VEOa1ZWUckIS3nKw1KyNcsBX17AN4LP
	 MPZkNHD3Y7yKJQK6/OjMs/WcVmurX0cwZ5XR3V1Uqr2LAdu4JQD7IZx+Kpm0ZMNdtM
	 wvYpwdyTdhvenfTkx+ppjYqcMAh9d9o0YQvTKpVuPqZ+LM1IaM6baDKRRRl6e7Cf3e
	 GvQaD3CpjPiTsuRSmJXehHXDyX93PdjlY4Xq5FZfu8e0fDP5qYqHUvjFrwglS0gcXj
	 XzaFTtGMhmdHXqQsV5EbvHYSrmQRXgPeSdpK5PognPMC184X0GS0+Q7XgWc5aliqTt
	 3FlZ1M3HJv5lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BC5A40523;
	Sun, 13 Sep 2026 12:35:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F9B324D
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65A6E40523
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kt9MgEsjCnw for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 12:35:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A92FF40505
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789302922;
 b=V+UKfhJMuZAXKoPA75VgQs3yQqxkJ2gkImxdnf1kJK6eF77pX5aZrQbZiEka9qCBTWzB
 gIjtfS0uievn1YdmYIpZoXkYIBTHfO6g9XNRyEJu+3lLQ/4G3kAniowu+K6PxCQbjlRmj
 U4PXzzf6VkGOtYv1Elf1PIpVxUBz87mbp0bYRgEkSpFxazydYLGC44IacC0RjwRhc8lXX
 1yV07W8YKUOVVZgBklONfzz2ZBZ60EHAT+5JyHUa3XQjhjDEZHUghpVPe8I+Nmwcnnya/
 3QPQDFHFWZA4RZjtW8YrQpzJStGD/UDfsN1/Vlu4Enl18Nu9/VU1wPVA2zQvsqn/fwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789302922;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=m905ue5f6mfXYv6WmeB1eW16yhM8QqmRPZj61avjkgo=;
 b=MFD0EuefeoI4uvRYQgZnCB9ZbMhGF4CLWW4qiHulaKte8kpBHLKy2M8bu9kf2MsFDEqh
 ypySuZwPnma1NCGQ7PCJ+pETxs1vaFHVjePGjxKrwEMpHb6DVQreL2x4o3CBlGY07SP5e
 HdccSMbRXD2J6Wjy2W0vtSoS4vuwk8P/Dr632ncUxizSzissmDAGgQ/02w3xx3fNechi6
 ZYDDKXdFzF/UCORjdSnsynYsu+ONt9HJE98+lBM0CnAyBoKAd7pbESLcEV/nPNFBMnFtr
 zOQ6qa4ExE85py0pnVapjL7iIFhM0IUW8DIvvQLZOTb1NHDJ3dXXJ8wnKU5h4blvRPQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bnIlW5QQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bnIlW5QQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A92FF40505
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789302903;
 bh=m905ue5f6mfXYv6WmeB1eW16yhM8QqmRPZj61avjkgo=;
 h=From:To:Cc:Subject:Date:From;
 b=bnIlW5QQV0TdqC+NwfGEfghR0QgfAq7dL5qc7/TAEKSyhEA/2HBUr4w/+mDOIzpPJ
 Gj1v2mhxx+S+e8g43bZGoBZvu4IdNZURo1JQN+0Iq/fCxlsNLrmyd0PQXpJgiCkLWQ
 o3gQhwTR0eas6F+jI7abZrvriw3TxZ8fVVkiSiJjpLXx3trypPmQwCi0FAipe7qlZi
 79G/aSK4W5J0NgwhxN3Ei8NX3EPRLe+S4leKZ5SoXjSO3Lus2NEXn5ZQ+Lly5CxZMq
 StxSfGEO9r8LVHAqpvq7z/8mDH+ch15WXDM+CnPX7PN2kqxsGzO3A8UI8NnRj0jhXr
 vaK8dvF7XUyjQ==
Received: from fli4l.lan.fli4l (p54a1b732.dip0.t-ipconnect.de [84.161.183.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EAE6BA4C3435;
 Sun, 13 Sep 2026 14:35:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45812)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x5jQE-000000000Db-2U3G;
 Sun, 13 Sep 2026 12:35:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 14:35:01 +0200
Message-ID: <20260913123502.1315716-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/2] package/asterisk: bump bundled pjsip to 2.17
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

Buildroot commit 7f48325de69ddaed921572edad875694a8154419 bumped the
asterisk package from 22.9.0 to 22.10.1.

This bump includes upstream commit
https://github.com/asterisk/asterisk/commit/5d543ad80ce6ad8a697cbd6c1938565047d26a99
which bumped the bundled pjsip package to 2.17.

To allow offline builds we download the pjsip tarball so we need to keep
the version numbers in sync.

The autobuilders logs show a download process:
https://autobuild.buildroot.net/results/400/400e53158f11926446c11d22681eb8a9430caf1d/build-end.log

checking for embedded pjproject (may have to download)... configuring
[pjproject]  Downloading https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.17/pjproject-2.17.tar.bz2 to
               /home/autobuild/autobuild/instance-3/dl/asterisk/pjproject-2.17.tar.bz2
[pjproject]  Verifying /home/autobuild/autobuild/instance-3/dl/asterisk/pjproject-2.17.tar.bz2

where the tarball was once stored in the configured download directory:

  --with-download-cache=$(ASTERISK_DL_DIR)

to be used during later autobuilder runs.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 35aa1282e8..1bd76ef865 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -2,7 +2,7 @@
 sha256  373c98f4d4a1b923b42def0aee03f4e36aca9d1c244a8eeda646da8a97f89663  asterisk-22.10.1.tar.gz
 
 # Locally computed
-sha256  633c3dc34ffb21af8ac9ee160245c9c174379391e35cace1b6c9f516a260f683  pjproject-2.16.tar.bz2
+sha256  04b2eb1f0f01aa0ad1945b167171843448a51aa6b7c3e806496d434f13a112b7  pjproject-2.17.tar.bz2
 sha256  6775095bcd417d375faddc1f17cdd7706ad8aa9b9b02404990c4b0ee218ee379  libjwt-1.15.3.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index b6b40645ee..8d03f2bdde 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -12,13 +12,13 @@ ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
 # compilation with the external pjsip produces a non-working asterisk, which
 # segfaults. The reason behind this is unclear.
 # https://github.com/asterisk/asterisk/issues/671
-ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.16/
+ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.17/
 ASTERISK_LIBJWT_URL = https://raw.githubusercontent.com/asterisk/third-party/master/libjwt/1.15.3/
 ASTERISK_SOUNDS_BASE_URL = http://downloads.asterisk.org/pub/telephony/sounds/releases
 ASTERISK_EXTRA_DOWNLOADS = \
 	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.6.1.tar.gz \
 	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz \
-	$(ASTERISK_PJSIP_URL)/pjproject-2.16.tar.bz2 \
+	$(ASTERISK_PJSIP_URL)/pjproject-2.17.tar.bz2 \
 	$(ASTERISK_LIBJWT_URL)/libjwt-1.15.3.tar.gz
 
 ASTERISK_LICENSE = GPL-2.0, BSD-3-Clause (SHA1, resample), BSD-4-Clause (db1-ast)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

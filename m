Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423CBC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E4D960860;
	Fri, 18 Sep 2026 18:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIjpsRzw6GJZ; Fri, 18 Sep 2026 18:47:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1292E60E07
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757257;
	b=anCPB52/lvs4T9sLdYZq3GuKE1YHik+KtEeylPoVY06Q9JdjoYBxF0wl/IKgT96sh9V6
	 d8+Emrf1P/O0BTB7ZwRg+BQEOxSU3xNmcWfv2elC/r0WjTxLfvWivNZ/L/KLQhBsN1vr5
	 2j5MbIZMVIKP5L+k362N84yOsacw2MOWBbkLeB68RGdFuV0N09OOZP2W7WCJNYoXeQWva
	 qcziXYkexaLzHNC54JEnB2pFQV7CoOkTuh1S0qZdRo4EmbpsYf4CEwAjX7S9JLiagzwSI
	 ZIhjcP+ieq2SsEr8BHQuWC0d4Dif9B3ySudwYa/KUsuEze2DqUyePLx79HrN6l7XGfA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757257;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ofj3m7pKK7xN/PXqXJkc4/X03e18205bDve+6WimUco=;
	b=VeRPeA0f5gmKkb35SLDufWBabm9z8tdS7L+ZFMlahnPF20u0GKxUqKb6DyGi+XkM9Fh7
	 8T4hBFw4HWp3DMlGah0zrlp4LcKFwThIMJCGAbizAF8FQy8aztXNRd0u2VFN6st/uO2oY
	 x6+dZSK2yd3/1I5JRVgNGQmRJ5vGJNi6yl8hsKNBzcWA010vM7Px1pk7jsFK32w9S8X4s
	 MEex0E/Gjj/+tIYIcjlezoKKepZn9GZRqB7QgKp/SLvLL1EF0hG7pGtY0xu60M70D0ubI
	 lKwVmZrB5NrLpVjdp8q7wQeIwVDNX7PjHObPR6mKU0tOJ+jdijrDEqYFeS7m59BArFw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757257;
	bh=Ofj3m7pKK7xN/PXqXJkc4/X03e18205bDve+6WimUco=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GQATtYnXMl2IG9qGhLYw0PZ4U0qF5wtZluY4ZobXqV6PM3BlGVVgNB65b9XxUaqsH
	 SAP4/dgOIKhHZc8uWolpRJp8RCVvtlt32efccAFGCRnZJPIhqoiHHV3hebWzek10Zn
	 q6NVjOBh1xycUp6TPrjJmNmsEEa6gMbN/Y76BEIJ/xsDqMTTtxSk0KNYFdvrehZawo
	 ERk2kMiS3NeJJegBy9pHLgz7OGMvq/VXwLHjUpehN509BKnlqpzXNQ8qgSCt/qLhf9
	 9UK4s8DmQ+AqHb8EktMzGdC9Jv+2BRPH/GWktDfcAldyZTVvR+Hj8Z48w5aqzDQL4B
	 lpgbAPtDwDNYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1292E60E07;
	Fri, 18 Sep 2026 18:47:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A02F0237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8640040B79
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C12YNQVmk7Pe for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:47:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8513340AB8
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757254;
 b=m2MOU6J6p/IcKbt7+GTqy/mGEz+UZe+w4dZ0VSdO5b4GOusHG2kLm4VsC/ovWsI0M3oz
 mwFbwbhl95Ab6o/+moJqTZtSXzRxLmcbsNnX22c/gZjNd4jJgXI00IgZjU/o5gAob0N3m
 gD4SNGOCwd5NVJFMW8xyKAZTzykk/jfsWajK5ptw30FldsWR8io1Lk24hyAKxca7npGJc
 g6uyxcr1laHk05lHsOsyuGLBqjYl9FqDnNoQUNkyHYGkCB0NGAPfXRTfwk0ZsfcVk5W2f
 UMo5E56gC394peevgZ5LlCChNi4ApNslHKBkZa4OhaUKyd6MT8GvmEXUPSHcKgzjCXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757254;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=m905ue5f6mfXYv6WmeB1eW16yhM8QqmRPZj61avjkgo=;
 b=fEAh1nCvk6ikFt+5JoNXmGAXXLvNF9xj4XeWtQqAMNVdWAxHks4uAf4+PxMOBcITt7xI
 goPY9JTzZDkDS6+YJkoOz0+eS2wpiKzVmpdMGwwvzB9waSghZRTKIrrsu4jQwrEs4ovGh
 3zcvtI+T3igITmufU45layZZEYhzsmocmzYCiViKOWwNboS7VolyZD5apL79ZOt7DAKvR
 BZrx5UnKk+7MNPCdAVtxv80wbyX6kcd0eS33/wPwN6v5rWkUBx8TSkBhVmM+2VIXUh21n
 37XnieMugXdpgsuMRZIlfiX6XYtRk0x4wfb3nArvKBXLO3ylJIFYxJvL7R3ZslSbRFQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="WMnGv+/1"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=WMnGv+/1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8513340AB8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756928;
 bh=m905ue5f6mfXYv6WmeB1eW16yhM8QqmRPZj61avjkgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WMnGv+/1eFzl0y8MpxFhD4LZzso3rMfrnEieMd0mg4wJOTFjMTbD0Mmo9wKh6nax9
 aFD/CA4kfnSamqlBjMPPyph7wUzqSOhrbF1i6S0zGvky+/DNtGiWaO3jmz+Kifsifr
 QqhUYY9WsjZhGRX4+l3Z8gPUNNqZpz7NNIHBQgYFNxTyCDdLNJkPFfomYj2CxXNHdA
 gdWsq0FX0upNUgP80wqS3/5p8khYibcKEOy7ZLkQlksI/N9aaHdNRmYU+Bx1IKFhvh
 lFUYUkW0lWO3W081NghpovYpGcCmoJxCESGqlgxCZwDrE0v1U38NBtWysl/x3BYxwf
 zEgW6j+N6t8qQ==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:c8hNRgb0sHZwPI8JWRJgW+1u2bcR2ZMNIITccT6HQR3Wg41tkHSbLR0xme75Xvl0cyK4CHl7hT7JwG1+rz9WJgTbBy0i0CQpZYgbtF3gtwhtLmGB/6KqZd5OjLi/u890QiI9ikT2e4n0AhUvk/bzEKHE4weZz1fZ2/y/35Dy0jS1HvPVrmX3OQ2rgivNVk8LoqVFtE9tzEjOHaeQY3Q0LAgtMb7iLBwkp+vzmT9e2cRswAkOTdgZzKMbAhCSTJS5cc64xoQmO5DxCpKhduRrdO2k+y7A714e6gDTpTNtbbvPwRdHCR2wyOVbdu3NIh5OOBt0KaNfJNP35BTwjFYrHd4WsS0T8ba02kccf8dr7zkQl+dM350mP1dvIhOzUroS1hROygQz8veTy9GTAVKStBfoFxjCq71Gz+hGegMaP6WRY37h9REUCXnD7KMH3CIyGuVjmVuCQABWXxkmm2VokFw3ww86oDamtS1mffvFu5qma80sLyx0af2P2fWwMX4B2A7ctkazu0ln6PIGLKqNeGfI8FeOFv2BbVTfcz+OX/ky/i4c7ZgZ5qR9Cm7kYZz9vkv3AMN/JUvx74Drp4/kxpKROglUSsH9y2cHC/ggNYBObF
 /RFilbm7pSyjaTBhDqpnz3kSc4awrSL2whlkbMTuGK3bZ7h0Slmxi1Gqhh61QTex24a4nLHcFX3El5t8Dbh4Adth7vUSpl+h9RTUPGKgsqCrNNalf7
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4DF88A4C471B;
 Fri, 18 Sep 2026 20:42:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWs-000000007cB-0H64;
 Fri, 18 Sep 2026 18:41:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:39 +0200
Message-ID: <20260918184140.3631274-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 17/77] package/asterisk: bump bundled pjsip to
 2.17
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

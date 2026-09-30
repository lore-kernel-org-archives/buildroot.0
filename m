Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38807CA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3A2860873;
	Thu,  1 Oct 2026 14:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6oDtNviYjgL; Thu,  1 Oct 2026 14:23:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5B15E60E10
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864629;
	b=g4kQ7YHZhZcXNmba4YYhsmUxqvsxYFVounakiPncu6Iqv95J00Yk8jylNFLzs/xS6jB6
	 hffSQRtLdY7i0mjkRJ9cgAtnNff7BlgKQ+50GIevn513CSYP1pfOGKqGAnukWXgv01O3d
	 aXqVYrX7fhWDW9rtvWnQkzhPg+cD/2WLfafAAz1LfxcY5fMYjUUDLg4UP35xzoRENpV3/
	 quqP1q4XIB8LIfaIcxWu6VgU30DumIWGgxSbV1pfM1PGA2A8l6R/mWAYO2Ig97TlshlZP
	 preRU9VpjkJuOwBeoQb4vKccpfAxDY6C5JJIWW6lqMHZtBE/r+W0Rs/U1ky01KKtEpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864629;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=5l4HPGJFb6BooUhqK/hlsdHS5gfbg8b9ttY+sWjscQU=;
	b=RX/cUZX9krshSH+m/FprOajxpvaVnmMajJ0LrrozU1evb57I6WoiFoSt0u+Ae27yb39Z
	 8PxwB/hTu3ZxLyaCmKU/iA7nDyB62JDtOxuuEijHvIjBifPKTtLBopgPqQEZ1zIUzjdvi
	 NxaQrjldXLm31WfGq+IXP1ID/TAQT6/cadrjLLWVhnv+GUo6i/6XoBLbXw7f2K/yEcXaH
	 MDzEhNlQyafaYmbi371SkLKGKIMb3EZHf2cPDzupP44eJL4bflAYQ48Xa8oiSKmIA6AH8
	 QgqprT59/VO1R8H+pHsZ1VyhTmaBNRmidUCm4ygx7AlE/BBtya3/4cRjrBFSdYZ+q8w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864629;
	bh=5l4HPGJFb6BooUhqK/hlsdHS5gfbg8b9ttY+sWjscQU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nBX0eo0EBqeMa0ksjA45SopgBnID0OF2S7Wi465q9/hH8SKUN6C/CCyD4nYxDucA6
	 3yAB+K0C3RPKoUJqvUwkHZkytSygY2LNDJWdyIRPWY1dNidsIjopZwyocnCfa98974
	 BRy+sdpBbN8hZYZgK8wsqm30MTlazyV+vOrLZSvV8EOjmJEkGnLT1kSAkOgv0GONES
	 j5T2IrCLQxSZwVOYNuZQGKKQr2mm+TxW6/OxetjD+IOIUaktcbUNTfPvXpIp+91kLL
	 dfbUlJ5ZLe7xn9PUTlEbnBigTY3oUFZ4342UcMRSgBI9pDIa+ZaZQ0a+VvdP5ujJ9k
	 le4eTc67+wE2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B15E60E10;
	Thu,  1 Oct 2026 14:23:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1273732A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12FF9606CA
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mVdq3XSo0rIW for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4EA26607F2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864563;
 b=qcC+hXMT8gFViEI0truzlWnTEuLX9HkzyWJfEB1Q/JFIbm6HyGSngvuVwWXfVcdyDz3/
 PDBwqQJQlwVdll9g51wkHLmTQtcJpQyI/cYzQSoPM61qgZj0M4GBtHlUAg56qdgt8/mr6
 +o/uYApO1bA4m0dp5nuosnWI1CA6ANdS/x0V3Tw6Q4AR73HCY1FIb8ujf8VA9Fsd1fSRm
 3kbbvoGs2IPzKYiSsO3LXfz9zHjN88b3zmr0U4sNS5uoIcHUuD9ZqYbJHqThB62S9+37n
 LJfzPrZcqrr8oWYxz8MgKO5FRTB91xxTyEVqILpiFsypcP1X8rNzoLO7EBun18Zrqhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864563;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rFeq0nYZXcV1B4TDZC/GPioiwwVIXABx08LMY6B1QIQ=;
 b=T9eGOvzRYDXSlapoiItATeYScU/Ncp+49qFbBmSSBYXgCl8BNKWoYpmQhdih5FR63ARW
 kmyZGzyLGlFIeG+KX0dtwx/INnD45MYY5ovyg0kMNt5dsCdF6vZINgijQW1dXDxX3GiaT
 nNrcBexLqD2qaeylFQnaD5QqD4n4zbwXJkQ7IlCBESYicYnOoclZEqqPzSGvKaiyFoNGB
 lmAC4jXgUgioXhmGEfWdTVgCPaLwgKtnn917UZMcSHjyP8nkr+N2rZQyAvbIwWZisq6dS
 8CBLyM2DlotvaajJ7YY4to0pIy21enlB7id7DenKEeOchG90FBaN/TK7awH2BnhI9Tg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EA26607F2
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96F7C9843B; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:30:08 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 6b94ee9448d32137d1719352286c04c3b1fa415b
X-Git-Newrev: ec1365f66b1b85752461beb29dd439369e9bfd79
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.96F7C9843B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/asterisk: bump
 bundled pjsip to 2.17
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0754185873600200188=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0754185873600200188==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ec1365f66b1b85752461beb29dd439369e9bfd79
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

Fixes: 7f48325de69ddaed921572edad875694a8154419 ("package/asterisk: security bump to 22.10.1")
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Thomas: add comment in .mk file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 96a2337bd4c48cda53ba9273e9531d7eb691c8f4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

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
index b6b40645ee..1ea335412d 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+# When bumping asterisk's version, verify that the versions of pjsip,
+# libjwt and sounds below are still matching.
 ASTERISK_VERSION = 22.10.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
@@ -12,13 +14,13 @@ ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
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

--===============0754185873600200188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0754185873600200188==--

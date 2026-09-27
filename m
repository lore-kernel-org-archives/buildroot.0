Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491CEC9833E
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 07:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6EDA6061E;
	Mon, 28 Sep 2026 07:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TcJlEl7otmXz; Mon, 28 Sep 2026 07:51:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E8C416064E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790581878;
	b=AIGl2/bVy+RAMdy8e+gH3GPB4wPgJK25qU3d5m1ZRNrSnS05M8JMsZU0eG67ScukQ9oN
	 j8I8eYDPqtlBfsJQ7VuxHSSc3S9r7ykCIAhlKBNk995cpmy6tQoGUjdSKi6utIqRLGrin
	 zIv7/dmyYCZRZg5eqAr/TmeBpFouItJNBIUjbDLmBDG/t0vkRpGrJs7gKymPYh9cto0Jd
	 y7mLtQXDZkAk/aLTcANMFk3JpdVtDa8NPtkQ5EVeF5ceAIDIhLGrSk3rjvj8od5b9T78x
	 2qY2W0g1s7SktQI8MenMysa6506UtduWOW4Muv97KAetN4J4RKtnc0PBVkXyquTV3oQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790581878;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=68lCjurp1LRk7g+nGDqhInsq4XKtcux4z4yybXX0VTw=;
	b=ZoTe2SupGov8tBGPnzo8ipcjoGw/tsbUntFMAetHOhf07NtXNO2LDUE4bdwM2+HMzh5l
	 vrocBGOfu4nPvt7QiyNVaXakFlVfqmy/GsVb/2ojSW/berEA8kt8v2sAGNM8pxf0e7Kz6
	 rDYQimhE7Jxy2SP1MadJeQ/0bpuz+xQBUhBvDgqO19pqA3EuvJ5Ro7dmztm1a0+6tdB07
	 jmcT2SZhChfyi/IKdEAYZhdNomheIrXzf2A6Mkgb4T86fwcywnvL1MvrkIDdFr/VSXY2M
	 D0CiZYzYuoe4XQX2FEBFr44L9dKuPARMddbYBHLhEBLZY6Y0/3EGk1JxjRl/O7YmU/w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790581878;
	bh=68lCjurp1LRk7g+nGDqhInsq4XKtcux4z4yybXX0VTw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KYmHUOpWZjQSlmR82IrM3h7MsO0fcLIIqD2OOTzKbvXcIC4LWGpLTmTFhXGvz1tNy
	 iztFUJqKOeOh0mgPWZB62abXAIjhmkf3s6jsnBnT1v/WMHuqNlv4qDymUsqsnRJqor
	 pZMgc4ha1G5A90sM2nPyQgtnXwzkARDeylN2hsFqF5lP9K8+15OePaZza33SUyrlVi
	 foYL5HQk+ZCmuW+VAQZfT3BFkccj/Wcv6SzBS8oGDF7wjJ+htk0PKflfNyo6ctgKFb
	 BpvuRCNWHhYeIhdUcMGds8WWl1qYd0WOWIZ7J1XXHzRwzrK4qpvFIMNYkVt5ka6oDJ
	 iVnFY9Hbysxng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8C416064E;
	Mon, 28 Sep 2026 07:51:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1E3D72
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C931880DB2
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7xlwt_G1sRS for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 07:51:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 05EAC80D5A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790581876;
 b=PL7viH/EztQbWPsHhoAmvAxk5M7JPEwVA46cymEAfssp9xjO6nQI1/GxEGTX5hpu5NOa
 uNTOD9Nx2/BU0uKkjxFM4aPZII8Xp0uKG9in8WtFO6YxFeOAMMgYfd1XP/EcPj36s08QZ
 jWbVzNc1RX5FsU4KQGh8UfJOy0gxlzKK+CGKBWCw+YUmq3wN4ZlqyzmgnzH8qD+8cBKz0
 WXHOFk2QKgKkudlo852UScSjgQTXK56xmqgT/YdvUNc7hioCIDHIex+hKDBLYHVH7dfUU
 XLeX4D1VcYUoc3qDKXCpSc9K8qUE7EB1QKGz4BdjQONyEilOUnAka5BJ1iNVoqEToUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790581876;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dFieZaQaJwwfD3YLTzHJyG79axtKemAn5uVokeCubdc=;
 b=UToJK0U8yFDE/hHP1WMMo5HLFoop0tXHtjwUh/rBnKUCRcIYIFjoLMh+PtF+hikfkRsF
 QsZz8YPYstrXsrD2aKZ/U0qpWDt4fKoQ55uC/K58l8UYhi2x7RQkucAF4/nZe0Yq55Oyd
 omarvlmhNFQ6JpGcZquTL239788uvSwkxhpWz5hw7mCa3uAaduBozZWekq+v6gNG/m350
 chooeraTcIIVjuiITLXYenJYirq+CWHha1RKr5/EDU54O0oB7FKyngu2tFyihtkUgpKJL
 JmpEEpvLm/umloyP71iBpkgl8rhXtq5LOgESyWb9HKedEVfl4NXj8eBeborShHvBtZA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05EAC80D5A
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:51:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D09F095C83; Mon, 28 Sep 2026 07:50:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 18:55:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea9d29a8afd6026b2aa042526387f084eb00f359
X-Git-Newrev: 96a2337bd4c48cda53ba9273e9531d7eb691c8f4
X-Patchwork-Hint: ignore
Message-Id: <20260928075003.D09F095C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/asterisk: bump bundled pjsip to
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/96a2337bd4c48cda53ba9273e9531d7eb691c8f4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

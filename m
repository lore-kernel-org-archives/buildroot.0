Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D19CA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03CD660DC9;
	Thu,  1 Oct 2026 14:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5kq7mXyUg5Q; Thu,  1 Oct 2026 14:23:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C301A60DC0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864597;
	b=Z7etvvtTAK3QMUJSoYOAHem7PQfgvkBv7PZal+E14/bjU+PA56Gc37mvC8VNu+P6/dvt
	 i/G+av0+aJwMgAya6FQIHXZz/8Q2Xgsz3d27y6rznkR85TzbUjK0cSR66UgT35+IUk1BV
	 6kCmkax2R7fGpxM1g08sDSzuHWN3tSFI40I/zImOOZfdA/RZQt8rN3jhfguGKgbz0bHMV
	 oHZM7t25o+sxDUmdb6aKHDIORh4M+SzzXFhJ0RP8FGaqPb73L6SrHU9LEiBbhqiCrst8k
	 qIc1ZRiYoudFBjm2cywf7tZGWkRKPE+8iLiTlNOMOJFbiXeN28jD98xUZuP7xO1W7qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864597;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=vS4o5W6LuR3stu83g1/AdKqTCHVEjECfnUpzW8e55Bs=;
	b=LDwAzEgfcaNUm8Nj3aWOwgsuPTOIofgowFtE1rDj1W2nBqN++hlOyFnuBmtHQrHGiqmX
	 KsSIUFQC9coLZiVeUNkdV85iyM6YenZyp43trYYJFZrwlGCKTzpzq6akhCa4Sp/eLi4Hx
	 v9gJXBp4ZDi1QsQCjDYraPl+C5ttAKvtxpwTGQzUzdhN72fX/J22KWUnHRJ8q6oZALlG+
	 8Q6pyY2ZZcxGhvw9cOrWPV6fcTrbpZo73hqGb3S+u4HwozJUEYlf4az3cetFCqLyBs/7s
	 s7RTNnfM3Q64v/saeZRlfhU21NT/jJAgaha7OYsyZ/rH+/hxzrRk8n9jfyLe86MbbCQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864597;
	bh=vS4o5W6LuR3stu83g1/AdKqTCHVEjECfnUpzW8e55Bs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mtgUZzP6WnjDxvV7KZa/y34T8LTG6pPbZo7t4RLlRxcJh6rpqXx46JsCNGLXtjNi4
	 /6Q/iK73ibiapYLHKBioAjS+aIL4Ihtfu/RiAmMrR+rRDQKZFi6li1ODp7HgB1Gtq6
	 kEYxrWl3Al/Ya9XFuJyTRLZ+OgVMuQhsI/a8FQsG+7SF2iqCUTGLcpQ1yHAmYNmSDT
	 HJOXJqH/E8bG/87tDxxojcp/DMEuwqonHHDbxqLKwpEaGw/if0cmTa7vI1VvjQ8Bdr
	 emu4N1hgCO0/tASH/g7YILOET/7PoKYpvXIYe+9shvFs8TwB2gVtt6+x2GlDWXnOQn
	 KHK05dMOtmOcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C301A60DC0;
	Thu,  1 Oct 2026 14:23:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F3EF263
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83EAC80E57
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JD7inLnn6F0r for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 63CA080F06
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864561;
 b=XpWYkqHNUxtb+MSJO+78MBVylFw48uqYPm1THiDw20ttOgIW/oW9ehaHA1uXSwvVtx0C
 nBd8vM0BeJ2wEsmzsot2yNRIuSwcK7082ykJlh4agNCyYZ3hOgwpiePVG7DlBJNgPvw+K
 Kk/JnbJHHr492jXWpMOMgyWKxa5w5+JY9O8hn/+H/RgRyXGJA+KcGCFBo9Z9ktKAakvAs
 kFM09K3s5z+/o6uhiq6NNi0UPS6E5pB2JCkWHc10qAgEanLqbwCD766FTfVhJRD5cIuSL
 vJ/iNkq+Dft/4lyHY0UHRgfpEWd1o7WnjNaCeXxxVaw1iHIx+Zjq4fc5zAE9NF0ngbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864561;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0BN+usEHFAWYSMWjnH7Obb/YRhZqHrMjDi++lvypXUg=;
 b=r4vUduZE+7NVhI+Lu+2hj0qcS3hiMOxQJq2dMgB1VHrlJvFEyCFWtXmiJcF0tjgth59T
 4aPdIw2fgzsIRreYrHFtpCmPG/s5QzXRGY9DAbfkKubfdlvynhIHaB3/YPyQ8RiDwEuTB
 FDVqxN5ysLXKTh1r25k3FIjJ0xaZSRZJBXLk9nAnKT5A3UbPTT8UeNjHMVCi3/gaJCTOc
 fEaSJ6nMFYiRmnDJkd2o0F/wer2AgNyjbRRuaa8Mry360j0VVUhzcWbzNOIcK0Meer4nG
 fF/rlOh+KgM7k07rS7Wla//Z1/+EcGwd9mjYrqSqgxjdIZ+0JYAuRiACC5MTFCGPhfQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63CA080F06
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FCE798461; Thu,  1 Oct 2026 14:21:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:30:06 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: aaa29d6171c2ab245beb783941032a52b7a8b226
X-Git-Newrev: cc894f92f24d3ae714ae209e779da158ed5da5b5
X-Patchwork-Hint: ignore
Message-Id: <20261001142127.9FCE798461@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/asterisk: bump
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
Content-Type: multipart/mixed; boundary="===============5900139675520579849=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5900139675520579849==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cc894f92f24d3ae714ae209e779da158ed5da5b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============5900139675520579849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5900139675520579849==--

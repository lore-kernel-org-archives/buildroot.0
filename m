Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8F3CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A73DE60670;
	Sat, 10 Oct 2026 09:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lm2hPLXJ6ot; Sat, 10 Oct 2026 09:22:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 59538608DE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624130;
	b=HMYu1j23bVvs85rOngiR/pvF/zyGWCBk+PeTfhX7FSIT03xEVipHVAj/UdCD7Diy6J2L
	 OQBf0QBP1Ojvvl1pcgugvE8jkurzRfhB3642swDWlr1UtTZAvApEVfvUn2BpHZwCeQ8Xp
	 MnhXpzFA/H1iZHIESedJBXVf9ZWW+GyUoOammnr0EC9garL7vxiFgmCNAtbysbflyZjIE
	 pps36zYxverUNfvvBpPQpEnRWBOhAC2VF5ygRxFj115+FfZrXL5YmGkg75Q+3k8q/UUZW
	 A2ZM43qXKUF6ilwRDsEGPCWbxX2A8RYLNofhe8dB7Vv8DnWZHmULenzlijsGkrgHnhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624130;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=HriEUtsm/Fm0bljVBettzjcCE/kVB4gaUcLpivuCa8g=;
	b=iFFMbanxVDioACqieacUrfEYAtlBuucnxmAJyvsi0Iq60kngZfRXTmH8V+UZhJO83VeN
	 +iz0lUnb9PzixZyFX2QcFjO4+Ra78CxYHw2lsL0SeDJX8XVYAo6rXVkOClougDQ6bQt1M
	 Xx+porLcl1+zhbEin/XXirSmnRbaswCo2VttexWXioez6Zj3YjCS9sTDQopMeJpP4sWZ+
	 tW3kXem+qJXmOkxiKLGE4Mxi0RzksRR0+8VQkeZHviS/wLvxlecHQX/II6nkqVNw9cwjb
	 3KUJFAWAV+Ge0T/DW+Ir4ZNt+XvEqSZU3op32KZ/7jBxlmVRsrHj42wQASAeiE5pacg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624130;
	bh=HriEUtsm/Fm0bljVBettzjcCE/kVB4gaUcLpivuCa8g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hitnpSsiH5qtvoXKeq+VZDU0j0ce6DYcegltnCwWhF77W43fGI2nxH7FoPQ1Kuu5s
	 s4QjqVIF95w7xW9xxcVSMjzkMrD+l74x3y+WKmFUjiKlq+osxuKJSIWPTO1rPt04UA
	 qtlQXYwcju2q5gpla7eBX71iI8ptvCexUv1k+dr8swqIzv9Qu13E6OzMvrn3jddCmS
	 BvsWFJEzZ/j9rgjbL1CYONJzXJgacMVQbjgs4kFwQ7RZGQbgXUQan0zQgBLWgspskw
	 dg1waay1auMhAD+RgdF4dJWgrYLTGsna8ucq2VFKEtXG8ta+UEjoprGSSzSjXLX5N1
	 JwvWPxcmaPAJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59538608DE;
	Sat, 10 Oct 2026 09:22:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71BF4E11
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 532AF608C9
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnJ3LOjYQ_Qr for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F097C6067C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=rcsCyyAW5KcJ6kOVcEcE+mQM1L+tOTuAI56ItS68w4fAGiG/+6Azc61QLmfgyIQ5BAxP
 9KD7UbYR+ZR7Q2ptxFS65bTn9J7ltFmzSOA+yZ6ILQtpUHoT4xqhl60xbg7680uIRVGjw
 uRZ5Syb1HJVrzO6qMYzW3QDF34VUa7NUvXQb1IioVVkW+yY2hmsjXbeC7+nyoLvsitFXZ
 0QK46q+nasjPVeWv5OLZvGuCAkgKJskaziRgUlHmRvSoNoyCds/drcLFYbEAkG73Gg95O
 +Vekb0qLxMBEABYh9y0UpjlSurkCl/gwfgRhOEk7LCDQ2IkB1vANrA39Kb/sNhLcyjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Kjl2kZSgb75pQChBY7wraOXx0k00gKg882E9eFaf6io=;
 b=izDTSLHjxZT780/m2DVcQcA2sdpa03QcdjWqct2xe8fENXKqyXMky2LxWxF2bkmSoUSE
 ItD/xyzVVFXtJBvJMiWEFD3NGGdou/oZxulbykwjfZtXAWE8b5l5hFbKkkduz8QXPB8BM
 mmpeBEpBld8+6FdCwpYer9ymXlSdcL+g74ukAOEXEJvgDBz+qJ0p8ZzGXPSJRDrCib3OH
 uOX8q8vA9euo9tppqufU6rGMIoFpC+sDYH1q3WkchP6cvHBtb15QPxRhxJRfQGA00t/bL
 WeR6zTFkPWNJCk46bEK5KXpsTi+TTkpI/GemcpoSHoUDBuiNacYzP2aJi81Z1pmN+Aw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F097C6067C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA9CD8F065; Sat, 10 Oct 2026 09:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:05:08 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 902f6c9f37e47c67d89040abc702e52e18f7458c
X-Git-Newrev: 4f0b66e7d7de9e3553e42e778cdcba8ca5b640c3
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.DA9CD8F065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/ca-certificates:
 Replace c_rehash with openssl rehash
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
Content-Type: multipart/mixed; boundary="===============6540148337812752174=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6540148337812752174==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f0b66e7d7de9e3553e42e778cdcba8ca5b640c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The upcoming bump of libopenssl to 4.0.2 removes the c_rehash script:

https://openssl-library.org/post/2026-04-14-openssl-40-final-release/
https://github.com/openssl/openssl/blob/openssl-4.0.2/CHANGES.md#openssl-40

"* Removed `c_rehash` script tool.  Use `openssl rehash` instead."

Note that c_rehash was already described as obsolete in the release
notes for OpenSSL 3.0.2 and 3.0.3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Martin Bark <martin@barkynet.com>
[Fiona: add note about how long c_rehash has been considered obsolete]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 97e7c6d82fadd52e88ea9db8f19f714a627cd942)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/ca-certificates/ca-certificates.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index f5675b754d..0f88df3eec 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -36,7 +36,7 @@ define CA_CERTIFICATES_GEN_BUNDLE
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(TARGET_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
@@ -65,7 +65,7 @@ define HOST_CA_CERTIFICATES_INSTALL_CMDS
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(HOST_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(HOST_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \

--===============6540148337812752174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6540148337812752174==--

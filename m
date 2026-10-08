Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1900CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B87CA4095A;
	Sat, 10 Oct 2026 09:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21M-rhuPwuB2; Sat, 10 Oct 2026 09:21:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D590C4094B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624097;
	b=V+n+3hmbxwcwpO1FnEMp5rzHbnTZAtJs/LaFek39e8oVghvz36pytwXR1zRsYJu+6vYb
	 5CV/CRKW7GbiCHCeeYpESP+K+0T4g/HlBdNMivOhFuQHBR+1LwH5ZnU0yUAaTRnkyv7lt
	 ktDgmIuNK3X0MLPCExPyMUFwwJWRAjTemqGcp+UsVTNDTIexPKkEL7/9Zwj0JkLVhKW2Z
	 qDefXBw6qVOFjGgYvFdyRu72JkDL36ZSeWxkocfXkxdWifZxXcgbDyWsBCBtSerfQv1N0
	 cNC8P6DNy67Zk+Rew1Pyjs3TJALapsKfGYwTkvBzNblEWVhgjfLoWQo4HKBMVEpXlRg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624097;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=FYzDB7zDTy1IWzIgW/rLixM8nGY+mDHhRxIoG5SDiKg=;
	b=AeeSufLJgMcUT8ZADaocjKq4yuWmQGhuO/35OThRJsr47A5qO3/ncg/CSkAoe39/tTal
	 GqsDnao7dn6w8ZZ4viuCmbES69D1iRCZh/SKrNj6bqwtbKZCwhtzfXVo5F1KTOrMxV9Xe
	 kEVMU7kc2tfQAXEG1FpsjeyRGY7ZQo4f4Zy+rl28QJ/Cjd3epUuMIq+2hrAzhwzjQosQI
	 pfQZO14H+keb39+p1wxXVxVJP+EBPjQ2RwfFp8Rd3n51jgO/LMPkUqpbhzbFjtx0wPOT9
	 BgDWJG6/GMYScQWWfu277xMZ5Hp0G2eMDLqe+889nK8h5xFPfIIKlJuSWIcDQoVgNHw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624096;
	bh=FYzDB7zDTy1IWzIgW/rLixM8nGY+mDHhRxIoG5SDiKg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UYRxjKrSiyQZvcKRoSlQ7Wy7xMh2XROdEVrzWFf870JEPrPRozz4i/2ySm9qqH0vR
	 UGGeObRic6hEs4Btk5rdlcCI9W4e1rGFJgJNQExZAd5w+Im9zqUsTyuUdCAPv9rmeZ
	 EBJRKgRr39RkWYvn0zR9CIvnINqljrEbdG7u0lHI6yb6ezHEJmaf/e1SpezTCGXo1Z
	 ILxzjxasBCSWVFNSRTMdfK9K9kubYUL0haVhF/XncwUX9aCoF5mQzH5UtO5xBHzCka
	 Ejf/vMj0qNbBVYhbUcrD5D8biyYjkVYU1dcWScquvwnlVp/ZyRmHPo3aWdYcAU5HsQ
	 QjzH/EhV/FTPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D590C4094B;
	Sat, 10 Oct 2026 09:21:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77553DE1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64C87608C3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCYbqM80qs1z for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7D97B6066C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624086;
 b=UZGHOXWWVNnYPhdLoeuMGpSNGnSzHzGEYOg6jNKq4n1jfhpPWU0zJSURmo7BgzrlWSGS
 qA/GTlc4rqH24UnBGCEroUb3Mj0Sd2Gq7zsTNeIxr7WydRiUwtc+v4gcNFYi3B7PBLyX8
 4aZii1t5eeQf1Vntz5JPncsbHQygUvwMZCQkkMo60eGdrZqLkG3HrJSAlCDLGQCBAeejd
 DnfYSQo17G7DAbcEceKueW7rmrWZ6FN7rl10DnXPA4HMbPRxQ4F6g4K1ZJZ8qN7NuS0ut
 c1mkhyVIAA3QM9/n5snCiIL7sxQuNoC/VjBnlQC+EZvbIYJM43xCoY6148gaRZb2KJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624086;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NkeJW1t2aZW/eR/nTMbgIPOTwc8kZSex8lbYxY2j+PA=;
 b=RbDH1YeNbEzajdA5xPIroQlCbocNwYHVGxGtri1losUx6mVT1CocPV9RflGMDec4U71Z
 0h0Y4MYCpQMY3WvHJssmbpDkTxZGkNopsymyIuA4SIillQ3qSD4QQGpX/FrGShqm5iuKV
 oLS9oCCDBGl63nCg9LetoqeMds3xkoPwQ2PwqpxWCXu7cKKEoV9pHbeoQU+DC3E4281rW
 EEm2W4KO3U/3lAqb6ORRfEBmJtTIJgrJMSema0NkNMUfEGpafEfCjbo4vobK9AxdlxcrR
 3BtU7KHtmM6yAaUIBUAipNpQiGacrGqvkaD79AwU6vLKQ8JhmsixJ2HsHWXEirPC2xA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D97B6066C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6791D8F065; Sat, 10 Oct 2026 09:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:50:25 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 319bbad24c5c369dc85bccc24330536befb9eb93
X-Git-Newrev: 5b418e0645ea26dfa031f70a06d39c2cb0af4216
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.6791D8F065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libopenssl:
 security bump to version 3.6.5
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
Content-Type: multipart/mixed; boundary="===============6412148297635059019=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6412148297635059019==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b418e0645ea26dfa031f70a06d39c2cb0af4216
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/openssl/openssl/releases/tag/openssl-3.6.5

This release incorporates the following bug fixes and mitigations:

Fixed DTLS retransmissions of handshake messages from a stale buffer offset.
(CVE-2026-84782)

Fixed excessive memory allocation in relative CRLDP processing.
(CVE-2026-35189)

Fixed QUIC unvalidated amplification credit may be over-accounted.
(CVE-2026-35191)

Fixed potential CPU DoS via O(n^2) fragment reassembly in QUIC.
(CVE-2026-42772)

Fixed a timing side-channel in scalar multiplication for mon-NIST EC curves.
(CVE-2026-54872)

Fixed QUIC STREAM fragment metadata DoS.
(CVE-2026-54873)

Fixed non-constant-time SM2 scalar multiplication on ARM64 and RISC-V.
(CVE-2026-54875)

Fixed out-of-bounds access after SSL_set_SSL_CTX() during a handshake.
(CVE-2026-72897)

Fixed QUIC connection-level flow control was not enforced for streams.
(CVE-2026-75804)

Fixed a NULL pointer dereference in CMP client revocation response handling.
(CVE-2026-75805)

Fixed an unauthenticated and undersized DTLS 1.2 AEAD record causing DoS.
(CVE-2026-75806)

Fixed a timing side-channel in SM2 signature generation.
(CVE-2026-77696)

Fixed an unbounded RETIRE_CONNECTION_ID backlog in QUIC stack
implementation.
(CVE-2026-84784)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 97a94e01efa24d9a9b7a410a42cd0fe312e65197)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 46ac5589dc..b7083cc3d7 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.6.4/openssl-3.6.4.tar.gz.sha256
-sha256  9bffaa1ad1e07b354c21bd3324ec02fa15579f45a7d0494b3e74bc449b7333ef  openssl-3.6.4.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.6.5/openssl-3.6.5.tar.gz.sha256
+sha256  a2157c2830efdec3788939b00c9b0638306d3f0bbb76dc4832ee503bb397df98  openssl-3.6.5.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 9b3eec4baa..4aad749eec 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.6.4
+LIBOPENSSL_VERSION = 3.6.5
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0

--===============6412148297635059019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6412148297635059019==--

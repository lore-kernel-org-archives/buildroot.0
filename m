Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8988CA5FB3
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 05:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63AEB4064C;
	Thu,  1 Oct 2026 05:58:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXUL1Pgq79aN; Thu,  1 Oct 2026 05:58:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 83DA1405D9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790834286;
	b=OJ3S4lK2T1/neYjU4TiiyDD/ALgB9T5oJ+x9tzVxZAAAo53N7lDnNvDqs4/OjHxdi02M
	 MotLgQJc+xaF5JP9+9hdcZ1e29IeP7stvDBkT5/DwQEcYgOSK4jgdZrPG+U+0y+Lidtpw
	 M1hNG1ixP7s0+RXvtuVSrBXw40+rY0wjRcLgPP53eL0EgoV0NWb3u30bQ5mJQYsnMaAxF
	 y0vvzt/2u74Ciswtx850o2cvUo2EmjvR+LtdKzDMUFkjHxbI0DIXdCUZdYbELpUG+BaRV
	 MHIDlOWtQjRW2zj/EG53xq/YHkSYULKiHOlRsTEzFHtUDTo3UrkZO7cE+rsVfIsnuDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790834286;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4OVCvMnuIlb6GGSRDQVJORfedn4xOX8a3VXhuvqeJW0=;
	b=W6Ln4LyVwGO/YOVfoMtfvM7zbPsaMXVORxLR1LbNtlt4henbjUxo78DS4Ik81iiuen/E
	 VhfPfdB9Yab//P1QkNhxtVcs5hLgcyu0MFZZbYzeE4ECEZsEitlsMCMGAokdtOrF5d8yC
	 FhaXMi/rNAJ7mqQls/qV4U9HauDrTWu1bomPUSAWC5u0ogdyOLCuw3mUndUC4qOdxR05B
	 FP2IBnBR6oaii0gW8jmYzD0th4Mr/whI9xBI9o+U9BeKmaPBJ9FiNGxweZRwjt8wYgj2p
	 Iqs1SyFl2gcSNJDr9kQ4PJHJfV+LiHqLXV6MHqkyfp8ZJ8qrkdT8oMrnMc+5WikuzLA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790834286;
	bh=4OVCvMnuIlb6GGSRDQVJORfedn4xOX8a3VXhuvqeJW0=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M2Z4MO7MnI7BtdOUp/4sRmcSGLqEd32Nkuw7/o0HO5PTEJsnlFk8Z4PiloBDPDx2K
	 V/i3xLDQLI/x4uXzq7d0JX1AEJluD0Sou5kgcCJ303euCvqtfjfuTO5YWn+qKPdf8u
	 FrUekthfOMZ4u2EL6n+lE06i+SJr51kBtoqbydExi3e7BFwPDCA1QmP6v6cdpW648A
	 6rNetmJ/8irx3rWRex9UMp1k+FlGAmcF/H7MdsrXlcyYSAn+ImPHLIy9xtPX5JhBcJ
	 czxqZmohiWu0Id/E81YR3GsswtoDXXf2XkeyIrMZZp/gW+NgS/Ju3b14618Tu5NMbI
	 XC3Vr2SQvUXXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83DA1405D9;
	Thu,  1 Oct 2026 05:58:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F39B33B
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 05:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D14660BD3
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 05:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 146Wio0tK88C for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 05:58:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 13BBC6069A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790834284;
 b=Ty72whiXetNrVExU2n826BFCEj7F6FH3K8PqN4epZ28/+0TBg2jPdHiqM2DMR6sRMFft
 aKlRNahPkRpaRfFhuf+OfAh9oKKc7P6726NhoHsAQeBZI0nvOoDtIYZUTJet4hPZDGmok
 Qxzv+OA9cQ1jw+e2vReHAh6R+KbXvTASVJwFRVXjL7kSU+lkWVRsGaMvzXBq6JlxpVWeW
 /6YMzh+0b3f6CAiDK4nQkmTzzbdSnsSr+4WQSQjeYNsif5RfnBGKhW45HX1y8dJr177e5
 PJGP4yW5c1oOA1jQ0ku6XUEc8VfLbPL21vHbWENtLrxwhsJc1KutseKii3+Kx5jXAog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790834284;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=w9qRyuYrAkWr/PMla1ngLPj8dFJyNROykxbI6LZT4go=;
 b=ZDN7KJlQXXRsIVpqmac5kK7OM7qq9NFWL+V7CpulOVScbWaHl29/DcvtYKnRjDLkRKqq
 Knz4mNPYCCg1ieHw/9sWO3bBXVlcZ5dJxrh4wS9tUb5zaJX12r6/1IvZ8485LX8vNnVJq
 8mu+0d6PLj8+Jv0Grq1lWeGjI2TFQYuknJv42RwgBBGjYXDh6QrWYDbHHpYfxtUGScCf9
 KLjQ08NmHy/NUmG/4gYwoXkfqBMsQJQYJMwxFOJ0nEdC3LtcT+1+gOw6jxiB7u6e9O88U
 OWuOmb9AQxhZ1ATC0CyV5BYQmLR5nHPN/n+0WOavYEs/Pn7f8vz8hWcUO1PQbUrvYrw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=openadk.org; 
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13BBC6069A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 05:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1790834280; bh=5RADJZBZFxaqXO7oyiPL/sV86KQNutOxf+ig4lSeLaU=;
 h=Date:From:To:Subject:From;
 b=tWVA/wyxqrwz3dZICo6QdH3Bc41BdZOEYHRd1woiPnGL4JwFDHxV+D5Psnx1h5Hr/
 aMJGlDnSUlH7RbK6PqSXn1e8xuyL1FaQTaoJvt2+8bjXXJvxypmZxkvMYhmgZYZXUf
 o8bDJwRej/lLm9xUWhocjwsRW2GQZFR6pRJiUZcjUgYAjoHAobG+m1m/99z9OmVork
 VpKjdm7o8UjWg8xwYZx4a/cctyUj0gFhTGRm622F/uMMGOTk3o+vDZdyR68IpP6gJK
 mkdRchzxVq78rRn0EEQJQheTkdkRLd4B4xGi5i4LiH246aFQdsdc4TmUzVF9q2TE5m
 QVcJgi2cK14mQ==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0806431E0AC5; Thu, 01 Oct 2026 07:57:59 +0200 (CEST)
Date: Thu, 1 Oct 2026 07:57:59 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ar32Z0ggduEeP23t@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH 2025.02.x] package/libopenssl: security bump to
 3.5.9
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

OpenSSL 3.5.9 is a security patch release. The most severe CVE fixed
in this release is High.

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

    Fixed a bug where EVP_DecryptFinal() incorrectly reported a stale success
    on AES-SIV authentication failure.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 814b4eb0dc..3938a81e5e 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.8/openssl-3.5.8.tar.gz.sha256
-sha256  a8f84a39918ec6415ce765d9b429d313ba97b8143169c172e734b9514464f5b2  openssl-3.5.8.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.9/openssl-3.5.9.tar.gz.sha256
+sha256  603f5602e2eef00d77fbd429d34dcd5822bb301757a1bc9cdb24c670f1eb859a  openssl-3.5.9.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 6620eee274..d16d024d89 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.8
+LIBOPENSSL_VERSION = 3.5.9
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

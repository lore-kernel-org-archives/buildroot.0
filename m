Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AFFCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5628D411A1;
	Sat,  3 Oct 2026 10:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3OSZt6r_ieK; Sat,  3 Oct 2026 10:07:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5C322411B8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022061;
	b=A9QkTFjoy39yfhobP5T8gtJRp7QjR8VsojzufX5Rwuk6WgcZx9n4RK9rNHoOYbPBiXf4
	 4Muzyu57+dAFzAyqFyyP2ippvgYXRnvCWfcuKbB4TZsindpbmRRzzeqlBzbNbuzIBBIWM
	 SzWfVUH6b9wy8FpcOcvbiMfShHxwzOTnkUPhShFRN4Zkwzvq+jkK1976rjOZCvsbnFxYY
	 BtAAKOabsdLYqTLsN0Uv8KRW/nSmwQqprv6whR1uVmFPAFI8c4wwpioxP7DgG7N5jtIW3
	 xRd8JOHh02XCkQGumig8ugRyU1KdWkebdmCDJnLdRpDRKrMKStivtk8PLS6g4qhkPcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022061;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MDtK7+u0vMeByll1Qd3HL7TLRyxBKAdZ0t2Zm+jkrE0=;
	b=R+AIjJTluQLvjQ1dmAAOwqYHq/itSCR+5SyrnRNUJbyOZEbo39JMvJ7cX+tCSoHg6aIT
	 Pg2mq6fVokhF+zmqHiFY8x9SzabqBUaAJjwUx5KC/KyQ3EYDe+S3J88Wrt56Brov7hqb0
	 j3vN09if5nZmEAcbYBKmuZGxsIxx50PM/q42y3gHs5J6n/67cOhifimP8OEdOctNjNFhG
	 YB3HbiHhXHggJbo2daF19A9gz5Rw0uOpPd2DtQgXVCSdA64Yz6YXy/7UmY91iQGkcLGet
	 G+x881Liyfgzoo6x+aPcyWzKJiqrvJhkM/i3KOKfiwWbvjmxi2QupZthV9asjx+7u6w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022061;
	bh=MDtK7+u0vMeByll1Qd3HL7TLRyxBKAdZ0t2Zm+jkrE0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QlICinqQdolEh2F6UjCRm7hkHKcKV4TY+NkXgV+ZYuc/QTRASDRVaIah7qzI36d9K
	 /8dDGbsr1SGx3x2BU3jOuqeQNM8Oo1iYwAV5HHsmC4b+733QNqYoAKCmvCDZz61gTZ
	 VIBIzH091IDcCGx2zIM4rU4OjW/p+7gKDAyhWkq49qSXmdJ5C7lxOEHUAGQsvYUQJ1
	 DtvNcnGEDifdlPUYSqg0Uwgyd6n+yyb/XOjCbHpwsbTtI8c2KRL8yFqGShhB7EIp7L
	 ngSzLzEP/2PWq1Zy5PVryBemN/IDeoLogEQFlJGdNzX59hRI4ernQFI//sy9GGmWY6
	 HLlp+JQ6o86Rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C322411B8;
	Sat,  3 Oct 2026 10:07:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07571335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBAD660E7E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9aIUd86W-Nf for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0684960E8A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=L5D4aO+AEcMbAdLDZNwPAj63nK6ldbieiAUwVqZQB/raL5mPpgObGKVtEw6nY2toTZSw
 rEzR8McYGyOcJdLnGf3ssx3CNvUamjjVldc+UiDXj/mzVuvfonPdGzHzwZjcKtj01xAsl
 fqrfMeugbDNyDHqzM88RTIt0DqVP/QBfJJ+U7fp/JIwFKcFu+dyhcr6ijxR1M6FmOr4C1
 vqwywlkSAQFCI56m/948PHUCigic3921Y8oRSolG5xKjCuNq+3Yefyijj2I8kP5AixQ/+
 rJNJnlv2FtNQjNuOU5eBOvt16LvI4Jntt/Bdixytutt4uKhRsEOD6L6YL1Nj+2d8GNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SqNg8dVyl9+CLQZfUtAnKThZeVu4JNEkxIP61c0KpGA=;
 b=KGlCMdYOQQo8qJ/PwX5EDe5nH0/FKLCj5Qe6eRkSIA351l6Hzrgh1CbiISIZsR4gV5XH
 2QagaHF8UAEr4eECPvCOSqPyIa1hX89O0YiVw3PVKqYYqKLz1KTSUtJFeW8hjX9URSCrC
 RZoF/PPSzQyaOIazuTKrhmrfekONR2kUquYoZx+OAXPTeFleqUSg3VoquwwPbkght99U5
 lLl213Wh5bjsn11nUrSfHzcufv3bfS7v/pIYWKBarP8OxBsQ3LAiLvRBb7ye/HYyzi36W
 uh/2/T9qOyFJQw8RhznwKiEJFFBKF7CFC5Xc+PX0jMFsBKjzleBvVq7MMuP+TihL6Bg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0684960E8A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 650E788762; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 650ca27e0b911a5023ed79d21b48d6f110022b82
X-Git-Newrev: d2e77bfea12a94ac749acf6684db3a61427d3f3f
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.650E788762@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-magic-wormhole: bump to
 version 0.24.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2e77bfea12a94ac749acf6684db3a61427d3f3f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-magic-wormhole/python-magic-wormhole.hash | 4 ++--
 package/python-magic-wormhole/python-magic-wormhole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-magic-wormhole/python-magic-wormhole.hash b/package/python-magic-wormhole/python-magic-wormhole.hash
index 2f03594cc1..f04a60770d 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.hash
+++ b/package/python-magic-wormhole/python-magic-wormhole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole/json
-md5  23f71fc6d6f78b93d419cee6d4af4d94  magic_wormhole-0.23.0.tar.gz
-sha256  4cd8f48a5c47f70578be7063f892988177681ab66845f4d6ad2d5eb03ce82acf  magic_wormhole-0.23.0.tar.gz
+md5  20b6a0c2f69f23c63eb15f166b12e912  magic_wormhole-0.24.0.tar.gz
+sha256  c01b4815878e5fbcad7a22cfa190c529349bf271164189a0ad955a34a8d4cde0  magic_wormhole-0.24.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index 9f3b4dfe1c..d2ae7a09c0 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_VERSION = 0.23.0
+PYTHON_MAGIC_WORMHOLE_VERSION = 0.24.0
 PYTHON_MAGIC_WORMHOLE_SOURCE = magic_wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/source/m/magic_wormhole
+PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/d7/8c/964308aeed7b828ca726da4bbfcc8f2bc89713b39ba768e24ce6331b30f3
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

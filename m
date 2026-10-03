Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EE1CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 916C08145D;
	Sat,  3 Oct 2026 15:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XFdYHzxn5Os; Sat,  3 Oct 2026 15:55:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AC53A8116C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042908;
	b=XcRRIcatybOxJQbpLy6zcVglUV3NqAgEZqEdjvhT6dGWZ4+6S5yrPu1cUF9xXsFFXVNm
	 4Bf2ymsevR5X5zgs+cNDiUe+DH/h49vzZ8sTaesEpwHQC/KmQIC6xzsiQ62gn8sgkH0tP
	 o1pocvRMQOsGxI/pEjOduqM1zDTlQvdeZQ99i/qtWuHwoKdHh9R3MGQ7SnrJJ276VxE9e
	 JKnlb6u9uiDNlJ4MY/z0y9ljMSmQvpo5+0FA0noIBF9phugH78P1F4lC6LFmAAlovSWQI
	 0UbSMgZosaUvjVrqa/+4gJaBMPxZZPOj8sfeg1Z+VsGwMo1JAbw4PRQwFfJEuEEu/6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042908;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KjJu8Mzo6Xdjfzp/vlVxRkUqrzoa9TysFS6FyAgp3OU=;
	b=QJG6wpvYqs/2PL7d0yVqgP/2WpeMjuw053GDa8NNAE/euU5RStMzqk0c/FndT8k+oV2p
	 eZ2XEiwEThxwoWTlbkNTXpCYkQs7W1fCwrJfidIxFMX+MYqp/0wiSySF6je9jEOHaNjxS
	 GvTQv3XN3G3mp1g2mAN/zT3PoXorx+7A8+9Wls8IjO6q9nV9ke0e9XwLdHfEULtR7xRlh
	 ZEohhfuXHuzsQlzo7UOk0vQHKs7Bixd/aFJ6eewnl0LszcaXk9PiK+Zc+7HeCw2VjswU9
	 0Nnw05nXi0Q6J+KgvcPl1fGIoUHa2stdFU2nbaAQN1KGbcKYSZ012Zt6rOJ8TiFdVGg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042908;
	bh=KjJu8Mzo6Xdjfzp/vlVxRkUqrzoa9TysFS6FyAgp3OU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HbnrQDLAwtd0YPfSZirNyAi8A/4SFy0yWppjAbtqLhl4rMI2zxRlFLDtgskOUEW0G
	 mW0iTi4GuzV5PJb9T73O3GLvuWc8eI0fjWp3Yj5MDiSrWScTuFF48OCK/a5I605rjv
	 eydeOKQcmxNBPDUM9mXYBHojTLQ3a4tEU+KSDAY6L0UdUO9b0lG0IsE/loWgCiGV3U
	 yq1ZnZ9+9PO4Iyq+JydvUXj0I/dMA0uurYsofPH/Pe/tL9T24/uUQZ4gcazx+FG7gj
	 Le7rhhqUmYZyzocznTKi0cFS4+t8BF+SC2N6NPdBQVVPV/LfzHU4fJy2sFwJOHq98V
	 PWEmikNSkAUpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC53A8116C;
	Sat,  3 Oct 2026 15:55:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90351335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74A99400AF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XvSTeSrdWCqH for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org BF8AF40024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=On6C5KdvplU3k1L/jj94o8KaGupigY6EYglwOtEJ9D/7A78wAJ55UaifgPru9x2CyT1U
 Ibb0sQCttpyMuU1aLvNT64g8Opf3g9xoc50EANz+sbBYquzt7pyEKwszUYp06ywCL1iNb
 k2PniHI6YNcEg5f2pY4MUhMCL9uJSsiya8lNLdY9ZVVeHCudGFVshDJhxckiccHb8Mya5
 wTQKfBPEZ6c0i1AcANO5XMulnq3sCijsEyNpv9lwVhTFShhBB/YdVTOELpEunKQsuMuLC
 zy5hNziqeTNm+ylKL204ipg7XCGqj5e6x/gqeAS/CH+UTGpCXWYD5z9XWgr3tat5CyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Yvv2mFSyTXw+rfyMXfDjqH2UZ6J6u6a4PdhgIUnGIao=;
 b=O5kfcsllLwnoq0QgLPQ23SC5BTEC/haUXLGjLoZ2IAtJ9JsdQtU7bcod1Aaqg41xVvE/
 Ragd5ub2wUnxWBL+J4iFWh4yO7NvAbpiNggsFIwwBENvncrSlDngOetNqRDHYtfEMx1RY
 2LxfWmBUW/vIpSP4y/8qctMr6snszhNa0Rt7xvrwvIns9jztgtpgWyvGx2VELEKxIT3H7
 7l0tjYWSA4mFv/so/tZnfxui0Pq4Pt4QauaSkme1ZOYXTSoBwKOPOXMT1wmpdv2f11YTK
 qzVhTgHBfBWouXLT1LyZunGprjoajSW7z1IIkxvQfGh38fBgLseIWGR3aC1Y6VEStrA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF8AF40024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BDDF8A58C; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c95a6d9fcd9399298de9ad4b9f4c345d0a0f3f7
X-Git-Newrev: 2982edb3103ef985a6c8e78316342dce42570664
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.0BDDF8A58C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-trio: bump version to 0.34.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2982edb3103ef985a6c8e78316342dce42570664
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-trio/python-trio.hash | 4 ++--
 package/python-trio/python-trio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trio/python-trio.hash b/package/python-trio/python-trio.hash
index 79146dc1a2..a6ef3cbceb 100644
--- a/package/python-trio/python-trio.hash
+++ b/package/python-trio/python-trio.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/trio/json
-md5  e778db1205fa2ea00dac9340471b8f1d  trio-0.33.0.tar.gz
-sha256  a29b92b73f09d4b48ed249acd91073281a7f1063f09caba5dc70465b5c7aa970  trio-0.33.0.tar.gz
+md5  19217ef09ab5a871de7b6165da677e34  trio-0.34.0.tar.gz
+sha256  63b9485408bdfdde544fced107045a8c0086cdc4bd0ef2f797b9e0dd111b964b  trio-0.34.0.tar.gz
 # Locally computed sha256 checksums
 sha256  418d025e1284311f2690263e6efa6bf51585e5741818ece63e5862487e505bb9  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
index 4211dbb313..05f288642e 100644
--- a/package/python-trio/python-trio.mk
+++ b/package/python-trio/python-trio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRIO_VERSION = 0.33.0
+PYTHON_TRIO_VERSION = 0.34.0
 PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
-PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/52/b6/c744031c6f89b18b3f5f4f7338603ab381d740a7f45938c4607b2302481f
+PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/92/dc/a2d25ed73ad49cfd79bf18d262577c3731c98e382284e28d522f49a0df35
 PYTHON_TRIO_SETUP_TYPE = setuptools
 PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
 PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

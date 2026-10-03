Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7321CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9389160F3E;
	Sat,  3 Oct 2026 15:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BrhkMK-KvEuU; Sat,  3 Oct 2026 15:56:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B6D2460F3F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042963;
	b=OSv5PCXrlFNNxAee6YMximAB88EnCE1KwFN4QrKN1RZlCfxQbiZi/r/9US7toiW9hicU
	 +lsFe9u+tS3Xobz3UlwWKtSG14mbbA6Cu5mly9sVcUPP+TbGJMB49uaIUOPKffoogx0fe
	 G4YOTMAHxY1XcTZ9e8Hi2y2ijajVoh/39p/Hg5RSfyVJowCC7km9ufo8YE5dvNm8M6jmO
	 rL0s9GyoUgIQ2/sGEVxGAmhdXwZv2YDcLZhA3H+k5Byezsg0owK4oUtfPzbxnkHd00X0t
	 MhcS9viaHe8b8Ll+dKYs6kb4F0Vjo4PN0sVmlI+rdyGomHD83G3F39xCkq5ZOBLyEKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042963;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2uduaQ6dhKP5kGPt2SJSmJrgZS6nFNxXxVtR2W3gK0A=;
	b=ncQo8pIBVM+QgmuApV+grUf0/wYR0F8PevBy7rsiKZcwnj1hh5v+H7tS8NKeC5qFEXGl
	 +oHNfCkwjl6GLmj22cw7ZZpIdKxwsspDwdAjCGEm5+7W6zOBcFsJsz3PUwbGHAClDBk3c
	 8kQcRnUGBVZRhpvvgDGSD91T7dojGwK1yHIwc/PkUBfnFfeIMalCkAvTJMb/96sQi/hQ+
	 0dAr9um5shqMraCh/ZxoocZZbHJSilgNzLYnfNou8ABXSD3pY1lG9C+l6e7B+ZHxMkLAA
	 UOA/WNPfqSWSgsqtZAb+6S2TJj3pmKR5UZfj54NawwvjwRmF/d96gHa/KppLx8OXAJg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042963;
	bh=2uduaQ6dhKP5kGPt2SJSmJrgZS6nFNxXxVtR2W3gK0A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bAu1akjnkaa/dimr3pjssVYj9WYGTilYAhIHZ+C2go9JnVaVwOKcL7l9tYVkBHqHQ
	 61jfyn4TZTu6HMFzw0ki63OFgY2ZyL+0H7UuL+84YmYHwW9laDAsl+TqigTjkEm4qB
	 iPaZ/a0V6OA2ig0SyaAq3pE3OP7zeZwiYjPnYyGZtz56jnWQFF5dnhkZThVJ/9XRBO
	 PRwm7O8+r7ffNAmP4GOaos/7jM1lmqeKLRwlSCIZtGsVWA98MwHec8DpS4sx7UIale
	 DCM0pSCNhEEMOCC4sD5YClSLpo9syzbOL9anwn4LGqURN5j+K/gJOXnEJDfRBtxJ1N
	 1wub88Z74sAJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6D2460F3F;
	Sat,  3 Oct 2026 15:56:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B59061D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9ABF840055
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9K6_JPTk0D04 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CA93C40049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=GEv2wV+ZJDbDiTetvmhnISU4Hntclb06gnGpqFsTMa8GOqIwnkPGOXN5ey8MZ6Dqs/rF
 ud46218UHhWqFbL3kea6v4EP2kzcWrw3vXwcgB1WoatkxXZdYjZIhORT0Ec5b3xtyXmzn
 5xi/2K1ZJyhQqMNqBeoTEoljhrZluu6S+KCCXOv/5OQyJtdd3M2AwO1C9WbcRR5XhOCFz
 ZkPo16PTQIUacGDwd6Oeo0qxc+j8LIhdcOIJlDye1TL8chDHK5y1peFNckSa/u4zffw2F
 WtMG22SLpq/efrLZXgKVg+qrggnfIzMFNzNUqmZ0r3yQYoBvhZCfts2D63Qd1gALRzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dpNSY27VGem4w8vLI+i52DZDAStk+UFaLWCoMFV+53s=;
 b=nI58Lche5SNRMIElcEcA61eUHIg0jLwYQw3bSk8NwtnlUoUfwU7GxeRYT99KHptW2G3t
 8xRKlCobXLXMobyQBygzpGbsvAEvgYuauGrNpZtBpJaSoIehpelw82CV8Ax/tSptAa4Mn
 EY2Bs+RRJxWuX66nvDpWF2ZLVjSes9zsIIGm3KPgEVqXdMbCXn6lJG9UD8RcEIUjyEg00
 wruIgMwr4zZEmVcLdC/9waglfHdDWG/AGu+mjjVdxbv0CXog3zeCWM9wAabYFknCxDVT9
 dlynUAeJVYU9trL4qkCR0uo5Ns9anZuPNqaoHp6dZI+4WErCQjvfmyTONcrLwRFQciA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA93C40049
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17F568A5EB; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 933d454d22146b6fabfc178091e7b0865634d65c
X-Git-Newrev: 84999ab9d964af65c3378e9bc82074dbc2c3147a
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.17F568A5EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httplib2: bump version to
 0.32.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/84999ab9d964af65c3378e9bc82074dbc2c3147a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-httplib2/python-httplib2.hash | 4 ++--
 package/python-httplib2/python-httplib2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
index ffcf5cbd63..fcb8b19374 100644
--- a/package/python-httplib2/python-httplib2.hash
+++ b/package/python-httplib2/python-httplib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httplib2/json
-md5  957581afb1aa862ea8efbca88e13bd45  httplib2-0.31.2.tar.gz
-sha256  385e0869d7397484f4eab426197a4c020b606edd43372492337c0b4010ae5d24  httplib2-0.31.2.tar.gz
+md5  0c45edbd75957af282de53fb428f6b1f  httplib2-0.32.0.tar.gz
+sha256  48a0ef30a42db65d8f3399045e1d09ab0ba66e3b9efc360d07f80ea55d286025  httplib2-0.32.0.tar.gz
 # Locally computed sha256 checksums
 sha256  589eec38f72df2be203711d3b8cbece9b908c5e7ff00bc3cab7f63bae9e366b4  LICENSE
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index ea5b8e0008..ae683c759f 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPLIB2_VERSION = 0.31.2
+PYTHON_HTTPLIB2_VERSION = 0.32.0
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
-PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/c1/1f/e86365613582c027dda5ddb64e1010e57a3d53e99ab8a72093fa13d565ec
+PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/84/f5/ccf58de92d61e3ad921119668f54ed36ca1d0cf5dcc5c1657dfb164fd78b
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
 PYTHON_HTTPLIB2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

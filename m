Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE232C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 10:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EB3E40402;
	Sat, 12 Sep 2026 10:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3tsH6r7xPvq; Sat, 12 Sep 2026 10:49:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 53A52406EF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789210144;
	b=lW3vt3JcP3YGqMLz8mV66YYS6Gj6+CVhvKeW3Fx3bpct3x0f4YKC8cED9DSeo0DV1ox9
	 ShEBT7PauuelEJxgLTPMdCaqoJhpMvlgHzsRnAI8oTpX6eGla+CbVF+4VJT8ia6m8Jn8r
	 6+Pg54L/MKO27VrsNQZ1eOmm3hK8WJ++CL6+i4HkvnBXwsOpCiDm0HwCecrMkZfzcHy1P
	 dqlo0hc1/iZptXWLzFXIK0RKAkmRXQACfkHLqjU75tcYhZwY8IArXvyzZxRzZA8d3eTVQ
	 hfTS57s9Mvsz2qMXqhCDpXlyMItsncMQtTQm0x4nQgaejnuFxOgMpJtsuwantNdO/Gw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789210144;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KckJ9qkY7PiTTU7bVW/PNOc+kgcalabJ+PVdjKW8QhE=;
	b=fSRxvmSkvxLb7QOC+mpj+EpNfvgVXWjL9tpytMj1Nsen4KGJrHes0Xl6XTNuS7tEeAW5
	 1EiojZ2o5Uz4PlBGXTrAn1gVT9Aypuf3WKaGkzuiqF43qDHcnccA8pljoLYMaqtrW5qv/
	 ShWfN57dbNJtkB1PTBkdHKkvkmVJYHI4X5PNHB7W1gtFVTefZecfp/MXbTB2RbAWkxxeg
	 lzjJTxfmXOisiBHKuTcMkqAxMSsCRqFI46MMvMIvOGunyssnt5r+nolp3taXdyKVINVqf
	 C6HV/ztfq4OnA95iTirDueennsnW0dlKDRrmYDcVmSTrO9ovPRrpNIC0HMdKUh/5/lw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789210144;
	bh=KckJ9qkY7PiTTU7bVW/PNOc+kgcalabJ+PVdjKW8QhE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OHGFHWxmMvhn5+zXH6a47ilA95IDYSsME4UUcikTG8aZOZLEoydJIOh+DH/rB94jd
	 4byWhBixaM437ZCTw0rdzdWLfGYjqPfhxUXF4XoeMEka00CjxkrSGRp7KeA7zZGUuB
	 mDwW0lgblUW/58MgE6PxybLMZ5Qvi8PlYcFyEvTDWcYkNUmuMjLi/0SfDHT/cEp7FA
	 prrpJLpeTD4sOEOFaGcDMFsrhty5rW7qQ4Lk/W768kGBBQQvMZY2pDHttFFVO6GV68
	 zTqxTjG0VRnbfi82YHvP0nR6qzRTBN+vDH9wapPT3xonyAFu2g1UEto2l4hmouXtuA
	 /b5cTRuFnxZvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53A52406EF;
	Sat, 12 Sep 2026 10:49:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79F3F2D0
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6008380DE8
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqRhfSVbASw0 for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 10:49:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4881080DCC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789210142;
 b=iCL6+ld1gG0elg6tYBuI80ntx/KZX3EXtcRykhtjRoA8lG1eatYStRgYB31f2aqv2Fg3
 KarDtvK6Gh2pt1VzdUdf7DRAUhnyNjEXSLUC+dL7gqcaajJl81Exi0gzuEA8YNr6Pp8y9
 fL4Psna8BZcl7vpi2eiZbylfICjcsW+i6k3YH9d82Ba2dfBaAN72Dwq7c/i9C+7vNcfEf
 YuNtpSG/MDhb8wnUdtQY4srf8eLNjaCJ0cuWmSCyKsOAlgpHS7umcg02uMcYkR09z0Uad
 BDDoTTlxzlHgX0wdFnIQkaI3pay48t9/0TKEA+h2jAaqQtClkx56jTfBZmfLXS5LdZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789210142;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=M66tGwKfxUBM4AUMfUk0Xck+gjqd57aZ+a4Dktge644=;
 b=RYUu5hvb6yLjCypKojcu1XhbRMy4wUwYhBi43C3oVsoaRX8m5zT0FjF8Qj2bl2S0FAxG
 zBkLOoWOIeuyww516U2xJZf5KkQ+cioAUVPCQUpfiiazExQR0/uWRoSfYRsYa0sz68fY6
 7q1r5QwLVwMji3Vwx2SDbJuWMpgMsNKhOe0utg0LB7rBC2+1oPTvYgJwPRCoAdA9CVrfm
 WDIzNuwloCI+MgJ28R7i0vzHxlB8E/700ElzJTHTJbw08Ph55vhOlDGCT8XENQ4oybOmC
 wP2srgi1IBUyIAEsMeXOUUpryP2XQQrpe3dc6+SBhQcR0fOFpXyIammpwmuNV1JXbOw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4881080DCC
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEFB188443; Sat, 12 Sep 2026 10:47:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 11:31:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c
X-Git-Newrev: 5839ccb520f51ca5c6381b2c0eb32b33e8ebf4b5
X-Patchwork-Hint: ignore
Message-Id: <20260912104757.DEFB188443@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{python-}protobuf: bump to version
 36.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5839ccb520f51ca5c6381b2c0eb32b33e8ebf4b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

changelog:
https://github.com/protocolbuffers/protobuf/releases/tag/v36.1
https://github.com/protocolbuffers/protobuf/releases/tag/v36.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 4 ++--
 package/python-protobuf/python-protobuf.mk   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index aaf5d77095..17d42534a6 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  f0b6838e7522a8da96126d487068c959bc624926368f3024ac8fd03abd0a1ac4  protobuf-35.1.tar.gz
+sha256  dc74fa582f559cbd31614ddfefb4868f43c919d7184bde514bb47f90c6025eb8  protobuf-36.1.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index d4d0e3e0d0..c4ffbe9eca 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 35.1
+PROTOBUF_VERSION = 36.1
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 714e2cf49b..469ca3e6bd 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  e9074f4f40672c900f878be049f86cb8  protobuf-7.35.1.tar.gz
-sha256  ce115a26fe0c39a2c29973d914d327e516a6455464489fe3cd1e51a1b354f81a  protobuf-7.35.1.tar.gz
+md5  5cef553eb5bceb0d5a57610f1aa3c40c  protobuf-7.36.1.tar.gz
+sha256  d0f6470f0ce2b84e3feaea2d4b816378b37ba4d4aa08a274305373de93e2d524  protobuf-7.36.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 17369d1462..d73c265302 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
 PYTHON_PROTOBUF_SOURCE = protobuf-7.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/da/01/9ef0afd7999eb9badb3a768b4aedd78c86d4c65cfaf1958ab276199e76b4
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/86/73/f66c748df06e7fe24e658eddd600d19c4b40bad836c97ce2d0ad9851fb6b
 
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

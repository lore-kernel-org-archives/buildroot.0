Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1C6CC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58C8C608C1;
	Tue, 13 Oct 2026 21:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1Nrrn6ukcrE; Tue, 13 Oct 2026 21:52:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7870460899
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791928344;
	b=j6K0KqkTUG/anrdNyXwNH82H5jrMkV3x9EwpxnUrXDLeGHCzpmIFjY4UYhp81tIxQ3dn
	 n2qvrnY5KW08P/EjrbCVKVDd0YKNTNgTmPx6Ur617xB4DvFJTnPXSH15sM4DSekHaupKY
	 zeF1oNTgjlkIfaPNb+5G0HJXVBGweHLrHIU/bCkqpSGkfsHGe/iOnsYucR1tPt51RrONe
	 xnAr3fe7rgPAARjqgJfisPBoM1ARj1izBxQUAVBwroErI3QfvzLzfuaN+RiHNu+iC5Jc9
	 AmtI0QVqGEKZW+Br03tNQuOUuysNNcWpnMKjkSqNvOvMJM4wlOETtDb8W4UMLf6e02A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791928344;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ogCgwWje4prXrOJjfirpRZ/zbwcpjwgcMk+Y5cOTkDg=;
	b=SUD9AyCBwSxpzUEC9vmGx4nJ7U/GHvUz7q+7COKbA4CV2pVeC2WnMDgHgEIIIGAFEAo5
	 zIgof/S3NImaxQ5dj70uvRcTMbQU6030XMJgnSMZIzPFdtYm2HXrfvratop1KvWTDuOFq
	 GNkrziizMiOJkCfUYSVjrqgJhLs5x6gIQFypPtimyyoMnUSVoctZ6eU9ZFwKoRZ5W+gkN
	 pJmp4yV9LhsZXIqfhEs69orpFx0LfdW0orciHJE2RNd5TnnJjYSNGy67vkBslQkgpJNOo
	 fgLOXvnbF0lWpHCBZU6R/6urVtU09mpsWd9/7Xn8TVDB6nh9YXP1F5gQVTDU0eEwUew==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791928344;
	bh=ogCgwWje4prXrOJjfirpRZ/zbwcpjwgcMk+Y5cOTkDg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=PL/hxvpQ+9gPRTbevexSJnM1qSBIk5p7WkpALuAX3BerdeepAiQwDoTTAcjuybhdz
	 TjODC3V+CT1Xuxuj3imcNjCACCsr7GEVwyVH6p/fQ3JF9zqe+pWX3nlV9+xKolCPGE
	 N4yo0P8BQnoz88r7euc70GMlaGi8zvlP+vWNyvzeI6WYp/6aXVfftfBWbARLgEK1mz
	 Ty2psPqLLc+R/BV8SiKi2CaH2xplotmJ3MRn1TpGEIDWz0S0ZHTt8V0M+8BJTXJg+W
	 Im23HNPOa5rrKdXl//xYrcMpn6D1qszhSg4++MdccpqW6b4k43gcKMOEWDwJRVuyqN
	 WHzQOR9TyNNVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7870460899;
	Tue, 13 Oct 2026 21:52:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83ECE2AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75B2780A83
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwcBLDdGuOtl for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:52:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9C1F880A50
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791928341;
 b=mdcWc30JwwuSMzBcqmFT6rO4bugB3+SCijXo2AjjoBZeyPflyVYBo2ksqCQb8DiZZ8db
 WxcsPkzYLaemrYxKzNOrk1YxuEhdF7EI12y19U+PwiFdSgozM3J3XPzxVy4VYkEp8uabG
 5OkXoAk3eBTdC9AdUiCbAjQOJ+SIJ/A2NLph0DPn7UJR8OQyFTLUA0k0lHJ6WXQiLzKiH
 AipF+RrxAap+TJpv18ONZ4sWJocLtdkJcWYI6KMzzqkBxszudrUfidGVOp3e5sH4Ud6Bc
 aBj4llvONkIjWH9s78NTXNoJysitwQFdPzkjj38bHw86HvVzN4aUWV4KUddlIVvVtbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791928341;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=2lBPFww8xRxnqeisI5Nk4gvNg8XAMoU9F86FB0WCe28=;
 b=IncpcsF+3S3x2Q+O7vc+zh2UfyG2PAHESs8emSBMbDsdelwh6YnUTW3DqRy7zMBYGvcQ
 2rpuyvAVbTAthW6K0HQvKkxtMnRbhA64jaU1Dep5pAtfiFfcqkigYjKZFT6oW9WdzqjsS
 cvZPV8JUgNMfY7K7IHeHZWZ1iB/mrHSOjm3j7DmCbXt3mDJLNW+Q6NMYxycxVnZIg0lRA
 hwsDK2CFQRKX0M5VjJ6s9zU+5AIRATh4ecj71ywsEe/9GL6pRQp9GvuMfhBeLJAgAnGmf
 n1JUi5ZR6GutDL0cZuHX1Hz51jMmdVznTRJyEdyNHWL47sgikZTUpSgVcnpQKgy3JjQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=MkNVK1vx; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=MkNVK1vx
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C1F880A50
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:52:21 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6df5e315bd1so2364270eaf.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791928340; x=1792533140; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2lBPFww8xRxnqeisI5Nk4gvNg8XAMoU9F86FB0WCe28=;
 b=MkNVK1vxlldvhlKCMjbE2Ff12zzIS3EE4hAwmPGSdeFGy/UgtiwSCbhHuIDRim3Bko
 yKlFoJrSwEm224HPFkZaw75P0Uw3eHVFoKc0sfl5BuQLXOR/Y4SRTigAQo/DOxMmaiIs
 WfPFYTXqF3hWLriFcue0u6SdSIVnbOTfbGbkbUizx3tQysx2N1+i6zbzVgN7snj7/azA
 skNb5JRAt/cSSACL7AnfpaGXnWCr8Z74pu/FXwkuborE3cBeKsB5jQHgl7KQwez2EhfR
 MAsuYDLCryvk2W6iY1PiyFwQ4dzXH0wup2dPa3bNXI4+S3Egf/f6d8GGe5yArXUyFp/T
 WCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791928340; x=1792533140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2lBPFww8xRxnqeisI5Nk4gvNg8XAMoU9F86FB0WCe28=;
 b=ZYAhLR79tC2JZR7DKSKBbZFIYeCjaZ6/uR7DjpFZEPXazbpWGkKw69QZk5wAInsP0v
 4qiNdmxJwvGKLKuxbwwvKsvefYGaqWgyaop4a9At+MBgFa1EInX/4I0PX1XGYsm1H0Gi
 ULqE/DbXghaVx4HfKal3TfT9FSrXZI4mFRLybuZuVS7v4BFggyh18E2EoHSYzhEbbaMx
 9z5R8IWWj4W5PI+bLjzOJSaXgHPGS0drciNXAaGE6v/BsMHzEAWprvo/tJt3AYQsETi6
 nbtZQHXAj1VkmKwmfmM0HaCKAQxsnPcHngfMWkHRK4tk3rrgvUCbRaLbfljqJEVMYv2Z
 hxHA==
X-Gm-Message-State: AFq9FYIvMEI8vNx+oOOW2xrslAi8lTtskJg4DHUH79Tmh/iMYAEpj4X3
 0PHINmKxpohWWTaPDHcFzxcurR8OhpOjLIaLLnjs9ku448pSXgTAnTzmFK+Uy/Hk
X-Gm-Gg: AYBFou0POc4xCZvxrMEZ/yzlvSbgt/kSLUUSPBPppyCoJm4yIFeEXhQJkTfHohcYxyK
 C+MKz9SbVmwL4gC9LqDDHcdDbMPZe22mt22cm+AmD0lUcGHGA2m8gxB0mOXiuyfw29Eksctc2ue
 VeFtpWfQMHmE1Q8s6FJLNG8fKA4TT1L0qX9+/TPDSMNrSshQPpPKhf9uvyn7AGKRRkFQu91kIcB
 YclXmOAmfkEj3xgt5T6qitmUGZzBNupIMqfk/i38LOt259yv9HMLTKFaPUbrnleTwbRXAqg4uQG
 xLqEX4/cpCVK23xgdaT2HzCWExryK6lJU/xByhzIe7tMLlz2UPDSgRet5LU0Hcge19hr+afbDwC
 wkTpTQisYUZPAJqDHOXvT6cE3RVgDuWoqHkJqP5A9/tMqSM4Phkq+dCxlt6maLr5CK+moMCuWyd
 FtMYwSp53y/Q7GKyG4I2vQGajdUx2cXhjWGjRYnaLDiohUBD/7Rkx3C2kpIfO6RsOrzwbrM5zjx
 arZK5mJ0xEkTySzJQkLnxcE3hTqSRFMigmdLwhgmkrGO9bFuAKtVBUiFS8/IwFW6pGHgOD5/dQk
 yg3tfsoXWAxzoqHJup+9Bdsuy5zYw91khxCBZqnl3xOQCYRzhpOa0yCIwhHv0NHl1VuS8ODoNZB
 9pTXBRE/mEoANfV8aQvW5ev2DEw7HFvJd2noAqB7tXHk=
X-Received: by 2002:a05:6820:4c0f:b0:6d9:8fed:b73c with SMTP id
 006d021491bc7-6ef10b8687cmr10968352eaf.57.1791928340105; 
 Tue, 13 Oct 2026 14:52:20 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6f56b25672bsm6813224eaf.11.2026.10.13.14.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 14:52:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 15:52:10 -0600
Message-ID: <20261013215216.2460255-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pudb: bump to version 2026.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index f897f09735..bda4b2dafc 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5  35a728fbb6996bbbc9a857e7142883d5  pudb-2025.1.5.tar.gz
-sha256  e6dedb81fc3c8cdcd66cf62e86337cb913570ebb2c994c9ab52012d059e086ad  pudb-2025.1.5.tar.gz
+md5  fac6cbb69ebcf2649cc1289309c12a9b  pudb-2026.1.tar.gz
+sha256  e32c8eeca47087699548197f101b1fe195ab8187b90e171f0a38cc0852fca73c  pudb-2026.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index 603ce4cc30..fba98d46ee 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2025.1.5
+PYTHON_PUDB_VERSION = 2026.1
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/f5/69/0c52c6058da586e173e48ef8f9c45bc805d9df78d5ad4d69467ff68694b5
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/0e/ed/9fed39a03222995a65ce2e1ebc90b9dc27dc099bcd05613a61a0967e0877
 PYTHON_PUDB_SETUP_TYPE = hatch
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

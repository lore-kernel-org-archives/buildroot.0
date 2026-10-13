Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706D1CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38E2960791;
	Tue, 13 Oct 2026 17:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoSztd0_ADGi; Tue, 13 Oct 2026 17:51:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 209D9607C2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913910;
	b=Fwee0CAqQP+GaY8krtHJ+xliaCU2dxGiFOkgdIQcGyraFJEEDWZ7LK/oXOyao5ggE+kn
	 WAiATi0L+zCYBdh91efd99pcGbKhQp91Ij856FFaabE78OCu8L4dd90dTfb4taF3CkZ1S
	 HY10yOCiOAb13//Lf7vMZMjYnJMQqFFKvoMYEf+DsDlu6ONiHY2UqWVo4Rn9IikIFr2G9
	 4AQU0pD0kUnVjVJL2WnHI+Ae2ELZqQY9btb/I3iYZTIcluo+3I8L3q4ZNpqwG3rtV15zg
	 zZQD1EDvovgAIDGgaEnisjYfv1cCbtfREUrA7ilHx7QmqTBVUGNP7SXFkMf6XLnJPcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913910;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uGK1UvPW0iOqyZimP3Pd7UC34PsP1QHQbfE0xI58gGQ=;
	b=Ysl2J7ZM8a5dJ2dlHX5Jbu0R3KjJ75flC9fi9yghVsV1MoepEcyqSKf5A/4ZdlQ2Xw/6
	 Gjblz5IPo7mlCPzHSoeQrc4BiWo1CsD303051qIBXXxZUKqnwWaWzsvVE+yInebOcXpIf
	 bsSW3/1S+GCyx96V6kPTkg31lwJF+G3TuTv/lnZP7DoXfeCLFTRu4HoUiANL0BYE1jMDN
	 ie4I/kaSzvuVZdatiBDnjq/xC0UOhwvhpJZYP4S2elOUwkperdd6Bl7AvQ+Gn5+B6l2LV
	 ji/mB8JApwzCXYmc6om7vxUYuSZjK/5KAr/+cNs/1bANUDXey2V1Yr2o3muVgUSs8Yw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TaGKo4Hp;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913910;
	bh=uGK1UvPW0iOqyZimP3Pd7UC34PsP1QHQbfE0xI58gGQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=K+2fCzem3XqWyX0LqICPsntsN0u/RJ36rvlXz2y0qEOy/ZWzO8F6gfsYV1SfC7F0z
	 /N3Ybl7vFXduOkzcCtVvZe7SU78BKEn11DU0OdvHV75oJgBWeFUZMAGCuq/tSdTyBD
	 8u/WVCGy3eRp485jVNaDnR4J6iLPJoPXddpxSzOXGeKf72KEAOuQzPTA9O14CYXuot
	 w8NGky4zohkVUkwq/DjFiZQwpzBtRBp9Ia8e+lzXYHL2ypGMHdsXjYH+pZhlR4QJ+H
	 uiCP4Qvf+2bmg3Uzn6oGkw+sVVdXCSiMH7y2ALw79Yx1/j3+lMar7POX6/ACQQxoHH
	 sr1ikqqt0S1lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 209D9607C2;
	Tue, 13 Oct 2026 17:51:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DEF562AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF613607C2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMOBMcXAk-hy for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:51:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EE2F2607C8
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913905;
 b=W3aHn71YpMVi9Zi6fnhfBXFknKYTq6ATWE3BNSJvMpqseYgnF+M4wOs2OifK7M/PPxt9
 ZWdzGW2pyRqmciJ0sX6lzjgHOeJ3meE+hDtZ1rDABvlXnbQkZYnL/dhkykNSi8qebzWJf
 gh7LIF8wesqOgMnTAdxV0N4n5P0nmswtGG10UEO4w/g+Mi5rF9rrFCxVr1Iv1cnSlK5y4
 Syn/XZ0Q/pVKEprkqBd2kuuM+zwDACFYMHW4Sq+wVR4AE9/nkTsaoqaK2VxRRZ9PdHz7H
 Xp/bReYwFs+rNRGqVW1unij9jDKvGNwAmoZ3CXHetrZoYo0yhfEZikBVE0rOZ+agPLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913905;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=kwMsZgtGHkzfKzVNdwSxB/aAsR6v2VAMyPTQi4iKOLU=;
 b=DAvU4n71Y3ZeE6g+btrS52IGeLtrvy11BF97kepqgtPocHjwwks7KLVprfSQTzp5RVkC
 YxKHr4SUrAJE7OoEqTgU/AnJR2YtKRAIpZ21Oo18gzvDVA6xwzasVyCkk2HJvWnPaIdqS
 1n7tE1MqqyKwniqR9I8HiAQ8Rzt/XpqtxJrqKKaobkl3/XtkpeH/1+CK3nfpmH0lHNEyM
 TEE/huhXNWqD5/+zV6/F8KrtrIi57eVoj2150ufASEEqGt0HbHubJkuOJQqbeB3OpyGYV
 omgb7/97nzWjF0e/MnlfCKy2pK43Rbhq5aGLE1uxAYnk9XXCfQyv/UzUmapIaN4yUgQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TaGKo4Hp; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TaGKo4Hp
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE2F2607C8
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:44 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-4ed6d69bdfaso1688834b6e.3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 10:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791913904; x=1792518704; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kwMsZgtGHkzfKzVNdwSxB/aAsR6v2VAMyPTQi4iKOLU=;
 b=TaGKo4HpWa6qR2m3TdJtJvJ/csD3Lq4sIVqW3GZFvKf2xasHuuEDPTI974hpGMZbRP
 dypPQGe91noPQnCb4iZW5vCiGaNEGNluXe4VjqXGjiQyFpnmOj1+MUS2glfumXjmoQWI
 sD+GRAir9/2sIc5IzmoPjJq/bGU1+ah2JeD8fBhaLwvOFsavDTcZaYNQbgCP91Dx4kWp
 49ErfVTQ/ulsNoURlZEjy3HiWd1naiyqRz2ZbJFHjFLQL9USsqDteixm8f6dgsU9qMvX
 WG2szRVxnZKXs+LAVx8a4GJxs5Thsbf2chCPP/LQuNLeLXoEwjuVFeSOywN0YcIClIEH
 89mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791913904; x=1792518704;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kwMsZgtGHkzfKzVNdwSxB/aAsR6v2VAMyPTQi4iKOLU=;
 b=R0E5KCjW3cGvJriL7O56cS0zxFOUPWWcGSbKqr6XnZvIqmGPKZ4rnrXn8FDEFOETPi
 86EinmToUyIVYXkCbWlsLfUn2dH2pIJUOGx1SkYdAe5B0CDGfiSmt0PN0XSiNBafSrY2
 EljSDK8TsVJoYZ0WGmKzqkMpjOQgHYRIsY2Mbmr8Tx9e1y+8wERIkHlAjcjUcaPCY8pU
 zKfcSNm2/U5ZFcREsTCWUdizSUVTLQjKKgHPbRlDldL4uqIv9PZSBzQviS25K4gCsKY+
 gSj8txpt9fdEx2Qi28VJHMzqJ5dbf6HbUttIHi43pDsM0XIclQ7gKwdSh5qVagG7E0oi
 7/cA==
X-Gm-Message-State: AFq9FYJKoPL2SVRJNBvDUS7Ae+YSTxGJXJt2rnsRBbw5B7VwzegRUwgD
 LJEyEPaOlITAF0eS+o+v4k2fsZAj9ZCBqaCFU6E4yiq6gwFDB9Fs+HjRNDIR599t
X-Gm-Gg: AYBFou0mpzrjp7/5ml1Fh3AtQtHEO9lSHVC2R5nthKPWp8U3VHwYzZUCkqUfYujlmn2
 wEs9dwmaB+RLz/kQwZseMqqZ4b1MgonaQKQE2IB3Sz8y2ygJThXchWEHJEVNwoAYVLELLtN8pB6
 f8WVGDgFSC9H6irHW1Pbp96xmspcpiWSnvguux/C4m30/Iqc9POwDFZDKxXiuMA+KJvpddAqcAN
 PoNbgXD8jhweBZ7g+F7W46lK62y4qEYUO6xKrTLKmLMiBANJeXku4F0mU0029enPFGkzGLV8hNp
 N8rUGGBKmPOPDi3ScWEVlTlwA1iZ0HCsn3KSOXuT1sXwl7EQq14Xfl1Dm4doqi/6BPNg1/IzvZb
 c7SkeWMbIJdtC0sBT9xLaSpXNYygWauq76JU/ESuSWoew2Tyr4xDt0eX/bkf+xjJGxdh3hygvoM
 R7H6Vikngr5sxRLIf6m/zwtw93LyIdaAQ5367kbMPPNWmTdZJodj1z/9eBDCmt32xZaKCjgclzi
 yI7Dv54bWY6LI82wKFQIHVdsJRDXQ/azOfZv6BhICenGA+NVYLJX3Zjk9fhgRw+Tq14+1M1gajS
 B6bX16op7jnrrVbJZgBH2QKqge6ZSUVmnqwa2KWKi2LTq0zV4/zicx8REV6w+FgYJcpOUFj8mJT
 8zXp8lgyzGw5lMBaJZgjvrkKd6UIzNNq/cI+HoGhb494=
X-Received: by 2002:a05:6808:a55a:10b0:4b9:e5fa:8906 with SMTP id
 5614622812f47-52bef4db3fcmr145009b6e.25.1791913903693; 
 Tue, 13 Oct 2026 10:51:43 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-50c1c120686sm15424624b6e.16.2026.10.13.10.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 10:51:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:51:17 -0600
Message-ID: <20261013175130.1822395-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-serialx: bump to version 1.12.0
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

Drop --skip-dependency-check now that upstream restricts the
setuptools-rust build requirement to Windows and macOS.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-serialx/python-serialx.hash | 4 ++--
 package/python-serialx/python-serialx.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-serialx/python-serialx.hash b/package/python-serialx/python-serialx.hash
index 36ef9681f7..11c2b7a512 100644
--- a/package/python-serialx/python-serialx.hash
+++ b/package/python-serialx/python-serialx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/serialx/json
-md5  e9646009ff5c2b7149cb7ef63df94c65  serialx-1.11.0.tar.gz
-sha256  38a4b60212d994449c9f3314c523ec629f1ccf629f4767b3867c7a5381366ab9  serialx-1.11.0.tar.gz
+md5  9b0b380643606d0d84339bbff9df67de  serialx-1.12.0.tar.gz
+sha256  e19e45ba198e919b86952f428376207c8dae39b741546e02e8e5657981cc3b1d  serialx-1.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-serialx/python-serialx.mk b/package/python-serialx/python-serialx.mk
index b0bfd48a61..0ce0a81112 100644
--- a/package/python-serialx/python-serialx.mk
+++ b/package/python-serialx/python-serialx.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PYTHON_SERIALX_VERSION = 1.11.0
+PYTHON_SERIALX_VERSION = 1.12.0
 PYTHON_SERIALX_SOURCE = serialx-$(PYTHON_SERIALX_VERSION).tar.gz
-PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/9b/c5/8c3f3e7985ca108fab641cc453ae015e1f6f15344064b99f115281c8bbdc
+PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/c7/68/efe61ac6dd5fe536eba0a3a23e92d09caa9e78cc59f97bdeb594a0098ada
 PYTHON_SERIALX_SETUP_TYPE = setuptools
 PYTHON_SERIALX_LICENSE = Apache-2.0
 PYTHON_SERIALX_LICENSE_FILES = LICENSE
 PYTHON_SERIALX_DEPENDENCIES = host-python-setuptools-scm
-PYTHON_SERIALX_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

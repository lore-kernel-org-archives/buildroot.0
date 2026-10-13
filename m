Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EF7CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B50CA607C2;
	Tue, 13 Oct 2026 16:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVUlYLf_K4tY; Tue, 13 Oct 2026 16:43:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BB072606A5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909809;
	b=iiDF2ZSdZPzo6XEbgPwNheJDNz7tIAMlw5SBozm0n+1a2SYRtEHC7NMBQaO1nFo0AgT1
	 ZU6vZHNGX7H2jH1QeERkIqFqRKY6TF5hkF4/h9HIXMVnOS6EryRYfQ3jM6G+fuQRhDGnR
	 EZ/ZgJ+9MTnwdgZKjzCQBs26nqd/hupXVnF+fSI7Q3UcAM1qGJK9dXnWfoBqraPdSNhLJ
	 YOxRAGqoBf15omc1QxmhlSTlewGcNt57MHhNp2uogUynjX3PDbdpb496eJEiDCCgoKl/y
	 P/fAfHrEWJcLPObwsaHyuWSxC4FpG1/EVl5poqlIHJZ2iorm5lEg8ZYVxmWsPijfSJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909809;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1cGdI8JiCmjKViBoKk7zJDkdY365X66huTBx7adwhAo=;
	b=hJXWFPoywnsVzVa8WDxhatX8UervWSH4OGPEt/Ax1HevKMIoMESr4twSPyl1wOOXW8sz
	 88Wqgz9V0V/gCBwngJtq54GqBQQQMiTNEImHeNJSveRz1tNz2sNhk5tmGe1eEMVFAt5Yl
	 S6oZ6P8bl9DfQjgBgD29MCFGU0uBMBNYd81yB2glYEu5QJL+e2ujlCTEyLXhHifU/AFeu
	 aWTdXxcKhWUYI1wPnhw5MYfNiBDAYA9Exv89OjNrlS9fBMMnZkuGU5Q7j7qwO/wrx5sAU
	 6nqG3PVGVnRMS9Z6i4FUiFrHUd9Usgy+7U5UgZ+1hNiCN/U3YMHAsQSqcCqnwn5iNAQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909809;
	bh=1cGdI8JiCmjKViBoKk7zJDkdY365X66huTBx7adwhAo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=m7EDZM2GCZZk7BsJjaGVfKvHJhgWY+50S9/+a3mPlltR7DEYsEfCIjf4CO2NAEz8O
	 ZufXW/ryw5CAs8s6/BAszH3AdLCIHc6O1sHpRXqwCZqVrFJlzWIRdiP3Njw5xqoCJJ
	 texV7EXu0a8p40uYAQzZmDJXq5TqyUKsm8F/q2Pfa56pqLryigk9YujMvNKEtjLEV2
	 VSEXSELV18UQY9cP1ygZ3c2qzIHIzW7fhx2YlZJ2flXlNfTHi0MDJNbQvD4SUs7JaM
	 WHZnOyfWZEp+7hfYnoXOW61CYKV4KxEGb0siYeybke4//WHxmcq4ucxupv7shS2krB
	 f5Uih8H3eCBEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB072606A5;
	Tue, 13 Oct 2026 16:43:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C40AEDE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4C104007D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 573ojuWp1J3y for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CC87A40049
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909804;
 b=DO4WuS49zGNs2GFP8cbtWNVkfxNTNe4oWSZ15eD+XbyCDc9BKL5TjMtgCrdJQAe2VSt3
 U4DER1kNSraJlH4Jev4m7k96CIDAF/HOTnGR5uUDRnO25ntUPcEAQsOg/rjFUVctzT3s7
 2ejNfUu2WQxybhTaDatrjcjMt3p8QFSwkf4+6YJ1hIEyq48KblmA83URej7VPqOUj/+1F
 7qs7CxuhivjeXZaRKOuJWj2QB1BY+L/QUVah1SdjbGs/L9UIoch/TLocnFYWpFiLarHjL
 LC4a2ovCuwTrRO3wHrYmZtI4gxdNQWbRFXFh6yNAELHvNWIbNmU8wFSJcDsLovnW3FA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909804;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=JlBXhaob+GCZUAMWCzpyyt3+yG2lDZcLqD9M6Oc6poc=;
 b=EuCbq4Zffx01pbC1b4yaT9tjs3pVNt3yfN0UJcjg3yMAheg8nGaoPdHlSQ06m9Y7KSUw
 4DTyUPykB2tZ2jvxALbNfE2JfpAfnnUxqywriJH4Oqhr/tcmLwGpzC0S7bk+3Ry3fnXUL
 4csx0PJGh8bhsb+qQzBB8degngBXXZzU7J4AWbFkeXi+wHZo1ihqxnzVFbthr2oW+t56m
 1uRbMIcgY9M1/tlPSdd+3CaK+u0brLvl5QFCRniBJc6Z31Ffz9KVC0zZcTbnnz5+Patpm
 +XCFkUf86g+JBsoLiO6LRo/PD73XPn4lHm+XW9TkaRfSm6AyskFtd5gs948WEy6ZGDQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PFaE32Qo; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=PFaE32Qo
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC87A40049
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:23 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-81ae6aefdceso60798a34.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909802; x=1792514602; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JlBXhaob+GCZUAMWCzpyyt3+yG2lDZcLqD9M6Oc6poc=;
 b=PFaE32QoauPwo7m142hOzwPizcspfH4J3pQl7awZ22QigcLefWtqnB7UTdejC/cbkZ
 jwMG0MgGQz2aEmEfYnk3rxfhq+4sFBXPvOMesowby+UIumyq6hKQ7JLcdOku9EJRNdhX
 shKAUDz6epKexc+8T5kZlvJrf4e8riumQVEhcnUgV3zz26S/iEsJTHCkDgSLWNYzdgst
 ztBjUSYIDF+sqB5Rb5QH6Kq33YxlnAFuVFZumxFPyDcqgvQ1Gr512K+5R1wUp4Mfw9Mp
 Vcs5o14TH8IroeJefmt6l0/LX++TPhH2ei9GH+eaMZC4yrXbhaR1oFhmafSEzKUCoBwy
 18eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909802; x=1792514602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JlBXhaob+GCZUAMWCzpyyt3+yG2lDZcLqD9M6Oc6poc=;
 b=qagLfhl1pjPHw1dUMeQiU1OwwpA4KYdnO+cMjsfJOseaPl1btaKybpByk1lnCFL+wF
 mLC9LBniXJkd2fEf1Hs/xiKI29nPJsGM64siKlHvQ3Q1uzY5gmaPGqZFjs5JZ+hzI7iK
 KXDWf7Qv9tR4ItJ6d4GQpYMwqDQGtls+5P8BtBRLnlZy02VyWajDMBfko3CINazPqakK
 CuCPvv2SrtJ9FfihXOoWDJ0SyYBPUz2BaADy3IWIstmvzvgacWX97VgPBF3Qy+Pg661B
 VOqG/HNwvoMquKfSx7bCKscWynsKgXh52Tm/H3sk8Axtc4xYNmSG2FQ1VW+Nkkll9Sat
 Xscw==
X-Gm-Message-State: AFq9FYIF9sbUUgAXghLgI6fi3XKAGE84qB+LzA++6rHHnDdYvJ60f4ym
 RYdHndOw9uBvzYkn9wDDGmZFLqOWBSaNq5y5mIre5cm6HZTdc+bzFK1DZiZ+0Q==
X-Gm-Gg: AYBFou3Kh0tUX8TUGGRXswUjEq48g223cU+fQTicRcaOA8R8giQ1Ndw6hg5GzLT/Qsj
 coGHiuYSmpMACwWytUnDGIJsvjdMsZCljwqdjfyxT0humJ0QWivVLUhpiL1Wl3LdoLKrLsvZ4R/
 ghUKahzVisWHyEOleN72HOrj5eogXiG3zSsCl26lVt/aqwdY+zL16QklJjOiFNpe0Y3NVu+HiFm
 ynWJ3Iom3lHGs1JCTOItN5ukhsHGrB4sdm7uocOvPg64u1YU2OQgPmmNFqAY4w5iDc5vG8l++t4
 mbw2BCtKAG4dnaAlHxIHv+NiYsYmvBQdt4/B4iV5q0OLnU2Fkah2cvrsNrmWJViVaBa+ROW/cYU
 famE8ftNpQiIrxmwULtoo8fcxKHXWd1635t1A+pQdEUOXJJfCvkYG1Cghoc9KCDB7we3zrMg+xd
 DL/w0QT0xRog08SIhCWS1EPRigzS0P3PYJc1z6Dw8rOLL/3plLyoxW6FZHVTdc+3YhgT6BFhw4/
 Ldw910tG6T7PkFrf7cF3tZDBxJysCmPN2ob2yaeeRg6HVFa4oZGCldNr5Ss+DkBMMsqiRHRvgeE
 mD8mpJcWcaHuOvLBxVNQ88tBcTdbqx65ZDQUL/hw3CtGYVfOpp7558GMNPVYnU5mJwMTrVhmu3c
 QVYu370D+CiKUHtkEIM0ir2j5lO4ZOLIQj4cX/HTgYKM=
X-Received: by 2002:a05:6808:e88:b0:4b3:7549:d3c0 with SMTP id
 5614622812f47-50c4e67e7b4mr10193265b6e.18.1791909802469; 
 Tue, 13 Oct 2026 09:43:22 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:03 -0600
Message-ID: <20261013164254.1476592-17-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-opcua-asyncio: bump to version
 2.1.0
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
 package/python-opcua-asyncio/python-opcua-asyncio.hash | 4 ++--
 package/python-opcua-asyncio/python-opcua-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.hash b/package/python-opcua-asyncio/python-opcua-asyncio.hash
index 6fbb632cde..2911984494 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.hash
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncua/json
-md5  0e7ce8a935969d74a4e14147d4514c78  asyncua-2.0.1.tar.gz
-sha256  f9f73804b4d56a12aaad7a2f062b15f08c856718d93a10c647d82a9f38f787df  asyncua-2.0.1.tar.gz
+md5  3bbc7886e7686ba4374ffe2e9560d95e  asyncua-2.1.0.tar.gz
+sha256  d741f5e21f189ac0a45b8dda13539c2d49d8d992b9b62d2758efe1bfd3d1454c  asyncua-2.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
index 15a5e9b525..4c81dd8d63 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OPCUA_ASYNCIO_VERSION = 2.0.1
+PYTHON_OPCUA_ASYNCIO_VERSION = 2.1.0
 PYTHON_OPCUA_ASYNCIO_SOURCE = asyncua-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
-PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/d9/7d/14830444700e18631853c417b05472c7036cd266e90866e8d0ae4bcd7c72
+PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/c6/90/13c47fa62aa83f2ed98a931aa3a7bcc77a3e7163400eb9f2d9e1d3c9df07
 PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = hatch
 PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
 PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2028CA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FF76813CE;
	Sat,  3 Oct 2026 01:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VnzKGS4PEMSz; Sat,  3 Oct 2026 01:33:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9A6E3813A7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991237;
	b=BEi3/ZEXzK9AFkvnPsyB0LRIm8TKrfY/kXFli960ejMD30p8N4uE1BLZ33Xxsk9pwVOK
	 qNefuvh7kzhZeK/1dCMu5lKR/1UNP7Q7IIPSVO2unkkVtqNhE/d8AU1QEl/xu6daXpd8S
	 hJvx0GCvMJ6Es9Si9H784ANcqbyfFYkZQyGJ35l9hw8ZHTEPttf0wT/Ti+0b05lJUIU8W
	 cIckKP+/IGq03xzdzAhpfvAXXbccTKuZs4oXUq7CmEdqY1fDNlTTFVvf0V5ns6h3UZpDH
	 K/fU09tLJ1mo4WKsRe8FRCfI0EwEBeOAS2f7Fkcr0Do1byWu+ZBzMFUnRY5RzWx09Zg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991237;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tnss68LYYM8jN9T1eZv1yecFfxSPdtQiTRqiQrKVC3o=;
	b=J2QuKiEHu1nN9okNJP23KBGU7TXZzDNn9BT3i9m9RFfF893O5TRsRmRJ8Xii6JD/t3tX
	 FuE2+IHCTiI0yZ1rI+fHA45EJM9GYKMFOCUK48FgMiDfosGg+9lxrraglERPMPr1LcKJH
	 9xRkKF4j+cNy42Mt5FracvCyqBQmm8bs/MW2+pYlXeB7VrZWXDckget9xvuOVMCF2byts
	 99pXhvzGWugndB5cQmXq8Q+TY9RAmU5PwE/xn1ir25BIbKeliXAQJB5d5849w9EmZQNHJ
	 wqx/5EnQe7ZYzPzWVBlsKp3h7Y4UgHK1/ufwD/w07JKgJwprtJ5PI3h5de92qtmxrhw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991237;
	bh=tnss68LYYM8jN9T1eZv1yecFfxSPdtQiTRqiQrKVC3o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=BeMYgdK7C0Kqsbl4/FN8SWmT2v7blmIJguRyH7/zTL/1yEjzdeoDHopxseYNfjtA8
	 OHBeSGtK3ar5hzfz7vGnPhvFrzBiJ5jCdwmqKK6EHMR9uDGmlvCQSu/NFqEO83dRLc
	 BnNsYOzQmFgpB7lBX7ONy4vsVDPrr94DGYTcegaLXV1l1M2SH7fk+iPAi2nRPs5uh+
	 VGT1fe+jZWcM4ba/bXKFbI1V6UEUndIBJ9RKBWC4SNAvXv/EO+xHzwKHjN9Rk+gbpB
	 ZFKD/ywzJUm4heLFTF02nBTeGnhsjLpTv2chbDh510+XGkCEygiJP+FU1F22vMbkim
	 LKCWVqv+4IczA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A6E3813A7;
	Sat,  3 Oct 2026 01:33:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 286071D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E5D260DC7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s11YOW6eK_hx for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 284B360DDF
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991234;
 b=UZiuuOYTzuySV/VUUN/8/+9avHwg5JJsHvxS9SEp7pBk/LeLOh9Elpn9doB0/y3oxGSt
 MuIzQKD01PVJUQUuCA1B/5eL3sb1yLryLGxm+nftj3X3OA/go4USZ2lkFWRxR1FX6I5Ri
 YNnhI93Vtrs/CAzB1Q3aKQlwhTHGWaYWe5PuROFymJvM34Z9c5swBM/FQz3fyHq7wLopS
 s/eGS7HHOxQNCZYFi0nJUpV8pDd/MSphVoy4wlFhm91gbR/QyS7f4y0FU98/oV6tviv2I
 PjsIxoeo8+hjFJBysxX/fZ74BHL70E1qpPczrNKXHNmrtmKWB64PLimapYgdEruzEgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991234;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=JFVYjaCavAcp5nf/Q3RwhEVGhwsrLORe3vAuMQnN2XM=;
 b=EgTvJXqIBnUJrQXJW8hwrdVIO/0KgiKssw5YHwFwmjC9rYEEJeHCBnrPitGugW2l2sTO
 dWH4rujZ0EQmPIJLzHVKoaLliEOBl+0FI/XFEf/sLT06PF5DMfb4W+tGA+a+fnHXpBuBZ
 nrsfRhS1t4vQXVmJY4zEe1i5H/3lPs9JyALhuboGoqJNmOFqNrFPNAHpYnY2quRZl1cGk
 0S0wGGyjwK+HmzYhr/+HZz0jhnIZkqBIIOjQy10ML6lSmZ0snthAkPTOUfd3pYzbAKcyA
 1aR8QoLmFAVNXoJk5R8bkt+qLjLbEoKv517v2dy4mShY84iJQD3nKuyIqRcamdyfy9w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=r7Hns9VE; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=r7Hns9VE
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 284B360DDF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:53 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-82395ae2ea8so355081a34.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991233; x=1791596033; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JFVYjaCavAcp5nf/Q3RwhEVGhwsrLORe3vAuMQnN2XM=;
 b=r7Hns9VEeFwtOa/PB+IKbjgz4FZU0fNY+fYtEOj0iwa09wMJvIglwYIkQ3HvxMfabH
 PTIwrk1Ug7gVxzfbdK/6GFOzTG+LlnfLNRDXGcJ2VHAMrcxCsoJqDjfJHKf7ycZKjafn
 l2AUyk4XUPSXe7MD2um5OTGNNJ451hu39ZvNilghzIn5ymmb6LT5GKZziUf1/hNXT/Qb
 gb0d7GjXZtRWcwnHPm/A10dJ8B3naLZzJl/p50ckdrymMNovukTo5D0baAxH6dO862nx
 EoE1EzK+2kps4GxzCJg+pTywozzY6lIe+o21rtqFjoPSN89tppBc+zdWBs0SiGCcnu7H
 +Ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991233; x=1791596033;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JFVYjaCavAcp5nf/Q3RwhEVGhwsrLORe3vAuMQnN2XM=;
 b=LicEuxwa3la70T3e9cbcMsnKjv5pyo4ZuU5Lu/xZhEnpQ9jjWr+GubF5qItKS6ucIc
 QtcZMjTDMYUPzUzk1gBNA1L6Eus+KA9woq4olkmWDDFH9xSvXIzqIORYTW4M3QyW1IgA
 kxWnlz4Nq5K97tKin6mguB8nNcm08sCRPhxnnGeHHjvuJbgWA/Hz9j+hShkaHX/mGd0Q
 m2d0MeG5O57MSpxV6qiwOFWtIRYhhqdfVWaFqBmiqwdMQCKVdiYW60zcPcvP3JjCH+8v
 KgjGM2ScXPCwOgAS2ZZ9tmMY3iHDcSrbeJtaM09tVHyiVWwxjTfIOwNxgalMnr9fZZBi
 dnUw==
X-Gm-Message-State: AFuF++ljxMbRjv0UxLgIWGsu33jRGainw7Z99tEz+rC04OZn6vbMLKiY
 wK/OCDHewWGJbSNNZ+UjlbyOOv8s5pw8RqLjnLStKTBTEne+eCXu68hQt99pmw==
X-Gm-Gg: AYBFou2O4WVZwIQlgubqgqYE+psU6jX/tOzFs34hMYk5ZImAyLEc9TlfZG0U44LjRDr
 lls1RB7LGbUou+4ohiO3v+ZiXVN6F0J7WqJMi8Q2M70qms0kzgl18VyTmgayQLu4BCyC9/vOpS7
 D6T9m0RodnBDUxw4tsEWh1s6rljAy/EgOm/c8f8J/dYY5n0WW/pPc0sPNMiISqUb+4MopcRKDxG
 KndNMg25NAi7hOUfW9AmybeFuhpNGzL8lCviKUR3oIPB7h+6qgFEzsQhy0sqBFrImcNyCnLiX7P
 mduDUQVZ5eRkrzN35P5XttVJ6Hde+lxYOYhlqscDI444uZxwlrpWmT+aYK7et/f4sGYnMwvNxdA
 PdSxPkIfoDOzFpNQKw6R2/wMK12agy6Rrxcu7Q3QdexewwVEw1n1aLF6zB7ja70ROGV2Z96oDTw
 6tFUaG1VRByJ8a2+n2AIpJ5XYbM0KYib1LcdHOnnlhHAX9yD2xJMAsuk//zZZOZjbNSwSAFARcH
 M9gauDD3aDVmklGIEKOpOldUY8ME4PoIRkPeRiYOzY2FzKT2t4JggThMtvyCRHXg435NMhk+rl+
 C3ttmhBPhnYhUErVptlQy4XA7Kjyji0DDhsQ15CXF3UK2/PBwmtL0GkxP55JXr2NRf4tELUx4uR
 o3vJwwNB9Wm8XRXt3YIKWQGCHhtCzurtBDyUdkfgKDQ==
X-Received: by 2002:a05:6830:83b7:b0:805:bf8b:9523 with SMTP id
 46e09a7af769-823fc4402c6mr1253205a34.10.1790991232954; 
 Fri, 02 Oct 2026 18:33:52 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:28 -0600
Message-ID: <20261003013304.400979-28-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 1.1.8
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
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index ca76cc9219..a1652f92b0 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  0c980e5e003b197f22c271da5fd72875  tortoise_orm-1.1.7.tar.gz
-sha256  a0f0f27f9c92547739f0a3f0862c257ab64d8baadbc0e548cbcfa2d70bcbe275  tortoise_orm-1.1.7.tar.gz
+md5  d31bc68389936220db65f389df34ee7b  tortoise_orm-1.1.8.tar.gz
+sha256  09e27be9db148824dacea470d01018ab571676f94aa5428a05bcaec44c413ec7  tortoise_orm-1.1.8.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index 48a7e84e6d..927d8fda97 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 1.1.7
+PYTHON_TORTOISE_ORM_VERSION = 1.1.8
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/1d/55/e75d3ae0dd2c96cf961bf068f465fb62ec481d802beb65f406620bfd40a0
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/10/8c/059f284ed7a08e9cf3a45973e2b9d013a8f242fbb1051a06c3d60c638920
 PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

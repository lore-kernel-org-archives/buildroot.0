Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6030CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AA8441054;
	Sat,  3 Oct 2026 07:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4tChaC6p8eE; Sat,  3 Oct 2026 07:18:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9353F4106D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011912;
	b=RqcDw5NsbZoidsQyTKPtcWHdcZeglZPw5rzlT/Ii4iQZLE6iGpMShg2AwTsruvw7os47
	 XGXiUaP4LZD2azVVqyfaJH2iHRB5Gsa/QJ4NkL1ADHTMVojvjbXSmTpB5a2L4gUfkzZdQ
	 TMGUKAbK73lS5TCoW++oRLDSZAGhY3vs5TvNKMLoB1ifFPHGx0MZem+oodZWLLSOpnbul
	 enNa6ickDyCP0t2g2oNKh/EiDX7P1GVgYNC8uUmSFC5zq1ckPzOZhEJptaSMMI09EwsGo
	 9YrcA6ccX1d0n0cp8O+J3jbgKT7z9TmzJugzw4zMKhxABigC/hhHshumCJI9DQcmCDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011912;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4Yc1bG7QnYNqOQGqMhd6dSIhxqtEFaFbj574Fq4Z0V8=;
	b=gpA4DqooVDNGxxnSMFL2uckD0aN9+JTbIUd8fbT9VhdEjcEsEDtmYZRODq14UQQ+xQUZ
	 bA1ZTIaFvk9PVQ8NaZ06L0KSsmMIMWbQsLTb647KkHQp/HrrvXdAKRwd9OF7rkkHJCIrI
	 pNZ2wCXQPUN5VGB68o3p3w3anTg5/hZzjessj3VZhqpr9lAU4Zf/0GawzzGMH0ljpNJTH
	 Lb3ZtqHBFs7BDSkyPBM+BtPbrQnLHl0yFcyNme6uRG/hgIgE0CYz950XfHfvKS8vXCHj/
	 klHbjspiwEm8qsRSUD+u8n4U9SMTY2DEqEYAFlp2iYmVsE1ZtfdYXoz9T5Wyr7EPq8A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011912;
	bh=4Yc1bG7QnYNqOQGqMhd6dSIhxqtEFaFbj574Fq4Z0V8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hY+AwlgRPqHWSJxBrpkrhgfjur7JG8K1EJ4ZYTTLM1FfqzB7pBa28wcW5+wJQOTBP
	 jYH9KSkQ6Xvh4bPX8I01OC2IfTE2PP0tFABtjWoI/Puoq+v81PokeoP1Lr3AIbOPx2
	 Kc1tFi/Xxa3CnSi4k9qKVs+SeSaZdPpam+LMTRf5WyNTftLa+8k3ywu4b7dzs7II7r
	 C4c/hi/7eikU8ctIHsNDpU0K4sL2nbPEXagVnx8Ghy6MKq6jitLDGx8wDyBxbVcMfM
	 yA9z4dqnQtwK/BYmpFcoL5glnpbVH9iq0AWDCeVJBs9Ns4wHOhUaXuACNJwFmy3nuN
	 AC9LVii8vXV8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9353F4106D;
	Sat,  3 Oct 2026 07:18:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FAD934E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05A5B8110F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqm5z-ayJxGF for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:18:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 10C6B810F2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011910;
 b=Ye+AYKjT/uJNFI6cpCL0ba3jKTOb8hN/t3EpX0/Jf1SKtWiCc723u25VAI4iFwEBrFpG
 8ZsDqEq3JgHMvPIAfYxLeonQxajXgKR2uLdviVGKCoMamt95BltaMJH2QtfsO1V4lyM2N
 umDKJC/BBFMnS+kiHlxiQ7pSOBsXKvDYvkC4B7Njz3z81F8kMOsFDioiuNknc8ThzuGt9
 m0iW9Ch7ADeAYT8NoRGhCUvKb0KmrAT82PDfAojDkOKDG/gM15dktqlRfp+V84WG3Nwei
 wxTGIfh6sXpEq7QTu4Pb9s90zfUfVWheY5HJMBatFiPoAtaSdKe2edNRoGfRrVjJLkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011910;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=/MFg1CNgMPhDMPLCAq2ygg5ye4sJgMDV+dn/idwmFME=;
 b=iBpau7mYy5y1E0z7OIPr34qUH3JJRerZ7c2wkIWSB+azVd0YRjMrermBFnOUZRwuwZam
 XduBHy0F/HEbR4RWzgSZQYhfGYzkAiEc1uZCsvARfwbBFyzpq+L5n5dCkVfRG/C4z1yqZ
 YfJaUTyvLPpzkJqfrUaovPIb90Fzvz0JSIpQfLt/7lfUjOOCySTxhElggTsUb/Cle2cqX
 JWE+ERvwZbZoql50+kYCLQoyv1HHB0MlgEeN4SBc/z1F+AjbuXO9wlSVzYLzOCXS1qlAp
 KLAg8ORXcmIiZ0g78Xy0gA5FOep4sdq0yzJJ45t9anrLcD687VdeGKULJUeaFwOimmw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VCI4BTsT; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=VCI4BTsT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10C6B810F2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010937;
 bh=/MFg1CNgMPhDMPLCAq2ygg5ye4sJgMDV+dn/idwmFME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VCI4BTsTXPtLj9Uh8BPLuMkRciaTgIvlGIpuzpAf5aCOGNPgMH4ixgMofGdeS/vne
 HJszpg1vud3U/+RZQ3FdIv3qe05TkVbK+nMHQglIWkVWXTlQEU4UOfz6XKo8V3+RlX
 sLG/wuA9TkhgKZSiKufPBKhy/DRdd293xKBmk48ma+Nf1LilbvBsCwWeCHLM1N6ylR
 54Q9piKfFmq3xQvybH/O+pPnA34GuiCd88Irn/lPS3h5RGJ3L+Ipdg9ma40jJ9U+Do
 ZVsunpPS7orDq43Bf3pXPtQsuJeRNbuYWm7JK46y1crAk5JrV1LcBZYZ4mwHNf/wrT
 eAGK29dxKIaFQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 +dkg7bdsz+Sz3fpCs4hwY6ZOMUehKxjN+KtrDeuCmoKruXV8hZJaMQfzdbP9GgdACmdXYxPhJjt
 FsPwbgZi+dDYdd2nI6Sb80JNhV6e+/HFFK72oP+PU3AsSs4xTfxzMBDDda91D4vpHKzl9Ws6lfU
 6Td7uVDd304/SGFZShO+0Z/fLxuXULJbas+gziVwO9mBg72P/MV3ni92RaIQivV41NlSRpNUqEk
 FMLkLTbn0fq4tbgX9hx1u1jPWOuDYKQ9f56DakzPfIcyMwb0wD/ol8GNwUiL7Mwynz4CFl5MnWb
 VMjlpblkY0sjKuYZe1ac8+k3mDydSV7LUHrZC17HP0OHb0h8DPgWsqR3U+UioCWYBbdUPpv3OOb
 byRBd+YJlt6SSuqwWZP0DBrPTECu7OfHz+3rCJXnfaMe/E2UHhsO9H4FG7WH+qdWdOH+MdVx83U
 LSVMbqv3WV4YEqYpoj0pvXtT/0SMDjv5sM5p2LDUngpwHspJLIBhXf20hhwvH/VEKkDa2FJgFJ2
 K0TC1xpU7bU6F2gEPDmD03BIdE7D/EJIsx+J9GNc8EEEB329s+p2Wj4k7cM85jvTLusHPm5SJWV
 j/ulqMJH4hV1SusCp1262ZYvrnZYk4gf2IJaSs/qwnFfDagRpMOpE3mHoLGQm9vp
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8B7DEA4C5479;
 Sat,  3 Oct 2026 09:02:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkc-000000007Zo-2QyD;
 Sat, 03 Oct 2026 07:01:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:52 +0200
Message-ID: <20261003070128.1295458-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 020/114] package/python-dtschema: bump version
 to 2026.9
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-dtschema/python-dtschema.hash | 4 ++--
 package/python-dtschema/python-dtschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
index 77da1aa801..5acbcf0e05 100644
--- a/package/python-dtschema/python-dtschema.hash
+++ b/package/python-dtschema/python-dtschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dtschema/json
-md5  7ab2a44de9a5c91fe5fda9f45c1dcb4d  dtschema-2026.4.tar.gz
-sha256  10cd0ffe239f8d88913390ac5d8213fae382e87a20643b21c65714ded82a4460  dtschema-2026.4.tar.gz
+md5  5409d40ee24f16fdda2814c63ecb9a4f  dtschema-2026.9.tar.gz
+sha256  d50aa00414f09b7aadc776afabe623915b8f94e59d6eddef80920d6505cba671  dtschema-2026.9.tar.gz
 # Locally computed sha256 checksums
 sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
index d61592004a..6f6b0e6b18 100644
--- a/package/python-dtschema/python-dtschema.mk
+++ b/package/python-dtschema/python-dtschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DTSCHEMA_VERSION = 2026.4
+PYTHON_DTSCHEMA_VERSION = 2026.9
 PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
-PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/f8/f0/3990f821c088a6107ce1ca1906fd123aebf3c2a0a4c82cb41d7d52664bc3
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/25/61/0ec805ea47bc1411bcecc65d2f9fcb129455c0f859624fdc06c4a22f8579
 PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
 PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
 PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

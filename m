Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E387BCC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A61B4607BA;
	Tue, 13 Oct 2026 16:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGZERfh3GLEG; Tue, 13 Oct 2026 16:43:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AB7A5607DB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909817;
	b=qO6+TJtPPvcfDdvNlNdH7Gl2qzPoqzYiQVsXtrek1df550vbMnh6mSipecbO/s7izKrn
	 LicNfh5xycFCLP/FMg3IMtSl8aYwG4pA2oH/sOGLkvttGfah3cF1DXZlAk01TyXckJysL
	 DK0NueIDy8SPzAAez99t9guiAA9qTqaBG6fdvUch7OaWf1XUg+QqB98qNtEWg+MwzH7yc
	 FhZ0CMMKLH37mXnJJfYeBKx/DLoQboORvfKAaOMauG/sfUgrbkfwjh2J3uZFgic3GrP8r
	 kwSq9x0OwC0wbXiVdog+XB8EUFeIno3PmY0+JL51Ii+BU6d0NM/qw9cU0Yi1nEVztwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909817;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IRZDOeNPN4u+TVVoNFCmbJczxVEWeRg3Yu4OySOzbpE=;
	b=cXNzVtBoEDCyUIfnp+F8JRfnmkvE9+MjiiR0bCISwWjjjsRv09uzNIuu51Q7Ld0XTIzm
	 52rRIzs7UhrvP8TIJNAin94IJRp8TxqKNpNghZX3oNV3aFh854nn4rCOWanNHFKYabV4u
	 yFHOxwiHuBGhT2GfLJx1pyfc/sOHg0h6sbiOB5jjxFVhfaeq6WZ4BwqmXWVrFiIMziXv7
	 fDMwAPH8DvlP1smoN+e4ztsdDiAvOt3fX31IwT0z1cyiJgVyEwlk5NDggaFrujFkP5ukL
	 X093FApXEMjUUjbMwJEYA6z3jcLUxwrFN9gNOu2VW5gdIM+1mQoC0xz7rZYFFZ7kEpA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909817;
	bh=IRZDOeNPN4u+TVVoNFCmbJczxVEWeRg3Yu4OySOzbpE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nkkgpsRMtGjukN6ZSrIHBRNvP5Ff2zaLagothUlr6BSqODvolp8s6YZMcdDJQZdqO
	 yqsdTJNaTAYzmbYwkc7dMas5ZGtZPgpgXazTjCIwdX2KNPlM4TP8cQG3qgcK04fY1E
	 Nbgsyo+ZIaTGqrlgavCO6gxVwROl+bxOuaVLMRWkJyxRvH2Yw4U6BitZJx8DD1msIq
	 S7donHpP6smBBt6BIPsRLaHS3P14yYar7g2/5Wc6oC5gcjDQTyyiNGTCv70eso9g/0
	 7GHmWnENmJDJM2kGtiLp16/o/rdMG+k15wqx49IrmaxH3ciewGhmb1lKQf2NBDCMjW
	 A/+reGTGVIy/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB7A5607DB;
	Tue, 13 Oct 2026 16:43:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 519A8DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38469404D0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWLc10hjpIo3 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 31DAC4037D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::30"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909810;
 b=gg8Y8KvEpSox3mVsxRD3mvJeRLf39pOAlUzr6zIvDNNliOOcepx5XJKGhriOrN+tYZOW
 Xg8IM2wZltJpTIJqkL3K/VWIhyu7Xsg0QecgkD5HDMO4RENE5r/7U4IDq0gFPh+U7Kpu0
 HT1ucjBC1I7IQnA6FSHEl8lfwuNH5AcaJAhXmZ0pHdhC9ZibPWhmPzCz++4aL+6S6vkZe
 rJJUjMFW5BovJ8hBjX9xawla+qgE2LyQpEL3DRPkNtf6XlQyfw3PhaHh6/I8CTtjov1JY
 JR/GhTRYiR8kvVHoBL59+MrJ506hFuMx9a9Kv4Z5n+bn5AM4kEOwxgwhOX6/5ZODeIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909810;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=A9ZGdfdJDLJWiPeA8A45rr0wSO4jXk/m/yXZgXS3P5M=;
 b=MjfiitTBHaitODBfzo3LuhMpWf568FpSSM58QI9Rx5cl4vgIQcaNsrpL21KrMgCYOguJ
 UJFtxzA+T1Q5l+7LUaP0nFZ0+qc3zpT4kNUEf90ykHxl/YlJvxeuAnBVw5C7Vw2CiE7Hq
 cCcMi+MAN4MdidCgL7BShxlw9keUC1JPWFaOe8xyEWW5OTJVbS6I4DHPNXfjFbZR7HpPL
 tPCKzDsN01XKbGOw/PX+gIkamnC1aB+NezKYwev2TiqjpoYJvbJ5CWLmpYo2RDWgMQS4g
 m4b1yFRgLPZD87weXBLNjaDF48yOtQWesn+Nk/iAQSwInA7idp9UmWMJVg8jzcQ9McA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=cDO17yxn; 
 arc=none smtp.remote-ip="2001:4860:4864:20::30"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=cDO17yxn
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31DAC4037D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:29 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-49dfaa16190so3789660fac.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909809; x=1792514609; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=A9ZGdfdJDLJWiPeA8A45rr0wSO4jXk/m/yXZgXS3P5M=;
 b=cDO17yxnPcOClbVjsrUCkeJZxTyY19v6GkAkjC1j+fjtnhdYG4OgiJITPnPphmIOyo
 L9CJM0YW94//xYB6pwLs4DUNZKrMye2E1k3urcYPYfkm9NFTZ5hhmJf6dlFdK/fcz87c
 97SCRlz2jy15MxpXiSd/oPGlqWsGj2CcA+gkdJrYZndSyHIyVownk8vsV/DI75bvHYdJ
 80LIpQ3ObRYEmHbJoI5ZLXpwvmL2H8YvlP+wm2Kjwd2vPoyvh9zeKvDfUekiKqClabhN
 iJ9HrSaO2pOooQ3F3IY1Kkg2str6CzgLQ9X7XZkWg72E5TMnM8dTHVxSAt8rOVCQKjj5
 MOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909809; x=1792514609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=A9ZGdfdJDLJWiPeA8A45rr0wSO4jXk/m/yXZgXS3P5M=;
 b=fIFIVpYTckxf1gFYXOQgEYq7K2CXF1OIjVSYqSUBe3QI4jmImtipHykEeOWmKKzDLW
 IVG4a1miL8127LzRlzeK/pK8vYVpeaZaTVZt7miprRcthlX1vXHHxJUttte7eI4Sx0qZ
 nnqvrfILoqtJRxuAHGtPRqak6UaQHxfZDpSOC90fmzufNlU48dEyaoa5SDfmdddzs/Wy
 V/c9eev00LyzwkSzM0VjLB+3bUygzr+QD6Ug/Tz/fWCMobDucjWZ0xv2xf/OAyZqXMGB
 ctrhUnqsvf1X0CyPLWu1yrpyZcCLPZCrccZrxYhIQlYO3kv5XHafFr0niHWQTUxlNQW5
 tmBw==
X-Gm-Message-State: AFq9FYIN5Za7imx/e/4hLQyDHsjtqix4yMpxcfM5u7YCXsBI5NXXEQf/
 6wkvFHmPUttpJjAjAQ47e4H0ThPArnMNPtIEfjsUvluqO7yv5kbXvQc8cy78Nw==
X-Gm-Gg: AYBFou1xcTMEk+qyfYdj+laCi1vAIlYQc83s5lHcc0Pp3o0h0rvdE81sIcAW7Y4QTgT
 AP/kyKtJU80NWAqvoaUu4413L2Qh11gfyHVDKneVM8N1jamKG5iSzMTUaFGkjNeyp+St0RHdSfO
 yajZBFq1+BeUV+GXrrIVmAyLALJz1/fqiKZjQquyL2yy26BVKJPe8hbSxdOvrySe/TgtFWgfWWn
 2Sf2qCGAxu+tj0a2wekp2k8qO/Q/bgO7CBQj/tVGmYU+znUT2m+n1sQqsaUaCfXgjcJwG3cc9df
 4/uEqnW/UNcmxN1cwSxS8uZeG8RO042s4Y10tD3AgMuyx7ncH8UzBz5+aCT3P/UCO19K5vcPVFd
 ukWbvAxl4gB8+5Y6OKyoyLf3AnOlrrNSXlctDIlx3Uj4CmnpGj8r6zDykr9d0DqoKgv7NxTPKPM
 NlmdH6rFRxitglnkCt+K6oGDdyHBSJb+x1FxzHC4AhonaA+6TYDdPb605nuML8ilQZY9iOx3yUV
 CnGJedqwfPnAY51isnb7xI7URpmZ0GIWDJ5CA5fsOiObAfQpSmTc7KwYOAHmj8VFTS0mqBMr/Mn
 K0ezK+AguKXduRveg17ybpd165hFUp4DP3QS/WvEUwXh6XNukn1EhoD+LYbWOEkmROdx0XZwqqV
 PXH3nlGBE0dl4oBxtUAyrr4QNTzDgjbemN2fM7Rib2dg=
X-Received: by 2002:a05:6870:b2f0:b0:439:bf59:554a with SMTP id
 586e51a60fabf-4a2a48e2a0dmr9029453fac.13.1791909808793; 
 Tue, 13 Oct 2026 09:43:28 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:07 -0600
Message-ID: <20261013164254.1476592-21-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-platformdirs: bump to version
 4.13.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index 7f7590a6c8..b9051298de 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  7aed05d0c6d803af78de34d929e51bac  platformdirs-4.12.3.tar.gz
-sha256  427fc0bb321ae0c5b037fa03238ca74820437be162e78b4848c4d4055b9b766c  platformdirs-4.12.3.tar.gz
+md5  5872f9a2772efb2608f4444b5339f833  platformdirs-4.13.0.tar.gz
+sha256  1aa0b0d3f224c1f07c295121e312a5a24a180d6ae5a8425ea1784b3e3863e9c0  platformdirs-4.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index 9610dccc64..dba59abfdd 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.12.3
+PYTHON_PLATFORMDIRS_VERSION = 4.13.0
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/42/23/4a86fc741c38c5b69792a4ef954b281afa69bea9f083f881de1b0d23bc07
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/80/a8/66d45abadff219e36e2a824181b8f6a67e7ed4572934d6252c71c29d5731
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

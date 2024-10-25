Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138DAD149CD
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 18:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFA8581EEB;
	Fri, 25 Oct 2024 18:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMoe0umvEy-7; Fri, 25 Oct 2024 18:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04CF881ED8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04CF881ED8;
	Fri, 25 Oct 2024 18:05:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CA5B281F
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 18:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C67040159
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 18:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYC21CkWeQtq for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 18:05:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 26CB240BC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26CB240BC1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26CB240BC1
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 18:05:38 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 15079B0057C;
 Fri, 25 Oct 2024 20:05:34 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Carlo Caione <carlo.caione@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Fri, 25 Oct 2024 20:05:23 +0200
Message-ID: <20241025180523.118939-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729879536;
 bh=czbo/n4lldttqekn+v8Rku65bxCpUxzu2nUi0GvqGXI=;
 h=From:To:Cc:Subject:Date:From;
 b=UOSAihaOGBcBI5WcNHoNdAe62j2S2fW/JUD46MiaTZmBwGGLmaewCD96G08l7uyIk
 7vlm1QgFGr3mszYfHwXeHeSZIIwCqttDzcZ+l1BzxyP9hDHJfaynl5IOL2lip2hAlc
 FvQU0Z/lEIMwmMuoGbkZC335ZjSiNCDd06JJzNAn5FzmwR+xidNTpjhS8jPwFGgryd
 AmeCYeGmBgjXyGP5fLlt1S5UTDdpDB39X1Kk2HHpzE2f2vi0N+AdLBjNPKaNfrQRC6
 g/NnI5n0nZ2h1FIqLN/gbbfQPvzpDgLxgYbo4qVCb6WJW+gGyDQjbEtz+tAGMnZOxA
 ZzsjFWPFHV2Ig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UOSAihaO
Subject: [Buildroot] [PATCH 1/1] package/jailhouse: fix build when python
 helper scripts are enabled
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When compiling jailhouse with BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS=y,
build is failing with error:

    Traceback (most recent call last):
      File "/buildroot/output/build/jailhouse-e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560/setup.py", line 18, in <module>
        setup(name="pyjailhouse", version=version,
      File "/buildroot/output/host/lib/python3.12/site-packages/setuptools/__init__.py", line 108, in setup
        return distutils.core.setup(**attrs)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      ...
      File "/buildroot/output/host/lib/python3.12/sysconfig.py", line 549, in _init_posix
        _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ValueError: Empty module name

This is due to a missing dependency on the target python3 package.

This commit fixes the issue by adding this missing dependency.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jailhouse/jailhouse.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index b5a8b40fdd..4dfe37f5ec 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -21,7 +21,8 @@ JAILHOUSE_MAKE_OPTS = \
 ifeq ($(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS),y)
 JAILHOUSE_DEPENDENCIES += \
 	host-python-mako \
-	host-python-setuptools
+	host-python-setuptools \
+	python3
 JAILHOUSE_MAKE_OPTS += \
 	HAS_PYTHON_MAKO="yes" \
 	PYTHON_PIP_USABLE="yes"
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

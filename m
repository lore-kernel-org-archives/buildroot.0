Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CBCE7FDEF
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 21:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F8FF60793;
	Mon,  2 Feb 2026 21:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0yunrENvImp; Mon,  2 Feb 2026 21:36:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 496C26079D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770068211;
	bh=5tUauQovid+YDIalYMB8nFQCa1SB2s084Gw6OVKAsxw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qhN7q4d4czko+OYQF82C/VA8LJvG0+67wgmWtSNeSnBHfidSldbS69aszfiKtutAv
	 TwCodF9SATNdeQ9iIKIpIMQAUfSl/ZkSt5r9ofsLSbQjFbA+wvnkVX2YITZH1I3jVL
	 BAoE3w8PxcPo3EJgLyDhI1xrFsTmDQf1vz5NB9LA+7dk0TPU0vSvx8hJ5r9GeXLY/v
	 zPe6yGqM57Fp5yI5ny6S/f/8KO7TOvDxFfFEThYBkDAKMveHDsR4vyANC0L5lEJ/it
	 2FIXp/HWS1sEuMj7Gz6GJKdN+N2U3tQrRdyXsypy5uaBjEEV5Sifzkuqsv0dZt4pjD
	 EGBlsyDG49Y7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 496C26079D;
	Mon,  2 Feb 2026 21:36:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAC4D1A6
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A77CB4078E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZc0E5C7mLr8 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 21:36:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D4354076F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D4354076F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D4354076F
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:36:47 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso1478585e9.1
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 13:36:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770068205; x=1770673005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O1BfuTpdNddCYQ+iKhwozeYwuNKXSLR1VRXNULtneH4=;
 b=M3Wvdjh+yhD2Ls8ULXkvaMuPJR0djJY4otTQysLlVkU5h2CAu+X2MmxNgr8/E8lr2H
 /SfKRMi3GMrjCLd/XgHfQo6CeO6vozqipN99G0+JUQV6Eow8YuvX1oHCeqPoVrr/vHNC
 R0zzle28/Xuux+NR+1at4AT3TjTTYBwnJMOEienZZu46fEjKT3ImTP7OLRySYMTrz7gh
 yWUH7P1XqZnrn7yo0bwVawmos9rtDwLMaXRUU+3QFHlrWTX0LbXIPCtLEXnMgOMuJyGE
 I9B7cyT0GApD6DTbFAG72YvAkUKPvcQm0BntUVBXr5t2J7nMoUMASI42CHD824HLqtdk
 qFEw==
X-Gm-Message-State: AOJu0YyGMiu5/Dw7213qCMsWuxKw8Ezv6l6a9azyJVLCdXjvX2kajr/T
 +dY/ySIKkX7xdv/BClMTPdLJY3HmXW/KvXTpKgB80D0CEFSdma/WOfM3gO85XxDPFqFm6v9ec7S
 w8lLgUBY=
X-Gm-Gg: AZuq6aI+IiDz2VZ9JkVyxwvZEUx2B3DAiLFX5iWLKs8091MdGSVPW5wLAsF3/ul07kU
 tgdTWhdyFnAVQlZ6XWw1vOqn70rUrUT1MZbIZq5XSSmEI0ZONhbMxQx69rS0vVnSybu/iKi5dd5
 wzxUWCFU0wwRhx7H+p3yPZwAjRZQZ/Cv5RljgmOPNK4wbDpBSUc4ajtG+z0K4tvfr1X61JAAIAA
 +dKnlqnC0QCqlQ9fBHQaLTQIA0+oTgtoMfV4flJZEBUFbgz3VSS9X+BId5fMuKa/MhdOnHmMyXR
 85DitXwDpdusqmqcW+Aj9n7S09uNkTuD2KjJCjlM0IiHgXqDNpVYNO53TjS+AuR3xfns05Q43qc
 dF6veZEYCd3+Dgl/7ATaw5ErwvQV/r5BmVtUKmI2jjWPKwn5PT052JX7QnYuTOCyr7jTxBz6OYY
 CuJsYXJwGg81/yAc329qjEtquAvOOtMCHa9Zc=
X-Received: by 2002:a05:600c:1406:b0:479:13e9:3d64 with SMTP id
 5b1f17b1804b1-4830514ec0amr8751225e9.15.1770068205325; 
 Mon, 02 Feb 2026 13:36:45 -0800 (PST)
Received: from P-NTS-Evian (41.126.92.92.rev.sfr.net. [92.92.126.41])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483051335dbsm14193955e9.11.2026.02.02.13.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 13:36:44 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Mon,  2 Feb 2026 22:36:37 +0100
Message-ID: <20260202213637.396090-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770068205; x=1770673005; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O1BfuTpdNddCYQ+iKhwozeYwuNKXSLR1VRXNULtneH4=;
 b=31SPIOB5ADihPt5eHSerc3Bh6kZkWU2n11POgE2QnJhzK2attZmPNDdPtom50mGQVX
 a/0vozyt9ZXeP7abLzk2yL1HS0TWlzhUr2tMQF21Z52Fa3mP0npcT6E2ORSJm1ZpJN6P
 T92Frp5dmnfvncYnMO9mem4qFWOjdiougggrQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=31SPIOB5
Subject: [Buildroot] [PATCH] package/php-lua: add support for php >= 8.5
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Our php package was recently update to 8.5 version [1] but this version
removed some old function like zend_exception_get_default() [2].
But php-lua still uses zend_exception_get_default().

Replace zend_exception_get_default() by zend_ce_exception as suggested
by php project.

[1] aedf131da66d2f2ebce64788deab07be17ce33eb
[2] https://github.com/php/php-src/commit/a812a74c2e60a0ba080057067a7634e4da3f2b9b

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797268 (TestPhpLuaLua)
https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797270 (TestPhpLuaLuajit)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../0005-add-support-for-php-8.5.patch        | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/php-lua/0005-add-support-for-php-8.5.patch

diff --git a/package/php-lua/0005-add-support-for-php-8.5.patch b/package/php-lua/0005-add-support-for-php-8.5.patch
new file mode 100644
index 0000000000..de0b00995d
--- /dev/null
+++ b/package/php-lua/0005-add-support-for-php-8.5.patch
@@ -0,0 +1,34 @@
+From 2c8b642b70edf5b0602b10a25d3f04874e175276 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Mon, 2 Feb 2026 22:12:48 +0100
+Subject: [PATCH] add support for php >= 8.5
+
+php removed zend_exception_get_default() and replaced by zend_ce_exception.
+
+[1] https://github.com/php/php-src/commit/a812a74c2e60a0ba080057067a7634e4da3f2b9b
+
+Upstream: upstream dead, custom patch
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ lua.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lua.c b/lua.c
+index 5889bc7..62f8f0a 100755
+--- a/lua.c
++++ b/lua.c
+@@ -871,7 +871,11 @@ PHP_MINIT_FUNCTION(lua) {
+ 
+ 	INIT_CLASS_ENTRY(ce, "LuaException", NULL);
+ 
++#if ((PHP_MAJOR_VERSION == 5) && (PHP_MINOR_VERSION < 5)) || (PHP_MAJOR_VERSION < 5)
+ 	lua_exception_ce = zend_register_internal_class_ex(&ce, zend_exception_get_default());
++#else
++	lua_exception_ce = zend_register_internal_class_ex(&ce, zend_ce_exception);
++#endif
+ 
+ 	return SUCCESS;
+ }
+-- 
+2.52.0
+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

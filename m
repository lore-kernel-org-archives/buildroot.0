Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B46AFC6165
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 01:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AECC402BB;
	Sat,  3 Jan 2026 01:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPjt1BNfKJmX; Sat,  3 Jan 2026 01:36:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85A79402DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767404164;
	bh=GavyBCb3eIxMiQEu0nmuJc9xGNAT1F5A9Pbtm8MKMe4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DIosqKV7yU+MF3DOU7hCuCFk6DY5fXeUTsmylb7c/CDY+1DfW62MTSIwofFdKRNv+
	 6UBMGb/37hTJQIqr5Qz6J64PydFclZInBqpqMNYoAAjtmCp1GeAlS8Xtv7ujE8fOrk
	 UglW/GTQhtRy34AINodgnHYE+jg+QG5pzJSPPnyBRM9O7y/TvtKss1fe7H0AvSszIX
	 u7wFddZ3duuenXv1ekl/MnKVeWgTA5W+ht9zpxyNG77I8kFOe+5+X+PKw/d3k8TzO1
	 jHLpprnEFeLbGjF3DCQvmMYzjGrC1s2BWuyQByl1ps9p1RJ4MQgjS28AD56thLR6fv
	 SWdRSlyqMkBfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85A79402DD;
	Sat,  3 Jan 2026 01:36:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94D99351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 759D260639
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id St8FMtt3KOcO for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 01:36:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9BF8F605F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BF8F605F5
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BF8F605F5
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:36:02 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-7c6cc366884so6105707a34.1
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 17:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767404161; x=1768008961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8a9MRjBqeoZPS1kkJOMbSn1vh/ASmpqoPesGafbYdUo=;
 b=rqmgUfmIkFW9k0yQwwku73x9tpBHxU7vaxe7VaM3koSQAsBliSqw3GikC8ESHaD/wq
 WBpAxngNC4Q/a8aX3Fv8NXGkalUtLGSQfUD78bmaMb7Jdeqpx9k2WVrzki1f4mqoO1aL
 5GaOK8dc0mIayPEspufr/HO4t2ks7ohi4Vi/7MI/r++R7M0850eLMGkcJgxamzoo3dzq
 FjFuIwWplwbJ6dJ21GOZN+Zq3sUHcBc+VQtl6PiDqdR/PdlLILH+eT/e4oW4viK7gLNU
 j8psJ8LcVgTR4N9mtissx9TY9+fKKeiZaBj2VyhVUhqGeNqsMC0uPOqfaWhtu2gTkgyr
 2Q/Q==
X-Gm-Message-State: AOJu0Yykw9JynQ87cB53dE3AmEv8fg5QRzG5GWagHXG1MCb55HMYTvgh
 tZoJoHfJwlzR6CMQYrsJGvekK/QJ2IPTmdQvCMieWadDgu/I6klDT0OZTr6cshtDI18=
X-Gm-Gg: AY/fxX4HL3aIeg0tq5Pv0AY8glkb9FpPdiuYZNkJL7yq9NdQIflHerXQhzS91fj9dlx
 tUDKcv1p7KVz7A5qpTOgajeNZK8sazYA3kBU3Xg05tM4KpMUdRlDW1qPoXqb1dWe4iu1FDh3IB3
 4s89JAv0JahyfIbvPyAiz7rka9t94x8PLUujTBE9JV5txdvTnVz8xdqGiL4k8fkLnX+iI/mjazv
 LmjtJS4Vjo4q02iFuknKm9RQ7TuLKdjH/F3nvk4CRW/EgY/02inpnZ2IGePKMKSESZcZat3u0OR
 fn1JCdPrPVAO9nT+MBK72h7U/v8oD3JUM2jAwd3LXM3qpflDeR+ILF/aLzQSjQJ4z2a0t47fW9e
 PvQNuu2SjBJk9hwJQnjJSjxSk7vK9WZYxsUy7dTSLDTmtEvsG5Qc6BUf9NJCQ2HQDq5rhJJvPZ0
 JpZxGg4bXlItOVUYolE9yvt7SAV+XQaHoadvaqoJJdtH9wH2hNmWZXbdQtuetRxKfSSv5K5kjf9
 4qFWvlWLic1GAhTkCZTQLP3/7dQnpsZ/j8ekpC7fZ937UfqlwDH5pY=
X-Google-Smtp-Source: AGHT+IHyUBb/aIYDtBuziSuZ6llJWcMaQ0g3J82oztW2FCZR55I1+7E6WuxuMJzxRtBJ+O+ZECszIA==
X-Received: by 2002:a05:6830:2e04:b0:7ce:2b1d:c0ed with SMTP id
 46e09a7af769-7ce2b1dc159mr985173a34.25.1767404161261; 
 Fri, 02 Jan 2026 17:36:01 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc66728296sm29294461a34.4.2026.01.02.17.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 17:36:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 18:35:59 -0700
Message-ID: <20260103013559.784592-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767404161; x=1768008961; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8a9MRjBqeoZPS1kkJOMbSn1vh/ASmpqoPesGafbYdUo=;
 b=Z4vZ0jO6g5nzS9PJ20PH8lo87oLyzFQP1C2Y1uElW0R3PBCJOFTaAccZqNIhjxrbOn
 RHuHPxz9XUpjQ5MPfbUnAdH/80G8bLk1zdbCHBwcEhX68dopu4z/8FmIAMwPrc9/ftNh
 +CBF2RIy4IL8dkGxVLP3/QdXJ8UipLChUEgvAhM8gykysdK3d4ZYq4X+H+5H+ZoD532N
 KDNgu9TK0mcIgG2pMcXGYbX6OgBjJHJm10uXjDGDKwZ0Jw6j/J8uSmy2jchxeFmpAcwI
 x8wyFqT6bfzBeDiOf6kkUI1dIJ5qpER+bXgJinv3UyAzqjftYDA6IQSYmxTSb8RZpVOk
 FT0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z4vZ0jO6
Subject: [Buildroot] [PATCH 1/1] package/python-babel: bump to version 2.17.0
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
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/python-babel/babel/commit/b50a1d2186c20f3359f7e10853d2b2225a46ed40

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-babel/python-babel.hash | 6 +++---
 package/python-babel/python-babel.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index cb41750386..436e49a9bc 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/babel/json
-md5  1dbf17974d7ccc9950757ed3c9618db0  babel-2.16.0.tar.gz
-sha256  d1f3554ca26605fe173f3de0c65f750f5a42f924499bf134de6423582298e316  babel-2.16.0.tar.gz
+md5  726d2ed119255a011d248ac0c9caa24a  babel-2.17.0.tar.gz
+sha256  0c54cffb19f690cdcc52a3b50bcbf71e07a808d1c80d549f2459b9d2cf0afb9d  babel-2.17.0.tar.gz
 # Locally computed sha256 checksums
-sha256  3f9142a40859dfcb33f45c16ad872b500d683cc4a20b17091478b404e900520f  LICENSE
+sha256  7801a84fe811279cb350bdb4fb18f94c36b18ef813fa6aac043b6c6d39484d0d  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index dd10abbfa3..57e372fc1a 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.16.0
+PYTHON_BABEL_VERSION = 2.17.0
 PYTHON_BABEL_SOURCE = babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/2a/74/f1bc80f23eeba13393b7222b11d95ca3af2c1e28edca18af487137eefed9
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/7d/6b/d52e42361e1aa00709585ecc30b3f9684b3ab62530771402248b1b1d6240
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

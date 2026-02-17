Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB5DE9A03B
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 21:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8D58808D2;
	Tue, 17 Feb 2026 21:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2sWStryICkwQ; Tue, 17 Feb 2026 21:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C78C5808D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771365345;
	bh=Y82wCq16foKiFlK6HljhMZfTNntu8+4tnFeswEP0HBY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SI4zKsPact8aA+fz2rNHkTrLSN0mHX6Ev5n0PbricM/zVPB+7GVmcid1UM0uqyQe8
	 FBfI0GKL/7IueNLW6ankTgOAqF9R5c7ZESa/GM10eCgW0Tu7la1HZi4m5Yenqea1+y
	 N3y8jpk12XKA2CZCCKS82cSKi2TkK2GESVouVOn2Xsvfbp40Oo/50kInJirBdpG7iD
	 cskPibPUIk+TfSKcnrnxsy94yqGAAD0/1eCBJ9T7vw6d3PnmOck9EgBfB87lnbuj/W
	 Op7MnOvgMVkwCk2chkyPBgW+nffhjof1FwlxxIofYpEE4hk2oBOK2EsuRZBktRACh4
	 yGImXMwN9RMyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C78C5808D3;
	Tue, 17 Feb 2026 21:55:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D228270
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 21:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ECFF405D9
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 21:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BjMo_tLf8kr for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 21:55:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5641740273
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5641740273
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5641740273
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 21:55:44 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-45ee8823e2aso2567138b6e.0
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 13:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771365343; x=1771970143;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=azT5RyB+eqGTcmDTeLjTZf1LIfQGxDXzBhwrh5JiY8c=;
 b=C3Caa5n4pOLzSEp6xcRsiSQ6ad/sueJkyvenXEzgDvE4syefYaCzCr5hh4NNdntI1t
 v3PkH5AQlN8sjJVmmJ33nnzrRjCyjOUPEdIHqnWx7mJdwp8bSROSctb2epnv+0OsWz13
 iEJZIkKSN86myYp5ne352VStuTpK4X2mnuqO8f6H31Gw4lL5rzoriCxwmUeTMwngjjgG
 hZomw8ZCfHTYMLEqK+pVRHbxvXJCRWukJ//1Bcho/QVd20Hjz3A4/l589KU9KmzzNjKB
 phk5AtZRm9XaTwZnvpcHHlhVG9GjhRh7haJwfU6KhS5Hb7wPttqdIdE4znOHzSMy87IZ
 mIiw==
X-Gm-Message-State: AOJu0YzNZXiKUNM+ujLamq3djH41nJS6C01nV6y8sm5ENrL/myLBwXgg
 P08fsXCpMOg1S2BxpiqqJDwaFuPPJPC0T+NeBx5mYy4RhMkl2KmXKF9aH7cY45PN
X-Gm-Gg: AZuq6aLID1zGkU1aRvh1OQkdWj7sB7LtQ85QIQyim4zBZLwVy20A5Fb7x7JNwlKiKmW
 q8N55HXsTqP75PGfSjMZEYbsnN/ADX6C0plxhAq9LsgJC1BQp2fDWGdPVXIeoaYhzyeBPZ/rhBM
 /yFUM+4QJRtRG/dKHSTiHayIJfinEjbtSOjvbHfamwBdqRcqt9TTvKClEhyaeriGBjS2dUaIuic
 9U5w0QLSKGWGqhosoN7m116uTV7c5LjxYOJl9hjmJOYrANYjI/1mRKPqSy3BFjVRs3nV7jgUpiv
 YQ04gw5ikrQSfi1uwsvS4eX5SdChlKkcSGXunzFGdXcxLbR4ZbLuOuJpJXSMzuCzanfJyEb0fHr
 nZNawXG2TJC7Ey02vzfwRibTmySWPKgiFA0HdWBuF8fDGYFDI/BJ2P4fNjjlksSpGDgvoaKtJNo
 p7+9YTlHoCVPzw7U12njrATQSusUSBsdxUteupVeOR96wDyh43PwmvbKPjtKR1bk0vdRptlZpMr
 cvCaj/JkhohehOSgoBs4hexRbX5Z15nOFS+DGhTy9KuGsmErIBIBer2qXtCrN8=
X-Received: by 2002:a05:6808:22a1:b0:45e:b624:5639 with SMTP id
 5614622812f47-4639ab5f410mr7926492b6e.10.1771365342929; 
 Tue, 17 Feb 2026 13:55:42 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-26.hlrn.qwest.net.
 [71.218.105.26]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-40ee62b6f61sm15654900fac.10.2026.02.17.13.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 13:55:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Feb 2026 14:55:39 -0700
Message-ID: <20260217215539.4116167-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771365343; x=1771970143; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=azT5RyB+eqGTcmDTeLjTZf1LIfQGxDXzBhwrh5JiY8c=;
 b=Nqsx1Lx2m1AN3myPSJNCX7siS0M0gJgIYTvWf0TgjVAN+zhkKUyAJJMQL8G1RZpJlo
 OkFtCfGqE3aCJIyS6B61DJ8He6u4QHfFvq4V3b3xk2sBoskR1fGh+09oYtml8/KFzXLp
 CjjK/wCBe5DNQtyim23AXgOZdW0TMaP0P7FpsdbLuHibojE7n3lHntyw9YI79hFRcCVS
 elFxjKCn08OSoLr5Pp+HSvYqs2jki390ibXKLsp8EKuv48QgZXqXgMghSmbplkNcJ8+9
 dvsNzjwVysAEKrrtNKvTSW11AVhU1D7GoUqOdXJBCRVnYWTp1dk+THfiGdreuQEXDAf8
 bXCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Nqsx1Lx2
Subject: [Buildroot] [PATCH 1/1] package/python-nkeys: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-nkeys/Config.in         |  8 ++++++++
 package/python-nkeys/python-nkeys.hash |  5 +++++
 package/python-nkeys/python-nkeys.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-nkeys/Config.in
 create mode 100644 package/python-nkeys/python-nkeys.hash
 create mode 100644 package/python-nkeys/python-nkeys.mk

diff --git a/package/Config.in b/package/Config.in
index 371a1c33e1..1114bf1952 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1252,6 +1252,7 @@ menu "External python modules"
 	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
 	source "package/python-networkx/Config.in"
+	source "package/python-nkeys/Config.in"
 	source "package/python-numpy/Config.in"
 	source "package/python-oauthlib/Config.in"
 	source "package/python-opcua-asyncio/Config.in"
diff --git a/package/python-nkeys/Config.in b/package/python-nkeys/Config.in
new file mode 100644
index 0000000000..47c124da08
--- /dev/null
+++ b/package/python-nkeys/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_NKEYS
+	bool "python-nkeys"
+	select BR2_PACKAGE_PYTHON_PYNACL # runtime
+	help
+	  A public-key signature system based on Ed25519 for the NATS
+	  ecosystem.
+
+	  https://github.com/nats-io/nkeys.py
diff --git a/package/python-nkeys/python-nkeys.hash b/package/python-nkeys/python-nkeys.hash
new file mode 100644
index 0000000000..011a97d284
--- /dev/null
+++ b/package/python-nkeys/python-nkeys.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/nkeys/json
+md5  b3379afef753e16d4b00b2dd8aaff04f  nkeys-0.2.1.tar.gz
+sha256  3a201dcd203d8bb05ba2884d441b2c92918b2a537a10d324e73738887dde9da3  nkeys-0.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-nkeys/python-nkeys.mk b/package/python-nkeys/python-nkeys.mk
new file mode 100644
index 0000000000..97de6fc22a
--- /dev/null
+++ b/package/python-nkeys/python-nkeys.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-nkeys
+#
+################################################################################
+
+PYTHON_NKEYS_VERSION = 0.2.1
+PYTHON_NKEYS_SOURCE = nkeys-$(PYTHON_NKEYS_VERSION).tar.gz
+PYTHON_NKEYS_SITE = https://files.pythonhosted.org/packages/e1/8d/d17254baea57fe4a7dd1ba89827d3cf0a21106988ec8971a46bfc5239b15
+PYTHON_NKEYS_SETUP_TYPE = setuptools
+PYTHON_NKEYS_LICENSE = Apache-2.0
+PYTHON_NKEYS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

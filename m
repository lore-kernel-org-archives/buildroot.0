Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C802CEE644A
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 22:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 752A1600D1;
	Wed, 31 Dec 2025 22:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NGip0HQgkMt; Wed, 31 Dec 2025 22:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99CCE605C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767220423;
	bh=dIksFvnkhqIZrK6VriH8P03jmNBq8Lh0YLHSvjWxYpw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=KbwJGEBmbMW9tMj4MGQLFE4AC8S/2g9/wNU42RwVJ9bmOTkGsXqz2RopEhybhcci0
	 35HB8/Ediuvvpr8xN+/8Kn9PDJIGdOwPL8F31XV/N/XCVD7GuWVSCe5wo/i2oVdD/9
	 TSl4V9Vozemn5J3PlZn58RiaZLYRjJCAqzvVhjG59IoQ8gEOeyULEHAm7PBkSsJR6K
	 t33A7OUs96CWqbbdJEgkKKLmSXrWGQUste3cxSVuWQgGxv4D7N0hmiFxJ8352OAa25
	 2uB2A2BUGxWoFqiMCBxhEO2yF/j3otCxDL4k3DTxVH5NhKNxQ9STFj+hCcfNoBTVwZ
	 Zd/kUchqqDHeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99CCE605C6;
	Wed, 31 Dec 2025 22:33:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 957EDD8
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 22:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B702605C6
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 22:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyyDVAJG9ooe for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 22:33:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AAE35600D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAE35600D1
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAE35600D1
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 22:33:41 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-7c6da42fbd4so6062163a34.1
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 14:33:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767220420; x=1767825220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ooT1LDOozxhBa78hB+znqIFA7pnCgTaJTnmWAf10nYg=;
 b=dwTe7rw1158Ws0hbiV7M4VwMjOnlPWXLrwXLtCuENnF5L3Gy2aUBsG4ESDomiTQ6Qg
 Uw/C7AfvuP2x7TFxdWaq4lkveJJT4rVWrPSDmah3qPLVJXY8yv9Pa2f1hJdghXD/Abu3
 SjDP969/+LVJ9uqbpvj1lmU4csqsf/XFeV54GlpM8MEmVggnplSGg9bxNa4jipIoxM40
 U2MOr5C9E1k3IvrLWhG8TbjHPZNdwGc6COZAftLAkwasMdCkTlBktK6rwCIDce/9rCJ0
 xXvxk/k5av9KYpIdNcf5rM1Y4qtVnY2qC1ocHQNRsAlYZvjliGBq/uncuQyoOewOq58Q
 BVPQ==
X-Gm-Message-State: AOJu0Yxd1dl8u6P7kJmsM5WWU61ob7sCjgMA5Dgc+6O2DBIR6+8wFCjd
 HLHdNjMSz/oEuDU+XWAOpfixGhgOe3bxye+6fIWf/qnLOaydiIxkSiuxyz5GSEDK9i4=
X-Gm-Gg: AY/fxX5kKuj1fxWYu2wEvcUx8sf8l4+jNM5DTHTOZC+gFeiTybnYjOxVAphBshSXNLX
 xBCulqNapEOaMU6EUBK+f8uuiyTRFLy18Yfz1K3M9xWs41DNQwHvxECfe8+GTlZPmPGSfkB+qSr
 CS49tFhooQEDfoYfPH8zB7GDv9SsI1tToB1QL5FWNnnQJFvc2k//UiAXbO98mhV3NY6NNJVpluj
 pKjX3jYZytflE20ZVa0ppGchQK33zEBDWf1WSx75EACVHipslmPNMON8MsP9w2khfUmEju9D4XZ
 tbZZVg21EuMYCejK+nEwRVGy1HuKhqaLxw4vN2FGKel9WXLzy+GJ5GvF4xLmnuN5yhHMJLnqCjI
 EYyo5SThwjpXdCkeCsO6CGFI/SYEI0ijUoJuovjivTSA29cFSHr8bjQ65x9+ngajNRH/6NuPiCq
 R/lUSvPZjiz0BB7fAi8eGmkG7+M/WtMVgtWBiitNjcQtvEVRktTiLlVoI9K54SnLBGXGxrTOa3r
 84r+h0OwKJa6nssXLJe6E/mN8aDMkUTqSVlwDDYqJBTB+4Mbz6RlF2TTmRd36GbwQ==
X-Google-Smtp-Source: AGHT+IGBPaBPXgc0pgtFxyuxpz+ZC/BqEbLfSjYFzfoEa9cnnyDNrto/5VuSU0jDdQQP5fOgZaI7Gg==
X-Received: by 2002:a05:6830:2707:b0:78a:5183:8f6a with SMTP id
 46e09a7af769-7cc66a60ce1mr17335585a34.28.1767220420325; 
 Wed, 31 Dec 2025 14:33:40 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667ead3asm25243879a34.20.2025.12.31.14.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 14:33:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 15:33:37 -0700
Message-ID: <20251231223337.535914-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767220420; x=1767825220; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ooT1LDOozxhBa78hB+znqIFA7pnCgTaJTnmWAf10nYg=;
 b=iI99b0AHa5qTIv0T8WY5PqhrLjOoI7cEpE8Ja85f9UajBUfWgJc+Tj9O+T5r7QJ0av
 6V4im1mh/lgxvrdViNvXFGquRaihgi9V6MYZez3eUGXHYyP+W/IxLPqUg1wDdYyfOkoC
 G/mlDaR51L//VWlRrR2mRvpbBPo0PlB+6cmsnjZAzkD5hJwke/bR9GQUSocSZw14agBP
 UcdCsWtRzl5vvqfm2qQPEMIGIh7KQc3qJEZ/MJB6HHbyQSrZwhhQ5BycWoXEt9Kpo5Ng
 40kk+Rc78dDhjZrx2v/G0rdID8C9UBCeKvtXTl8EIkddEOzMSiurkGFcndvCmQHK6mbH
 aLQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iI99b0AH
Subject: [Buildroot] [PATCH 1/1] package/python-psutil: bump to version 7.2.1
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
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 02bd2fcd89..a283b1ece2 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5  99dbbe92985d5e5a3a45574ea521af67  psutil-7.1.3.tar.gz
-sha256  6c86281738d77335af7aec228328e944b30930899ea760ecf33a4dba66be5e74  psutil-7.1.3.tar.gz
+md5  7d3ca5607f6810bec61293ff0845c06f  psutil-7.2.1.tar.gz
+sha256  f7583aec590485b43ca601dd9cea0dcd65bd7bb21d30ef4ddbf4ea6b5ed1bdd3  psutil-7.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b89c063b3786e28e0c0a38f1931db61fed35e69dd2a2966fbecffee0f46c8d10  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 2e20712f9a..26f19ed8e7 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 7.1.3
+PYTHON_PSUTIL_VERSION = 7.2.1
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/e1/88/bdd0a41e5857d5d703287598cbf08dad90aed56774ea52ae071bae9071b6
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/73/cb/09e5184fb5fc0358d110fc3ca7f6b1d033800734d34cac10f4136cfac10e
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

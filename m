Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B35E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 05:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A8F360AC0;
	Mon, 29 Dec 2025 05:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LDPWylGTwe2; Mon, 29 Dec 2025 05:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E49D60AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766987233;
	bh=/g9kflYUrHCwaT7cRarUPiXqqvko59fTJGwZznjCwig=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=VH8Mh58wRObPuzz7aV4mtsQvzXpHMHACpCqXowzJGbFogzaPs8XaBtHQYJ4NSXYjN
	 E/rhUgX7KEGV+WaQ9SLH0WM/6kLwrat+sBMhku3tFwAm0gPJzJkUTlx/wEBQb00TQq
	 7qJLyySNOGxQrOwrzhE70I/m+yVDDkO32UNAVH8ck0cyesYZ6L+o6MTqcGlWNo3amh
	 DsmeUE/yjOddio41GORNad6kUHUl3twLtrM6wIap0j78ahNERXzwWwZZo373DOwUGm
	 ze+FkbBPhTcg8KZ68xSjOf9R/YIINkNbdc/j0ZjHRhywMWe8RsLUhW7Ms2mIkQOrDL
	 o6h5nRIsEeCjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E49D60AB2;
	Mon, 29 Dec 2025 05:47:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA018D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 05:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B729740073
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 05:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyicjRxqA68e for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 05:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B52AB40059
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B52AB40059
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B52AB40059
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 05:47:10 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-459a6261428so2144455b6e.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766987229; x=1767592029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gLH9KYd/tbjwn/9D3A+dEpxYQbJCIRMgIiqeI1sBTtw=;
 b=KVazgIdzsHMwpGZzuFoPCChE7sySM9Ptvz5haIc8rMmCqL5CGRE9nfrPo5fMjLaZiW
 wj7uoNqEEv657JlCDa/yGyW0A+sVU6KksjgCzc1MLFpYagX9RYi7uvxntod3GEB51Jp8
 DUdliZiloOvhaY6afgSZ5lIaK6D/2e2JwF26TiRMoeSP0QqfXEWpiSwtv1IdBKTlpKuW
 hNecNtLHLenL+gf2SScKP/1osiG5+fYQpQj0eXEg0QODilRv/S/rF1MRd5FZRFDanSjC
 tA4AMWmNSSoLtYUrfqqSKgTVgX5I9WTeJe6DYN2Uy2yq5KxMrSKsQo3kvieLQkgRE6jL
 Mkrw==
X-Gm-Message-State: AOJu0YxMQ7FGPiN284Kiyf9dHUebdKNEycZdYcxXBgP75e5XeKGazx3y
 t0rvUO+KvhHuEgIz6u2HaSK4ndkhys4Q4QAvKsZ0pmIUuylguNgxJqIrGZcCmCxp
X-Gm-Gg: AY/fxX6hgtGjoib4xLcMUjEYnPdGaSTeOtP40iK45Jz72LFkOz5BHu5uduevEX8ROqC
 8F3bDexenj5105B/GUjhimbIRHVaAIcBk/BHBwibB2s+/WiThOff9/bmPHAseQvi0FFhaT98XQi
 GudWAhA7NaXTleML65/dEX62SRGEqpBLRZUDwfKA0BTiEMnD6zygSs2jOAeZa0z+cAdEsnjADBi
 aqYAvyLcFdLINJDBZUBAyedKYoXerLJ4QWcnQoVLvrQZyCl92zsmGwW1Wya/sEhKcGEWvKIPDDv
 JwnHkAi1Z8iyvStvjLDKsfwbHN4HRIIYrb99QIHwYNO+yXhAqYFY+uASz2ZCRAbkyF0XmhIMgIX
 y1e31L4gZnWAldWtapJZDxPd7yECpCt2/5ukSPRC9H7e7pfjw9NXZwdZifqS55itQ+ZzlXMwPNI
 N3TFRgaAQoZb+YNnDVBZhrsJuLQWX3nVGM7NEZzAbQc9FFysnBBSmU8hfdr2wL92h0r9Z5UvrH7
 MXC/KC3MK1I4CkRLcWqzoPDDz/tLf2OrUxbBsy4UDPw5Z7zXHKitRo=
X-Google-Smtp-Source: AGHT+IEYmIg7/z9EYWvq06cU/EN2o+C/yQVI5pLrmj+Vg9jbtL6fGQwt2oEW+oS1IL+ydDnbpgVayQ==
X-Received: by 2002:a05:6808:2186:b0:44f:6df8:6a2f with SMTP id
 5614622812f47-457b224549emr11105568b6e.23.1766987229323; 
 Sun, 28 Dec 2025 21:47:09 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b3ba4221sm14094093b6e.3.2025.12.28.21.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 21:47:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:46:18 -0700
Message-ID: <20251229054619.3499351-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766987229; x=1767592029; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gLH9KYd/tbjwn/9D3A+dEpxYQbJCIRMgIiqeI1sBTtw=;
 b=gJN1LgG1lEggwTCHeKXcmYtByzHGbB75UNc994Rl7qEluIrgweiwHU52MXaOQnA13d
 RFbIrTyTtcR0jb1eKgXmNDycIuY8rvIpHyJWwQgwyULM74iqlJpigHFW7p0fdd4nWp0G
 CIgMkdih2ZcwlKfZ2imjqmKWlPsjPriJp79XeFezyPeN7KVlUPIOJOw1JhWI1OUwNuCy
 DXcTaliHl6tvAkNNzIMFNc+AhRjpvDkbcFUABvIFlt0kHsRuAiTYfZbevfD1h1VImmy1
 9ORBiAZhJvpc9tt8H+K+NVkXRKDeJciv+tfnWywhFvmctCcoLN+7rM76/RZ9eQJRoDhh
 Pilg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gJN1LgG1
Subject: [Buildroot] [PATCH 1/1] package/python-selenium: bump to version
 4.39.0
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
 package/python-selenium/python-selenium.hash | 2 +-
 package/python-selenium/python-selenium.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index 47a5b7be67..97978c0995 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  b5a238e9712d8f41c78c27759ec14c761acecc14505399c020b69de8bc38e51c  python-selenium-4.35.0-cargo4.tar.gz
+sha256  c2518c75784290095739e386b4deb9f192b11dab3dce152452e6763918dd6c18  python-selenium-4.39.0-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  1ee8454a0696ac46b0d5b67f85b2a0e3af2b7726e1b82cd182af60fd285bcba3  LICENSE
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index 2dc3b9fa22..8308325ffe 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.35.0
+PYTHON_SELENIUM_VERSION = 4.39.0
 PYTHON_SELENIUM_SOURCE_PYPI = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/75/67/9016942b5781843cfea6f5bc1383cea852d9fa08f85f55a0547874525b5c
+PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/af/19/27c1bf9eb1f7025632d35a956b50746efb4b10aa87f961b263fa7081f4c5
 PYTHON_SELENIUM_SITE = $(PYTHON_SELENIUM_SITE_PYPI)/$(PYTHON_SELENIUM_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_SELENIUM_SETUP_TYPE = setuptools-rust
 PYTHON_SELENIUM_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

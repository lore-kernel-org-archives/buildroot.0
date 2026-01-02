Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A81FFA3758
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E369980802;
	Fri,  2 Jan 2026 20:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6r0EAJBmGG2f; Fri,  2 Jan 2026 20:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 512EE81585
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387472;
	bh=26W+Lvi2wFhNMkWCKzbvkFMO2+p22AVullZtHPZVeM8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=lFdg0mcYNNlI66bNCIk16V9MAH2aVqrMG49yAGIYZVN/Ef3mMrgoZaEjOzMrw4Kl4
	 6jZTlMqDjo2IGJGKUR8z852aKrF+mJmXcXNHwOg1ZsSt2yQV2Zqo0EQpstukT99R8Z
	 j+hKagtST+qgj74U1VjUIdJqcWT0PdAAwgDiLu210++lON/yX12T5HPSarzUkSQq0b
	 Q4RPVJB9bTldgOE0+Z7TH9Xnl0odaKJ0tnLPwwzy1bPPfE71RYqEA83b3ak5buXzl7
	 sK0awIoOhQwRZkXVpf+9ArYjwOn04smLm7QMb/IoyfqyOmEO0Nna8FX2wrEpya4GZw
	 9YfRjXTho72ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 512EE81585;
	Fri,  2 Jan 2026 20:57:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A224202
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16B3C608F7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C25O1eYt0ikZ for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:57:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 36522608F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36522608F6
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36522608F6
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:57:49 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-65cf597a717so4421845eaf.2
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 12:57:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767387469; x=1767992269;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CF7WvQjMdEhobY6Gexiz9+LQVsialDHIFsG1ISE1a24=;
 b=k7m1/bS8FR8JKXnrJPGNksJ2KVdTmy9jeQyTUA0+EQqzEmsfEh+Xg1Sh+lrGUK70yk
 faoJli6PjpgylMt69nOAkGSNTLeA7pEtFGKA9a4YW+pq8y2bdZ8XvPkQkuMNkNPuMLck
 3Sj3dHcWrnVB8Bmd5h30ZcNSbAaHoQOpJ0/udJ8DjsR3ODavBodpwLL/jVhrpOvxY/5i
 T9mgC8xGOrt4397g6dh2J8qYFNcxMV+PvzHH90akMja9jUm+arPbqL1oh3z7gLEGO8dU
 GdJo9nRddphqZA13nKZv83UxmGyMWNH7vwLaS7jzqGTxjlMMVoL2WDfg6k2w3cooY0hl
 8mHg==
X-Gm-Message-State: AOJu0YzBcqzF8E2II0duzsX21GXU8Ze4nFs8TPva7XhtwtCUDldt4m2C
 jHBdDL2vb81dSUXgQ35SPg/UjNEWpIIV9dOlSL1S/SJCUijhmnURvpR+3dgnJDXGkLE=
X-Gm-Gg: AY/fxX47OolbgLmoM1OMauaqa3OyNrcK53rzLZewNWtmvyIo5xCaarXdFfrK8V99JZW
 Soaf+i1w9Eyvxy7Tke8dkUTF5d3mw09ImwB4E4qT/wHu8h+iKDlBHwtCBs4FfCOQozB9mLApG9M
 yQIylVhFYF4CTtZYd515L2R7QbRi9UGvIOWXSPt/u1BVytNaDSXkThz0kRxLUGu7hWW36Kf5ExF
 k2BT6RfcZ929bDIRx4xPqyBpXzHYL0FRQXbc/KKK8ukjhSAX9pLfSmaGjVJ33gMGZXp/KGa30eB
 rsDc68+dHUL4MQmmGDxUP6/KzMAXU46fxXj75pO9I5vskluSXdPXtmqUGvxpOjd7iSPbNu9FaPH
 Lazqvgvwy/k6kFs/xAOZeF3v9z7TCFKmkC5dTVCrt3J0BuVCn04jIvDEos1Oj5ASYQtuRfJQW+6
 KqwCKOaFBWHzr3ZBL+kWxYows/S9Z1otQyiF8bKl9FsEvzL5jOqR4xNdjgze0+av6fhcM/21gW4
 14jGdRgYFn5vlFEgYJgVupb9hyh9Jt8vbKx68D+ShGZfG2e7d+d1h5FNjA7OdwbVw==
X-Google-Smtp-Source: AGHT+IFN6ntXFk25q6pUfbERcWBGHstYW6n86az1JbDGaz/G1mZGcueJFab7r25BWA/Yj1bG15J+/g==
X-Received: by 2002:a4a:e252:0:b0:659:9a49:8fce with SMTP id
 006d021491bc7-65d0ebe0a30mr14512802eaf.71.1767387468652; 
 Fri, 02 Jan 2026 12:57:48 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65d0f1f1caesm25228628eaf.0.2026.01.02.12.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 12:57:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 13:57:46 -0700
Message-ID: <20260102205746.36186-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767387469; x=1767992269; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CF7WvQjMdEhobY6Gexiz9+LQVsialDHIFsG1ISE1a24=;
 b=nTg+aEMHUL8n+e8vI15iG0VQ6a/+vWQOhbMfF3RELp0AjChOwimzv0AQ45M0Zst7+A
 aaWmTM5CUwSxzS/qKmgVWdpi+qE6n2EV6134SkX1p45Aft8NMeXD3vqFSdSVBudt4EUR
 9fNGPNGk62mUGMZT2THp+lZ8a7nV/t/I1626vAJyK9TlGcH+0tazcpcfPQyuaj9Dpn6/
 kx+7yzd/MG/5sq9TVnFFg1RzT9erPlRPhJ4QBw2vFGfMXngLJClz1FrKmlM+PxZ8rUZs
 rp1UvbKXcIYvxZmU5Jqq67maWJPLbXz2KxB34aXpS7XGUrUzvQOe0e8H+2ZuvUdRaTd6
 3c4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nTg+aEMH
Subject: [Buildroot] [PATCH 1/1] package/python-path: bump to version 17.1.1
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

License hash changed due to move to license file autogeneration:
https://github.com/jaraco/path/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
https://github.com/jaraco/path/commit/d2b8d7750f78e870def98c4e04053af4acc86e29

Add new python-coherent-licensed build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-path/python-path.hash | 6 +++---
 package/python-path/python-path.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-path/python-path.hash b/package/python-path/python-path.hash
index 117d225e75..9418d9e6d9 100644
--- a/package/python-path/python-path.hash
+++ b/package/python-path/python-path.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/path/json
-md5  3f03cdccfa0fdd9dee34c445701d4a31  path-17.1.0.tar.gz
-sha256  d41e05ed4fa1d4f6d702df3c1e0a1a255d7b544287432456455dc7c51e5f98e9  path-17.1.0.tar.gz
+md5  c7ab103cb96b36758daeccd1ed52b587  path-17.1.1.tar.gz
+sha256  2dfcbfec8b4d960f3469c52acf133113c2a8bf12ac7b98d629fa91af87248d42  path-17.1.1.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-path/python-path.mk b/package/python-path/python-path.mk
index 1ebaccd099..8d287772d0 100644
--- a/package/python-path/python-path.mk
+++ b/package/python-path/python-path.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_PATH_VERSION = 17.1.0
+PYTHON_PATH_VERSION = 17.1.1
 PYTHON_PATH_SOURCE = path-$(PYTHON_PATH_VERSION).tar.gz
-PYTHON_PATH_SITE = https://files.pythonhosted.org/packages/ed/51/127cd9fa2baae5715e24839d6fb73c6fa6eca7b84a52fc7ce8195d830802
+PYTHON_PATH_SITE = https://files.pythonhosted.org/packages/dd/52/a7bdd5ef8488977d354b7915d1e75009bebbd04f73eff14e52372d5e9435
 PYTHON_PATH_SETUP_TYPE = setuptools
 PYTHON_PATH_LICENSE = MIT
 PYTHON_PATH_LICENSE_FILES = LICENSE
-PYTHON_PATH_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_PATH_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

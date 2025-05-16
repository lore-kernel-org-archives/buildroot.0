Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F94C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 16:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 097E961299;
	Fri, 16 May 2025 16:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFrYgMCZJPsx; Fri, 16 May 2025 16:59:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22C3760A95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22C3760A95;
	Fri, 16 May 2025 16:59:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 729D01AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6384640B6E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5a41yM_ZYtLK for <buildroot@buildroot.org>;
 Fri, 16 May 2025 16:59:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57A82408F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57A82408F8
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57A82408F8
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:59:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so24821625e9.3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747414763; x=1748019563;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OA3ublQz/b/ByFmKtl257BaWFH05bWK2PDQL7BRS35Q=;
 b=RaGdMtd3BD6zihdFqBdS57Fi3YrqNUKSVEq2la3k+7aJXSNewvKVhlg7lK96di7rKH
 EbrwA93feqMurFFTmXrbKJTyjO3cooZKxCic+0ZFDpPZXgxzC6VmXPO9MBqbWqBHTYkK
 YP6EXlUc2bhDICueOeC4hKdz4fkvHXcxAyf27Zrfx0pUvl9EjOgiuu4wXNI70ysEhois
 9s0SVb6jeBqBkoSjSF8OxAe0V8UrAK595sJg8KPAZHdqCHp5lBr8zQv+moAepfKNWrhe
 N8blY+RAR41q9WYLZjPbplf6gTqzp5oDGvbY6MeLAy1vuHUxR3tWJLc6n51nMP4749hw
 JvRg==
X-Gm-Message-State: AOJu0YyVP4LG+4Q6HqMz737jnIaufV9YB/5w/8oTdMEVNPtx1rxIdzsg
 Pll1FtP0Q+CytoE54hCYzgdELplW3iETj1FFmenup6dsc6InfHI5KuvZ6EBUuJqtHx8YfB1zbIO
 mrZYAjK0=
X-Gm-Gg: ASbGnctYhYPwfGF9B/8XGdQ+WQ+1sPloc6goION7HzzHvbkM654TFzSt2pnR6D2iQOh
 Yh7Qpu8O4TFak7NRdhy9S4WqoG7eLO7VpMArErgF0QhP2LiqzJWPb77aoyvZ9uL/NQFnc0XZuvD
 KxqxhR+3emd8IOBqrPhvcBzG6g65e42y1IWS36xdHL1wY8XguXuUMBIJ2x6xdmXqbDwivaLvuxu
 CK6hlfonwjaE0Sh4QziMKHJWxKKETPKMMADsdO/jrC7kcJqsQ+slPqWVnb4ZAA91sx1HfvRZ3Sv
 P+dobyc6yD3akNNTQphOw2/AHpebPkDlO74zYOtI9v10TNvYPEteFYjapOogfypStA==
X-Google-Smtp-Source: AGHT+IGUaCml8W5Dyw1FjTOhrDqMewSTUCp8wKhkRWOz8kgCfiiOVXboE9c2wrGhLYihRxY5lryotA==
X-Received: by 2002:a05:600d:1c:b0:442:ffb1:b58 with SMTP id
 5b1f17b1804b1-442ffb10be7mr28864785e9.12.1747414763217; 
 Fri, 16 May 2025 09:59:23 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f33690f0sm110937825e9.1.2025.05.16.09.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 09:59:22 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 18:59:11 +0200
Message-ID: <20250516165911.225407-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1747414763; x=1748019563; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OA3ublQz/b/ByFmKtl257BaWFH05bWK2PDQL7BRS35Q=;
 b=bEX3qo6HPeWdYUuOfV/Sd71HW9P+P+Gk3vmTuLAwQRlYO+ozKO5RLfvlufGRL+3Tck
 MkogH+QpeYpJTHPtll8xXTx24CDvdvijYd555YJkq158uvj0XyJCaR35RdnMCgXORWdj
 UGvoOKJh4V9boVz65trtq/fxnK7jvtBu15pQUjgHB5XQa0MG7Nnuw7njNIqWcO6Fb/Od
 7eNx2UyhvoRj4RzcI3HCMtA8y2cMRRMvjct6H0DjaCvLcNlmLqGWSpwcM2PhE64OUAh2
 V6I2XFJD4pK04XNz4sjDUBh2DXqORrYaRwR2puV4z4/SWCq+z9pr2GPbSJ2dUu7dlXcW
 R+SA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bEX3qo6H
Subject: [Buildroot] [PATCH 1/1] package/python-h11: security bump to
 version 0.16.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issue:

- CVE-2025-43859: A leniency in h11's parsing of line terminators in
    chunked-coding message bodies can lead to request smuggling
    vulnerabilities under certain conditions.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-43859
  - https://github.com/python-hyper/h11/commit/114803a29ce50116dc47951c690ad4892b1a36ed

For more details on the version bump, see:
  - https://github.com/python-hyper/h11/compare/v0.14.0...v0.16.0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-h11/python-h11.hash | 4 ++--
 package/python-h11/python-h11.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-h11/python-h11.hash b/package/python-h11/python-h11.hash
index 0c65a11d00..1ea92278dd 100644
--- a/package/python-h11/python-h11.hash
+++ b/package/python-h11/python-h11.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/h11/json
-md5  84c33fc0aa1f868928114c4d02c43dc2  h11-0.14.0.tar.gz
-sha256  8f19fbbe99e72420ff35c00b27a34cb9937e902a8b810e2c88300c6f0a3b699d  h11-0.14.0.tar.gz
+md5  af51401a776fd654cfd98a197af9f21f  h11-0.16.0.tar.gz
+sha256  4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1  h11-0.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  37db5bb85926db28a427a25867f10b1232003aea1be69ccb851138adb8e6f361  LICENSE.txt
diff --git a/package/python-h11/python-h11.mk b/package/python-h11/python-h11.mk
index d7dca5244b..4e4685ea5a 100644
--- a/package/python-h11/python-h11.mk
+++ b/package/python-h11/python-h11.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_H11_VERSION = 0.14.0
+PYTHON_H11_VERSION = 0.16.0
 PYTHON_H11_SOURCE = h11-$(PYTHON_H11_VERSION).tar.gz
-PYTHON_H11_SITE = https://files.pythonhosted.org/packages/f5/38/3af3d3633a34a3316095b39c8e8fb4853a28a536e55d347bd8d8e9a14b03
+PYTHON_H11_SITE = https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963
 PYTHON_H11_SETUP_TYPE = setuptools
 PYTHON_H11_LICENSE = MIT
 PYTHON_H11_LICENSE_FILES = LICENSE.txt
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

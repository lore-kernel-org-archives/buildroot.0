Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A323CAC597
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 23:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D557360D86;
	Mon, 15 Sep 2025 23:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5Q_BWDgdwf1; Mon, 15 Sep 2025 23:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E29126066B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E29126066B;
	Mon, 15 Sep 2025 23:53:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BEFF722F
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 23:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC14E81432
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 23:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GvbMiHLXwIj for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 23:53:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C1FB781431
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1FB781431
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1FB781431
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 23:53:56 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-42401f30515so10701595ab.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 16:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757980435; x=1758585235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TkfT2ipMGlSe5PsaE6+PAg0912T89189X0CGBLgqjBQ=;
 b=ezaupEpKT5p2GXwP/Hq3EWdLIm6BibcpsZ9wMCqCUO2nyWwMMln7VLLCKKObNTvGoS
 rN7G+XQJuwL7qL2RyDQqXMVoKLYHZ6J2Pp95WNEc3jd7Su1SdTGfmTGq7acPyFuE1ip5
 FLmP/cNBQWb60VoCxpTm3XzF976vgKstHFBUEnzqDtmmAh5X1UrqhT5n8heucHmPq+gF
 wEVV8Gz+YwA35/XfxOUAujEVLe7q4aT9ru9WW4CZstfzD+qxykst+xTlhbh482uupZ6v
 OWIWQ25k+gYf/vWq95Z04eU+fdrflhaF/P5syyqB5uSJQ0nrALlbjeg1P87Md7Tcer6z
 srvA==
X-Gm-Message-State: AOJu0YykqW7oiyO8fC6FchsyqCNsnj0q8bZ3+ObOpc4OvAJAC8msYTRe
 /WKKJs4/sGn5govItgDebvzf+hFWZ38wTFOFmRGKoR/g/TIXwi17Yib0uyzHEw==
X-Gm-Gg: ASbGnctam5YyJmAoWFmVMftJroQNBFTRDO2l96SDUu1yV7DRwWMh2F7U3dDzqf8KkYD
 mYSr2LYIHq+Gmp7L3mNXWENhs/15zuBd+9lU3GdzpB4kZ9sVYthsuwsr2bdFQpQ26d7bfBIvV7b
 Zehn6Y7NyZoCWzhALnw1IcIvaEJQ9ELMKSd5yuJzAq9ZzUDRI5TaEHT6pBIhkS7rpzG57cPhKsa
 dyD9tMV/nZIpTm5U6v9xs6Tp+wY4gEHhqdJjiIBSexQmuUhjf8lIDMkOjS9eaeDwe/GLrOnc0uZ
 z70vqB5VqmYPibYYX2kLMeSPpndv8ezyIpJMzg/rlr6r8sKdVOsUnkdgumBwxLuT/8WlWL1Lo72
 8kIKq63CKQkcNoyo3kzGBD/vZJiLxbthc82PSXRUPsrpDvtiNNIzWPqrESOIMVOrAiHpHtAUDG4
 OM1PtrLqyqHkY=
X-Google-Smtp-Source: AGHT+IH4XSrfRA0tegPnWVGbeYMsNAAi772aVMehLjlkoC+pGU6sZj8GOyn582R8VUOX29ggZjeWSA==
X-Received: by 2002:a05:6e02:1489:b0:423:f113:749d with SMTP id
 e9e14a558f8ab-424114566c6mr2384755ab.4.1757980435347; 
 Mon, 15 Sep 2025 16:53:55 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-42406eea76fsm19025085ab.26.2025.09.15.16.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 16:53:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 17:53:24 -0600
Message-ID: <20250915235324.2448456-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757980435; x=1758585235; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TkfT2ipMGlSe5PsaE6+PAg0912T89189X0CGBLgqjBQ=;
 b=G0oWzs4/WeU98DcGNqhoKMNga79NjWtSrDjkTUIb4PvZFXmVejFubN58cK+5tkX5uW
 sdOPJ8oKJrPqwG3TCUrxyP0R39M4mQLxi0Ja36k31AxvNNx0ngY4CK1miJkQE2+l+d82
 w3IOkBz37RaZOTgL1G3WVAcAwLjrsb6TSvr1szjsJ+I585zwArjTMQM7MQOYaHIGZqTN
 wYWF8blnFrLYd4rjSJbTdPu7rvvOKwZBq034AQc0scGP9V0k99pFKelZQjWNTlgfYjTc
 8FAltB9nfpC6S7/u5k33aMzmdvzR3Dp/FOVhn+5qzu+W3CqHFzxH4R3YxtU5SXUqa4VU
 kkWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G0oWzs4/
Subject: [Buildroot] [PATCH 1/1] package/python-grpclib: bump to version
 0.4.8
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
 package/python-grpclib/python-grpclib.hash | 4 ++--
 package/python-grpclib/python-grpclib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpclib/python-grpclib.hash b/package/python-grpclib/python-grpclib.hash
index cc65209138..31ff505fdb 100644
--- a/package/python-grpclib/python-grpclib.hash
+++ b/package/python-grpclib/python-grpclib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpclib/json
-md5  60ce203e5b9f95de3d7e5721dbce2bd9  grpclib-0.4.7.tar.gz
-sha256  2988ef57c02b22b7a2e8e961792c41ccf97efc2ace91ae7a5b0de03c363823c3  grpclib-0.4.7.tar.gz
+md5  c37be825d02fa3f3f488f172c784ca71  grpclib-0.4.8.tar.gz
+sha256  d8823763780ef94fed8b2c562f7485cf0bbee15fc7d065a640673667f7719c9a  grpclib-0.4.8.tar.gz
 # Locally computed sha256 checksums
 sha256  6c7fa8cf9b94ad5043a6b550a0ffb98356e66100b69dd1cb8e1f82606b436e8e  LICENSE.txt
diff --git a/package/python-grpclib/python-grpclib.mk b/package/python-grpclib/python-grpclib.mk
index 0bec0a1879..4f8406ee69 100644
--- a/package/python-grpclib/python-grpclib.mk
+++ b/package/python-grpclib/python-grpclib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCLIB_VERSION = 0.4.7
+PYTHON_GRPCLIB_VERSION = 0.4.8
 PYTHON_GRPCLIB_SOURCE = grpclib-$(PYTHON_GRPCLIB_VERSION).tar.gz
-PYTHON_GRPCLIB_SITE = https://files.pythonhosted.org/packages/79/b9/55936e462a5925190d7427e880b3033601d1effd13809b483d13a926061a
+PYTHON_GRPCLIB_SITE = https://files.pythonhosted.org/packages/19/75/0f0d3524b38b35e5cd07334b754aa9bd0570140ad982131b04ebfa3b0374
 PYTHON_GRPCLIB_SETUP_TYPE = setuptools
 PYTHON_GRPCLIB_LICENSE = BSD-3-Clause
 PYTHON_GRPCLIB_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

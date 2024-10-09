Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B476CEE33F
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 18:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3680A80FFD;
	Wed,  9 Oct 2024 18:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3XZYESD3qwV; Wed,  9 Oct 2024 18:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3070E80FFE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3070E80FFE;
	Wed,  9 Oct 2024 18:34:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CAD41BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0867440607
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-a8ZXP4_9Lg for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 18:34:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6329405AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6329405AA
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6329405AA
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 18:34:36 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-83542d9d7c1so3348939f.2
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 11:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728498875; x=1729103675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=er48ObRXECsBxjJFsISL1zWQTo5lyPbIFt9u9GkH5qg=;
 b=VhiXceraGlmXdvFrSHF9UGSpkY95Pbr0t6hzyEJKKKG4V4sALJIJa9jny7V0jBGXcj
 hFmE/F6NGM65oM5C9mWbJST6hhEb5untr+LMU8J7WkN6hvFc83A9Z1LzLvQtWoWvip7o
 C0887h8MbJsdj/HSVkO6fr04fxnN+yH2wNL5losIkhbl+mstVZkngXFThhZf3d+55kfc
 2g590/0lywLUVqY6gBnFw8PrZzRkCLgaW+BrJROTJMABcqyjBOQ5vBdbbri5r537bi0J
 zaEWQ0oGqWRM3r/zgqLj3uzKGqVuxIZ+C+YfQ6yz/wquoL+HDoFP+0JLMkJkQoWGR8mY
 s6rw==
X-Gm-Message-State: AOJu0YxEZsbZF7bBnCqBYLNckrm7HnWYVqKpWUyiOPzXmvC+Rl+XFRsz
 3SL1q67DnPnetIYk7AW3Joai/ZtDptujzplafWWa6axqZuqW1Dr/Etdv/+j1
X-Google-Smtp-Source: AGHT+IG3UGZDVerghMnak9ZwcuR9zttH12qQzySfyaK7PrY3PKKM/9I9KkqPr3K512oMxZTGX5RvWw==
X-Received: by 2002:a05:6e02:1949:b0:3a0:8eb3:5154 with SMTP id
 e9e14a558f8ab-3a3a5c96a9amr10161935ab.4.1728498875573; 
 Wed, 09 Oct 2024 11:34:35 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a3a380c90esm1846175ab.70.2024.10.09.11.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 11:34:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 12:34:17 -0600
Message-Id: <20241009183417.3885725-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728498875; x=1729103675; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=er48ObRXECsBxjJFsISL1zWQTo5lyPbIFt9u9GkH5qg=;
 b=m1Tkkyv6SF5yPeYVyJ8pFGS0eaTTiLXB6tLaHQjIvA35GHYWitTcVe2fsSqWmP50hJ
 CWUpLK5afdp7l1UtMAw0B5Z0Gv78TUCUAYzO0NyJ8zfZmbiLmd8oMPLWNQl6VIIGAx3v
 sgNzP3ToKIlJ7NjNHRAj9AofuZ17lKqud/a3BXyl/A+hQFYmUkp/vvV5WAc4klSE6jys
 Cg9exO03J3zzNt67pxF2z1mAR711ZU4+u9u6Aq6HCAxklHkhAvr71b6UBIPCzA8C28fk
 7ZCZRNrTsW2XR+PH4cq7GhAgjycVYfQqHaUODc9VtwOqVqGXDo7YOxIxrBj54oSujvfX
 7mAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m1Tkkyv6
Subject: [Buildroot] [PATCH 1/1] package/python-webob: bump to version 1.8.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-webob/python-webob.hash | 4 ++--
 package/python-webob/python-webob.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-webob/python-webob.hash b/package/python-webob/python-webob.hash
index a46c1dbc94..065a878d41 100644
--- a/package/python-webob/python-webob.hash
+++ b/package/python-webob/python-webob.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webob/json
-md5  10191c69fa5a2c00f3b9abfb8937b415  WebOb-1.8.7.tar.gz
-sha256  b64ef5141be559cfade448f044fa45c2260351edcb6a8ef6b7e00c7dcef0c323  WebOb-1.8.7.tar.gz
+md5  2372b45cf0e0a3970daaa901fc9d0f64  webob-1.8.8.tar.gz
+sha256  2abc1555e118fc251e705fc6dc66c7f5353bb9fbfab6d20e22f1c02b4b71bcee  webob-1.8.8.tar.gz
 # Locally computed sha256 checksums
 sha256  27bc4919e7e9e6b6cda40644517ca74d32203e32fba89ef832aba1ed93e457b3  docs/license.txt
diff --git a/package/python-webob/python-webob.mk b/package/python-webob/python-webob.mk
index 11ba104476..0240d3a456 100644
--- a/package/python-webob/python-webob.mk
+++ b/package/python-webob/python-webob.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBOB_VERSION = 1.8.7
-PYTHON_WEBOB_SOURCE = WebOb-$(PYTHON_WEBOB_VERSION).tar.gz
-PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/c7/45/ee5f034fb4ebe3236fa49e5a4fcbc54444dd22ecf33079cf56f9606d479d
+PYTHON_WEBOB_VERSION = 1.8.8
+PYTHON_WEBOB_SOURCE = webob-$(PYTHON_WEBOB_VERSION).tar.gz
+PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/a2/7a/ac5b1ab5636cc3bfc9bab1ed54ff4e8fdeb6367edd911f7337be2248b8ab
 PYTHON_WEBOB_SETUP_TYPE = setuptools
 PYTHON_WEBOB_LICENSE = MIT
 PYTHON_WEBOB_LICENSE_FILES = docs/license.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

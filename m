Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28697E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEA7180E0A;
	Sat, 11 Jan 2025 18:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ht9yR5kep_ur; Sat, 11 Jan 2025 18:46:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEDFC82F0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEDFC82F0F;
	Sat, 11 Jan 2025 18:46:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C550942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DEE382F0F
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POSFd0RwlVT0 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:46:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 45FE980E0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45FE980E0A
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45FE980E0A
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:46:16 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-844e55a981dso97524539f.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736621175; x=1737225975;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N3eOEzlXPOQQgaWs1EIGlWIhGyJ/wfUR7gELJAWj0qw=;
 b=ZMuU9/qDziSLm83GowQqx+wU4lk+WP0q9Y7LhT8tJuikLOnDo8NgzR3v/zE5Sfg/J/
 u/oSKa7kM3vHC6LWIIOXCfbTB+p5Er13sqCYKI5hAA7VE2mHy5oDjOf2fVlgm6gdQ7ov
 anNl4rRagfEuKWsvKfWSc9vxerdK3M1o1UiBkzj4kUa9VGjpHR10Ld/RhrSzBhXbBIfu
 1PVcZiqv4nMSlEileMECVY0xsxo2n876YmG1/mbRd8RDKFxyIn3Wnihp3SKsbksCeFFs
 D5OgnUppurmtLmO52r3qIknuAJ1o6gwjMZzHWXk5RnBZOoLB5B/VHZCtVkyFAYvKztRB
 GNwg==
X-Gm-Message-State: AOJu0YzvNSp5R6E+PSiPfKUMQ0TXO7L/Bi5Orn5+e3VpXdBYOEqLvp2m
 jaxQq+Y0ZyAfok27andcS+mU4fCecsdX04U0xkeIojGrAnNuhGlYWx+3CFoC5ZI=
X-Gm-Gg: ASbGncsyWgYY/RzdJcBlWmB3AEl2rmEYoyChfPRS/UwdrDHnzIDbX9QGudmgEtLRkXk
 /ncMcF4aSZ/QXusVvgBBbRvbtGeK81I7x/KEKWpJPHdX0cv0AZmPYa7Ka5ys9CnXldi+3QyOFOa
 i0v1AedIl3mYYiPnfbLEtRkzUgOtrWd0JVC4xd4HSGQr+2YTYM4jfvOYgohNvQLohznHgXW+D+C
 rHVqnMVLYRI5VvprZ0KOKlxcXegkVZI/JOFcuupr2BpEqiD7tf7usjzXmQoHTv3ixlHDcMUfUfm
 aN/rdy2puPnRpBkBvtaPOeI5tXiD7Zo=
X-Google-Smtp-Source: AGHT+IEtmf4EQrkp0KXbdzUdx1fQtpF+B2rLksWr+bqVc5XmRhQs15uz7pDw20lBM94NqK7QHWv4xQ==
X-Received: by 2002:a05:6602:7504:b0:844:cb6b:56b2 with SMTP id
 ca18e2360f4ac-84ce007c893mr1478719239f.6.1736621174915; 
 Sat, 11 Jan 2025 10:46:14 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b74a17dsm1671724173.132.2025.01.11.10.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:46:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:46:13 -0700
Message-Id: <20250111184613.2948996-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736621175; x=1737225975; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N3eOEzlXPOQQgaWs1EIGlWIhGyJ/wfUR7gELJAWj0qw=;
 b=l6p7J3R6DBYFJ5zTfyZTQhO6FT96/MNbyaAdLN2lotfJGufPZAV5sQL+A6LTQi7tee
 C+4rJuzftVAdwPUauUMcIYZP9lWqSrP4AGfe19LkLIJImYFbdjTmT1g9t2HlY156sRdv
 0xRpwutroxBwE+DLl7mqgSDP5MmepHYJae0S+k+FJSEWjkTMa7GB4BCLwti8spY6CQBd
 FZ7/AVE33tgPYaWdGIClE4sIzg9S9r3CTS1/LiDngRSEaUFPyQrA1Wy5tvtyaLS8NIFD
 GZMDTCkFYlLmd8vVltGt0TYynl8BvmP5zWlP0D2/k7tkTTvpRAPzmFMDX36AxZ7SY/lQ
 R+dQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l6p7J3R6
Subject: [Buildroot] [PATCH 1/1] package/python-typepy: bump to version 1.3.4
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

Add new host-python-setuptools-scm build dependency.

License hash changed due to year update:
https://github.com/thombashi/typepy/commit/974f6c5665c4ff0ee9f030e5d2e89b07bcea2073

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-typepy/python-typepy.hash | 6 +++---
 package/python-typepy/python-typepy.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-typepy/python-typepy.hash b/package/python-typepy/python-typepy.hash
index 0b73f9f4df..5cf3daded9 100644
--- a/package/python-typepy/python-typepy.hash
+++ b/package/python-typepy/python-typepy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typepy/json
-md5  2637fdf609b8a7b9b8ec722852efc706  typepy-1.3.2.tar.gz
-sha256  b69fd48b9f50cdb3809906eef36b855b3134ff66c8893a4f8580abddb0b39517  typepy-1.3.2.tar.gz
+md5  f7ba433b3ea79aa36699be634b36aef1  typepy-1.3.4.tar.gz
+sha256  89c1f66de6c6133209c43a94d23431d320ba03ef5db18f241091ea594035d9de  typepy-1.3.4.tar.gz
 # Locally computed sha256 checksums
-sha256  bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
+sha256  4434f353a12dd0236a99e5d3fd07fe3b3a453f9164fe10c57a11d6ca86b50c08  LICENSE
diff --git a/package/python-typepy/python-typepy.mk b/package/python-typepy/python-typepy.mk
index cd67d4e888..03760f1d5f 100644
--- a/package/python-typepy/python-typepy.mk
+++ b/package/python-typepy/python-typepy.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_TYPEPY_VERSION = 1.3.2
+PYTHON_TYPEPY_VERSION = 1.3.4
 PYTHON_TYPEPY_SOURCE = typepy-$(PYTHON_TYPEPY_VERSION).tar.gz
-PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/cc/86/9672794fb1c87a17b839666976ed4c8cb779ce05d471bed3166a39a53c4d
+PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/79/59/4c39942077d7de285f762a91024dbda731be693591732977358f77d120fb
 PYTHON_TYPEPY_SETUP_TYPE = setuptools
 PYTHON_TYPEPY_LICENSE = MIT
 PYTHON_TYPEPY_LICENSE_FILES = LICENSE
+PYTHON_TYPEPY_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D629AC83F17
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 00:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60469419EA;
	Sat, 19 Jul 2025 00:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E97D624KlReQ; Sat, 19 Jul 2025 00:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CF14419B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CF14419B4;
	Sat, 19 Jul 2025 00:46:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D68FF2734
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 00:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCBD7617B2
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 00:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFVqEC1MGAnW for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 00:46:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3AA9660E05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AA9660E05
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AA9660E05
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 00:46:56 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3e28be470f1so12147355ab.0
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 17:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752886015; x=1753490815;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T7jRpq941F9qmkG9tOW3QVVc6PHeyYkKcxA/uqoT26o=;
 b=rxsWUQjr1Uv3IqrxaWpzhjWieZtf7J0UnRdxZwNqCgW5bLgn5JY3PmZ0GbZKdTisEJ
 aRDkDsPcrqR7geipBjCm8LGRZOGB8AK5q1ZyjYaHue+QvjQ7vgsOE8K6XafC4cLc3Nye
 IwLrQQ2xCXH5oePhEKk7mUgSS3+EonmrMxDS4oUWzicOwp2xgTJqxBFTkjl5qUjHtBGG
 clRiShA5Vu5tbLr8zqU/2CraWK66O/uhuEy/ksfD5VALGiDyWHPCLz+s2IYpVdpanfxx
 bNBbRymbotdkh9OTTKaQepTgDz8pj6FNC4VMcqJ1fGZZIPtHHJ2VHHz9jjRyKapJ+BCL
 P6Dg==
X-Gm-Message-State: AOJu0YyPmb2ZOj9IcKMQyd6mBfYD9aF0T3FFkSjNSkx8HfuD2eGkAGNJ
 MHsANI8Groz8zbEEN03i/zxM2vYdHkHL2YYK3o0q1LqZhnTGeGdmHgO9qvSbhT4n
X-Gm-Gg: ASbGnct5JhWF5/Z361e0/VXbr8+PVgSJmmNXo50igFAaqKlfpSbX5alzQNYw2EqlNcx
 V1rBtnk6j73ZeM5q18H1aLCcYyt1AjjheZF4cznv3HPYEH/KWU5ZHtlah4PGsAQRgtHw0bFMdp2
 YdYr31G5lh+TKFPPtpetPuUUZ5oMJbZ8QwLFdYavD/qNjcNYMPV202suRuXlL2BEYNlH9eMNJgO
 LIuBmAIvfCc9a9Q4cGnbNcbvtmWyKVXzESjIfyg7vZ0jZ3AbdtRAz/NM9bQ+wwjPyZ2LjQOL+jx
 YCyfQNyOcf5OEPzoSzo6QE+O/pXlm1F2pYypo+0QHdMBwcwOW5B1mlAPLE2z0esU56I0Z6HvhEq
 xml/KgNb2Vz02FvZ9Jvue4IIU7u63p319IPA8K53RDdO1NXebgasPI699Or/AA/aDNMW3QoFWMi
 vPKw4LWKHwoZxVJyGhqg==
X-Google-Smtp-Source: AGHT+IHOJImfOquOkFvUWmRcIj/NKKHAnfcmo8ZUUyjHhe0etWo861ws/IzFDy8SmEnrnZFHICCHEQ==
X-Received: by 2002:a05:6e02:1c03:b0:3df:e7d:fda8 with SMTP id
 e9e14a558f8ab-3e295979073mr49866525ab.1.1752886014901; 
 Fri, 18 Jul 2025 17:46:54 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5084c9b51a4sm603989173.79.2025.07.18.17.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 17:46:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Jul 2025 18:46:52 -0600
Message-Id: <20250719004652.3087009-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752886015; x=1753490815; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T7jRpq941F9qmkG9tOW3QVVc6PHeyYkKcxA/uqoT26o=;
 b=Rsx7ccrIZ9K8Qp1M7ie0cnI0xedSC+fNa+NJd57fCH/o1Pq8pqCk/c/jgQVRQqToOn
 olvXKlcUDYQ8+9jv3ry2OAAgnvdU9CvmFGiO10VdQxqD4qQnJ7hUqwpLTvYyz+dRcbdm
 pkUdfpKgvWJokVwSwy6dmBRKUY3HfaMX4Z7u2HbMa7vB+sFpila03fqh6FEcwNpQ3AuK
 looFT9bvF5zwpcTwPW/4ezKzVkwuHHLuLUTHXkTcn1xysOYknzdjE2Jojllom7p5TnzW
 GgMAe+OoZCpSGl0/tzpF0zaYT1dXvvLj3no1W6qO/3FCxSOWPVi/SF7LvTF1jPPXX3uj
 zRdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Rsx7ccrI
Subject: [Buildroot] [PATCH 1/1] package/python-dbus-fast: fix cython 3.1.x
 compatibility
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
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set --skip-dependency-check as dbus-fast specifies an unnecessarily
strict maximum cython version.

Fixes:
ERROR Missing dependencies:
	Cython<3.1.0,>=3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dbus-fast/python-dbus-fast.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 854ce2068b..fe17674708 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -11,6 +11,7 @@ PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
 PYTHON_DBUS_FAST_ENV = REQUIRE_CYTHON=1
+PYTHON_DBUS_FAST_BUILD_OPTS = --skip-dependency-check
 PYTHON_DBUS_FAST_DEPENDENCIES = \
 	host-python-cython \
 	host-python-setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

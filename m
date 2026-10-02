Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682C7CA5FE5
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 20:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 315B581399;
	Fri,  2 Oct 2026 20:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_03bskj7ZFA; Fri,  2 Oct 2026 20:55:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 44EF581397
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790974532;
	b=QWLDgbiLgyIX9WJVLkMjkynOMZfcqO/5Ac4rsm+8eVYVT5NPgr1P79EhN8DymZZbKPHv
	 NIDEL1s/1Y7Kaa0NyhKf+rPpL2T4SAkKl7kpaCIE61Dgc5BCGEKbe1lI1l+67EkQOaPZ0
	 K1casICDQq0c3linUQYpiw8l/AMgNAPD/mpgI3+gRsr4O/ErQJXdZbT5xfPmrn668YAma
	 Y60Ktmhjl8sSL1hnJJosvGjkBdqlrgih0ISYZuAb6PljWHBJazYBXBr7mz3hzrh8OLBpD
	 AFRnx/SgElsm5IlqePEIH72mwz11TpGe54GWnul1TIhdjjIudQ+9SfBDuOkgulu9jRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790974532;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=OevPYkX5BumNWjEX+2vSgEDtBtZ22NW+5HtDN71OZ+s=;
	b=SZcdzOOGp+rC+QE0ILE9VGkg4DuUA4hpboa3pBQo4h4kE1++0FzcucU2WEA3eKJfS+QV
	 R+hf5y9ZZv0+yg5clYkxWk+e1WWoL+NqhWe4EPrw52YQIt+3Q+wY7WJxzmNVsQG1XHzEc
	 iR7Jsio0V2agEUJyerPd8qAYaNxQwAPBe9SeAgUKBDMllVi7YUc8Ba5RcOxM1XSMU7m8C
	 mUa+CnRnerZ92z9nj+J9+OlqhOVbmOPjlbXl1aI5pZ/PQkQcCsupBWYLwaodElD9MmhxX
	 KjDUGjD6AALbwfvK5DstWNrFH5PA5B9fBkhcIyjop8v1fUWyLUQCGfiFXU06o+TgzCw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790974532;
	bh=OevPYkX5BumNWjEX+2vSgEDtBtZ22NW+5HtDN71OZ+s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KLkomt+SxjJwUC+cIqraxNTcICBSPGoDSZ8XStNTZUYxyNwwvLYh0R88AiMxWQ5OP
	 I7pAQYH+gLciW80N3Em87iRKXeS8jrqdIHhuEFlqmq5nmFDTHpnErT1R4oEJTMn9y2
	 RH3dQkBnKulk1VUw3NUKpnqysM2edPlh7kWTm5tdxMSApWvm/EWFu0nLYBnEf44yMi
	 wDsJsM7DnBEfYTfuv3aOCstB6raEfdYhHsP0JmTz6W1TQPWeJ59NYKBcKXPmX62LPb
	 68FKfJflRA9qvWZWfPwwUsWHuABjclAhjIh5ywF4eElqquLXcaz74SYrCXmgH4j4/h
	 PH8x273j5udcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44EF581397;
	Fri,  2 Oct 2026 20:55:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0691D2E0
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC6AD60D70
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id du3be8kEf7DQ for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 20:55:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EBBC060D6B
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::28"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790974527;
 b=VrPW0QLuyVX8+s5LuBTC0V2HPwFRjwpN3ysUn5MmfetetwnTDATgjIanqq/ao7TMmU3L
 0wPV5NqVPTbmmYUVVGt7hhS3sKInDLVPzArMDUu1fnaCyrjGVBXEDM93RzM8xBSsV2fge
 9yigu6yM3D0uMIdjomg1/ZBUp08E8z6AtHnjerjHw5S6Hpq3jyKT9NB0vvgXLWS6xdALR
 TYxRiqnKCzEN0qwRWKH7RKffwARQ2zZLW3GcX1KdzFMIrvB3OGkuinXu4+F/NjmyhovPW
 PJGikj2IzMKFqxKRjB/5sDPsM/7O0KIzgKY/cvRUDpH9sGNE8TJl50LBZkrqUsYE4og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790974527;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=K+hvx5q/YCOssV5tLPSVEHTLpLlUqyvDogpY1vLDNb8=;
 b=qt4zQJ8WrkfvlN5zSK8m8FeMiaCXqTb24eBk2MFpgEqB/q5txq5p4q6C15gXql7xsXaw
 Y6Bm2uxjKNUFzRJXTe/q1Cg/tgpaTIoZP84mD7FNyfD9rsYPmpZatyCe+dBypIj/q1EB6
 A5/+8iitsUXx8ppQK/225rb+C3b6R2PZwG+BHhvcOJz40KR2aqilHqMNiVdxPVIADirzS
 0yhp/pX64/jLVEbc0hmp96okqUICbHbI21xTtrwvCw1oqeu5AFqxqhwk79dmtsBZANuBQ
 c4YzlcQ9CE5EHmpcfgAWNNxxBkslsOcXyVFPZd0iUw25L5KWhLcRgh9EY3Gm4ryvE4A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=kKq5uxfW; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::28"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::28; helo=mail-oo2-x28.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=kKq5uxfW
Received: from mail-oo2-x28.google.com (mail-oo2-x28.google.com
 [IPv6:2607:f8b0:4864:31::28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBBC060D6B
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:26 +0000 (UTC)
Received: by mail-oo2-x28.google.com with SMTP id
 006d021491bc7-6dcf2ba1fa0so185821eaf.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 13:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790974525; x=1791579325; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=K+hvx5q/YCOssV5tLPSVEHTLpLlUqyvDogpY1vLDNb8=;
 b=kKq5uxfWZirEppbH1bQo5fQTfQEWFrdM37SCKYKNmsIuSTJNHsej7qin2tiE7wekTC
 79Es2h8AfoQ9QECwXKMnL5zWA3k3CXK/g51CTAyhQxVhf1mMeLlpsn+4SXeRUmmo6Hp6
 NCs7UR+7AZDQa+ILZmDSBQ/vmiNzZZHBJTfxJWXeS0pwdlHoRYpvzJT3EjZzQ6jpJqn3
 2uqI8OLaNkXcsZfvMOdqnIFBrWwixPZlQ9cLhIvDwtvU0OHagl+Be7hXv+pZQpep3W7O
 KHSPk4ayTHinp0PN5rn2vADAAAvw0cj+fh9VR1ciIlV7GnV8jJnqLywaGnq0eUnv6HSE
 Ru3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790974525; x=1791579325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=K+hvx5q/YCOssV5tLPSVEHTLpLlUqyvDogpY1vLDNb8=;
 b=pfX5fsuTbmoeLPk57asF7qjoSB4gAKd3ADRkWynWISl8LP8S11Fyb89bhvN8rWYoZO
 RnhWmJz63kKKiL/sUi6B+KK8oAmNmot3TbP3LQ+SWIP3iYgt3ssvmBmgxcpnW+a9wrsb
 BXdSTfxuGxsw/fXYXycl79A4vTDPatnW5t9u70a1odHsISLiHo6ax033Lvlv/T12ePlu
 OgPcd2fv4+30UmprK8PktKeTaBC0NZcBvu1iPIzHASPwpraQFNegs/yBi5m3vfMAA60G
 4JoVf50oa8nbJYzVfol7mF6mKX2VE7Si9FFWfnf3MlisZzZrveHz0plaR4m8TI60gM2z
 Tu/w==
X-Gm-Message-State: AFuF++njJ55/Dp+cvyYSE5JxwUbA0G/DWxRsyHLW836jy4mPoU2awVqt
 Ie0ezfbyQJ0DbrctLjNyphoFuo0tj6BmGT/A8MVl7F1EXgMmM80m1YnvEfpaFg==
X-Gm-Gg: AYBFou109seguLcIGKaYqfEwulAog1gvWqwlqC93BwTvmmvLKjA/mKkHGeToz/nd+ie
 CrZf6AEkskhWn1IlqdAlP/g4nRNk2o8bobxiyK7ZNSG2XOMPH3+Ym49NdJE+KjdwjjbeqnLTYlL
 bHykCcUeXPYNyx744n9/Xp/pPsvVQrcNe+6FwPMdOwOGr2OvBOrCAGGeQwqObVbGnWMxcgQoiwu
 kzeKzy3hniHNf11nnrrJbx+vro9yhwBWlSHZ51v/DRcWivJW2GJYTN1L6g3s82g8dW0HP9vpNCt
 nMx89kX2V/wsfzwtGPTSAWqNBFmTM367e4n6PX8Brm/GxKkrPJDQnruohdIIIg8kxvoilOMVHsI
 zg6Yd82OHAorIKLfXOGMeTp1ChvPGGQcNnKQnGNZKGKUi8YacTJ8O7hfZ/rjnIyqL9rwoVOMBRb
 BYBQaYp/PK/7pzOyAfpHdt13YzsZCXYnDysHcPaj4YSMjHyugN+K3FVQ+TkHUbksaGX3Z5lK4Aw
 Vjwk7VXHUYaSvvFJw8TNvD36RPnDVSnI8gIJNkRdjQLpOxC7yBxwQniC9/fqtBSBlC+qbpYsfTx
 TScUSVZYYEhDyDJBpjkzujxDzKy8oVCb0d6lmkNWdRFXForHb14OS/RfobV+5KrRPFDuEiYiSmI
 DBbzlP9hi/rGdkmJZFz0qq0pEG94npWRxTMEB5iO/1g==
X-Received: by 2002:a05:6820:1526:b0:6c9:80d8:a1ef with SMTP id
 006d021491bc7-6df3506061bmr2948423eaf.44.1790974525641; 
 Fri, 02 Oct 2026 13:55:25 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6df3a9b0f1bsm3197929eaf.7.2026.10.02.13.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:55:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 14:55:16 -0600
Message-ID: <20261002205517.4043570-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002205517.4043570-1-james.hilliard1@gmail.com>
References: <20261002205517.4043570-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/6] package/python-httpcore2: new package
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
 package/Config.in                              |  1 +
 package/python-httpcore2/Config.in             |  8 ++++++++
 package/python-httpcore2/python-httpcore2.hash |  5 +++++
 package/python-httpcore2/python-httpcore2.mk   | 17 +++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-httpcore2/Config.in
 create mode 100644 package/python-httpcore2/python-httpcore2.hash
 create mode 100644 package/python-httpcore2/python-httpcore2.mk

diff --git a/package/Config.in b/package/Config.in
index 0c9d66f462..2fdb8b1fc9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1165,6 +1165,7 @@ menu "External python modules"
 	source "package/python-hpack/Config.in"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httpcore/Config.in"
+	source "package/python-httpcore2/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-httpx/Config.in"
 	source "package/python-huepy/Config.in"
diff --git a/package/python-httpcore2/Config.in b/package/python-httpcore2/Config.in
new file mode 100644
index 0000000000..73e1765c11
--- /dev/null
+++ b/package/python-httpcore2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_HTTPCORE2
+	bool "python-httpcore2"
+	select BR2_PACKAGE_PYTHON_H11 # runtime
+	select BR2_PACKAGE_PYTHON_TRUSTSTORE # runtime
+	help
+	  A minimal low-level HTTP client.
+
+	  https://github.com/pydantic/httpx2
diff --git a/package/python-httpcore2/python-httpcore2.hash b/package/python-httpcore2/python-httpcore2.hash
new file mode 100644
index 0000000000..c088cfa87f
--- /dev/null
+++ b/package/python-httpcore2/python-httpcore2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/httpcore2/json
+md5  345513f80f9ba004d66a8534c5b74dfc  httpcore2-2.13.1.tar.gz
+sha256  e0aa977abe17e69a3b820a24542a6fa88702676d83880b8d194dcd18408e5103  httpcore2-2.13.1.tar.gz
+# Locally computed sha256 checksums
+sha256  c4df125c807b0613501e943a5c92496dd11d2c16604ce396097a8dde396304d9  LICENSE.md
diff --git a/package/python-httpcore2/python-httpcore2.mk b/package/python-httpcore2/python-httpcore2.mk
new file mode 100644
index 0000000000..48c3d64604
--- /dev/null
+++ b/package/python-httpcore2/python-httpcore2.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-httpcore2
+#
+################################################################################
+
+PYTHON_HTTPCORE2_VERSION = 2.13.1
+PYTHON_HTTPCORE2_SOURCE = httpcore2-$(PYTHON_HTTPCORE2_VERSION).tar.gz
+PYTHON_HTTPCORE2_SITE = https://files.pythonhosted.org/packages/cb/f3/1db7aa2bc2524062192bb0e0323969492d1883152a232fe36eea65f4e35c
+PYTHON_HTTPCORE2_SETUP_TYPE = hatch
+PYTHON_HTTPCORE2_LICENSE = BSD-3-Clause
+PYTHON_HTTPCORE2_LICENSE_FILES = LICENSE.md
+PYTHON_HTTPCORE2_DEPENDENCIES = \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-uv-dynamic-versioning
+
+$(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

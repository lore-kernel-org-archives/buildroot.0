Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FB5CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 19:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E265760AA0;
	Thu, 15 Oct 2026 19:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2zMk7sV42nQ1; Thu, 15 Oct 2026 19:33:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B6AC060A95
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792092791;
	b=tGdSVjcWu+UK0kuC3u3JWtdY71GT+bKb752PacpK2fnP4dz0Db1uMyB+sER+TzgdJHwZ
	 VWQnwfX0mx5DZP089FlB/xjcGUD9w3VUfPeFssVfdd3UHiM8+COktoOj8j1zujrFlpia2
	 RwH6E4g+movnmrR6+OpvFd1k8PV8O8pPlJGbXwbmgiVP6VIVTE4OPnFAqCK3ueYSexehR
	 KS8Lvmm0l/QKC2t8DwYSjB6s2+kPO1RZ57q7ycP7anl6Os1SKaEnKp0yJpsHcsjbEL4yV
	 SL4nnehpfEpI8XGpjMT4IF1V+wN3xwQOsstEvWclLd2EwPZAu7B1fJP+otnSYWo9D1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792092791;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ZORIvP16Mj72RWAQx5vH2rAdHlw7O/+JNdK4iNV+TPU=;
	b=Lobuo/N3Ey7wUrZvfoNnyV3rV+b3UTx+vPBXc83dCUJmldAwcfK9T0wz6mcxibdh/x81
	 wnDA37Whm2SNM/d1EkiFLh+ygQQfYf+9R8RVo0IfYyeT92Xznu9/DqE7QDGqdcaIf2+7n
	 ENEumbTMxCCmuPFJetgX7OaQPTgbeTJKGJIgX4lCz95T0T+m+8N+K41ayuyA1I/TsddL7
	 u/YMk2laYPqcv0xTLyVHsRSfSMrje3HNv6JPkp2iOGeUdlkP8QFFBSETxdMd1OoCa4gMt
	 a3sKA7M12h87K0SSF9ycmjYGmzLVU4JrOTs33JF+U7LRdOd9M12tFJM6C8AmQ/yqvMQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792092791;
	bh=ZORIvP16Mj72RWAQx5vH2rAdHlw7O/+JNdK4iNV+TPU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Oog1ueS101IefzXcsAS7SZq0i6zJgHJ89Nf8mDLmiOiH6F/BDgUIgOaDbNTfQRTxx
	 G2aZwOifkOS2xTQ0USRjuCLNg7g9D/Doq0Ycjahkyw8wwzhkDW9wMbUp+yj612H3jV
	 wbRh+xIJ0bxjOo75CjqdRu1oL57W1x/aJaKyrNI1sJUKQkqvkzUPg7tB3P7EFh8mov
	 eMClVZhJvuZLlrcq3ad+FMKDaqOlZvC1dKEUmPjdoUREzglIskpvhRS88c6BHjfnSK
	 jVsc72tF0IhuWZhjabTaxqbtarA4MrYdagCskZUcgs6nWbURuEj6lMYrcRwe/5Cs+2
	 MoP/CxcwxHlqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6AC060A95;
	Thu, 15 Oct 2026 19:33:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BD0F1AB
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6EC2811F1
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GS-UQcqk7T5m for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 19:33:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D2AEC811DA
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792092788;
 b=VYCqvZa/7PEuwTKfligcPufHeyLqlY9nzu06KEhAOeu9r7jPOAr9+NZgNTZCbnwQLMao
 AgfiL/ZXZIqBFEl3QaoStrFzxxdn8ilJ767HlSQn1a5vHCMko3aRvnyf3k7jjdW/m21wB
 HSVfV0DpXAqs1FsgRzRJrB5EVuEu1bgis1dAPfpPQdtwvpJksMOXKLjblwtpZMjNXbcsq
 QnDkJUMOnzWNP/48ois/rBENQa4UP8snAY9ERRgtjhn9bQnhxx5qrjXhRIJnZB6px5ff6
 kntUkv82mDv6zpwxmhtveZ23ZvtwZmjy6WEmLaudGd3KXvvlRDj4nYA25xTlXtuTWHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792092788;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=QwBAwBQs6GQpFMMIgnCJbvJMbj6v8H4zsuUzJrPv4mo=;
 b=Htc5k1Hpi37vlpxT0HZQ1XJ+7YK3r7AWvZbeZzquHUfeTbE76MbzjgXZrN+503Sp2Sa5
 N1mBXyxiz/UNulgfAmFof/pCoeSXeyhubdTdndezCo1ESl4txAEFBqXdVjTVrIQMD0zVQ
 R1n8Vh4v69wqJLumC1h70co5MCmRHY8ST7fXBtsjRMgvl23l256H3cGPw/Hj3tk6vNv1+
 PJ0bELUjOJYbbCQ/g0kHL4FocKszsIPqcyAVIlplHuJSNzjuOrP65s0m4YIn9BapN7oGe
 LyrNQfgimC3CEm5/bBBaFU7aoEWCArKe+BYwWRdSgkS2VoRfNjgvzU5TeKuM5Zo0X0A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=O9o5Tql0; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=O9o5Tql0
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2AEC811DA
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:07 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-6f74f6b46abso2592560eaf.0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792092786; x=1792697586; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QwBAwBQs6GQpFMMIgnCJbvJMbj6v8H4zsuUzJrPv4mo=;
 b=O9o5Tql01PyS1MMEoLZKP5ePgXfadqAA7Ff+BKR1nx+KiMHDb9Vfo9RojkHzL+qLf+
 S9IJu4zqLGZd9LRDGV8CmmeYyiVwJbVJ4B8WFHcSWJDW5/q1K215561b5K3tRmr++frQ
 TSYrh1iWkGOR0CHjIbvkd/hAgkqn3rJ1Ks9L+WduY0E7Ko6k9Ffhf3DEf0JWYdOoleUb
 Q4Iw2ymqIx+dCOFUmeNMfmw3bYeBRc9OKYCWEYvNpH/gDXwU0BRsjU//2957KdrsBJgX
 z/lna0oCL0sOdYaVWwEWR5NOdNoeIPYdiPe5UdQSAjNIPt6RBfWdMYnX3B477wFIhhIV
 H7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792092786; x=1792697586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QwBAwBQs6GQpFMMIgnCJbvJMbj6v8H4zsuUzJrPv4mo=;
 b=RByjtlt7hEuNOFylOesgibJBDe63sxtBAH6LlDmdXSzAnkJ/xX7LPGiHl6As6J2Ekh
 9CxRNNYumfKo/ieglmpSY8hWbaMt33MgN8refZTO7MNntVybkFyMxrUPQfrvoPXVbxi1
 0gJlGIdtfaHehnhszQLjgueJh3QwIzSAwmbkAVvK05cU04PZ6MIPNe7ra0AFcI0wQi8I
 U7BAbCp1Pls7NNZQWEjQ1VnKrdViJImzLWtyy5IqrpgEefPQyjxapy+l0U36N+bRrlsF
 BlLk0TaxKLCs1DbKYt8iX0tdAQEkZCNz5PIcWmsexcEu+wHEyhPmXJH4dpP5wcCQOZmM
 CgFA==
X-Gm-Message-State: AFq9FYKCVugmOj/QyHYKLfuHxxQfH8z2hhZym+XxRrY78Hgg3Gti8/zk
 2jNvXLfhfoxqW51NzSSIGobnaBf4XcWyQTYEGzuTkfnkBd8wBcmkjk2PIY29Yg==
X-Gm-Gg: AYBFou2WwnTKFofiEMgiSh+VdZEiO7+XRvhvgnQj2hr9qfF95aw75V2Y3kCCJehglLN
 XNHJX51vuhxjZ6Yw3YrrGdyRdyU2grWuXoLUtzDFt1C+qco6u+Fk8bHEliQHTLMXh963bLMx4tY
 DUhvtjj6ZQ995QeBXsOT7YYFym+EAYHN7+WGb07QI9pfweorY2tFrQcrk8Yd8RMl6sn8BAYyuZD
 +1RohGqs8PUFouixuTIX7WJxqzXQ+/aLOcM9ZddjV7b75gC5gMnGPU9O0+VPB5E6dlsVuaq8Xqe
 R2h+NsKBzeoYm0pkkIbwLOthRmkxtrTJgi+zYa5mEBhpXToPBCG1cpYRMiyzbM7kz26hGSHGPMj
 SBWdeVPKhI7pM4CNYak9huHNiQtmipgHCyeL0a6g3VAPquS1wYsMJLzhg/csNxT954g2G+BIS6u
 enSQeuReyUmB6s7wW3sLsvX7fLbKCzm97gbn1W7XZ3DhGCU1BPPVBdkb83y2N+U35PvQD1LMuuu
 K6WYkzzb8M73KUhc390v3LNDknvEBftjuW3V5DTreydhWX9mIJVlKVGLXFpBThg6Lyuh1iI7JNs
 Q2uezQJkAMXwRJuOS9Tf5EruNIlQEIxeqC18ykYGQEv9sC7EcPtFnZcietAXoprQ0goq652Gm5a
 4sqE2MsAW8KlZkLb1lMWIaY+SKUhZEqjoL6rsV0xwl9O/9vJf6zp+
X-Received: by 2002:a05:6820:2d03:b0:6e0:1599:a4a with SMTP id
 006d021491bc7-6ef0dff2c3amr14728575eaf.35.1792092786484; 
 Thu, 15 Oct 2026 12:33:06 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-7018f2df328sm180045eaf.7.2026.10.15.12.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 12:33:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:32:42 -0600
Message-ID: <20261015193243.3299884-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015193243.3299884-1-james.hilliard1@gmail.com>
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 8/9] package/python-pkg-resources: new host
 package
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
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Setuptools 82 removed pkg_resources, but older U-Boot Binman versions
still use it. Package the standalone PyPA snapshot so these consumers
can keep working when setuptools is updated.

Add a small setuptools pyproject.toml to build the module from its
repository-root layout, and include the license addition proposed
upstream. Supply packaging, jaraco.text and platformdirs explicitly,
as the standalone module imports all three at runtime.

Add a host runtime test covering resource access, dependency resolution
and cache lookup.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-LICENSE-copy-from-setuptools.patch   | 39 +++++++++++++++++++
 ...-metadata-for-the-standalone-package.patch | 39 +++++++++++++++++++
 .../python-pkg-resources.hash                 |  3 ++
 .../python-pkg-resources.mk                   | 17 ++++++++
 .../package/test_python_pkg_resources.py      | 14 +++++++
 5 files changed, 112 insertions(+)
 create mode 100644 package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch
 create mode 100644 package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch
 create mode 100644 package/python-pkg-resources/python-pkg-resources.hash
 create mode 100644 package/python-pkg-resources/python-pkg-resources.mk
 create mode 100644 support/testing/tests/package/test_python_pkg_resources.py

diff --git a/package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch b/package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch
new file mode 100644
index 0000000000..3ecd63fc8c
--- /dev/null
+++ b/package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch
@@ -0,0 +1,39 @@
+From a5315eb2caffc9b4a43439df81e6a0d7f7647352 Mon Sep 17 00:00:00 2001
+From: Achill Gilgenast <achill@achill.org>
+Date: Sun, 15 Feb 2026 15:58:35 +0100
+Subject: [PATCH] LICENSE: copy from setuptools
+
+Copy the same MIT license from setuptools, just like the rest of
+pkg_resources that is compied from that repository.
+
+Upstream: https://github.com/pypa/pkg_resources/pull/20
+Signed-off-by: Achill Gilgenast <achill@achill.org>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ LICENSE | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+ create mode 100644 LICENSE
+
+diff --git a/LICENSE b/LICENSE
+new file mode 100644
+index 0000000..1bb5a44
+--- /dev/null
++++ b/LICENSE
+@@ -0,0 +1,17 @@
++Permission is hereby granted, free of charge, to any person obtaining a copy
++of this software and associated documentation files (the "Software"), to
++deal in the Software without restriction, including without limitation the
++rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
++sell copies of the Software, and to permit persons to whom the Software is
++furnished to do so, subject to the following conditions:
++
++The above copyright notice and this permission notice shall be included in
++all copies or substantial portions of the Software.
++
++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
++AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
++IN THE SOFTWARE.
diff --git a/package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch b/package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch
new file mode 100644
index 0000000000..e9982cd1a0
--- /dev/null
+++ b/package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch
@@ -0,0 +1,39 @@
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 13 Oct 2026 16:36:30 -0600
+Subject: [PATCH] Add build metadata for the standalone package
+
+Build the extracted pkg_resources module as a standalone wheel, mapping
+the package to the repository root. Use a static version for this snapshot
+so building an archive does not need setuptools-scm or Git metadata.
+
+Upstream: Not applicable [Buildroot snapshot metadata]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ pyproject.toml | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+ create mode 100644 pyproject.toml
+
+diff --git a/pyproject.toml b/pyproject.toml
+new file mode 100644
+--- /dev/null
++++ b/pyproject.toml
+@@ -0,0 +1,19 @@
++[build-system]
++requires = ["setuptools>=77"]
++build-backend = "setuptools.build_meta"
++
++[project]
++name = "pkg_resources"
++version = "0.0.0+git.7fa76c17"
++requires-python = ">=3.9"
++license = "MIT"
++license-files = ["LICENSE"]
++dependencies = [
++    "packaging>=24.2",
++    "jaraco.text>=3.7",
++    "platformdirs>=4.2.2",
++]
++
++[tool.setuptools]
++packages = ["pkg_resources"]
++package-dir = {pkg_resources = "."}
diff --git a/package/python-pkg-resources/python-pkg-resources.hash b/package/python-pkg-resources/python-pkg-resources.hash
new file mode 100644
index 0000000000..e80a20de6f
--- /dev/null
+++ b/package/python-pkg-resources/python-pkg-resources.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5fc3f3fd8e23438a83d366897ce4389d2983d977b4339303359a0ffa0a33c15e  python-pkg-resources-7fa76c17eacf8a67c6932c9c2dd97861f42439cf.tar.gz
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-pkg-resources/python-pkg-resources.mk b/package/python-pkg-resources/python-pkg-resources.mk
new file mode 100644
index 0000000000..35076514f4
--- /dev/null
+++ b/package/python-pkg-resources/python-pkg-resources.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-pkg-resources
+#
+################################################################################
+
+PYTHON_PKG_RESOURCES_VERSION = 7fa76c17eacf8a67c6932c9c2dd97861f42439cf
+PYTHON_PKG_RESOURCES_SITE = $(call github,pypa,pkg_resources,$(PYTHON_PKG_RESOURCES_VERSION))
+PYTHON_PKG_RESOURCES_SETUP_TYPE = setuptools
+PYTHON_PKG_RESOURCES_LICENSE = MIT
+PYTHON_PKG_RESOURCES_LICENSE_FILES = LICENSE
+HOST_PYTHON_PKG_RESOURCES_DEPENDENCIES = \
+	host-python-jaraco-text \
+	host-python-packaging \
+	host-python-platformdirs
+
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_python_pkg_resources.py b/support/testing/tests/package/test_python_pkg_resources.py
new file mode 100644
index 0000000000..72acde3dcd
--- /dev/null
+++ b/support/testing/tests/package/test_python_pkg_resources.py
@@ -0,0 +1,14 @@
+import infra.basetest
+
+
+class TestHostPythonPkgResources(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-pkg-resources"]
+
+    def test_run(self):
+        cmd = ["host/bin/python3", "-I", "-c",
+               "import pkg_resources; "
+               "assert '__init__.py' in pkg_resources.resource_listdir('pkg_resources', ''); "
+               "assert pkg_resources.resource_string('pkg_resources', '__init__.py'); "
+               "assert pkg_resources.require('pkg_resources'); "
+               "assert pkg_resources.get_default_cache()"]
+        infra.run_cmd_on_host(self.builddir, cmd)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

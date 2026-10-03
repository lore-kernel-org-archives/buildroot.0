Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098E0CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 02:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC5E360645;
	Sat,  3 Oct 2026 02:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJWfPJnohPlE; Sat,  3 Oct 2026 02:33:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B8F7160648
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790994827;
	b=bj9UPY4nSIUT93WVl/dt5LAMQBK0GcrXmkVPSbi0ey73AgHNv03rxhAeEOSuPM5tSC1K
	 2Q6VlBL9itmDu7Kz2TfsVNWRk0vOG4mclMfgJv51rArD5OyQfu7TD89VENX8o1CiYlU2X
	 erTvczNnNGdu+gSCShG7++MX6/YIiaw5dceBalKq7yuF2NCi8xtbCihC4GCkrPz6kJ2V1
	 ATmojIpD/cAXpWxWUW1OQfbUmE+JIEX8lqeelt3tFgLGii9hNxHMRiVG75feqoq8hPT/d
	 POFFpqcMuagmaC62VY16UD9KVBQkPNdGXPR7Ykw6DOoe5mFRT43Ny6MIdPFBIGRj3nA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790994827;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5lBqlYz9c40APIUrCUkXZTXLTL9j+I07K5mnHEdGsXo=;
	b=phiI2jjT+33l70y12H3aM00KCPmGBAF5wUhTKcHkWKhfn0Y9wozy1S90v59sljg2Uo8L
	 BNY5sYuhzcv/rnm1sMxyXmuMOjepFUDOntM2+ovmz/p+1fiqy7joQFYixTGRRg1lEpfXB
	 Ie2h3AntWcnKytfXIxC/tZtyLtsZJsLxXXhfUBatIzYvYU338NpJlvUN2/qTzg6qPBM0/
	 bQFSc98FOY+k5m+gQAJklnjKlVZJXHV7I07Xelx1hoSBtDlFM+PbA7mIfh9H446qNeEdh
	 QHy1sls/QdJEr7QSmDGn44dTAEZcgvt3spLpGu6RXk/c1sAZqmFu0+fZX2/gxMSLtXw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790994827;
	bh=5lBqlYz9c40APIUrCUkXZTXLTL9j+I07K5mnHEdGsXo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=KEtRBzlUSpuAlyGmo6k/kgy+TSURuOmANSLH+dvyByb0GxFqNQaHM/Xv5sAjeMAz4
	 qQu160Om6psfh4Nv7Sn72NeXX/OPfDK8BkjpQKpJ6pGoy6I35UziktAAJDi93vBhKF
	 4+4klI5+TycGHl6Gc8VNVHL1zPDme71TKPEFXp2e+sU2FiSPHvDPMOgF03SfPA6EIM
	 VxjQ0fpZ7ah+YxGc6MxDuM7U4FRzIrItuY/rHfS0MJC2t+lteg34BTBptU3xA+5e6m
	 X2OoWouqdh/IzA4k7O/eZn5kxZEFjvCwhU4LpM9n15DdgYwWCMAezTLyHc2AzC7JAk
	 /A5teqQv7ED5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8F7160648;
	Sat,  3 Oct 2026 02:33:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4035332F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25E2281115
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bg3_5sMUWTPG for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 02:33:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 329A681103
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:32::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790994826;
 b=js82Zu6jyI6WCSL561X4RVQnN8bBZOFhqzC8xbCc3kZYrqSll/inGqy3bmOlQ/jHy9nO
 YYDAjW5OkheNk7r8abfw/qzVcDpkc2yncfN2KfIRMj8bqfETfzGOr+dY6ClYx44pLBqQX
 famulmRnfo2tuQDkDPednTYwSNhzvrRQCbNkCB73IzvaPzblvT5jc5f447nA7XgH2s1XL
 r56fY6IC4Rg50wgCxAec3WSPuEhY/n74lhP0Y4FOKD2p30p6fG4bkT0RI2ZlMOxadFu9P
 T2vAc/OPWeMq+ChKOFLDfy3SvP1KLTjLFTIZfrM17OYn/q6iLjW+aGJ9XYiFF0tMMwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790994826;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=wYCbyTlMl8J/0Sk9MLJYYxVegwkalayRm1vdz2ndE4o=;
 b=CNwM0nE+/Q7c5FSLzTNE6Da4JLuqWMdrpuXYn8bGD4+EXIsrDJ3/vGc1FqVpbcLzXSnI
 WJf3aLrJxjm+GNUKZ/3HQ12YJX6bAU8d6rgouhO3jttf6vhQ5oE1zF8ZXebeMgGmqUiI6
 CQ1qgp62POLoWWqwCcsQlP2/4qbkhcqv6RTCELNGAgooejUDlPj7sScbnbkPQHhhPv+mR
 rQbwqySursxGtq/DS2dcqbtgBMvQ80cqygQHpaGVYfYHnqbwus1lzRe5kIgirMPPtLdON
 YUwsZEmO+y3OOLQ9rvL14QaFpwd0jTpdWx5eeYBAf+unE3wF7PZBHcDaplDrH6ty9Cw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Tk8Gexva; 
 arc=none smtp.remote-ip="2607:f8b0:4864:32::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:32::10; helo=mail-oi2-x10.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Tk8Gexva
Received: from mail-oi2-x10.google.com (mail-oi2-x10.google.com
 [IPv6:2607:f8b0:4864:32::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 329A681103
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:33:45 +0000 (UTC)
Received: by mail-oi2-x10.google.com with SMTP id
 5614622812f47-4b37a368895so38978b6e.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 19:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790994824; x=1791599624; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wYCbyTlMl8J/0Sk9MLJYYxVegwkalayRm1vdz2ndE4o=;
 b=Tk8GexvaMMF5DYXj9LyozLi3EHzqvUT6hPnrn0kO4GH+cNQB7dgwjfCYsGxHK6smtT
 HMoA5Y1mpJIimU9bna/DgtZRLrQjggPv5tRR6mqh++V4KgR0QlDUYm1r3QK/GhjLGkOK
 a1qd11j0mwZkqxsPndBIezJvjsDIYJzQnx8XFe5P+r7cG5f0Cp4r+Bst+Co1S3uL70fY
 SaPYFnUta71lCn0ErZP35Z6IoW2keDl5TKtWzN7yD9RsocwIoSBHvkoGM6bUHw9/MxvE
 ZJGHdtW4E3GMWaRoyqgsq75tfAzKoSws71oVWrA9WRwjVW+yleSBXaz2/D/lqcc4xIbY
 RBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790994824; x=1791599624;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wYCbyTlMl8J/0Sk9MLJYYxVegwkalayRm1vdz2ndE4o=;
 b=pyRrszCGdl8YcUqAVxq8IrWnFBuRMm+KYDiiUCJjdONJS8LJopKFTG/vlIC+IFgPA1
 cTw8cylcqoS2Cf+zqlVG9//0NaNgR53xxkbrXip7e/ZRrsC6vJnTsvoSTng+dEM3UXQC
 pkgtVIt40t3j7+iD8AmLvrdAYI29UNuuisQLTYz61I8I/dpf6DYB8gSXcBeWcg6xvqux
 OBS7j1nLjH165TiyCllS3p4ReER2y+k7aNPNkM+YoKBA8Nr47YQBR3Yi/lBtxdxLM8Lp
 PbQ2dkDCcrWhgsY5rXuhB7sYV+mKZKODFM2eKrjmSjnSZcP7LFFXcgSUKkqclfZ0jHOs
 8u9Q==
X-Gm-Message-State: AFuF++lYVbdBklOMYGTbe36anXirX8nyd367cb9CGemzqtyWq0bF+x+B
 KyNkVLtlNmF9aDRhxdUGCwEymO3lQ30TUKtfLorN+uhzTnuiUOms1BQ4h1YeZQ==
X-Gm-Gg: AYBFou1iqDG56hi6FZgRPViBb2TW8g+lLJ5nO0d8BNjR34REhk/XlzXBE3FlZqxSLKt
 gWmGlKmZ2/uBIdNSxJbVBiVl09t2njYL3/FIsXA2ANjiz9GFtbgUqF6XKSbPx3nFevWgWtgG2Uv
 jiasWXkhlQgqFLLTOdbGdokAP34exOIv0d6yhDWJtFhTjAPTT4kpNlK2khg840ps9F+ze/z0cUf
 GPIhOu0+aqdvj7FpaMICidSd2NgT0Y5aYoyO9LSQd7fkoSu3HSDH8KLDRa17hUuTIQ5GRj3PHp0
 +BSKrygNXqmhAFPYMio7WqAgV9V1Zi3b4hHx02Ug/9yvzn/A6MgZSHAtBz2bpyGP0dvGmYSAbpg
 ImMnc2jP4pgkwGk8KSmDc02Wy9FMUqQYou19G/74Sgfx5uFhQBEfnnaMN1M5mLhuBF668cBd18I
 pVCRiUUs6h69Z6wntLFo+WD22TaKc1v4B55/523AZQlCcAAWhBak6MDYWz5Q3SJo+972Y3AZDBH
 LsAzJTwY8T7leqWPyfK8kekp0ckeas1RYkkU18SUcZ22KuR5frHeOQhkyS/eTXievWPIG3mxSmz
 ASBXxmrBMPd3jx68js33YtFqlCB6THlOczHCpK5zx56Z23dXV+RaKGf/2sJdkiNDslM0rzpxjeJ
 jfEGG/LtsosgHNBb1tiN8spTX0NZOVp8b5nkf8ZbHu8A=
X-Received: by 2002:a05:6808:158f:b0:4b9:a8ac:484 with SMTP id
 5614622812f47-4f52a7848e2mr3624114b6e.34.1790994824535; 
 Fri, 02 Oct 2026 19:33:44 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4f5249d7c75sm3936069b6e.12.2026.10.02.19.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 19:33:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 20:33:40 -0600
Message-ID: <20261003023341.454213-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-opentelemetry-api: new
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-opentelemetry-api/Config.in         |  7 +++++++
 .../python-opentelemetry-api.hash                  |  5 +++++
 .../python-opentelemetry-api.mk                    | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-opentelemetry-api/Config.in
 create mode 100644 package/python-opentelemetry-api/python-opentelemetry-api.hash
 create mode 100644 package/python-opentelemetry-api/python-opentelemetry-api.mk

diff --git a/package/Config.in b/package/Config.in
index dcca214383..ed535ec1cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1273,6 +1273,7 @@ menu "External python modules"
 	source "package/python-numpy/Config.in"
 	source "package/python-oauthlib/Config.in"
 	source "package/python-opcua-asyncio/Config.in"
+	source "package/python-opentelemetry-api/Config.in"
 	source "package/python-orjson/Config.in"
 	source "package/python-outcome/Config.in"
 	source "package/python-packaging/Config.in"
diff --git a/package/python-opentelemetry-api/Config.in b/package/python-opentelemetry-api/Config.in
new file mode 100644
index 0000000000..bed9bb84c1
--- /dev/null
+++ b/package/python-opentelemetry-api/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_OPENTELEMETRY_API
+	bool "python-opentelemetry-api"
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  OpenTelemetry Python API.
+
+	  https://github.com/open-telemetry/opentelemetry-python
diff --git a/package/python-opentelemetry-api/python-opentelemetry-api.hash b/package/python-opentelemetry-api/python-opentelemetry-api.hash
new file mode 100644
index 0000000000..914a0f830d
--- /dev/null
+++ b/package/python-opentelemetry-api/python-opentelemetry-api.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/opentelemetry-api/json
+md5  7ad5b73590259f0da66c9d9314f1af80  opentelemetry_api-1.45.0.tar.gz
+sha256  711ede81773c8025c2c03dac0450bc89f3d30aea6eabcc815c570d4e35a963f7  opentelemetry_api-1.45.0.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-opentelemetry-api/python-opentelemetry-api.mk b/package/python-opentelemetry-api/python-opentelemetry-api.mk
new file mode 100644
index 0000000000..84af11bfb8
--- /dev/null
+++ b/package/python-opentelemetry-api/python-opentelemetry-api.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-opentelemetry-api
+#
+################################################################################
+
+PYTHON_OPENTELEMETRY_API_VERSION = 1.45.0
+PYTHON_OPENTELEMETRY_API_SOURCE = opentelemetry_api-$(PYTHON_OPENTELEMETRY_API_VERSION).tar.gz
+PYTHON_OPENTELEMETRY_API_SITE = https://files.pythonhosted.org/packages/1f/dc/e12c1fe1ed8a7b7149777127b1a0e12ce5bd5a81d97408bedc2128c260f5
+PYTHON_OPENTELEMETRY_API_SETUP_TYPE = hatch
+PYTHON_OPENTELEMETRY_API_LICENSE = Apache-2.0
+PYTHON_OPENTELEMETRY_API_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

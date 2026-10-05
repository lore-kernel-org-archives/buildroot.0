Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F611CA5FCE
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 13:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56A4040613;
	Mon,  5 Oct 2026 13:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwpoHm3sFi76; Mon,  5 Oct 2026 13:45:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 78F304064E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791207913;
	b=kCm0c5kZE92s7FxI1Pb3PGQAEWBEWMMKz/0+TICXLgzxJRnaqvJasvOZBnoHETfqPDtu
	 jCNwWhlsvLevf9dl6CpCQGJfltDvP4EoUYHB20Z4xKVa6hODfM4814WwHjMuZP43D+x95
	 NBJRKausJtjIJDktQ/t/ZW2Bd6PLX8M+l6mBGJdZ9wbiGsMkcmo0qgCP58f8GA5oY1826
	 xmjVZ3ePC/mMiPUFk4jV0fo2yXXQJq3Jv/9qiaawV0uPiysm8ShZY1kezQCdGt4znhKUe
	 SIVFTjheghCgRCPPr8KLDIYKl/dizVNPlWJt0LDnMrRAKVKT1eypKa8tiKX8MaXLRQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791207913;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8/prWya0Nq/RdZbZ/mXEYXgcHhLbMx/kFZlaiN/lW9A=;
	b=eZQFGuDtbUla8ZbvWX1HYFzJ/pHvsaKzRfu4jZBlwu3+e2j4ZbBp/GaLuHRsWA3OFp1A
	 FsbgcpQA99PlHlo+zPsMG59HpYAocud8VVQUUjVneVnOwl9pSv7mbBWVho/0M7K7jmGGF
	 pJ6stcRSKv07wD/Aoe1znjw5wkhSL3L6/NHWA+r7N+MuUBbveGemT1eyXyzwDthkdYqz/
	 SaIdU2UdNWpRtb/nPKOx6oK6VS2aJO+ipxrngmvu36QOliiXr67BHJrpzNSVZV2MFNBmf
	 yOb/pas26usDOjAg4Mu2902bZzEFkck6Wb6ZRB7WmkOTwdNUcjEqz7YAqbfuwqZRDSA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791207913;
	bh=8/prWya0Nq/RdZbZ/mXEYXgcHhLbMx/kFZlaiN/lW9A=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cwCxTHAcUy4fuA3d4JDq/GHYF4wuZnxVcqRhzYfl6Mkk9UY08uY7NvRrvxNu0QyIz
	 /nxr3MVEuIXWta1gfN5QJd78ismfbRD3vsdvK2zEORqXSZq+RUgMiAA/H8Efualeg9
	 7pJJAPgQdhCe571N1fGrJrMsf1wI67s/UmSud68ZY4cqZ8cEl3+GW7KaXAdlNS0Rnj
	 G3K6bEQ6xiPm/EzyQJozCTg0MsCY1TwRf2mt9vZW0uOUDE0ln8SGiQKxZCk5l0T14t
	 EhHBai4R2qVW6GQ+iOPai6HANok8Dyb2TTGql6taWYNiytv8mCAzobvhefXNXiALOM
	 g+h4ZdbSbbhHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F304064E;
	Mon,  5 Oct 2026 13:45:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C53D2E0
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 13:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51CAC80BCF
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 13:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0gigDrTPtcEm for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 13:41:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2B23880BE0
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791207668;
 b=UHnm6lyaYAYDV0qKigWb/tjyDmVu9Ivp232Ku6KkwLEATM/DxvGGiG6iEk8fx4QbA8WN
 Dr6X7JzmEq8E3Jj0g9XwsVBPoI/OvkcP+oHdxT968ulrXAOl1Kqdl4Z2gQlCAjQKuGCif
 Qz8drryx3SChF7MAJzjZD/qeLl0e9ARFOEJCBCIbdQNV6PPy5gL4F76vg9d7PjI5NOfqg
 9pVDSEi/03W4VJr3301aCioLExKjxi3h8qJ158nh+zNT0SRP5fuAe00xMUhyiTchFmZTk
 vpCrOD8+9tYabxZhed4taYcU2cqulSt2oOyvljMAwznENcKTs1pjzOiSdM7iFcr6qaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791207668;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=mFjzKWZBy5V23Yxa0zmdMYt0qG2EWqKM61JSa81qFCY=;
 b=XNqtvRugYZmO7oJqfF2/XQF7nKQLdzVAX51+d3a+m3oIe7MKvYqhVXzGk+MUiIBbjvm7
 WbCad5qLpLTzD1jKYG6VZIE0bRKOBGJGl/HSNcg8sycMZfHIgtdqHIEHZZ8ixJemBRTyj
 9mRCNwpZkQtQaJSavSDgUdlu6H546qXr63ENQTykDGoDdN2RKBggguuUU1BuNa1UXhU+V
 9HQYvqMman6ONJH8N5r3onv3xZwEFcx/fkVj5I6afguQC/SM1UGTOOcZSfVHdUxrmMB1Y
 tzADz/717KRYCGl0ORFarBCOfCBy4QnsvSasq6qD+cq7tfBghduY09wi4erjr4qSpkg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pig6dmWm; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=pig6dmWm
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B23880BE0
 for <buildroot@busybox.net>; Mon,  5 Oct 2026 13:41:07 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48c4649b35bso1811515f8f.3
 for <buildroot@busybox.net>; Mon, 05 Oct 2026 06:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791207665; x=1791812465; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mFjzKWZBy5V23Yxa0zmdMYt0qG2EWqKM61JSa81qFCY=;
 b=pig6dmWm1/2h0lAVHAVNzTTjQ8pt3QunNjyz0RcKjvvCtEpWmhpmiwV/9ro+67y5Y2
 eVl9K/TF2gFwMFvlgcdRGoP3ruNG7NJ4m3aFIgwx8h3Xo6L4M/kFeskeUKDp9Qa33ebF
 XLHFIn0rY8CYPtWUaig73F3qG7AnwGbuzlGszrXCA6zQ4XsG1XI0FIkDI+KXT34b2Xjw
 /WLJCOOK6Gobk1GZXTINuaJ4kKg/GObX1IYB6D7lUMK7ZYag25An0itXGE7ZeHLhmNBt
 2VG5gppBcA8lxV9eYfGnQTj3/MB0TbVO+RR2GZSQSi0wH6o43VGuPNaiX5eGU2TTA3iT
 UgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791207665; x=1791812465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mFjzKWZBy5V23Yxa0zmdMYt0qG2EWqKM61JSa81qFCY=;
 b=v3LNSsNCPEyWRTVy5uaqN2b+XIdbKPbKinCiG5jlZ5uetKMQlk5mUsixrMilonpebk
 /eIhDlQPtjRCWUxB/Rck0TloTg/RZF8do+J5+X5xAjQr3zhpLhyFs681f70WjOIMhsGP
 ToZXn4PcTg2vG/kWPP82axjUDXZwTnj8SM2Ov1f4hR5/644VK9T2eJGH0WTzH3gPLE7N
 +q6CB9GkQo0/yl+VpJW6//FH9QTVCYFPAfOYFc9F9r0ARmENzvvGvzcVi2cAlIXSwqWM
 uC4bxZyzkYMCiFiiwG9EJndz54PCfrl5hCRx0p7KXuplpLqbvO+pKERY+3vQfrf9y9CW
 2Vkg==
X-Gm-Message-State: AFuF++mu5M9scr5yVT1CCATyj2A3wzZw6vtoSu8Q9ztgQP541mjhHFLm
 O9W19pSSORXneiDYC3+CCQXLFiymAFTbjWCw7cy/PRrt4AYgJcB3EtE58UC8Yw==
X-Gm-Gg: AYBFou3WH4fgMFZ4czRs0O4d5fac+IEVesoM9i21yQlsbghf8YeB9utVgt8QREMLvaa
 OJZtqY+67RHh/M0lTzGZsuxMZ3a5F3O95uar5GhAYsLviaYnRDRv47B2IiWxgbWOToC9/A6TLM0
 ChcKLGZLjb/8YoD8ZWpY1gNedDHKM+ruYqEpLHGhvZoteIF3WBt+vqstWjvB/e0/sAV0rKCAmB1
 wwZRCPeDE78UsJKJ2r8BgV/dUih3Clev+BMa3Dn3acAoG1xFVRv6CGGfTQ16NchNnTTdviSBL+/
 m+TV3+gNhgmtDb3yPmXQctM+qjTmlxJMR1OOAc2JyabBdIYux1kWtxvAHyDdzx0FcyQuuYpiJIK
 da3mTU5+esWUl60JNkzZVEpxc1iZrGlbtibzFUx9FtnE9qyg8K8c2oAL+z+e/4zPw4cicFn7KS+
 R2qZqSzTgXVqk8NqiTYnoTN4X9oIsUy+Sl6NoX7oEWNN+FEssRW5kKZWrU3TPpK0Gm5NnU5vwJH
 w==
X-Received: by 2002:a05:600c:8518:b0:4a1:706f:b40d with SMTP id
 5b1f17b1804b1-4a1773ba805mr8763925e9.7.1791207665216; 
 Mon, 05 Oct 2026 06:41:05 -0700 (PDT)
Received: from vm-2404.. ([37.66.186.51]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6229ee60sm3554044f8f.34.2026.10.05.06.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 06:41:04 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon,  5 Oct 2026 15:40:55 +0200
Message-ID: <20261005134056.94384-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/luaunbound: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

a dependency for prosody

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/Config.in                             |  1 +
 package/luaunbound/Config.in                  |  7 ++++++
 package/luaunbound/luaunbound.hash            |  3 +++
 package/luaunbound/luaunbound.mk              | 12 +++++++++
 .../testing/tests/package/test_luaunbound.py  | 25 +++++++++++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 package/luaunbound/Config.in
 create mode 100644 package/luaunbound/luaunbound.hash
 create mode 100644 package/luaunbound/luaunbound.mk
 create mode 100644 support/testing/tests/package/test_luaunbound.py

diff --git a/package/Config.in b/package/Config.in
index 433955169..be0e4b8ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -788,6 +788,7 @@ menu "Lua libraries/modules"
 	source "package/luasocket/Config.in"
 	source "package/luasql-sqlite3/Config.in"
 	source "package/luasyslog/Config.in"
+	source "package/luaunbound/Config.in"
 	source "package/lutok/Config.in"
 	source "package/luv/Config.in"
 	source "package/luvi/Config.in"
diff --git a/package/luaunbound/Config.in b/package/luaunbound/Config.in
new file mode 100644
index 000000000..cc4e06818
--- /dev/null
+++ b/package/luaunbound/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUAUNBOUND
+	bool "luaunbound"
+	select BR2_PACKAGE_UNBOUND
+	help
+	  A binding to libunbound.
+
+	  https://www.zash.se/luaunbound.html
diff --git a/package/luaunbound/luaunbound.hash b/package/luaunbound/luaunbound.hash
new file mode 100644
index 000000000..dbf1c602e
--- /dev/null
+++ b/package/luaunbound/luaunbound.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  99f4fb8695327f06d37013bfe09cad5103158d803941bbc3caed9328ecafd5bf  luaunbound-1.1.0-1.src.rock
+sha256  b02daf9bb40ed6504df2bcc7b51d78abea4cc3fe7a9819bcdc01d122dd3ac5f0  luaunbound-1.1.0/LICENSE
diff --git a/package/luaunbound/luaunbound.mk b/package/luaunbound/luaunbound.mk
new file mode 100644
index 000000000..d1523699e
--- /dev/null
+++ b/package/luaunbound/luaunbound.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# luaunbound
+#
+################################################################################
+
+LUAUNBOUND_VERSION = 1.1.0-1
+LUAUNBOUND_LICENSE = MIT
+LUAUNBOUND_LICENSE_FILES = $(LUAUNBOUND_SUBDIR)/LICENSE
+LUAUNBOUND_DEPENDENCIES = unbound
+
+$(eval $(luarocks-package))
diff --git a/support/testing/tests/package/test_luaunbound.py b/support/testing/tests/package/test_luaunbound.py
new file mode 100644
index 000000000..9446f946c
--- /dev/null
+++ b/support/testing/tests/package/test_luaunbound.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaunbound(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUAUNBOUND=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lunbound")
+
+
+class TestLuajitLuaunbound(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUAUNBOUND=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lunbound")
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5770CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 23:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F7E7406FB;
	Sat,  3 Oct 2026 23:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3u7pKoexsK-2; Sat,  3 Oct 2026 23:32:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6C61940704
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791070358;
	b=K1fMiSAAIfahwKnwTHZZG80STpdGHYKWJ7vVr6qFED6gFaGRc5YNmEewXYcxEclB66ED
	 uY1TK48a8V+jhO2k63Wq3i5YjrY7NW2F4Keyv437AZj+mrqAF6+6e05TijCl3Ux6SyHsn
	 8CLpQhy2h5YGlBy2pd83KEgyxJUn4MhGUB4Y8lh2XgoMQxVGgCEOAB+gRpsf21qqqaYWq
	 hAZL/gdQ0k6EAnlgwDGVvX+FnSCj4vCGwYscKE2R6j+fGOgIyq4+va2hCCsXMT3m+1tV8
	 qXbvMuPYUR0wAPY8jtR/0ZIZeZZr3J9pB6o7HFQyVygaxY5z/5s4rssxGtIFqmk9xgw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791070358;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Vwj1BVr3tEt4PcCch/rRJJjYlIgXUrU/TeV7elfcCHY=;
	b=P5iTM4QXN3ZJdzkN4v/Owvv8F/MH0Eebsg2AI0g5+oHeYsUTaBYoyCGv4WS6NnQYE/0m
	 C9mjTuUqx2RYDZrxGHSQ2K68ywhmqbatG1/1faFm7my+hc76lGNRcp5qTmWB6wUleh8Nn
	 hdnd6/Jnvtiy/KXGLGomQzdAGplIn1JbKTFzzxQHoDP21Gc5s4wLHTGB8fp9oTbr1FmMR
	 gCfiK2BPsaIgh1oNW/UXGRwRvNthrUCus5RLr00Ig634lt7iFaugNm9XjuPehhfy3I807
	 rLD6PlwWtx7UtQR9yQwq5f1NCj1SCgg0UJUvgGyui04vmFIQf68b7Gqe4y6JMxt117Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791070358;
	bh=Vwj1BVr3tEt4PcCch/rRJJjYlIgXUrU/TeV7elfcCHY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rM8Q8DV6evohDqmLQOL1cQzz/UtGRrVukb+Fa5O5snOBT+GGkHf+5O3qufsT7IQ4a
	 YXCsirz6CHmuXAfvvQ1d9W7TyF8EeyK7XAoGZ5RbuMFUkSuXZBGfaTZbFnth5hcwmQ
	 y6Ui/ZkSCoXH/WR56Vmi2tkCwtLKgm+DV+3gnQ2Vot9WbrlPN5XqaVwQ96FOPajg/9
	 VAx7g7OrK7QmxKJwl6dC1DSXFnTsj/UxZ1mydug+EJdP5NF7so1ZJJB1wy2DAJ5QTI
	 ea3AYCQC+L4YeANsd7oQYlLu9XgSIZrreShO2E/uIbbko2rGbvjgN8y/C0OsMrKsBb
	 8qQGSGAIEFKgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C61940704;
	Sat,  3 Oct 2026 23:32:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E7A4435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 705A480F4E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZEiNmnlhuYy for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 23:32:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 772B280F48
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791070355;
 b=ki2OLejmblKy7S4rJYjVipPoM2FCfDOhJRIOx/DIiKxVXb2AgkzP/IldZitFlE6BseWS
 6fXSYQrbR1osCnv4b6A7Y5KZW/v/ovbmiHD2N0p1bvbycofK+8JWxfPMgi/PVW5HM2EW0
 +IqU2tLmVs5/gfKrYTRakFlnGUyCNA6q/1XcfXOA7HE/Wkg+KCE2fg7rVFq0NsV1kJSxt
 +2iCv3FWHmcAkJTGucJqpbFHKa+oIySZHqlxJl5kiCwx0pjV5I15bLDZjTPxDxb+iN9hi
 sY0TN1xDilGj4i3jb+7oxQE1KpkhQPXSBdQG7JGWLdfxIIp0eXW5sMJG0G+6HP7Vxew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791070355;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Y+h1VeJqvItkZnEJq1kJ+uDhs3CUZBCfO6SjblCVY2k=;
 b=D/9iH/JXD9M5PBIt++3NcMmbMfKFn+er2kf8NjScqz0UvaVBQmSA4Ka8SQWcERuyIVam
 5qke0T4gWd9BkWbRHlJXkD+IZotf0tfosnScE0l+RHugV/LGy/oOqWPRVcdaEo/vBq255
 Zgt10XMpCkDPRe+PcbMQhixGxpEfbxVlq3+4z3XKq+hBzfdeABhP8J8szrBHq3Qg3REAh
 8ltM29k/q9vWy/DZBah1l56GqkEht9BmUgxdX6aCjlhbZ0mJnJMHPaueOOFtiJdU24V/f
 nHqppNV2EKZgDhkbEejixBleZeOFRjsG8mS2WYojdHZQNJj/C9dYnnvaZXsIQe+TFEA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=XSkaTY7N; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=XSkaTY7N
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 772B280F48
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:32:35 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-823b938464fso862896a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 16:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791070354; x=1791675154; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Y+h1VeJqvItkZnEJq1kJ+uDhs3CUZBCfO6SjblCVY2k=;
 b=XSkaTY7N0ZQqKl4zoJY5ZIvquqO93WFXuX0WAWqPhQVgcI/tCp46AWem0K/bXC9cJA
 Gxa3+5Jhx1wtvDQzIwS6KE4ufQhzV9pnbbBO2T0JJqYQ2hb2MjrnFIuym94UbnTY5THh
 vgELmLPuLq6qkE9BPr2sOISFJjZJVSDr0ctqxjl9rwQQfNxwZ6PRXoaheB0fOPjPO8XV
 FpJYxRHYrAiwk77+rRG2vXPIPG4ryezQiJP46I6OTdgTgi+4AOUBFYvrZi/NkNtr6r40
 yzi+oMBCXCcJIAAYgjEN3QDC6XGjjmb3w8Os97dekNFbEhcpqaC/8Aujoy8kNvtmr8z2
 +0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791070354; x=1791675154;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Y+h1VeJqvItkZnEJq1kJ+uDhs3CUZBCfO6SjblCVY2k=;
 b=ohM7SemptIGySPHk7tGlkjy0nJsdI1q/ZnQBDzlhB5SFx05hdT+q+6awAcOZ4YfTil
 /MrhxCvKOo8RvArNQPlCM7u8s/oosiM6RDJRu/ECexHVD7dBav4dmDIZujWRZkxrjwst
 bDHhkfcsn0Z5YzLn6S168PfaSHlRV8b2Rq/rhmFIHZvH0WccIsrYXF1ae/AixLTwC+zX
 DFkOOZBOfOs2ZiltIZ+zhRlrDP2VAg5kDh+rOu+HuNyzS1h1rfF0Mt4ekdyYpS3eVKwF
 RFUEiy6SkizUXliZxHJ2DgXDnQdp1dPhVwLpHg1cD4nqZHCpYjT/MrQrKKLd0h8YwPfU
 YuIw==
X-Gm-Message-State: AFuF++mcKCVX0qUXmFRTd9h41pHOMbqEN4r8eSEGIh3hOiCfQKBpjskQ
 CoeWExggHXKjLPh+sIbUGoPa4aPRZOVp9FQAuoKPxIvmHJQo60kQDgYDO1ab3A==
X-Gm-Gg: AYBFou1GJSHMblLgaYHkws10BDMiy/S0BbgN74yFpAPf20K6Y6Af48RhD0UQaq8Tgwb
 ZIPGsaz1AnkDqgsHdSJryiD3S89PimvbJsOi7L4X9xrU9c7rAmfiNs5WLPFANeVqPnucky2OhTC
 In9RfKs/jvVEFNfTUHYQj2DndCsx15nvOOVvSCyyPi2Y1YMduvzffN/5sUDg2mkoIWNbA5RGS0m
 TU//bvQqliJ4NdWJzZSqnIuTzjhLi2b9P4Y5xcnqB+RffUZg2S3LhJPLUXCU/T5VqX2SNSr0MPg
 ZZ63LS1Asstds7f80kWs4JsZZUzogseyzMyS0slKntEz/puiAHsRzUDJnHBXyBOwVSHkTR31P/3
 SCOuhHebc0vsA8py/3Zwjhv5Drq5t1DliaqDJbhzo1Z3Hn0Ud5Wh96bWFEbKmqa7dAZHLyL65ZM
 y+oQQcQGA8hK4l7LyfAxwZI8ZMi7qeqGppisuSlZPkmnLbt0VeoCXgKv8aY+oSmNZav7KnyZbXm
 MZgelG9dLrm2tpVupfX8C50M8XnGu5oftYMw9udlTTpwCsnqd/zTrjyyLgifQDeYESBXDtcAv0M
 KbihApPpQslSHTtLZxaNPKmaIHtyegx3B1iuBO/vAo18jYES8UIxBWpCV5xVu1YRYEq0qp/e81d
 X2LcLmf4tnwSNU63j5KkB9Q3CrsmNIIFWnLcaJmB9EQ==
X-Received: by 2002:a05:6830:44a6:b0:81f:acdd:bd0c with SMTP id
 46e09a7af769-823fca26dbemr3435076a34.12.1791070354099; 
 Sat, 03 Oct 2026 16:32:34 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82279b7dbd9sm7045147a34.12.2026.10.03.16.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 16:32:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 17:32:28 -0600
Message-ID: <20261003233231.753958-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/python-shellingham: new package
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
 package/python-shellingham/Config.in               |  6 ++++++
 package/python-shellingham/python-shellingham.hash |  5 +++++
 package/python-shellingham/python-shellingham.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-shellingham/Config.in
 create mode 100644 package/python-shellingham/python-shellingham.hash
 create mode 100644 package/python-shellingham/python-shellingham.mk

diff --git a/package/Config.in b/package/Config.in
index dc829675ff..59d5b893da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1425,6 +1425,7 @@ menu "External python modules"
 	source "package/python-setproctitle/Config.in"
 	source "package/python-setuptools/Config.in"
 	source "package/python-sh/Config.in"
+	source "package/python-shellingham/Config.in"
 	source "package/python-shutilwhich/Config.in"
 	source "package/python-simple-pid/Config.in"
 	source "package/python-simple-websocket/Config.in"
diff --git a/package/python-shellingham/Config.in b/package/python-shellingham/Config.in
new file mode 100644
index 0000000000..3d3ec047b5
--- /dev/null
+++ b/package/python-shellingham/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SHELLINGHAM
+	bool "python-shellingham"
+	help
+	  Tool to detect the shell you are using.
+
+	  https://github.com/sarugaku/shellingham
diff --git a/package/python-shellingham/python-shellingham.hash b/package/python-shellingham/python-shellingham.hash
new file mode 100644
index 0000000000..d83c2fa88e
--- /dev/null
+++ b/package/python-shellingham/python-shellingham.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/shellingham/1.5.4/json
+md5  883d381da8fe788fb24428591e61eb20  shellingham-1.5.4.tar.gz
+sha256  8dbca0739d487e5bd35ab3ca4b36e11c4078f3a234bfce294b0a0291363404de  shellingham-1.5.4.tar.gz
+# Locally computed sha256 checksums
+sha256  f388fd38cad13112c1dc0f669bbe80e7f84541edbafb72f3030d2ca7642c3c9d  LICENSE
diff --git a/package/python-shellingham/python-shellingham.mk b/package/python-shellingham/python-shellingham.mk
new file mode 100644
index 0000000000..7e07606714
--- /dev/null
+++ b/package/python-shellingham/python-shellingham.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-shellingham
+#
+################################################################################
+
+PYTHON_SHELLINGHAM_VERSION = 1.5.4
+PYTHON_SHELLINGHAM_SOURCE = shellingham-$(PYTHON_SHELLINGHAM_VERSION).tar.gz
+PYTHON_SHELLINGHAM_SITE = https://files.pythonhosted.org/packages/58/15/8b3609fd3830ef7b27b655beb4b4e9c62313a4e8da8c676e142cc210d58e
+PYTHON_SHELLINGHAM_SETUP_TYPE = setuptools
+PYTHON_SHELLINGHAM_LICENSE = ISC
+PYTHON_SHELLINGHAM_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

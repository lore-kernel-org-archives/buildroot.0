Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63710CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 22:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3712240AC0;
	Sat,  3 Oct 2026 22:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GaCOSkTm9Lfm; Sat,  3 Oct 2026 22:45:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 396E040B7B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791067501;
	b=TqBXWszWv4eV4JCOQOwCFeszzjrypVjney5Z/SI5cRSmPETvgKCGWqtHWXVjk+wglqCU
	 47sCiR72+7Hb5wQsrtOm6vuWWwc7Sa9bJ/xbsl7lgOYVQzxVlhLdRFiwcJcKoeKJ3lEZr
	 gJ9K+FALy+pf80RmOpJqRweCsWR9tnuVKT/N1wxCSrzWwaocKVZb2fglBWoOp9mUecxfr
	 BfvxYL5OAmIhul9J7bNzZgLyPi6M0uaQ45KX+cWnFzTrr9RNBg3DSqwVb7HD5XCKB/RhH
	 JA50plEOYLaQOCGcHk3g+8XPAmS7pUmzj5e0CX4HuLcRKlMvW4Ub07cM+L8y8GtumnQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791067501;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=R+YHttkXU8z5+Wah/ncJop6L75tRZ5pCslrpCv0xUkM=;
	b=VKnerxqpCmT+GblSi2RxCLXgQySiyRvH8oVqPVxP81cTqlzzwcDTTXR6qfT3FKrZo1y2
	 CEg3M4cOHQt3dabset3kHqL1Z+2GgvQ5rIAz1JG8snJntnhoX2HhymTdvcXS5EEJLjdju
	 sLF5AeWz5gjTgDSsblHAc8M5G/+iZsmkuanW1VXXm5gyF7cxp17Jn5mJ2mdfbBCU8fFY2
	 RHn2xBU/Lqg6LP+76le2lnHvH6ZIsFyfLrjd9ACRhf2yzfcLIj2Mj8HhrzFNYGkd4R78X
	 yk7jGtO/3EcR1o9IPt4r2fmzU5Tv0tvIQbYlmJsYuxY54Gany0MzIKH4QxhVpKcFQQw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BTO9hPAA;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791067501;
	bh=R+YHttkXU8z5+Wah/ncJop6L75tRZ5pCslrpCv0xUkM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nfPUCoQhg/xcE6aiTpIpAtL/HOmz0sAK3dgzvNgVWL84sNgMHwPYnj32ClmE/Z1Gt
	 84TEGuq+osT8LsL6mjRTc2SL1IPhGEY9q0E6GVE6maPYCxz327bqWzROBTP/Kysp1u
	 dEv9G9FAM2CgSuywfXNvzWFuS/fR9/g0W/9OaQ+I5+jurLgn+ndwlPO20NPCflRRDu
	 4ZwgoBkfgWjPOih+fYpqBORcM4vQwFt2YSPVlzvKgsvumUKLsfqMOYtL9CjSajq9fJ
	 jAaO7oDfxBxvLRmstVxjJDWLwzjnhNDGW6kkDmcWstyOsMN/dzl/uJBF3gxY7F3939
	 FoL/kofg4w0BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 396E040B7B;
	Sat,  3 Oct 2026 22:45:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34677282
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2657940B81
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7KYsZDh7x8zh for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 22:44:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0BBCF40B7B
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791067499;
 b=Qm+5M3XG/nUSgzyPx312gVrjHO2eEpQkPWzEFsrMVezRbPNPvotYuLXLCg5FAb3dW1z9
 nPR1aIFZuHriKGOgaM5bog27Kkgr5uODZTE+NuRnw5dhjf9goVmSTCbTzsExkiEQ+66N7
 mR38yFrLb3ASUc1kSpE9L7G5+G6nG7diwKCmzW5KE1wmazE7GHewWRSKukSvkWPC64NKR
 1o8cZIUuBIYnqt5hh/i3LgrhTmALzOfW+NPSJT3+eCiSuPZF6gFjW6ibZ7MeU0AyRGSOq
 BDRy/B2ijGGUD3a9BotJEELxEZh2uedd61eznrCf1zhPwCXSgz5fuecyDqn61nTzBlA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791067499;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ho3aQhX2ZcqVK+nx9mjrcI7UTyV+StStpfIHQAzhAR8=;
 b=F6mUuLc7QVqZGdnW2dzonah+WfcAYuIVwvkN1z51qEw0dIlaaTIR697qNVtkHhaIihpj
 VAyyNEmE8TQwyioDoUf5gOK5zqVs83aaeRrwIyUBJCEbk0UNNE3f8fVyNZzy0QR8H3Tdt
 D+d/UrFmVrHa3Mq9JsUO5HN5KvYHzomYd3RctVkt7Ay8tSseHQ+ZhqUjYs0c02DiMfajV
 M35XwZBDAxiOto+MQS2WInJwC2ZwDTmW8nMcDcjE67qn4orehHczPQ+WebKlITfxIA6U5
 MBztX2uq6PpJl/OiZxSL0qoc7X+KtNykBWZ9g7fWaFUwdN/UV4koEPNHR/VUKJ3DqZg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=BTO9hPAA; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=BTO9hPAA
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BBCF40B7B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:44:58 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-822f7e70796so842468a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 15:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791067497; x=1791672297; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ho3aQhX2ZcqVK+nx9mjrcI7UTyV+StStpfIHQAzhAR8=;
 b=BTO9hPAAluMAX/oSYih2oc91O+kuR5PUhF746gGFPxSyN/z6Qhmc9stFTDyg/Jlo9d
 mojjdinrWARSliXmvmdnMdFHpsGQp6z4sV1r7YK1ddXYTJb0Tn5F4f0IzsfRWl40ZPvV
 Kcij5NdS2R3Qr+JESCJpXrvNYeD3ydXNXfGg4GJJyxxGHsMMsKn3vfmherBIMU6vDawj
 jixhCPJryb28HXwfaqfNgoeq4AEQ0cgY8dJsYio9LoKgCgvwPa+7oc/EBnQZ+bO6fcYo
 kGU9SzyvNBp1lGvWP3W3T16zhgMhYSF0jpzrwOk4V1ZydVOIij0b7KlSzO/v1hcwfuPm
 ClXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791067497; x=1791672297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ho3aQhX2ZcqVK+nx9mjrcI7UTyV+StStpfIHQAzhAR8=;
 b=YxtYhAk1L4QlvwwFvpH1kFcU+OVtskC9sPJvQQusr9ucVpv3ZScprUUX4ftgqHpMuj
 3D7/MvCVKnPp1YfanHxYZTzvrscOufeYmcA9V5y5WQLqOFuXPqpgUqgeT/SBihco+tgp
 Dym0K/xZ7PByZBjNJVk1XZYStX/In7Fu1IwifQ1mfuK3KJYcpYaqHijGibtscvDThU1b
 fuWbdSjldA5wlX/JitqGMYLhgKcf6CCabCqVohZc2qkWlf38O2WMJz9f1u4FxFNzUxlB
 R6WaDB22YAOks5PtAqarjQk/xEB0C0yjvX3mGacHo0bw35C2jEtWlYyuxTVZ6F1afXAf
 oWBA==
X-Gm-Message-State: AFuF++l+MHB8ReA7uFrJv8GU1vSPXMAYI9NTpfT8UHm/98kQM74joKDL
 BAb70tWulZiDxT/CM2SDdoteT8dVcz7uEt8c99AOilHBwgIsVripkNDrakg/Aw==
X-Gm-Gg: AYBFou07KvV49YR7RoctpHEcBZiAILLBfO3mJfMA6GRj2L85JFqCPxKQbmP9rapZhqx
 UoFlbx/0ncWbR1k/nHMdGKBoy2JVjfJKfrT16bOwGoHQiS5d83mX4PF4OfPJ2bDMI+ajEXm17qM
 cdzafFDpEqG3lcMhxdOCWfAsftTzXTNRchvl49ZSJR0xxzYayld48WoAwSWog/mjD97oeszAjfj
 eyXopG1VmWsHpMNlg/VlOm2c6KbNaI6kVpUmHkN/HQyaFJu8RU2oMTFWs6tAAYw9RFhu5crQFuO
 3kv2lv8o0AFt+yzZ8TXQSCtd5Ct98PPN/1qd3SOwshqhw6rLl49F8o/hNQPuqKHTnAYcUsde/Y0
 fbxZSOOPud2mpep1kiVnMoa+4hf1o1qGrkfrq4hBVRxEcUsjMmPNNZXlI6b/5BcOYKBTT0MV7Km
 ru7r2of1XVJWcRChYsXi75wia0SLZuj3Bh6ApE6DywA3fb268PDMC1EzaNaDwO2Qpe79pMTiw0y
 hGZlTVHgnFcK8kCoGAe60oZ0l4McjJJ7mcHcvU17LAQpavX5rvzXxK+b6XkxesJsbGormre4LQW
 ZfE3H3hKxjTw64VEaRGmYj9bQoGlxmxZCeKjShuQ1gYt1zd1FMz1xapKyLBR9iTomG5smn2NGjz
 JNhoC9iSI2sRf4wO/na/CDP+38io+5IYjrwHwW1RxPJSetkiImYo2
X-Received: by 2002:a05:6830:442a:b0:80c:d34f:5f5f with SMTP id
 46e09a7af769-8228327c070mr8402200a34.24.1791067497351; 
 Sat, 03 Oct 2026 15:44:57 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a36943bsm7262522a34.19.2026.10.03.15.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 15:44:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 16:44:29 -0600
Message-ID: <20261003224447.744966-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-google-api-core: bump to
 version 2.40.0
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

Add the python-opentelemetry-api runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Depends on the following pending patch:
https://patchwork.buildroot.org/project/buildroot/patch/20261003023341.454213-1-james.hilliard1@gmail.com/

 package/python-google-api-core/Config.in                   | 1 +
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/Config.in b/package/python-google-api-core/Config.in
index 88bc8326b5..155cd2fdd5 100644
--- a/package/python-google-api-core/Config.in
+++ b/package/python-google-api-core/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_GOOGLE_API_CORE
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-google-auth -> python-cryptography
 	select BR2_PACKAGE_PYTHON_GOOGLE_AUTH # runtime
 	select BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS # runtime
+	select BR2_PACKAGE_PYTHON_OPENTELEMETRY_API # runtime
 	select BR2_PACKAGE_PYTHON_PROTO_PLUS # runtime
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index c080165c33..c99105cd6d 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  0b8a8deefc55775475642b4a6799e912  google_api_core-2.39.0.tar.gz
-sha256  824ee414a10adefefae33fc5e2ba28dc6f0f7089d011c9cc98ea9178e61299e9  google_api_core-2.39.0.tar.gz
+md5  96fb3d02ea327ff1051fe3a7a212b9f1  google_api_core-2.40.0.tar.gz
+sha256  ebee7d1b138b5362beecec260e6e8988ac97346562c7382ccb6f0ad8435c599f  google_api_core-2.40.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index 3aed7f06b6..0da2f694f3 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.39.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.40.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/44/8d/cbdc715cdfb7acd7ccf1ce2869b103734c6a3cf124afd021f56c10c17522
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/23/f7/0fb8c3618c783ad49da1aaf97f93a4bb9e4ed522135516b44d129a7f85bb
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B8DCC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09E50607C9;
	Tue, 13 Oct 2026 17:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvhi15xigMP5; Tue, 13 Oct 2026 17:51:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0C115607AD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913904;
	b=hqfRsx3kmvxmJVzXD4NDT1oti2GaK6lR16nc6qup3tkC1Dmlc3Hs+P5xYmGnlUeZDn54
	 9G3u8N3KNb/DgSyDwbAtrY6FhYaGT8R+qZleamwlQinH4CN3jGwE46r/pZmcddK2nOlqY
	 +MQVBN+qf6UJAjR9jOoNCydlXEv5my2jKcf7bFWbOLyn4f1a8OliFxoofvScZxPg0NbNv
	 g34UO7t7B7QTKgJat3qunVfQ1UowjhE/yx8fSeOmmyR2df4K2HQy87MrpMhD2K8PXpibN
	 eCs70jOJRNqU7OGAOEjNuJqHHeX7Whi1gyv4Kc9Lpdnk95PFufq6YdswO00DO/AScCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913904;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=j8eXaVXAfwjSp7WEc3fZEErDFY93zzFVll/4oV52I3M=;
	b=oKHIcDYTs7mSM6xmaAk4wUIojY2AISeBvhzcn6+t80cDg34AuvPTJkYqL5PLn72gsEHc
	 HKkdgc29Qsz37UkDtfoBR/2bKyiTfh/U2osVjWRo5KB5Va3W3DmeJXnKoBRuLOtb9VGah
	 T67TxGWmSALjCFDm/TAcM4v4h89yIm73t12IUzYAA4MhZajVh/N3U7gSG8lLwHIVrbyZO
	 AaLfxgR+PifTlwP/i5FJ176d3SE5dVLD9lDdxF7oNyYqVv9oSPhcfMe96nXyv6vkb87UJ
	 07H8QZJfLc5dNumgtccd0C18ATwzuNM0oIwqGkUUNbMTxKIsEr/2jik3csQusz7QpAA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913904;
	bh=j8eXaVXAfwjSp7WEc3fZEErDFY93zzFVll/4oV52I3M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=blInvYf8PMJ8yMVZPli97GU0oCo5FGK7rjvI0eRwXXye1e7VTMeqhA/x+tz72zSW7
	 UOHc6SImQYLA6CgMGZmGH/2ZOhd3f+d/1tLbv9BcBRpujZIh1xzU3VK69WmB7Q1jTU
	 wHnj2firDNzN0VqQb+BCkZtfZbwORfR7iLQqq11NKRKb5UO8Fdp6Q0dhNf5e7iJ+0a
	 LBNRpsTXBzT4fLCTfuNBq5JwwenFXgrPEyPr2TMsoKT/oQmdpvMpKyzo/f1gKroCGO
	 Yh29wHEHEg1Hu5Q/E7XYvFAHhQOaXiZAdKqZwM9/hwVj95uOjOQqb+ZairVHzYtnxu
	 f+6M8Jlrt3XcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C115607AD;
	Tue, 13 Oct 2026 17:51:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 398B775
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F79180AA3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxOkXyT-yUqY for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:51:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 39D8F80A86
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913900;
 b=H+34yPyIQqS7IlUThM4O76NM+4iZBPpP+hdE+BLRnhyOfcI1Kb9gF6yvSKy5eYKSM7Y6
 fo7T3GW8RM1EJXBjcoAIBGYT4Uvme0tCgD6Bs6HVOpLoqImQc/+V1WmzxtbMj1eOweYy8
 04wtlI+sn0l2PsGozlAmevaENkJl84KSzMI7dHcj7/mEe4FuDGUmVyc6AasYVDtevj6M/
 m0XmEZ0q4PzwQivGymz/CT8NoUAK5xAfafBUq3H6pD+wxLexReV7pIPr9UDeOSGDFGjSo
 NQxzsjlLEHCDMlZSXH0w4m7BX8sUqvVMtPyyqNOx5w6M9cw+RkvL1qwvKe+eMwMLiTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913900;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=0iKvgGkaEfiejVU+d6oApc0n9utOyXfitQUrUWiesPw=;
 b=cdFpMBEKx9VnB2W8wl+m7qKFUTtTFVEHzQkp7adghrYQ7PS+m/hL/2QPbBOGT+wh6do2
 2ooJ5JVcQ9YUrd0Ka7sxSdqdxgXcxfDHUdcvYMDC/B1GVLEtp982ZsS/oURFpuJ1anrfA
 2cuppy82SEPGEChLYILiBoYS8hFE+WIYx6i0mB9kZ3H81mUWK3cT559s37GtX6n1iEEW+
 Vvn2Y78yBf22Ke/7xMYF84/A8Wi7IdmLYV8uYXwIXXOM/cxH7SPj54yOaeQGUXZdR4wG9
 XdwxOVgwq3dj184zMqqWElyFaNSIY5g1Ng1kNobLwt9ova5o8kQlHNPdvCUEuzB1L1A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FZsOxjyt; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=FZsOxjyt
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39D8F80A86
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:39 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-4f66bb2ab57so1364025b6e.3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 10:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791913899; x=1792518699; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0iKvgGkaEfiejVU+d6oApc0n9utOyXfitQUrUWiesPw=;
 b=FZsOxjytbTTDwzkhlGTAGttYuE+SwIVmRHDt4Sc6/66/Lqn5JobENwgTOM8v2Nr/Xn
 U7FOOsDUFqJ9/1lYemI7B8kGUKph5UZHErDuaFb91XMS7IW5YrCntiwEDxT5YFMMImiE
 ItmIBclodDk9O0VE7Z18z9iJCD1rk9GP7MjWcqVljUOxdVO08v6R475XlNMa9XavpClV
 U2x2F6LyZIimej5KbryMjNQzy2AsKhD53qN2CCxmGjZPrR+RAVYyafcPJjL8ymUcRcBZ
 xHq05fgYY96JhpHC+PggRgjocfXtcKBGSlv43yTMybv1ApN7LCo8tNN9zak39JgYyM54
 avXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791913899; x=1792518699;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0iKvgGkaEfiejVU+d6oApc0n9utOyXfitQUrUWiesPw=;
 b=L0NqyttnTMQyq+M5xD5lK3lYIoG60fmOwnnVVSAIj/lDqsHI3Dzjz1KxQySgHY+Qd4
 Dr7rIf22BubsMYgsoFMl7bWfxhBNYFwH25txDhvLod7fVn7be6u8vL40QdccYDxgZpv4
 RWu5cFctCwM+wW3kqx6q4874J/NJfsIX7k+W5XjUviJ2uVKWEHXK72ow8dw0pb1tehhM
 ajsmk7IO8wB0N6yTtNUPKi8re8TFwVam31ux+0RJ6yBiaPiOSV5tfQ/KLfTP3sFOz654
 UvgJDAU8OIi8x2wPTPcUpwZa/+Wet1h/9uNyu/9b997+YyVUW/cb8ptcHzkaGtPP6EQo
 wxHA==
X-Gm-Message-State: AFq9FYLtBj9PCJVfTl8L23vUcG0ZlZeOrZQgmZ48NVzF7ZHXBwSCOuLx
 uNyuV+1QINBw2OsCw/wSPC9OUC8izWB4fyT57IrKAdPcf6uoit3qOPhVACYZ1+lL
X-Gm-Gg: AYBFou0n8fddSjpjvZjOyH9RD76HkCrfYNt3m3Ko8lsyTjViTQI8n8ifLgeTYa++QDt
 hBDrLvOAXjB+RlguznIj7kOjwh1fquJXtvEpY4y4sO0LCKgxPrlD0LpT6WiuxNNVmF9tjUZUJjH
 zS/4OXLuahIj6mFdq5a73yI3zh6JlRnTKZ5cUD5b4vsSBEMX0e/8THFbPM0igkzfgcgcG0t7yRP
 2M0x1EmVeMt2vOwEjl/fSLBbZRr7Z8YbbAJRecEZdRqDJsPugN3xaQEgfiqfrzmCrPIF3hjLXUA
 goQzAkX1MmSw58C+OyxztWLyiZATvsMGmoWtKG1U93zumFxegvmPO3gXrG0BiiUv8iabf751vi1
 pcGene4pPcQWH8Y2d/Li3i8lSK7USnCqU1jCXBVTgXv12K+oeDLrq9X5IuQht+0ncjPC8p6jmhO
 bwzYCKm/oXgULMGuF+BdrJ9VFC4Cndt0++BvOMT5mAusJjkqS6k5vWkMEwL8YFgK1XKEQvylD/S
 YVjuP1wbjPv3J2pd74/hj3AMArMq5tgNqkjbSblR5bi6otRzLhezKuD4GbGCcFKn9Dkgo8T92aU
 zw/B2+XRw9ghoQ0TfXQ2LKhGIjO9PqEY0EWlP3azMvDe8wX3uBmq/Ki+CypShJkdW7eILhaHxP/
 a65wskUG6hsHm2YDi9rwXLbxN2QO+stJakuxA68/uPng=
X-Received: by 2002:a05:6808:1703:b0:4f7:8bdd:b74 with SMTP id
 5614622812f47-50c589ed1ecmr12088771b6e.51.1791913898834; 
 Tue, 13 Oct 2026 10:51:38 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-50c1c120686sm15424624b6e.16.2026.10.13.10.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 10:51:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:51:14 -0600
Message-ID: <20261013175130.1822395-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-librt: bump to version 0.16.0
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

Add the mypy-extensions runtime dependency for both target and host
packages. The vecs module now imports mypy_extensions unconditionally,
rather than only when the experimental vector support is enabled.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-librt/Config.in         | 1 +
 package/python-librt/python-librt.hash | 4 ++--
 package/python-librt/python-librt.mk   | 5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-librt/Config.in b/package/python-librt/Config.in
index 1e29629680..fefc32acb1 100644
--- a/package/python-librt/Config.in
+++ b/package/python-librt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_LIBRT
 	bool "python-librt"
+	select BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS # runtime
 	help
 	  Mypyc runtime library.
 
diff --git a/package/python-librt/python-librt.hash b/package/python-librt/python-librt.hash
index 30ab711042..850d8cc3a5 100644
--- a/package/python-librt/python-librt.hash
+++ b/package/python-librt/python-librt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/librt/json
-md5  25cc9fb4e0c47582ff60ee5985cacc6d  librt-0.9.0.tar.gz
-sha256  a0951822531e7aee6e0dfb556b30d5ee36bbe234faf60c20a16c01be3530869d  librt-0.9.0.tar.gz
+md5  d5f38ab06cf4e27cc33a94ba86553d57  librt-0.16.0.tar.gz
+sha256  ac38d6d8d66bf3d744148dbbc0b8e193e195a51e364ed55e224631f5721891fc  librt-0.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  88f9e379c684580053c58e75e296ca2eb243b6edcc6e5357f247310e96eeef8a  LICENSE
diff --git a/package/python-librt/python-librt.mk b/package/python-librt/python-librt.mk
index 264fe83281..09b7c32697 100644
--- a/package/python-librt/python-librt.mk
+++ b/package/python-librt/python-librt.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-PYTHON_LIBRT_VERSION = 0.9.0
+PYTHON_LIBRT_VERSION = 0.16.0
 PYTHON_LIBRT_SOURCE = librt-$(PYTHON_LIBRT_VERSION).tar.gz
-PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/eb/6b/3d5c13fb3e3c4f43206c8f9dfed13778c2ed4f000bacaa0b7ce3c402a265
+PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/04/f5/9dc696772d241814bacac7880bac32f2930b5a6ebc1f85317b83161a011c
 PYTHON_LIBRT_SETUP_TYPE = setuptools
 PYTHON_LIBRT_LICENSE = MIT
 PYTHON_LIBRT_LICENSE_FILES = LICENSE
 PYTHON_LIBRT_ENV = MYPYC_NO_EXTRA_FLAGS=1
+HOST_PYTHON_LIBRT_DEPENDENCIES = host-python-mypy-extensions
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

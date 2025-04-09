Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810F3C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 501CE413DA;
	Wed,  9 Apr 2025 20:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7PUswA1FcxE; Wed,  9 Apr 2025 20:04:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8672A413B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8672A413B8;
	Wed,  9 Apr 2025 20:04:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09FD7220
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31FBE60B7C
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGCaEKUFtb82 for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7557060EAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7557060EAA
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7557060EAA
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso5213129f8f.2
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229030; x=1744833830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CkAZM17LgbFTiWDeBv0vA6Squb6bJtdQJ7Eq2BiEMEU=;
 b=u9A12UA90RWN/Rvn9FZur0uNrpZwAG6hmdQqbapXfwhJ6zqlfw6DUKc8LCR68GG+ZH
 MZqs0xXT63dfswEyNFhidFE7OZArLNOx53DjY+gC1KDH6Kj2HbxU+tNFOOBfAyqswUPS
 wAVl9FzvxZcp5yTb2ByZQUWps2C1eoj4a7BG4jK7xv4GK2r9BYZGQf51JKais1GpkGFF
 pHLtcdFgl6pWjOVkxtSfbsgT4AKazYeXfZ0tdyISJyvyxhhXn06jhhcrTv7+ndpHiHDL
 W2fIhEedBdTnmJAwdnoDNrdcPg2NJpOzP+DY93VVZzXEe0V2B/oilytRghHnup9k2VhW
 Cldg==
X-Gm-Message-State: AOJu0YzkaD1K3Qhp+kG2X2eXKpuRroOVakPMbcESfrqpVfFQjE8WkvUT
 vyWcPv9WfsvPFGIGwCCU1UBYT7tpjp0dil5xrsvPSqyA6WwYqq15amqVoQ==
X-Gm-Gg: ASbGnctfr0mVYmsMB0+tSnKyhiKPRsxA8MW2ZUDOmI9bzNMvQrFfyhx29gagTlqR4Kc
 gn1dI+BU86YlhZV0hZNlUOEy7+Fy7oQHFCzqA8dIc3g2pxeLCqWw9MEISL18D64hNYOCOGmf4mZ
 q7AlxcOemWYnkagx7OU26r8zS1ZjTOI0VX/1XABhhmQTilwhGujODgAvgu2ToDvbDMHFjRvx5W/
 aXuuWbpI9ocPvQAcsYagedrddlDw2au5HYykwNndi383p5FJvCPxZII9kBC+7Bc6DPE+Lp5QT2g
 1fSTdTYI5qN5eamOXSm4HHOPOomXCbAnpFxoMf9DXhQvid7Cbus=
X-Google-Smtp-Source: AGHT+IFQu99Yvyq7hmhn3uVPDQB+hFFcQY506KjP+bw4KDyh8wLOb7muW6l2vNNNA/xs4s7NUgUe1g==
X-Received: by 2002:a05:6000:4203:b0:39c:1f02:449f with SMTP id
 ffacd0b85a97d-39d8f272aa3mr64210f8f.2.1744229030397; 
 Wed, 09 Apr 2025 13:03:50 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:50 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  9 Apr 2025 22:03:28 +0200
Message-ID: <efd3391384b774b82378ecc49ef4ba7e93785395.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229030; x=1744833830; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CkAZM17LgbFTiWDeBv0vA6Squb6bJtdQJ7Eq2BiEMEU=;
 b=HTBpDamDaYEQ/T/4jVydcmUW/YlLo3Rk2Saah8xGXJodxopmX1btP03w+76whQLD6D
 VjrlnbR2HXqukLZdy76pNIG+8FiOPQ2ajAQXYEQ/2cVSdHaYZv8oD8X/MoTc8kQHtJkI
 qu9T3slyU7bgArEPzNTo481nFJ8sP/Na/MrW7a2MC/XelfHEWvQKxPkSy7wqkuiI1+PB
 23A1SMe+7oE1lhmbGP84t0N7Bo3XIulIgSjgCmgHlLisG2FU3OcvzkVYeLe7GOKWSZ2J
 74gHm8QmZkve3HfCbXFGpIGX/fB/qDLuesDpHqEH5SDE89J6e8EXabvYShxQstsvOPph
 tFCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HTBpDamD
Subject: [Buildroot] [PATCH 13/29 v2] package/thrift: afirm host-boost
 dependency for host variant
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

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/thrift/Config.in      | 1 +
 package/thrift/Config.in.host | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 package/thrift/Config.in.host

diff --git a/package/thrift/Config.in b/package/thrift/Config.in
index 2fa04705a8..dbe7585ea3 100644
--- a/package/thrift/Config.in
+++ b/package/thrift/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_THRIFT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_THRIFT
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/thrift/Config.in.host b/package/thrift/Config.in.host
new file mode 100644
index 0000000000..5e92365587
--- /dev/null
+++ b/package/thrift/Config.in.host
@@ -0,0 +1,3 @@
+config BR2_PACKAGE_HOST_THRIFT
+	bool
+	select BR2_PACKAGE_HOST_BOOST
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

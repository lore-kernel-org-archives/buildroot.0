Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E088FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 21:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14A2D813AA;
	Fri,  2 Jan 2026 21:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUcMcUHlLhJG; Fri,  2 Jan 2026 21:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D50381102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767388010;
	bh=MQXXfyogEFCBa8UaLy5bMqRvUlIj0tawvzCqroBLMFU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=lbDiQzXQDgNJlj948WSdbaGQ9NFSMZj4qw/YB0sUMMjK6AfXENfrKD6KLGT3oqdPw
	 r/niQDGl8fHcUcaPPIfEjqpQHdnfQg/e/t5kqH2NFkAwzjjBSPowxFUxWKi3LZHvYj
	 kPPOkx/hbPWL7mtIBMGyLCrz6AXT4Oo0N0eeRdwxt6RQbE2A+htnWo8ZM2iyANU2ok
	 RPQTqRPiPhv0qMc55lzCOtK9dDp8KYGE7OP6kGPhPeItCCX1nYijQK6Sx//Fu4FHKB
	 K900SN04NRwIW89pMOy6fy0NHGGcQmMGnOigmSk1KW1/HJJmmGMBkLgoQYsEI14/fl
	 WgBaYURSCD0Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D50381102;
	Fri,  2 Jan 2026 21:06:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1DF9440
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C366860847
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1K7SrtJcf4HP for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 21:06:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E151A60840
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E151A60840
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E151A60840
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:06:47 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-455a461ab6eso3741200b6e.2
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 13:06:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767388006; x=1767992806;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1/5GM3V5I12t3VtLzpzBun/wmYWYWJz2hSkpLY+ZUSE=;
 b=rIMP8j6OYmdMWlYANYOCZN/7jBwOmhjZnRjdWlTEaGlpE9876stDg6BQ71zGhQXlNS
 JfrZkllxe6sXdEMcPxTASxPosWxWmlAp987qNrZza6hEFJ6ElyC33BAFppVj14hnSPyT
 sYXQgMp3AytjA5zGQKM/f4zdioR5RhcjIY8Ll1sYGEHzma5FUUF26dz3PGIgIVnTSM2a
 xO7lIHRrIr7PZaB3ev5cejS8AvZPv/MWwMd+WVdGcu/F6T6yo4rAVpov0qb3qX19b3bd
 LXrlg3svHj1qINgylYwtyuVtjhxwk6y5RBq31Hvo+OUkIRfJgBOiodAjv6rZa7+4u09+
 GdKg==
X-Gm-Message-State: AOJu0Yz7YsuLFVsnouvr3/MB2zuofF74HYHpFU0FwzY4HSb5lBbB/zLq
 an73OQXAmsTOhfuKHFXikwW0uuJOqLTKqZVScBNyGyu/pl82SamsXhw6opbsVfqUYIs=
X-Gm-Gg: AY/fxX7O4bR8jxehz64hbi1IsnPuyaL+Zghrm0V97EX/dhbxAHQv0TpBjlR9ergPVuH
 uXbykHaCLJ5bp1ZOtY82vRqDz2rxpMnjkfeOlICJF0QyQYz7/SfuHio+JCN9yyjNyb08NW0M6U+
 lavtQNm8Rl2vKEDB7fpvXrt4IsAFg1tu5VSvVq3qrMZ/qokfU/hB00GuxOej6B0zLz/FKijJO5n
 0Ez12dvlqLA/lJeVHOo+sZJwEJaUUppqF1NpP0b9RnvamZyCuJbIQ5qZYLooi19BLJyVp0Gj5z/
 hgEpqbBMC+Iq/tp6XM0zeDAqdPBYrm0z9igfpNxEaE65facTwgBwdEZLS/UEgYTBP6e26ybpOe3
 eHKgFKW1OktDNAAhp9pZJ5FrXVZq2VR/ubTGTunaQO4osptc/Lwdoh8rWQD9fhFyJid01y8jcZL
 lV8sNzfZKdpQCJ3dAJWThEwvJx0GwnEBWIRp90RvbPyo8k8mQyyAhB67Zhyxg0BVesaoTscj0Xg
 kxwhsy6KWW/MeJK+iCirUCfNpu3VIzPoLzDCbFeDiLRYV6kgW/GCX2LJY+HVUcFjA==
X-Google-Smtp-Source: AGHT+IElA6CKCFhkldL9x+JtoU9XvbHDo0BaYN7XaxChUsabtOmUnT/NpNfQHnJ0BthWlB3oLDzYLg==
X-Received: by 2002:a05:6808:2e4d:b0:450:92f9:1ba1 with SMTP id
 5614622812f47-457b2058079mr20157464b6e.67.1767388006636; 
 Fri, 02 Jan 2026 13:06:46 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaa8d4521sm25976121fac.4.2026.01.02.13.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 13:06:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 14:06:44 -0700
Message-ID: <20260102210644.50758-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767388006; x=1767992806; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1/5GM3V5I12t3VtLzpzBun/wmYWYWJz2hSkpLY+ZUSE=;
 b=EFYHeVHoA8jU6+bp6pltCNtaMuEJ/UFME7KZwzEYspfw+kvEgwIZdV1OuCHZ4NBcGd
 HkmYNHzC5MWog0LPHVRA1l9rLLv+xFWkhujLvIBoRumnt2g3oPAKjGYM44gsCLZqlQqH
 g4t1RT26Pc/JK5dF15FCPix34IbIA9DwuJehlIMXYzIs2HbirXel5WURDXRljXvqy6z7
 Ib3RviD9h9IHHGcrlXxklRGmM7/4CIKC5kzVgOQD4Y4jOxlbpunG/immvI4LlyfzM596
 IJ6RtUUXzCU53xwLdGjDvfg+atTjCueePfkBD1ot2xQ0kU4vmCespkLLAd0b778BFcHb
 RKcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EFYHeVHo
Subject: [Buildroot] [PATCH 1/1] package/python-mistune: bump to version
 3.2.0
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
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mistune/python-mistune.hash | 4 ++--
 package/python-mistune/python-mistune.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
index c790096af8..b5478a6d57 100644
--- a/package/python-mistune/python-mistune.hash
+++ b/package/python-mistune/python-mistune.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mistune/json
-md5  47bd96502dcf22434a329b1814769480  mistune-3.1.4.tar.gz
-sha256  b5a7f801d389f724ec702840c11d8fc48f2b33519102fc7ee739e8177b672164  mistune-3.1.4.tar.gz
+md5  26272a8d5ee997f80b32a93e51a24b54  mistune-3.2.0.tar.gz
+sha256  708487c8a8cdd99c9d90eb3ed4c3ed961246ff78ac82f03418f5183ab70e398a  mistune-3.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  539013fd8e19f744f8bf0e27a532bbff54cd689ecef7a800f56ae5dc824be870  LICENSE
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index b5ec61e3a3..b67700b1a7 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MISTUNE_VERSION = 3.1.4
+PYTHON_MISTUNE_VERSION = 3.2.0
 PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
-PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/d7/02/a7fb8b21d4d55ac93cdcde9d3638da5dd0ebdd3a4fed76c7725e10b81cbe
+PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/9d/55/d01f0c4b45ade6536c51170b9043db8b2ec6ddf4a35c7ea3f5f559ac935b
 PYTHON_MISTUNE_LICENSE = BSD-3-Clause
 PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

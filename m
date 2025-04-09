Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D4CC369A4
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 17:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 829AB61ADD;
	Wed,  9 Apr 2025 17:11:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfxKVtILYBUz; Wed,  9 Apr 2025 17:11:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E33361AD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E33361AD6;
	Wed,  9 Apr 2025 17:11:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AEF3108
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 17:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6813561AC3
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 17:11:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruor5ucowaMS for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 17:11:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 46DD261AB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46DD261AB8
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46DD261AB8
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 17:11:30 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so36442875e9.0
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 10:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744218689; x=1744823489;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g4QIIEDLXpqeJL/Ukorgxtz27SfGjEyM7lwbh69Imhw=;
 b=mIcYX7sxVS1ZErrYwj7X8RBhBRv5aPVbzKsE2tIgAABZm2AewXiEWn2RmQOet6axWG
 cYjdHq0Pu2iWr/IYIso7nOoHnaCBQNtE+Y9/cCe5k7pOlNumdRJk4sauRPQEOmiuWYL8
 +DPTchmTOV1/fN0RXxAh7vDQHfHE1jI4dbMB4hh1xtAWh34MdgDclALQwvwt22GWTND3
 kTDnZeMNs8/HOar8xl+N6q4KZOQN/Ryq32l+T0d5C5/DsabKRT3VDxttJYBaYuKrI050
 JdiEPV/DIO609WwvPHI2oxxBrZDIxkHGgj0sEBsFWbHJt8bpKzlTTJedb9V8U7dleusE
 zi0w==
X-Gm-Message-State: AOJu0Yy+KoXVyUKNRqBEn5iUyrJY6Xp+KyNkrAJnHImqOx4EF6qsLCXg
 7E5J7U1+6Fu2zfkDwp71tkyhec5lPQu6SuU+ooUewUXAhC4gaiNYyx9HQJeY49e2ARVNW/WghT9
 V
X-Gm-Gg: ASbGncvd/Vk5Wz3ay2lO/DONvwBET0AZKtQ35VdHL01MiNvh5UiaGp1aTQqeDh46EIu
 GnjW949RlWCGHlWOFz3xboUFFjvS15wCBd6utVPEzrSc01EH53s2L++Atoog+bWwZv1IN2Av8Ta
 PQRzhqJUAzfb2TjhQZG+R+Fyv+LHFUX+vW77Mp2kwXKaW4tlVJpeCg3yLNvjHfxr6y3RjCNZMk+
 3RBs9uTjygU3Oh4IUeQFXTx5EmbAXyah2K6d8H+6iwMQFlEC/4u6qN0dZ4OSPcyjJdicPufELAa
 pjMFv0sjI/IyZT2HRx0ZW05qUICXvYvKMgWGYHLXfbcNiWw0UpBrJik=
X-Google-Smtp-Source: AGHT+IHPM/i+yZT9IURu5K9hf9NJ/+yaSoT2p1nDEnjROJlLkqXz6LOtFkoiaGGNE+pANlFQTyzUfQ==
X-Received: by 2002:a05:600c:c88:b0:43c:ea1a:720a with SMTP id
 5b1f17b1804b1-43f1fdbf8c6mr31010925e9.1.1744218688939; 
 Wed, 09 Apr 2025 10:11:28 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8938b5e7sm2201846f8f.55.2025.04.09.10.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 10:11:28 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  9 Apr 2025 19:10:44 +0200
Message-ID: <20250409171044.775633-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744218689; x=1744823489; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g4QIIEDLXpqeJL/Ukorgxtz27SfGjEyM7lwbh69Imhw=;
 b=AoCruBcZ4Vc1CYIEMpfyo3RbRMTDeDAYJ4jJP0T4AXql7XFA6AxigFdXQMz86sbLua
 +1HfueUd4v+4CVsRCzB+y3YCWxPhd4YetwbcDbl9sX26hvXaH8hL/OocA5kiEln4wEDx
 AxFaNhcZriY1iOrlc06qd4terlMqmIQnn96RrAzuZ0casIBUj/yTPanV5MAE7l+lqpLn
 xR/C9kjZmwzUdHphOL9YEdbKq5HMBSrKDx4BjtyogItW6p1o6IQGr111Zs9c8Cm8lP3x
 z2Ktl7L5GjIkXVikcCpLC7ULbDQU2emLWsDp5dL3qj2qac2bCCqVW1fDTv96Zdpl6hMo
 mzbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AoCruBcZ
Subject: [Buildroot] [v2 PATCH 1/1] package/python-jinja2: security bump to
 version 3.1.6
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issue:

- CVE-2025-27516: Prior to 3.1.6, an oversight in how the Jinja
    sandboxed environment interacts with the |attr filter allows
    an attacker that controls the content of a template to execute
    arbitrary Python code.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-27516
  - https://github.com/pallets/jinja/commit/90457bbf33b8662926ae65cdde4c4c32e756e403

For more details on the version bump, see the release notes:

https://github.com/pallets/jinja/releases/tag/3.1.6

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-jinja2/python-jinja2.hash | 4 ++--
 package/python-jinja2/python-jinja2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index a89c63a0f4..ffd0bc55c2 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jinja2/json
-md5  083d64f070f6f1b5f75971ae60240785  jinja2-3.1.5.tar.gz
-sha256  8fefff8dc3034e27bb80d67c671eb8a9bc424c0ef4c0826edbff304cceff43bb  jinja2-3.1.5.tar.gz
+md5  66d4c25ff43d1deaf9637ccda523dec8  jinja2-3.1.6.tar.gz
+sha256  0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d  jinja2-3.1.6.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 9b95b3212c..74360ec258 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 3.1.5
+PYTHON_JINJA2_VERSION = 3.1.6
 PYTHON_JINJA2_SOURCE = jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/af/92/b3130cbbf5591acf9ade8708c365f3238046ac7cb8ccba6e81abccb0ccff
+PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b
 PYTHON_JINJA2_SETUP_TYPE = flit
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.txt
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

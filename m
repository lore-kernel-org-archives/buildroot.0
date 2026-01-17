Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0746C98330
	for <buildroot@archiver.kernel.org>; Sat, 17 Jan 2026 18:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24E0F841B0;
	Sat, 17 Jan 2026 18:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWQ0LWlw0tU8; Sat, 17 Jan 2026 18:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCAC384196
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768673281;
	bh=Dfo4hh9/4/KNK0WV0i7fOZa35gyExmKZeALT9aY4HnU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=q2llS2Z5p5DqfrwSIz6eOYQlRibXlzpJTPnzvAm/XNh3kGFvFTs7Vg+5PDGc6L1SG
	 PcLCraLjSEjWK3WHZ1KxCIMqAn9qNDv9pAM/edHcpFvfscmtLOx5Ip6XCK3krZUWGQ
	 +6Aop+/J0TDOEo6N1v3JoF1Ul7SiN1LirFDUcqFDPwJT3LF9EwRCY/Ko9wqjoVRJuu
	 p1n5ZL9TfJ7CSkmkp/LH7ggUBy7U7zRMyZygbo1OFSqlFtJDotktxH3IQ2QbtjJeWR
	 +OAKIhY6YaBqK78fusoxizuNUZzoQWvXauIvUY1vLxgtNltjMQOfvVixbLX1tNU+xM
	 wd+iN8LGw3+Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCAC384196;
	Sat, 17 Jan 2026 18:08:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B980A347
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 18:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B54D5606C7
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 18:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCRXDZbHua3U for <buildroot@buildroot.org>;
 Sat, 17 Jan 2026 18:08:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com;
 envelope-from=danomimanchego123@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04F316063F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04F316063F
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04F316063F
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 18:07:59 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-8c6a234f094so301969385a.2
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 10:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768673278; x=1769278078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tkReI/XrxDpEsIZo6+u92VdLG8GNweVzRWpB1PHnaZ4=;
 b=N8wQ4Gnnvfq4PuZv2NTyc5l5ssHNc5bvFU+16p5MJHrATE2AmN8ZpPgHc4NRYmg4kf
 WmT/R7q6Ng6JQ/THIuu5iQ3oL3yIltYOHy4HZA047jADoUdMhF4YakFpMuCVdT8HfhnK
 yc+KPiedEnpe2Wgv4SfqW+e7c1Je06O37ilcMBS+vmvU1RiOCw3DPJ2IdqW4hvpaJyfx
 97cuc1WwW8uYEKmTlr9dSbQJV8qGTUk2zhS1RB/+ey05kFcN2bQN+jIbqUc1N2mLi7FP
 pf8megQUrUOL7PaaejFl5eibrteb2hzYwAIKPNRYPjRzeaBvp6Nriyk08gahsokzTHHf
 eBfQ==
X-Gm-Message-State: AOJu0YzHZ4lmkqfyW6aNrFBHqcPsU0H3w9iBTa/GLNtIEhT5HKBDxWoe
 U33uUWnNBsQnV37P8m98SgygupctARikM8fHsQYOOhi9SYsijwop90Cx0eWLhA==
X-Gm-Gg: AY/fxX5wL14C+F6pKXUjrZEtXnSPA6w2/5SYGdq4jhbA/1BpIMrM1DAxwIj3jtOnZXv
 vYJMgoYOaO61E5++Hyxiq/9XFjaI0ZJfSPPrHNN4YicdI16yosgMTvV4ZVulC/UEEyb5Hp7AX+G
 apF3A/2NiURjiF2FKG/ff7ALONeAV9ged8PWcyU8E/g0OasgFts/fVGOgqibfwi/CjkvMiOjaxa
 DRWCAB6JgLTELvykV4yLBf2mYA9/WKVD5aFto20a3T9kHgUulnTllRY49ZmpU9OvdEkpnjTB6Rl
 Zvi+kNsLu8tLix/6b2H14buHeeu7rTkBvnnBW7t7kpMMTtxq37HusN/mwryv3wDc2U9PM6fGkSE
 QqJwvuiCK07f7vVFiAoo1KAIZWCGOSf59265RE2IqI005JxCRanWKW0KDcUlOEiKzz31dniQ54Q
 hgkryq8SdP2h9I15QwauVyqcBsLD3Tofx5wzboG2ViYSI3zPEO4msRwVVD0UAHDTZNrW4e4SGH/
 dka7x0gS27qEqbezrMEPw==
X-Received: by 2002:a05:620a:404d:b0:8b2:f0dd:2a89 with SMTP id
 af79cd13be357-8c6a670767cmr800314185a.37.1768673278330; 
 Sat, 17 Jan 2026 10:07:58 -0800 (PST)
Received: from LAPTOP-N4PBHT7K.hsd1.nj.comcast.net.
 (c-73-112-153-195.hsd1.nj.comcast.net. [73.112.153.195])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a72639fesm473530985a.44.2026.01.17.10.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jan 2026 10:07:57 -0800 (PST)
From: Danomi Manchego <danomimanchego123@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Jan 2026 13:07:51 -0500
Message-ID: <20260117180751.465-1-danomimanchego123@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768673278; x=1769278078; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tkReI/XrxDpEsIZo6+u92VdLG8GNweVzRWpB1PHnaZ4=;
 b=QhLOzMAU6BAS90VJ/h2Snc7TBsRQ2UbCjOWSq36VxMfIiF+iBw5zksmeKnqDWHJ7HH
 ENAcdb3luJLmYZEFh6ufy76pmIZ6K/k6z1BdgFAxtylRXif7ElF+6KLOG48fZRWUb9ix
 FrjejGJP8g1/QYfdieFV7aen0IX/KvjQTAitUSnhcCTavKIAxJdiGKODbOneaH1pcJmi
 U5+O/3U2JU70c94toP4mjAbq7jEWOZfFX31OeE9pKcQh5JwEIYJSvHLp5MzJNsjBYokC
 8W1/wGKZtEjcMjiVDjzSDbf4vEQ5xLSW/4KgBDZXB5Z9LtO0r3NYGRDkjUO3IFoueGNe
 5hcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QhLOzMAU
Subject: [Buildroot] [PATCH 1/1] package/python3: drop unsupported system
 ffi option
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
 Danomi Manchego <danomimanchego123@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The --with-system-ffi was removed back in Python-3.12.0.  From the
release notes:

  - gh-100540: Removed the ``--with-system-ffi`` ``configure`` option;
    ``libffi`` must now always be supplied by the system on all non-Windows
    platforms.  The option has had no effect on non-Darwin platforms for
    several releases, and in 3.11 only had the non-obvious effect of invoking
    ``pkg-config`` to find ``libffi`` and never setting
    ``-DUSING_APPLE_OS_LIBFFI``.  Now on Darwin platforms ``configure`` will
    first check for the OS ``libffi`` and then fall back to the same
    processing as other platforms if it is not found.

The commit drops the now defunct option.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/python3/python3.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 0189a505b4..a92e969f39 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -206,7 +206,6 @@ PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
 	--without-cxx-main \
 	--with-build-python=$(HOST_DIR)/bin/python3 \
-	--with-system-ffi \
 	--disable-pydoc \
 	--disable-test-modules \
 	--disable-tk \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

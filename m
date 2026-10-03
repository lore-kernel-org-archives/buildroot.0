Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A91DCA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC0E60DB2;
	Sat,  3 Oct 2026 01:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sE8HuHFCOFza; Sat,  3 Oct 2026 01:33:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D4F0B6065F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991211;
	b=roU6fIUWwyDzABBntFZO7kl3zE8EqC6vVuI6+hDLPPXQxr9ZBPsb9f6s9g/KHOdnyOhk
	 0dCCKD8AvJLE3uY75wXlV0WLEhWuD1r1g9Fw0PkNTStptyizODQb1oraXN7PnJWCV3wiV
	 d5IHJkY2N7l1DCPxf4+cv6irkDtJqBihcCXdRArPm8KKbs/ATgeG6KEWNvlytA0LX7/CS
	 m/NpQWlJ88OrGwJn3nrEPGjBP9Og7azMHVLHgRdBZUDH+sxwR+Qsnj7s8NUarp4YS82Zh
	 DjO02bvaAz8v0XuJvxqZcMkW1sQKnG71XQKEASz5nLHEp8hjl4RMR23Q2TZ2g3fMSWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991211;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kbNVj6kx1Rm9RJRrla0vkPv9sC+pLd4Nv1HP35eNO7Q=;
	b=pajNIcsKNOJ5Ad4BKdATHKvUHgJ47X3SsAxGinSxfdgZB5Jg+gsIP07sXsIcKRrWf2mN
	 wYJS+IUzoLu/HFicxz+6WY6tYZHUmvPfKtiFiE+GY1jXF4BZmfYGNqvLb0UD44ci8Qg0j
	 LWvnjEyOBbPWEf5bpOyDnBfWu82zwZx5DB+Izf2sjuB626QYTLCc7xTaHjd+zBoN9YUQw
	 gvcRmPuzRZzHKxq3tiVTwL9m34NMy8JXpPwOTFy4cvXvAc6ft1044mFQMzL/Jc3dJOET6
	 ZUkMW7YsaaoeYqYr2krfeZPwZtjlShdnbq6xiKPTbYekW8E1qG0MrTfbYCS1CFyq+Ew==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991211;
	bh=kbNVj6kx1Rm9RJRrla0vkPv9sC+pLd4Nv1HP35eNO7Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fWRsEB7cVfsxung8tBTHJ1qHh57ySbauvP57VBGFQMfyb5SlW8rbn/4jfS4rh0qop
	 c7tjKMYlyUPCWZh+CJPkpPjGbEthGrtfNDOlq59FKe9Z/8BhBewSESm7/sUzr2/O5Z
	 nWs7Chrp8RVxH/Q05S/j8taqmE7Tyqjucjo5GscEodHL9yQk6gDUR7X1kq7vMR4tAU
	 0VTXgVOAFz/FvvvNd2VppKzStC/jfXGsFbFMeSpzv7gq2yBAPJwhjiXV3SYNqfWNCc
	 hUYe9QYil6l4ADJ4d1AxR/wnjzVi6v2KF8gFqWS+DhMFyoTYnmbRE49LfC5IcnlzwS
	 H5caHu8Qr4TKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4F0B6065F;
	Sat,  3 Oct 2026 01:33:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D26201D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B81C940DFA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LHruT34wu1G for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D754740DC6
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991208;
 b=ZG1AkdNeuxEBkpreAufheYD2GAkGJejC+JeDu2tiSnadXp72UHZFALMfcxZ4+IO2DsOS
 CmLqBV4skWBV5stu4yiIDn6uc7Ns8dlGIL8jvKBRepBDXrSjawPD+oYz1cRLuLmLM5wcU
 EbBB8ZUkCRmcq/EHhK5xgHtK+8XIg2VlFaAaUb2A/PljkUgpb41U8Yyg3znpLgKi5plvf
 /LT+W+cgfwJgJGtn+6BQyPC5oApW6r1ZckvW2x/OWP1BvVWwzU6Wqdi9qWN3nv60eki5Z
 XCLvwwi59le+cu1tZ4RptciOqQNRHXNV/cVyZV/FTd5QmPTYneQP/GAG9M0MHiNVYcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991208;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=CIDtFFYObNw5seb91NeCvfQttfcQU7RhmrZoe/s8fuA=;
 b=JDg4+8EfD4nTDGuJefT3ayjrZgryTrOqgR4RFDsHn7dcJJgw/Ny2kcb1m/XGY1kGK43g
 4Ru7de2vs1M/pVoQXQWMRJPqlEQkXl68UVuEdrdyY3OjQEY4QRWU7yMw5tbxX8B/64eMd
 /EZ7XeL5XG+xtY6oSE+vuEbbpq0tvQD8G4ZKRzcTT6bEs41fQM2aHib//iyCBCFO24qMX
 s1jbxcrJ6zTR0bSJfE0/VhwQimUPHp8HXgmNNt4Ko/SaiBWI823BT6bdJ4ub5Uka1M3mc
 HJMrbE3/bKT9gHRT9w8wVM6/4S5Q4tCuLCLEzHxKedBK+jqSxk2Ax87B+7D60fDMGpg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=J7L1v328; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2a; helo=mail-oo2-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=J7L1v328
Received: from mail-oo2-x2a.google.com (mail-oo2-x2a.google.com
 [IPv6:2607:f8b0:4864:31::2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D754740DC6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:27 +0000 (UTC)
Received: by mail-oo2-x2a.google.com with SMTP id
 46e09a7af769-7f4f0c89e34so494239a34.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991206; x=1791596006; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CIDtFFYObNw5seb91NeCvfQttfcQU7RhmrZoe/s8fuA=;
 b=J7L1v3288+XX2VrM0FQCJldAenr3LZzOaTdt+O1c+2euv2xGxwwPbw56vFOYNPBXl3
 sMuSw0QHDl8Q+OygxqhTVFwBwnCkNNrc3zEkwuf35eCuTwpRlcoOwOuJ/LdxgPw8yERB
 IeZWLJWApeOPmS4bVuwrLISy2gKd5gMXxMz2QbYTyyYeY3+HR5zg0gywdyDIW6kZb5FA
 tJ24TiTKrz+SWgtmlGGV32/MfDG8JzVMqh+3z1xeeI0lOWoyUaQpKB5nyLIvdYy+GYTa
 PkufCUfN8AFF0yZr6Yctd2BPgJfVLfnKvxag5kxullFdFS+SBvUdXIaf/UMHq+Clf+1n
 pUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991206; x=1791596006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CIDtFFYObNw5seb91NeCvfQttfcQU7RhmrZoe/s8fuA=;
 b=ldO442UO64viE0J/9axWDJHkGJceuwdYnyhKB+BzXFxiyp0ldYBu26cAV/TMGjY9za
 PL+axpmxEtXddpS6pD6Cuhep92N4bVzYcx5CBMntfOn5wthNQvXTi4QVTBmmoJWh0RKp
 B7SBSWN7OTaZmuM6qhD4z+xNybx+8IYqrsyg5huOLVdGBBGdGdC3qsCJyoPC2/At2BRY
 cYPQb1Nh4xK5cAT9TDbNbKDOt7HU3wmuF99tC0oc5sNn5GRwPfUah3Cvq4nbjMkAMzyD
 NLNbsUkvTp8P+uaAg+TYVR/RCPGX4wVb1W/16WcdRFJmWI75gpG66rGXvaylyBeWmnqo
 DtWA==
X-Gm-Message-State: AFuF++lGkaxHBsg7Cnbrc4o7xNRhkD0zA8anDphYCDsgCKfYyeHoePSA
 JbxcJ9Bm45FsNQ13jYMHHZn6ZhiRH8OpHpbD7ZQxe3biNbJVOLTLUIXeyngm1g==
X-Gm-Gg: AYBFou0/zmVZzJvTSAHJTHC9mLgEzfVtrH/kuzvyG/0YYguN1WaNnHFomgttTf/dK8n
 gflul1dQkpmTvmeQSG0Zq2sYhDS0ImjlQouawqRp6/B+gZW2OeakxD3nTpNmawMbcD4Hfo7GWQJ
 ottB9GJe9i/wyHQDQ2ny0cm8Dz7P5eKrvDqDlqjAm9jYaWLg0gSE/FSie9fSOjZq7pYL6ipyoQU
 CYhv39VL7TUCcteMZUTxZYUokj/SA6+fn7haa0Pxjl8md0CUnLU7MWL0JgegV9CWB8Gy4QSqWhH
 UYMuEvf/Jc6g3hpnb5TuMupq1f7a1jJTboy13edDq2XBrkCSeSOMhu6WCp1CDmrvDSFc1UDypY5
 1bhdQm44EM2Xw8V5jgAwuL7dMVmi/pglh0xlimWypUP8c2z0cDZKPWwZkVebCgsM8MHaCOOrlTA
 xGRfMfcC4ZAa4NEF6sKb4lPjHBnDcSKNq+NKNK+I4murX/H3WALIpqhQeDjFGAaS9NrmQ6ZwkTv
 dHILWZtAz/n99ceMjrE/5hkmHwVBeT9LTwRHpRtHSM4F82wqpqOgKwacYm/llz0xph+PMjX6soZ
 wc3dV8lhCMkxWljB+15WHHimm+9qYfI0GXxQ6GgRk0q3LuvSb6ByW46/RKqqwMpY8bQ2uDpI8Jd
 Nx3dOwsgDWuGdEQ3lDoO1DuZ8Ru5niOboPrBuo6YcQw==
X-Received: by 2002:a05:6830:240c:b0:802:4cf7:ea46 with SMTP id
 46e09a7af769-82283281f8cmr3930872a34.20.1790991206503; 
 Fri, 02 Oct 2026 18:33:26 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:13 -0600
Message-ID: <20261003013304.400979-13-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-packaging: bump to version
 26.3
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
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-packaging/python-packaging.hash | 4 ++--
 package/python-packaging/python-packaging.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
index a5183b1422..9c5280617d 100644
--- a/package/python-packaging/python-packaging.hash
+++ b/package/python-packaging/python-packaging.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/packaging/json
-md5  edae3d061c39a2ff713a97e133dbc50c  packaging-26.2.tar.gz
-sha256  ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075aadb987c2fb221661  packaging-26.2.tar.gz
+md5  c6809ec56986682ceffe573b8778a1ce  packaging-26.3.tar.gz
+sha256  94edc256424af38762eb31306eed28beb9f0efc50a8837492c9d6fd6004aed79  packaging-26.3.tar.gz
 # Locally computed sha256 checksums
 sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 41f8fef6a2..0f63da0411 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PACKAGING_VERSION = 26.2
+PYTHON_PACKAGING_VERSION = 26.3
 PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
-PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/d7/f1/e7a6dd94a8d4a5626c03e4e99c87f241ba9e350cd9e6d75123f992427270
+PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/7d/fa/3944b40b07da9ce895c0e6303a5ab7d53da063554f534556b134a54d6093
 PYTHON_PACKAGING_SETUP_TYPE = flit
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

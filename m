Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D19FCA5FE6
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 20:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6B0E60614;
	Sun,  4 Oct 2026 20:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 52oPl2ixG7Fu; Sun,  4 Oct 2026 20:19:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AE7E160627
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791145140;
	b=IrsYpgVsO9FhAmn875DoFYE1CX5xb96ur9C324F7O8YUNfHddSQ/Ie4MtEUgTom9ozZy
	 fZf2vrAZgdMNlphuw8hKBGD74Sk8kyiNqOcsuUlX5U/sZiC7PO74RuKRdWxc49trdEADB
	 +AaR4/BqAjoi5HRdQz5pMI+CA5vkesipC4JRT2io2Aeab8HKLU/vk/C0UOj/NrMH9GoqH
	 ROW6DlBEGusmtY8rKUq1eNNK4DzXyHHi4x8bSWGSlsob+lAmuCflUgFQAnllbjYU07gG+
	 ahhCWMuwkikUKVWlrIk0zDKDWHGE5qhi5BrERQuhVmy/2tkSeqtIevuxyooDtPB2/EA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791145140;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dMZ6V5fZjP8zv47DmM6ixzIzXLWu1DvOGW4Uf+p9+ac=;
	b=Tw0BR537HNWbTqcPGOkydQJPF3zSkg+GGEq6vr8UvUGEONIF4jIBg3oplCi6MUCihpKs
	 ar1entLwR7EEeM2wHU6CJhCWpuZxXy0JJRZeMgA8QYaUiVkBDouwFbHzKd1nLhImrxCPm
	 VlE9xkwdd16I8BGt6UKY1FqLNn/PP5cgSUgGAz3WDIDwGoFfGpqNSGwl/eOO+DJYVzcnv
	 Z4uWGRJhFx21pwSSXZX0T70IXY3m8sbLFnos6Px7Yt9bUuc0UPAuz4pLYOQyf+GL8LCcE
	 223znPWgHtnkRVK8a3yuJGm/tUmzOMjxtF7Jx95Conus1UO8pNWjM2tqbRV6ymPTVsw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W3n08q21;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791145140;
	bh=dMZ6V5fZjP8zv47DmM6ixzIzXLWu1DvOGW4Uf+p9+ac=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ZSK+s6qwTH6iAm8+Jz0UcTfSTnVYyAMJpCIolyiDo7RqLteMag2O92bgDa+K0Le4b
	 oJYRL6yGWgoNNtvT7GyB8BBuefa68H7YcV7qqskIGZI4m5Xumd2F04nZgHUkzozIch
	 m/cTlyHEdGUasyU7YXYJhFvzH1Qr1QO11upp2n7mU20lIaqviZub7DpkUCF94tIj9K
	 Nqv6AwcwprsqYSORYzwt3zXisTCWa2lasOu9b+jDhSd18vxjmYZ8PpwxYFF4niDlVW
	 54O8OK1zEfGnImIf5ELqz3iXDAz6yHMuIwWf2Al3G7CPzYGz6QMmGPerea5b0+vWQU
	 nXvucp21ha1GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE7E160627;
	Sun,  4 Oct 2026 20:19:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2657323
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3C8360627
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KpZnsGwAz77D for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 20:18:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2C21560614
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791145137;
 b=pYj2rkrB9sPp5zTpIVKrbSFQWAOnFSAtIw12RNfRxJRve/h4Kq7+sYoHQxRRwDPeS7hh
 ZpeWwaIOlPhE4LdSIA1D2WQ/ujDPoVvNdOIrP40HcWBrXuEd9AeBA7mx0g22mEQcSTogE
 OmyeGXUewoMcpHG2v0cufvkFT+fa7kzRCWPcsF6lDZ2661h2wpPQwVYmWSsFqzBb9KPhp
 8FDlniLfi0Pd+v3NU0vAINnytZgWsxfLR82UDvQ2YfIzTT8aAHzhNu+cu/9AV/SoirzzP
 mDCx2cagOkc8M47yCSfp1OLH2Imalxhu+BQBMKXqbR8irCvz5RzzvfqmGyYN/Q5sJLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791145137;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=gn+erO/gEF5Av5MLg2S+JscRU8gHj/ga0a0zrnEqVdI=;
 b=QeCNX5+etsGgO6Xo9dZrjuEU0SNMGilnYFLtYZrxJzVDpWXZbg1tAZDjRIi330n9/Yxk
 zzvNii2o8PjZuDHuUnWY5EgIMeTkEcLsEGuIKNro59WxqmyOxY0xWaa1UfGyHHhKhT7+D
 VCO/NcvuYy6WgDj6WzuPdreP4dmATNhsYlSurCWQt2tDHQTVnIxyfUcOhvWMY2eQ2fj75
 FNuBp2yo/0hEYM0rRq0hvkNz8T64QtkcgsngOyzYVpvAz91ydCqY1T/ceIAmARzrszTxx
 foOhCYZl5Derwu4ytLsUV64uTvkSCqDFhebWTnhH7ko2zZeYwTJ5KC285ZDU+f69r+A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=W3n08q21; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2a; helo=mail-oo2-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=W3n08q21
Received: from mail-oo2-x2a.google.com (mail-oo2-x2a.google.com
 [IPv6:2607:f8b0:4864:31::2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C21560614
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:18:56 +0000 (UTC)
Received: by mail-oo2-x2a.google.com with SMTP id
 46e09a7af769-7f4f0c89e34so1457346a34.1
 for <buildroot@buildroot.org>; Sun, 04 Oct 2026 13:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791145135; x=1791749935; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gn+erO/gEF5Av5MLg2S+JscRU8gHj/ga0a0zrnEqVdI=;
 b=W3n08q21qNbf27PMZSO9tPXFHM95MQUHfO6/QP4Sxx6acadc+8ZHRNz4jRAsyzY4xP
 suQI/MJgdj5kvgLupFOVVWeeuZWZR2F+HkWJLaVp6ewDVed+gIYXbPALvj2N91VjI6im
 yNDUPUcQKZpjUbtLz3pgCE6dR5NePmXqS9kelg2teY6i6z2i2yLfZwRz02t6TPDywXT7
 k4em48otnAY7pIrmHmhwbu9xwbGP4WOu0nQ5IQzy9E+vLTa6LUR8gEg8uTOAL7woJKSG
 cAcxaiUjeZeFUxR3+RHCsI9uiVEm+FqlK1VGKyp8tlqEzrv3fgOwaMhxdPjGdgd/nmBr
 b8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791145135; x=1791749935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gn+erO/gEF5Av5MLg2S+JscRU8gHj/ga0a0zrnEqVdI=;
 b=XaenMxbyknf4Jk7kIkmRFI3TEwBQOYD9DGxCEdY6kzCsB1l3YRf508lXj7P2TqYNua
 hOepRJJUK2rUfl8+7naFdU7ymvUe0hBe8za9GI9VdTa0T3ff7Cl2OoXwbKAtolAmXpcj
 MWHAD+956oS7OHvhAb46u2SPnAycMUXk72cNswzjKTswgpmJ0duZyam2w8CZf1kFoquy
 /Rb8514weob3h7QbzdK0mcQKUgB4Tch4ErDuW+BoUOl6f/J7/IwlezdHvkkUoSPZfFEU
 DHp/Ho9FxfG7ubHgpaNv+9f1BRLH9XrqeewW+h194eHdsXfEj692qBFyw4I52Vny2t7M
 rDlQ==
X-Gm-Message-State: AFuF++kVc18WGTBB3Gr2UBSjrTLZ8CZK8SkpkNkMVqSam+OhQiNU4v+o
 dUZbwEsTjUyyGTGPXO2YvacDQ/f2Zg2U0NUrHQQdWgFnD6TMdCSBXxYP4uBjHw==
X-Gm-Gg: AYBFou1crFwOedlGJVVKsnoq0P5tEKcFKwZMlxlNRxRPq+1C0M9srgMVEZ0IQXBXDYj
 8nkIlHri43w9pYzgqBHKNxZbFIWSxUdrB+IAyCCZMKdNLYlb5W9Sx6Yx4u/Bf/oMnrqwa2bDrZ2
 xUTQdlLoHa/y+pmGDXYM2lAn8/T+ZUj9b3S2e4Uf1BmdMPRKgAapxaTiayN0/D5Nt3lt0fWBArv
 vCnDpMQtM4qvLU02n3n1CIkzx+aa1PlUjnmWH8/bKnyD1oU5t2+djknk19+R6N6sq8KyRTixAtI
 bAEPSHJEUS6wB2+hVxwa1U2jSdsaj2k7uEGpYRlO6phfFd9eLPKTWGXMpbBRxABEqQUxP1hD33Z
 qWC+mBqy0nOorvukbVumcgMhq+BOAuFJ/pZxdzQme9HzqnPg9QVxfTLzmVEFfCM5u1PF4ExxGJd
 kzY6c+y8rMARe/MHMMtGQX+mM6l6YochvTQiliOi79ynwSHuzjWwz7Rersz5DMS2gcrUXIS7IjP
 zBY8TCHWgDBlhEyFFV5SwkLgNgfdD2UbnBrhIbej0NoPhWH8UXVc8CQ9JqI1QT9pJaTjZk33TJN
 wSE7bO94W5KZov08UrEC6JAtnqOGFwozRN6PeZKyMshhdLnoQ2Ccd0L4ZvwJ/i2Ogj3umZjTgVf
 A5M+GGFKmUGIR/k+NJQuN7OmUFlF3Bn6JxtWGfM7RD20=
X-Received: by 2002:a05:6820:c0d1:10b0:6dd:a0e9:1f0e with SMTP id
 006d021491bc7-6df34587577mr5038840eaf.43.1791145135414; 
 Sun, 04 Oct 2026 13:18:55 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a86abbesm10037861a34.24.2026.10.04.13.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 13:18:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 14:18:42 -0600
Message-ID: <20261004201853.915471-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-filelock: bump to version
 4.0.10
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 6547677538..23472337ed 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  0bd500192b983fb9bafd2e5a7b4e02f0  filelock-4.0.9.tar.gz
-sha256  635e7d67fa92654eed444e75e9ca18426d34e77ad9c469bf4373f75a932f7b22  filelock-4.0.9.tar.gz
+md5  2441f82b97ae84b4dd06f6f183c1c19f  filelock-4.0.10.tar.gz
+sha256  00d6a81f976a6332551c2c10f39e12b4abb7e01c64d4c497b81a615bc9186f1f  filelock-4.0.10.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index fa06e5f7c7..f24b309787 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.0.9
+PYTHON_FILELOCK_VERSION = 4.0.10
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/70/51/2bc9e529f154fad99b6cd0073e609291eb32fd23581b32362d33d164d316
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/4b/51/a182494d1d8dde1240bff84dda57d48165d982e59582ce8f167e8e3d7628
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

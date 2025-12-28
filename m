Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5AAD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 23:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 102648151E;
	Sun, 28 Dec 2025 23:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DbmQI--5qJ6O; Sun, 28 Dec 2025 23:52:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B29A8150F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766965941;
	bh=QXp2G+AbRP8z9eJrthP7EiRZZlg33XTUEuzwTXPU+qs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cL34WrIbIwRKC5ih6EjfWM3UnTCyxc4k3zpVXMLazP4ubIa2WjbhGid2w37JjCdPj
	 p9xlbzOO8TsaRfm5Xkl1JYg9Nf9HZ0z03nsJipFqX5xMasVGYHhkBkJGdWohrXbUt8
	 9DVs2CjoDSn2OBak0lvpN8r6zhYee7ShyKb+p/51j3+24x04aJxXsdA40yZXXyomwQ
	 +llN1WfWbVdkdMycX+SvT3GIQXJFYFbqnNyR48D8wy5x64vddGhd1cfJKkr0yXs+FF
	 L2iCHNW64/htOyjJtiu/V9a4cw7oTCis6HML/jHghgvubrnKpNsXdGQnHRgox5U50O
	 fCFvEBdTy363A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B29A8150F;
	Sun, 28 Dec 2025 23:52:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 60C741E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5273060A97
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21Vy2G7OBxrJ for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 23:52:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7B4B760A96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B4B760A96
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B4B760A96
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:52:15 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-3f5ec7636e2so2854314fac.2
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 15:52:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766965934; x=1767570734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A5nUgW0mLb817bYWlJmPLtfqw/hfbmleNeMsc7pxy04=;
 b=T7kuPzn6Vu8/wjsqQ7lYVT4Pz44HEzHXGYhSz2Hlm2pr7GClRa79aOFRMti2SE+erp
 hVffERTsWnmzZMCUZ3HQPTECHH1OR6y6hLkzoehAt9UhRsOb9ByWYyxZfaBGhpiwJIrL
 4CVcgE5R1GpQbQ9BGO544cb5JOVaJhf1hlTq7P1oLMwlv2LewJQODjx48YvnFjG5X5p4
 Qa2ysgi8L8jvfvl/K6HUnvu02cTUBq/NbgMXkkEB3CfV4fq2Oakbyea2wfcCbG3JL+0n
 YfjNO7PdMIaME0RtVqvYyvung+IzJK3E1xiqVg3xOvfPkLTcbaduX58eIyf+xctmVz95
 DAJw==
X-Gm-Message-State: AOJu0YyBhf7v0EXXMHnm0l4NarSZ6zccidDImFfHr6WQK7ktAG1Egspb
 wxx7HYAJocCpxOn/hEUFFLUqIdQH4KFWkKIJkmLn/6K22ia4Kgy40RHsnd4C09Eq0Iw=
X-Gm-Gg: AY/fxX7V+5HN5wJbpG3LwtfojXnWqeHJFXKchL5OzOvixE8h44S6m1NCNLIV6A+SqkO
 G3LDzA6PMVavUgkfZy+gMotUoffBvEZXOoI/HpRjb5nvDX0rXkehQOmIuJAGCiHcKEUWr1gKfaT
 i1wZ2TbM70oDemJkh58xMibP16tGW/StgvKod6gN/5smbobfibbmObQmbkcs5V26SP217IU/U7u
 8CLQHesmaeLab7cCaALy7oXPbKjxS5yIUg95XRgxg9yzxIVMifcdo60XozcTjRpXGDY0ss2WTbz
 Y6keMmGurdU1Sjr2mwqeo1dOmWw1ELfSVk1mcHh7edo0B6MT9hUZ6G40lzQali73dBaDwLv+Ofz
 wehjo+oFwWbM7Bo/JlT8RUbsYrgZ8V70tCcFR1E6feDpC0uuynDIF6FePwx8JXpAConuVnfq/6+
 VxPF+yPdpG50RiLx/5xdVFLxna89Sjiqhxtr7Qu68EZIgAQLaHvBGBvPW2WKRpc3xIOfmLNQawc
 l2QBiYn8MS0bOFdY7icQ9G/5emW/IzUOgH3bVZVU8GiUOxqjaUhWDw=
X-Google-Smtp-Source: AGHT+IEBOwlTbGwchUCWB9wnbYPZutfU0r53NpTwyyzEJThn8/EPOl492PySevNw/p8qNpPuN0h/+w==
X-Received: by 2002:a05:6871:6681:b0:3d9:7dc4:3c21 with SMTP id
 586e51a60fabf-3fda5603c4emr15820505fac.2.1766965933743; 
 Sun, 28 Dec 2025 15:52:13 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaa8d366esm18049996fac.5.2025.12.28.15.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 15:52:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 16:52:09 -0700
Message-ID: <20251228235209.2900894-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766965934; x=1767570734; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A5nUgW0mLb817bYWlJmPLtfqw/hfbmleNeMsc7pxy04=;
 b=ezC1mK7p51H5d9sd3jPGlyg3MaPtFZnDGSQucpRaYsIiTfnMHIfFljnZAjSdJkiTux
 adGyX4lHz3NmofhFl7Tqa4k+Bta/WOU0ljZ99qMJo1vkCJfxhFtx+RfHKCHcCSJ4KXw0
 F1DAT90S3jnz0dz/yipW+9nwxH0G3hPo2ANZRpR+MuHHfrGoTT9wd0669IDViUhid3Pr
 2OrDryuFygeNfKAU4GsU/I5+8tKiHFq/fK0sIA4vdKaPtXvayAUWl98FoNyJip4EEfwh
 8Hh9uSlN+JCaxAL+Xhz9jdhxHK/LrAP4arZ6Wx/OPRui2/nPrBr38bGSsFEpwRu5O5ch
 c73w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ezC1mK7p
Subject: [Buildroot] [PATCH 1/1] package/python-aiosqlite: bump to version
 0.22.1
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
 package/python-aiosqlite/python-aiosqlite.hash | 4 ++--
 package/python-aiosqlite/python-aiosqlite.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiosqlite/python-aiosqlite.hash b/package/python-aiosqlite/python-aiosqlite.hash
index b47cdaf6a2..b577de149e 100644
--- a/package/python-aiosqlite/python-aiosqlite.hash
+++ b/package/python-aiosqlite/python-aiosqlite.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiosqlite/json
-md5  1277d7c460a278cc165ae52be14f8fa9  aiosqlite-0.22.0.tar.gz
-sha256  7e9e52d72b319fcdeac727668975056c49720c995176dc57370935e5ba162bb9  aiosqlite-0.22.0.tar.gz
+md5  254707dc29315a01a95728d749d13e56  aiosqlite-0.22.1.tar.gz
+sha256  043e0bd78d32888c0a9ca90fc788b38796843360c855a7262a532813133a0650  aiosqlite-0.22.1.tar.gz
 # Locally computed sha256 checksums
 sha256  ab0c171dc3ef8bf325a84bb77d855421f2611335ddf6e08816b2922c4edc0f76  LICENSE
diff --git a/package/python-aiosqlite/python-aiosqlite.mk b/package/python-aiosqlite/python-aiosqlite.mk
index 208960954d..89fffbeaa7 100644
--- a/package/python-aiosqlite/python-aiosqlite.mk
+++ b/package/python-aiosqlite/python-aiosqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOSQLITE_VERSION = 0.22.0
+PYTHON_AIOSQLITE_VERSION = 0.22.1
 PYTHON_AIOSQLITE_SOURCE = aiosqlite-$(PYTHON_AIOSQLITE_VERSION).tar.gz
-PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/3a/0d/449c024bdabd0678ae07d804e60ed3b9786facd3add66f51eee67a0fccea
+PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/4e/8a/64761f4005f17809769d23e518d915db74e6310474e733e3593cfc854ef1
 PYTHON_AIOSQLITE_SETUP_TYPE = flit
 PYTHON_AIOSQLITE_LICENSE = MIT
 PYTHON_AIOSQLITE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

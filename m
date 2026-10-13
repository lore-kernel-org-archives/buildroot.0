Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E49CC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BB4F406F3;
	Tue, 13 Oct 2026 21:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoEkVY_DYcoo; Tue, 13 Oct 2026 21:49:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7FD5F406AB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791928161;
	b=WZIjEkf897PwUakNuZVtxiqV0CJKZVHBM4sKATRMZqgh0/t8eLYLXSWTikGt0AKR2R1K
	 GidcQo7Pe+QAiw+q4ZV6TXScROEVJgoxeEUuRvUfsSSr35IkyS8xD+Zy/ngpthIzz92wD
	 ZoswYGZ1kSRgqNxoU9C9Ohv9Nh4aBJKLBWQ6X8CpiT6zbKD3ks9hb6l/hWqKANETv+jxW
	 /iCv58OhOY+jCGbKAjmdDt4ts0RFRlWF5bAxRubzs7jmwUa9pRqPh5KrC7DiGzMegiUEQ
	 K0wGyDU0yUUbeTlIG4mw4z+nNy+pu9NKYPnn5ig2NxPDbIV3X1/7iGgXHucZwqzE2aA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791928161;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=b7Td2hhXxrkLWjkCS4qaps7I+DSGHDUdm3oZlXB3VbE=;
	b=JiiegVZC63TnNzhD21IecUsiWpbJAQyuxdX5jNYVXyN+dmdEzx2Hhhm8Whm7Oeq8gOLR
	 qNhp2EjGn3OhT33FXQSIIiZfXxm5Cjzbz4qJYEsVSDtm6c2MisRFPerhtpMDHEmcWtQEy
	 jXpAwoNVDgKElZp6TO4CGi4RRvzbnd97QdPUyhPh0mYaIOaESYgucxTQX8P5XDuh6k9HR
	 mXDAbHb+Q7E6DMYlQ5gALQB0OCejkTvWYdZiNSrjwK3Om6GZIbs8pn6xG15NSwa5/56oa
	 xigvA89lP8Meo/iI+eoXgdQNUOn21wXtXIOffQl+JNXcxbGUWHd+OETY/2IZWsuqiaQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791928161;
	bh=b7Td2hhXxrkLWjkCS4qaps7I+DSGHDUdm3oZlXB3VbE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=M8KeTBl/zAvxZWE2cpit80mr/3OwSNL7wGoO2J6Ef2Ymo1c1jKjrQG79XLQTVJtuH
	 ZZXm3WuCs1lpU9c/izRSHLntugU1YYeX1/BURM0o+cTeEi1LPNfWZAc6yfaN/VFd0Y
	 YyNnxficN+Awwa/YS84EPeUaI81iU9inogh7ZnJIoo4KaivRHZcMn96ITlBj9qNwqN
	 uoKsI0xP984SqjBacuJXwHHNbBbWZ8ooZES2kgOJM9mHcv0+ywjTa+Mz1DbbaMtpZC
	 UzrA+K36YOdNu3gs3bLtHrpMsgfYvTxxQ/dgoKkj0ZW8prfOsIAEQpivjJIWGnSW1W
	 tVQjpM9hYFFCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FD5F406AB;
	Tue, 13 Oct 2026 21:49:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E00482AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6042402AA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTyk8IbrTRkE for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:49:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E6E6F401A0
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791928159;
 b=MIjt9lhYn1UOwVVklutWvb3ngR/9rEpNJUHe08VYjmJxcnxC5WndaDmFp+CpjHK6sfiD
 hFwlrSRzykths4S4fjEpmkhK9V9LLQHax2E8v49B9fUALhPIDpMhcnLGsg/EXfBVKEGmR
 Nf2/BEo3g+IvyCWBhc1ByN46hZn3kg4PIMb+h/wcVgjGphTd5gEdQI8xtFUB6MYPP4rDl
 Lf6zqXLV5q3rDz+Vbhc7kybXYqwvCzVFkto3RZPCAR1V8kcoqbwr9rX1L7YZf04RsjmYw
 yb2o8/bAedrHPp1/EfBkqeSLM541qWRjMQHHF7VDDJNM1swt0g7UcR7pq1gQBIYWhXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791928159;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=EaizTmFmI5NyK+yNj4XhcmwRmf/WOYBF/1l9WLcLdzw=;
 b=sAweKnNYmVgRQHpRmqfcsrLAGb7LiIs0z6vCMBIKy/Ft6o5SayC6nWifTwItEMjTS+do
 VY0wfqE7oq9M6mfhhNZnIAmFpKDLa5xAEjfiiBxF3msbgjowYaC6J+9da1C5Z4twuDzgV
 FMLtza6WzpVoboNeA7oYAe1cguuCK0xpBtuLmM4iH9HhVokpKCwnkgFpEOwl3k135vxFQ
 nk5Mw7xUCWxhtak+wZk7VcOy6Iq7zBsQ9aVclxtzmS7xw/aopGqWJbK7+m9FX7qjFcE5x
 YGb7l3TYfSax+jn2PtXklx4jw6VJ/DLs78AUfItCQE0ed/NoI12FKTc42amZ+tIsxsQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Hx+R+NI9; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Hx+R+NI9
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6E6F401A0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:49:18 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-8256106635eso1752685a34.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791928157; x=1792532957; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EaizTmFmI5NyK+yNj4XhcmwRmf/WOYBF/1l9WLcLdzw=;
 b=Hx+R+NI9Tjxsv7wW9bgMWyOKVZ5cLXAkXyItZ5IVZOSDFni6/VmhYs5K0FLtcJImMr
 MzEjqCbVzMU9qPrtooMSzdFnVudqdNiTAUD8Ql2PuTqZ/dnE/iN2XvuBTMKY2CkNU4bu
 +MKEnapXoP6ZHn98UNcS2RHofGXbBq/59yB8beezt8jKgLYQj1sTHkRXud/RDolAJU4X
 wV55WKDy4CX2+CFet+fg2E5lATLqF2yeq8eriARvoTg1zdvNSlc6WjqlmXziD6c9x32L
 ZKolGwgQiGQ9QjVEROaW7FRr8wdXZCN0MKJZfBjyN2W6fSPmnaYyZqJbdrqpLNxJTu2a
 /QIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791928157; x=1792532957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EaizTmFmI5NyK+yNj4XhcmwRmf/WOYBF/1l9WLcLdzw=;
 b=CQwoeQPz7H9XZE8/JhHkZ1CJLYU6Aem30CtjSmDNFnQ4Fc/6Q5VFZM1bk3JY8pzRo/
 TTmPb9C4gpvQCOfolxnJDOTZ1ybyTNM4bj3z4kF9guHucatAKw+dCcCXHSXwJZnTwWdI
 JRms1SvG5BncKkvD9GvE4PCyISVEi2HC27F/a5yLEHb4Hv+srxLLipO0qZ6WYmBYZA9J
 B6XqBmU084DmfDGpXMM8EobDS39EA5lg1j4ws7tA2Ru3Ujxfa1UqeP3pk9w0QNX9/wnp
 L6QPAzhJPK13o37sLC0T8g8VezJuSsb7ZtshCaNm0Ub2yrlZUl97qKRnhHLefuPycL6+
 FiMQ==
X-Gm-Message-State: AFq9FYKisuCYYRB6rvlUQkr/Rz6gtcu/nMCCjNdOcTCY43uA2b8gnQUP
 T20UTCZr648vh4di9bYeS/sIBxlJ5Rx8U/grA+oU3VVOwntiZmJtlplz8OXLRPrz
X-Gm-Gg: AYBFou0a64+XMEM0PoubQeunzoLhRDaWh3xE+MnZ8XsbR4I7X4cPCMPr6sovLKy3CTn
 BWK0R5x1jr0D7Ffrsd6eQJDK4twD/zjWpcOK9SiKPoBdiQh/Xeq5k1DxoZ5w3QUVHARGB/f8MSq
 B69S+vOid2qPvgu/qYzcOJQwL+goVMsqM2fhxX5f6WgSmD2MEUTnhqdFwPqMGtEl86KWHL09vd4
 i1XWUby8IiTg2WsXxjQKPwygAnQD5Jm99C2RsH0UsyX37MPJ/wOEzeIvEcZN9rggEuO1v4mMBRT
 e3G5YXSTg7NWoEcuhWJxOKRfF9V+3OJ4rsYtlT9vq2G6WLUdyuCp6IK3iavnE8roYonzLuI+/oX
 077sKg2JcqeB2RqtQ8vFUYMnGr8Pm0mXiZ4CcPIA4HNt+N7CuYvGfUsiLiDnM2t4wkQeiA038jU
 2J40MSx/B+bhAwZ5Jyu+EhmoKlNTz5jBHXD/w55yAB0KHoATvRYpG/RdTNfllm5uTYbDiCzXo+I
 qsPD7McZ/h8BjoU05R7Vbjv79D3Ivexw3E2h509REcofkpvymscUsw9Q/tfZGIy0hfikJTbQ65q
 UVsQW1zOgGlbnWm1D0ZI1S8fMc7lAL0KTboJDZUIh/dFDZBMOjvtpeW89ac71LWJ5uLydQxRkHl
 6DDF/YdsdxFb8WRwrYGnBpAq8rwYVHB0sQ4esXnmwPA==
X-Received: by 2002:a05:6830:6993:b0:822:95ff:43f3 with SMTP id
 46e09a7af769-83098929807mr12576792a34.24.1791928157643; 
 Tue, 13 Oct 2026 14:49:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8367ada5b6fsm7002094a34.21.2026.10.13.14.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 14:49:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 15:49:14 -0600
Message-ID: <20261013214915.2459704-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-botocore: bump to version
 1.43.113
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 51be01c029..1e5c606e7a 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  a05d160b6ea2e3b8d54919585c414752  botocore-1.43.112.tar.gz
-sha256  9ce0d70e09fabbb3a2e1126d3ec79ed67d14c88bb3f064e62ab2881d5eaf3c7b  botocore-1.43.112.tar.gz
+md5  4112886301a08b3b3370b80684b4beae  botocore-1.43.113.tar.gz
+sha256  941d3f0e289540da7c49d5e2dc022f992e3638127a02a74a0c91df2661bd98ef  botocore-1.43.113.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 376c400332..4b0bf4f0d9 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.43.112
+PYTHON_BOTOCORE_VERSION = 1.43.113
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/0e/49/58187bfb510831e4cdafd7ced8e2a748097da81e8b9799d93f8d6ebf9f61
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/c5/43/e4b25ea3f83142dc13dda0313d5d818e20173c2c710d658dd206f67763e8
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD9DCA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2562760ED7;
	Sat,  3 Oct 2026 21:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMOWw2Zp9iTV; Sat,  3 Oct 2026 21:09:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 413B960E8E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061770;
	b=UtgFwJW/KkgAS05KcwHmBjdf5LJ2JfKFVti33d+VNaHTPmLR5dPbaqAM1BsLMhBX2v3x
	 ZylN9wWdmH7nLESq8jfi+iPLmeTMOAQAyhSzcb9FG3As6nVfvO26H8OGVBKVbpv1zUpDD
	 CWdNM1ksQWEWZa1NhoZNeSwqLD0Rft1RnwJB6GvlNfNI+Byb3i0hu8bSZMs/da0rAJjCU
	 gFimcUYhJ5B0LecpFnqvg0K1XHzwVSlRSp8Uwa4LLPEDnMqT6kkQjKlN3/JEcO1ZQiwMj
	 KWwEKs3cLcnMdjLk4hu8O7UzUNPzzcmBhtOPR6EajY7tvWNXQMa2QKdCQMAItf31glg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061770;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rvNo87vOy5DpXeAv5fihodJ+TblNa8w/TxcbMmDtDWk=;
	b=Zgkt8H9VaNi283ZhmVFLy33Oxra4i121NXQYfJqpa9gKzYQv41z1GKYFGgo1wA8NMTRs
	 PFLqdCI3Eg725ZvScd03c0m8icTnbJtHLKyeeCdblDHlfJm9oRC5o1tKsTagsE1ilXuJY
	 3IPu1z3nnIbI+eqVGnK3GZNF03kZKCm84P3uKQrz1O0akfLSlrSzGgrnndqSDVsY38E5z
	 VOHdPJaNXdjxSs8VgUkr126fE/RclHGMN2VT/CwnNGp9zCg3EVJO5wuwcSS+I0u56CJRk
	 obJBuADzaM6tdnzNmG5b7uxD9G749Qc/2KMQy/PUUjA4EJVPuXYIXndCXcqare2pC/Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061770;
	bh=rvNo87vOy5DpXeAv5fihodJ+TblNa8w/TxcbMmDtDWk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=q5dV8H9/XEZg4TTyRxlxTBT2WGFcVwwtuowpEo9NtJgu7xEP8wfDMufh6uTajgbEk
	 O/UGfFPcFsDqxEc+GFJZcYLbs/T71Kuz1wyNnhFIGYVydwjOK33E83YG+Xh3mNghVG
	 XVBbdh7fheQF36CBx1ELoZ+nMmOFRFNNbNZ4tcAzHNFgD0dfFo4USavTx189OS6m7l
	 ZvkR1b8QKlU1I6uUhY7CwJoftlQ/slFNP+SCtFANl8FVaNEe2DrMI7LwgJRZ+OXvdk
	 P8mudLuIiaUn3+unrazx7uQh3n6noLORxtRtzW2fFt5ANVtAviaHIlVjYM6IniYTFb
	 7983gfCzWFBLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 413B960E8E;
	Sat,  3 Oct 2026 21:09:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EFDF1A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9003881514
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-Hwwf9DfXbn for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:09:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AD76E81509
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061761;
 b=LoSyyy65VbR7qI6mc5cl9l32jQKgZ18EyVps4kchtHkph1YCyUW1awcEVZ1S/8EsopaV
 Sajo3vF8oUz89HI2BkJ84zhCJnc5SR2WzfFnWN2dE7gHz8cxTifSA4wRGV3+p/uZkuTpC
 XlCSsqLrbzdP3mlNQG4rnGnYXky8k7zPaKcI+pojAQPJ0A7ynrLekYKDDZpcLYQ3pjbnZ
 XAjfv7N8m8SSiqPIYyPRrOkkVTEPKyyi6tbk1KSgC1qfSTb48pq+OqMdZKKexavqATuD+
 Yod6A0SLUdAGT5r3i6n50JUze8Mqk/ZHHTMiNlm9SzY/QNKMvT00JfmOPTmneSfyukQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061761;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=NXCb66czj3KvxaKlx2+6rtb8VTvjJbgsPKkrI1h6WPI=;
 b=omX8AS18cvjmyyDSssC7kxf27kyWm05bwXuiuz7T1FAfgswzoFrqVtr3a5KGvpK50eBX
 qtEbNaCk4+xp6uMkaWfcjQJAZXuUL+9QnsUFECuTrAWzvx8kW4gIOQ7/yVuLwdv5JTFgE
 jZBMQehKGXy2ZERvmYfq6UlfcqDV9f9uDHn+W/xE+Oi2ryflhaDy27OekbBCGVEmI/fSY
 EIKv5DZj0pNsknLuYgINkxu7l1RfbOooge+p5ZX6d0kAw92VLAUD+5LPrQXfIjucfjqz7
 n250QUpbbrLQPkPqQB5PwP0ubJTAUtee4H79Se9LrHBvTVjx2FFmqyGXl96cmgCwX+A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=k2diqMf0; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=k2diqMf0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD76E81509
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:21 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-82395ae2ea8so812594a34.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061760; x=1791666560; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NXCb66czj3KvxaKlx2+6rtb8VTvjJbgsPKkrI1h6WPI=;
 b=k2diqMf06ExyQ7AmufCf4pH6PQ3/ouTD2VIv7Qr5lPc+FEYVblhjaUrQqejZ5RTF96
 ed7xRW3uga27eAutYJqD85qDqJ8e47ElJfiYHH9iJtX2AdJ7ykl/okS26ahpxE4UXa1/
 c3bPw28DyRXMVRoOCA9PSqY4cFkWAm5h51nxnZ98/bPl0oeTHgfc4ezneSHA7E/gyvQ0
 0P3DZuaj/HLxpwTtaW5kr/wbp11ToU9jzd457SE/gZZuD9v3MI3jGBeJLfg+IPzAe4wi
 c4ufR9YbgDn4CToGoEeLDKbIp6d6EXYjvSGb8XJmg5/+Mm3DF4uCUTW9Nt44kuplQhdk
 4CYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061760; x=1791666560;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NXCb66czj3KvxaKlx2+6rtb8VTvjJbgsPKkrI1h6WPI=;
 b=IgL/U/lEHVubMvfvQ5yj+RkeYydwEYNP0kBBvU4LAerUydju63ULN7+D0LKXHqAm/l
 pMXcby7yT4GQo9wJc+hl06nngRpyXfwECNGzgFpe9OcVTlTa9fP+NkHRPSx4eQbFv7yO
 /7hW6Iwux+y7OUvmt/9DwAo+jCfcakCZKuGo43IDVM5EGysjFaTvoAMMw0wX1+Ww4wBf
 GIpabPAMhHM5JReh4DC7XMP5tQ9GIMeRKromVX6EjeFJ+DSKyw9nNEuaIrSZTNaKxhri
 nwQ1KkwqOsILMEOp5NYbLWUTxAA1PtxH4KjJElDFMUUXdb1dZGIL8anAZ0D2EX8phyUH
 SnZQ==
X-Gm-Message-State: AFuF++kuEmJJQsPMQcimbAXwcEMKBhz+2k7PAozKEkuCpa/bho63Fo+H
 2DyYS5AXS/bP31WNb4x+Arjw5s6IN2ecSLyqzTmH2Tu3Z+S4eeISr4+G35CKBA==
X-Gm-Gg: AYBFou0CuNtpuoRmWtHcUIxbOutK5cADo4u3tovP0vwXjcy2HUZV4Cvz5U8uRdw6z6h
 RqC2AqEd+7u9Eo/q1T5YtrC+9AdkCLu369Jqva6oFSLz+LqQ24tSlQ/zxXgw0/RahjXOdxhqUzl
 KXnODnhvASv0sZD7ET47gPDcCv1DnrMguPh95QY9oGbJZNoIoEz76dDPCNM//hw4iPlDczfz6XJ
 Z9IKxqCN5TdiUSLSIf23ljKwf3qWWMJJC4wGvrGYULzR0fQMt0QIkAo4vGncsp18LEGgnmSaJ6W
 sT487AFRFqOKmNyqfxvTx0GE2HXAWsajAXORg0Xe8/3o6VxKSiLvhdctJDcS41T9VpZ8GwAKoBU
 QQbpdZxPtHloscXoIqs5o9qV6CqACvpAtJ45T8R8DVrC2bhEomJ1zsjZ15+ci2N5xXX06CKgKRL
 o5QCuHdG83WgZflh31J5WRZGW1kOhfpTFEXZ9d969dXB+DfpFH/oc7OV0gTDRsaK1AB9TcF18sn
 mpNtEHbfu1gkYhw+PEEGtgk+l4yZfukSuFZ9AnHnIkNNWxs2+5d2lqvYgWRhwWmosgeFbyzPrEH
 zjha2d5SWjyaT+eGNiC1SSoWQNX3xSaESsLYqcGhf9XG9n0vy9wdkkMA5+Shp2DjL1I99y6qhtf
 aJvezW0B2mHy3j6w+X7wXWe5CaKqEBDe96vV53gmbSA==
X-Received: by 2002:a05:6830:378c:b0:7df:5fc:3fd5 with SMTP id
 46e09a7af769-823fa08d0cfmr3330250a34.1.1791061760574; 
 Sat, 03 Oct 2026 14:09:20 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:09:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:08:13 -0600
Message-ID: <20261003210833.735937-23-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-zeroconf: bump to version
 0.151.5
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

Update license hash due to restored historical copyright notices:
https://github.com/python-zeroconf/python-zeroconf/commit/cb189247ad5c1b0bb1f4d8c562365b6b22c2e85a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-zeroconf/python-zeroconf.hash | 6 +++---
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index 3e9a2c06ec..9f7d232430 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  adda1c72099e20b2968ff7f22d9f6f36  zeroconf-0.148.0.tar.gz
-sha256  03fcca123df3652e23d945112d683d2f605f313637611b7d4adf31056f681702  zeroconf-0.148.0.tar.gz
+md5  0dadd9b0d4d47b072ee3a7e43e3a0a6a  zeroconf-0.151.5.tar.gz
+sha256  28c2ec9d772007eedf11b41a9c9fd3d5c684c17b00721ff8f1ee31b20ad286a1  zeroconf-0.151.5.tar.gz
 # Locally computed sha256 checksums
-sha256  4d1d974999ae8655ee47afb47ac3b327cd1baeea3509aecb35341ba1a1a53c94  COPYING
+sha256  73b9e1d4dc992630bbc22b4519f437020446bc8e913d0ad81a3292a79275a251  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index fe7676e2ee..ae666058d5 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.148.0
+PYTHON_ZEROCONF_VERSION = 0.151.5
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/67/46/10db987799629d01930176ae523f70879b63577060d63e05ebf9214aba4b
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/93/20/69744d9de9d375dae2639dda9add7dae85d52d690b68c61b23b8a6468434
 PYTHON_ZEROCONF_SETUP_TYPE = poetry
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

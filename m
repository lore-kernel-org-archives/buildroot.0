Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED0BCCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 18:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE1A58100F;
	Sun, 18 Oct 2026 18:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEYikPO6z8r2; Sun, 18 Oct 2026 18:25:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E881380F81
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792347932;
	b=LtDgrlw06j3sbPHFUsaUE22OqeRvliGZC81hLxXPIn/m0zdGUqnDc3LtzxcPsP1p2bmC
	 JZQBBO1vyFF+Gdbf9Oy4OFXPFd2Voqo1zMr+s6EN83+SDl7W9L4Sgd+7yCDmBUbfkBHC9
	 /yUlcWa3nYK/KNUL7jko15FemW+V4+WKtXQmh+BAZ6tpxSZt71TtTNmTOxOsvywJvdG1c
	 ov14UUWUiXVTYc+5M5Oc7PyYtvBMf0k+ZdpAfRQtn+k9po/hmfXXFZMzsCIJGiTXOok0e
	 xju0fhPihiy4xNOPxSGTMu0ZJunbRD9uYT6CDeHggkzeFg5A/eUR/f9EYmE8I2wOkUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792347932;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JO3LEEkB/euUFxF34g2ZXrYcKHkGmm+EHb6xvwplq6U=;
	b=lHV5E+AMofDujCmsMDsJAlhg7Ccb0/30HsSsIEwx99mdNzO9KHcEa9KRrE+rEGLDcz8B
	 /Bkz9htDI1Mp7wSivGlPojnn40unULutx7FHZuyUV03p9xNwT9aLbQ+OtBZjTsMFZlwBc
	 tldRsscfn60oZ03lR8UMAuacRHt+YfTWA5yX9BmdQOYkIL4D8fjpmKUGW+WA3BLS11VRX
	 QowBIyXK4ZGtegvR4kJf+qcrr26AVZ57WNzbbCqYfpOOUhJIV2vy/Ey1FOGknIXX28U3z
	 OtBqPKEQpLkNo3+ev8FR8mX802PppVp1+DZk8C83eNBZbPdO0skQuJ7YgkHnHE8PEIw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792347932;
	bh=JO3LEEkB/euUFxF34g2ZXrYcKHkGmm+EHb6xvwplq6U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=OvTwj3YRsfbDaygJwcVusClwLeKxft5DXjINVPbePWKfigY046eRp3WAakLZI4HM7
	 n4QtOjN5p56kXWY9UP7k4C/+79C1q1KFRfkvTTEZSrsT4CVFmaLnuRqeHGoXaa3wG8
	 C0H0tgFfBeF1cUwJsWsnP0BIPeSqEuqF0qAAYMfu8v8iqIQwo3YfrD+PE6MwdeeFVw
	 2MNo/Ft3y3CbjpZe6hXwKMCbK4xi7LCDkfgeJO91mXkMObNb6/44iFxrn/3fZmF0Yr
	 3xkKZCyHHW9XUtDPU7ACjm6Fdd8rD6AwgYY4w1G0kE2pn0tMsai7XM7D9XVvbmKS+/
	 CB4FOidwcc8AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E881380F81;
	Sun, 18 Oct 2026 18:25:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 214A661
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13817400AF
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9h7OOTJqoLn4 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 18:25:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 305CB4008E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792347928;
 b=sOgJdOOE9ZF0Oz+1MIikuwI5MSBi2d/4INfEII9cxJd5bkw4ipmxhfgsyNiIeUimjdNu
 sfeR8p3tDD7Xluwnm+aKRt+F2OYDNg2/rrNMTXRpr/H2a1a0zkccAIbqHhQp0OZItDsI3
 224NYWb0hj7M24PLH8QmgMrWnnHiF2YkSaGJIfoxZ+uxbrweMlJCX30guDHTexgozZe/4
 AIuR0TmMJNlEms/rE/oSjOtOAgjWngh/2kU4zp51IqTPQ+lamW6IGFc1ssyI+ggbBUJet
 IrPPXXdc1w3qTRCadvMsiqtVokrYf5LEL9e7dz6ThJgq+z6JGXB4MRnZ2Z0ZNpK5Big==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792347928;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=GQks48mK4KveKybB9LZ7nx84wMsV/zpiCX9OUKXuIDg=;
 b=hGTKbWgL4N4vn8JEzyL/0dXADTdXHn/192uITiNoDWzATCem0Bn3R7i9MmGToKbt6giY
 nIqqawtnKgM0k1sADExn68jcIGDOC3c8WcPQHbuKqk1MGSYL66hNTWyQwTnytjJ4EwcDA
 Ah85JMoarKDa0YVk0kNsPrcow7nX+w5Lg7pkQphbyXoX1V7i65JjYhCNe28euRGEXtevd
 nk9FHEZxaZC4cWNCOCBP2xjNSoSJ1D4XwgtsFjZA7a7zuU+AWsDSAR6UV76c55Z2YRxa6
 zRuaY/RWXjc8ydCVbYJYhjNSGOr4NQaRrQX7uWV/MkMNamvkp+6sg4mySu2IiM9k5FA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GFYXpJTi; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GFYXpJTi
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 305CB4008E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:27 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-6d7e06dbcccso950228eaf.3
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792347927; x=1792952727; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GQks48mK4KveKybB9LZ7nx84wMsV/zpiCX9OUKXuIDg=;
 b=GFYXpJTijV0tQ6eap5z0gI2NTfc9RLXYZMvzP5XlZH3f7BhhL0VH120JCvzQ21DPLm
 bhouYfwGCdVt3s/R/VGRfLUAAsV/eq/ncpZYwedeI+EwQG7yAoSFyIwd52kkXWQAPINX
 hs367bIAfr0ZDrs0BeF+fjght6cTfv/lMGw/qg1CBjdUj6AlkJuLoSwzgkUwCG4/Khdc
 a6K6oRNi1zcpQKkMZhM6COcp74fkogVcvKPmtj2RmQmkHDQ1kMf0rkubviA0tJ9VfoHr
 H4G7Q59Knqp3u/uEIMgg5b7T65Fxg0qLohDzDusOSI0BnJFh+2d/n7daXaCUQ2RFLVHp
 EwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792347927; x=1792952727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GQks48mK4KveKybB9LZ7nx84wMsV/zpiCX9OUKXuIDg=;
 b=VP2X8OsUae4j9zqLUQAvo0lJUz//QG9WpdJI0A+R8/QaEepbLJjkZH29ZiMzF0Cmmq
 wcEqZlibtrUOWqZbrsokWN6nPu9fQgU8Scy1xokzDt2XMcNxczCQua1+cn0RW0uqC2Uw
 Xv0sW5HySGN0mq6RwjHa6D+IY5iXt9j7lkGJZDXRS7nz1ekGPbKqdqYfteClVjxK98Hk
 qm/NefdQhy+5sY8PhJqVSuewwbbnk8tTWkkqmai0wE7HkINzp3CsyUqfHKWtCjge0Q4T
 J2qPh6I7rJ/iugXCtHuT1Wj4LO7m+w+trHIzvhpTReclg0Vt5fvCfg9pCOJ7H02wZ4NQ
 E3UQ==
X-Gm-Message-State: AFq9FYKp6c0voZ3nJMtxRUuhCtvIaiPvKTajk57A2QtjNL8ACa4oTNnG
 MPj1I8ULBW+D/GRjsmJpCvC6b+g4dYGdNTTfSkvE/A9tmzIDiQI+7iMt2e9F/w==
X-Gm-Gg: AYBFou3+TrRLNOZChlMfnWPsEhSrs7zapGfZ6MPvuNGzl1OmGojFcSCMvvpC2TAmrBM
 UGGJzuvS9fVGtVbPclybyWfjWVHdH1IfhDDmvRa3YUtvYuW46NZB2ojFuqzL2Kg+wX93N+Ts6mZ
 1zwnYWFv1ir76QY1NEp1fSDH5ez29V9OCxk8HaAI27QygwPINwbqZ4YX9dQ696ujf2wko9XtNfo
 tWkghIbprn4fhfCP0UMklOQCzfntfojD7Y7nLQb/iqyf+AfsI/68pBRLo7teg+vwXaM1pYno3/8
 dpKy2t2ZqDq1D/UEYzrLIoq128hnCX6vXZ8iBiSbhs4Ll1oZ+rImk+UJRwkAxTzsG6ZjJkGFssX
 UVowaklsYH7HZkzlqZWHBm6N1ibfEX11Hv3s3iKXNsQOzKBjIp7WmqiieWlY1da+OOWg/LzTCNW
 9AXefrU8qagFsEnrY1oMv76WIvi6rygU2uJBV8SqHe0mdNjsJ16iHOnHrhwBiYCK9lMWg4/67i2
 8qx4iUh0qJQWe6iTP2KVacScAR0cW+YDJSi5GV21jDFAe5Jq7by7lf74t1KPxUwgO9JKUbF/AGu
 9yorYpSwnWzDDwZ7AnX7vWLLtR7tvtp5x+RWD3bO8wDCCfSTnunVFK4be5X8gFJ95t/BNYAUfdq
 YnelVcsse8L4c2I706AJIX2Qc7IOkTym9xGPkWeS8yihNPE3d1j2VewQ=
X-Received: by 2002:a05:6808:4f4e:b0:4e8:9edf:189a with SMTP id
 5614622812f47-53ccd3e9199mr5265355b6e.12.1792347926737; 
 Sun, 18 Oct 2026 11:25:26 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5388a5572b4sm5715659b6e.6.2026.10.18.11.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 11:25:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:24:50 -0600
Message-ID: <20261018182507.536698-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-platformdirs: bump to version
 4.13.4
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
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index b9051298de..4948b75cd2 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  5872f9a2772efb2608f4444b5339f833  platformdirs-4.13.0.tar.gz
-sha256  1aa0b0d3f224c1f07c295121e312a5a24a180d6ae5a8425ea1784b3e3863e9c0  platformdirs-4.13.0.tar.gz
+md5  528f5df1ebe17cd5fc2ba3ff1d11fb97  platformdirs-4.13.4.tar.gz
+sha256  dd96496961684a7f42041923f842ec7494e09f5e87aded99117e1109cd40570e  platformdirs-4.13.4.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index dba59abfdd..2e543d68f7 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.13.0
+PYTHON_PLATFORMDIRS_VERSION = 4.13.4
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/80/a8/66d45abadff219e36e2a824181b8f6a67e7ed4572934d6252c71c29d5731
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/b7/89/dfd269de936e76319cf27787d9eaaca513491f635d49b0fbe7cdb6d3bf6f
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

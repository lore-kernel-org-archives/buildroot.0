Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506F0CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B72F607B6;
	Tue, 13 Oct 2026 17:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTIuXm0-xQUd; Tue, 13 Oct 2026 17:51:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 16BD1607BE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913918;
	b=ETqUrQ5M7f5DEnpVEUdf80g+ZnpRNW1xbrc2n9IfJvAvvkkEE3n+0WVrhD/ZNT7bWrD7
	 po3AbXRYfLQnUCFpFpyTlKoKuHVOjVkTn0TfLJ3zGdBpvqQhQ0rayddoaglxTBlkbEYaw
	 4fv5zjf8BI3ONWQ4mVju6KrHvIxHgnzl15VkdViINCJpXpo/VKX13sNSMilclQAt+6UWG
	 Zv1aM0urTW4TXSHUwp0dU3HOhDLnMnzsKS5rrZqKsnggWtaEhMSXa3+nYy6xvqT1NXFBW
	 jIZ+a+hVT5XiOKdaSutWhuXeHOv+tHLv/2A3BiNALgmo34/114tCdLA7XIt+hA5CUpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913918;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=G4rW/bPmkS/erDiqOlCG4YDQZ/80Ud58TjVsuN4MsqI=;
	b=cputzxf10v8l5DJb3j8GFCcFrJGRc346EBpHW9JrPpiWKyOGwrODNNarXodUYxnMKBkV
	 S6nOg77wweR2/tvT344MQKsPXZf41f1bWHsf5hz2YOVVCUfqZ2cvwK0/1a5RN8XBPnVLm
	 SXhk8DJQvqmDPSODyCPicjFa7uqV5vkw7QszGoVJRARK9QibrYFC2qFRoX6yQdqYufJpi
	 hAgptHVsEMr75grW8eCydg9dyyEl5bEJkzBYCxQh6h1yaVF7ovOTv2FRSoSo2gSwLLdnm
	 w39fsreHjBIRAm0NjiCfBXvcxAt3xPEe/4lRHheJsC3595GEbGMMBHOVgyaSmZflXAQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GAyFvHEy;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913918;
	bh=G4rW/bPmkS/erDiqOlCG4YDQZ/80Ud58TjVsuN4MsqI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mEMk4yHekD6Ngh7XjCkjRNbC102HralitLLCLL5kfw5j940J7IRdRkzMGOqCvAMeu
	 5QC1NR+yvc5pKmxpTs9PrixrRuKWt1x0kvo/DfuLMNi3tcPkp4B6sNq1fg8/vIldWE
	 kABipwkveXw8FaWFqgzjmYofatX0K4WSdntxuBAwdTOvZmQf/4cuGxZaqXxCdurbab
	 ByUBkv8u0lC7QkQ+yIkJ881b9VhplxbrkU9n4L07xmQzKnsy5s0fTDKdTU1MFpUVy2
	 HUN4OpuuZeudS0dOyO360AjBgfh5QJaA5JVL9VA2JxmMA8sQyDVoUlQWBYdgpVHNDo
	 uWftTMIFmvdkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16BD1607BE;
	Tue, 13 Oct 2026 17:51:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41F202AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E42A607DA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWssCzXxxCcW for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:51:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D546C607CD
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913911;
 b=EPgICqnedxLYbo5pU19DTlrnxspeilhL5rmYSWHGuuvmssaxxj8ISdEgRoeI/M7GzW8R
 U/942kFVDgbFdrIGfl/j3Z3ciGbW1DV5fjbYari+4ajlOhBqgVrLp363RTojupAjhb5Fb
 tHHT29WgZ7aTj33bOm44n+tJZM/xFsPm01MHpratl7vkQv+6ZDzO6yjTcgyLDgYK7Un8S
 L+vap7FbWplEceCx+yo3ryy47HpJOFSZyI/XDhANuhiIipwhyceh/OoPPdOg6k7/MNHUf
 ie9K2+7ljfUoXEkbfhbf3D/V4WTZyj50f7EvaPBgFGQ5whRNeonMCiEHDuM+0hKrsXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913911;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Z0wl/r8mouhPsSHSTlZSmp5fECpqUT6KiBsn6ohaVco=;
 b=tGmPS5STiQIyF07pplhUwLs+u4YmA8/UwlRWhy+TpLZZfk+zKVJ18QY3xp/qTUfORpDZ
 t8SP+tpArXxD6myJu81J1YpG1B/87+FXBYjNijCo98m/BYS+Kgj4UdP11ddDCNdcSKnaP
 UoUrjQ6C/dJCxUDNKzB5koq72EJHZbzULGbzXfRZ4VkW1x1dn4DJ7zG2hF15pZpDWzxzv
 RsN/K2ZKjtWX8KSRub4ihn/lWvklZpf+kLCytfndAmJp/KMmmTtiCHdxU/X7dEKaF24Vb
 7y3esO0suDFlfIdlgbqNKvA5X0GyFPEE4w8NdzvlO2FrDPL6QHFAKcU5kb2my4H6GfA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GAyFvHEy; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GAyFvHEy
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D546C607CD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:50 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-504db7f7870so2330165b6e.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 10:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791913909; x=1792518709; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Z0wl/r8mouhPsSHSTlZSmp5fECpqUT6KiBsn6ohaVco=;
 b=GAyFvHEyoIvNunZyWM5KgTBp8ou79GIAGm9wl4IyH8i6cch94KkEP0AbRJ3UoWRsFz
 G5WxAWU7qyGTxGONOz1O+jHb0XkKGKbgKv0WbfS8PI9U1ugk6Fh3lUWRc1LJGz/Bk5tH
 9f+VBEqL9gTW1R2/qClfZKzSYIUzz4fN1eoeV1YKt4CqI4L9wwA16rWae6BqujCNC3AR
 B5b0JL2ohZ0A4BMxFmAww13cyJ/YAPEEEktLRmdoh7UvCJ+IRhFTvUimu0qirRAqKDNw
 Ayz6pQH1y8/kL1KwXA01GEhJ25HpqMvPdoR/n3mh/Ei89WHHK3MPw0NdHOrSk/N5j/Vo
 sC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791913909; x=1792518709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Z0wl/r8mouhPsSHSTlZSmp5fECpqUT6KiBsn6ohaVco=;
 b=mJUUpGhnfHKtzKkTd93g8QqQqSWW+LFi+yPjjwg8kdT9E6mJ0Z24DPB9/ey7mlmd3/
 frnHb4rIKaJDNFKKr5Df9yGQQ+1HQtCfC2BGdxvJEKW7A8w2Jih5mpCPtewJuCJMsX8Z
 fBpNY1HA5I7Ro9uuMkMjxcZrBUwjvREtlD7aYcalcspXXWp5aoLIZ2sn61KlqdKdWVTa
 IRsTbZzJxq0mkmdP7ztk978hzKtcQuwwEf8ZoBQZ89ng22V08+NcRZ9mGXWn8TKgo2k0
 ciKaAL01B/Dpm+U2cn6YMY2xRysqDKuDf0zEKVaOfWdXAFK+Em86HWVDz9TxnQCp75AZ
 HNvA==
X-Gm-Message-State: AFq9FYIoENXtJSiP4YFXlXbZDmHqE1qfcJ0ncCZPkyDP0MMOmjilV7f9
 y9QLo+GpprmwXO5DgVvpfIvp37qXu12ghrSr07OdLze/gxs2l8scByBdUZvsLC1X
X-Gm-Gg: AYBFou3+bkx1CVTIx9od9DVqP81/z2e6Y0TU8OQuHmf2kyhIyzLeLNPR7M2mNwVEy4P
 17CkXECKZ13bZjXJtkkU0MOBU6YXMkADSvQNoL4oDS0Zk99mdBXZaWk52WkA2sFdW5gIiUtJXqW
 t5rVUT8T0E5vnJimJ3x0dbbLw9PFvw/i45v3LWdPA7nK6N+0v5RziSnYeZC4QGIdVn3IgSs7LWy
 D8+TRiYbz3zWBo/eeHxDm6Cd59iIKvSPBz1d7SdgZzq4NQYutvDZk02ba4/7s1flCzXH+JSrpsg
 oFWQsdme/Duk9qy51+LYs3RWvj6x/p5PxVr/kONEGkeadNm9XrSj32SbAbDSNecrDsZ5RNrdssC
 lOrurlpxQDW6KbxLFvmQ18i3Gswfokia6BadJNZQgJ4EXU1G32iUhXt+/EbIVsrIKuc9gdCNkgI
 4YgMWFStVAhNq5CakSeNkCkPtbdv7SLDbwIUzLo0niJgAppbKzy+FAo990mYdlu2Ky5Y8887vw9
 vKvYK5UD6gwtlS1KC5OQwT5fliTdXvtObJZZiMw1AVhcjfSEFboiERQtl84N0b3CA7dE8t31TCO
 1px1APPCH7imDUqbVoYicZYtDqY3fyni4UyEQpmWgiFjb/rWSq4FCtz/Eo1ttmwOJQu+DbZXY6C
 E81YKorxZUijYbcVs6Rvq3dF+oOdYnspXd2cqcQZaTd8=
X-Received: by 2002:a05:6809:1d9:20b0:4b9:a829:f015 with SMTP id
 5614622812f47-52bb6f85182mr222483b6e.33.1791913909373; 
 Tue, 13 Oct 2026 10:51:49 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-50c1c120686sm15424624b6e.16.2026.10.13.10.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 10:51:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:51:20 -0600
Message-ID: <20261013175130.1822395-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-truststore: bump to version
 0.10.5
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
 package/python-truststore/python-truststore.hash | 4 ++--
 package/python-truststore/python-truststore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-truststore/python-truststore.hash b/package/python-truststore/python-truststore.hash
index 6c18984eeb..02fbb00b0b 100644
--- a/package/python-truststore/python-truststore.hash
+++ b/package/python-truststore/python-truststore.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/truststore/json
-md5  d66211e2bd37f6852bd6009728170313  truststore-0.10.4.tar.gz
-sha256  9d91bd436463ad5e4ee4aba766628dd6cd7010cf3e2461756b3303710eebc301  truststore-0.10.4.tar.gz
+md5  022fe1e2fa8e41e8f336466ba395af86  truststore-0.10.5.tar.gz
+sha256  30d36967ccaded5cbb38d602c433f53600036c79d502f4533a49b60a03bbefcd  truststore-0.10.5.tar.gz
 # Locally computed sha256 checksums
 sha256  33be7b7e8fa4fd19b1760e1a8ed8a668bdab852c91b692dd41424bcb725a9fca  LICENSE
diff --git a/package/python-truststore/python-truststore.mk b/package/python-truststore/python-truststore.mk
index 5ac2a6b563..5267880814 100644
--- a/package/python-truststore/python-truststore.mk
+++ b/package/python-truststore/python-truststore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRUSTSTORE_VERSION = 0.10.4
+PYTHON_TRUSTSTORE_VERSION = 0.10.5
 PYTHON_TRUSTSTORE_SOURCE = truststore-$(PYTHON_TRUSTSTORE_VERSION).tar.gz
-PYTHON_TRUSTSTORE_SITE = https://files.pythonhosted.org/packages/53/a3/1585216310e344e8102c22482f6060c7a6ea0322b63e026372e6dcefcfd6
+PYTHON_TRUSTSTORE_SITE = https://files.pythonhosted.org/packages/ee/9f/c5201d42a484c061e528825fc8e2d565f5abd50a4ced6fb7d29c4ec99b2b
 PYTHON_TRUSTSTORE_SETUP_TYPE = flit
 PYTHON_TRUSTSTORE_LICENSE = MIT
 PYTHON_TRUSTSTORE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

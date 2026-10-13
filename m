Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB63CC6B10
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 14:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E97C606F4;
	Tue, 13 Oct 2026 14:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwdqhHpgm_8e; Tue, 13 Oct 2026 14:04:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9E38D605E8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791900276;
	b=mktgsX2a432MF7dKJgUPoG+3dJA9bpJg2sHzIpuw7cvg7hyNtDqz4O4CHwpAPW9iYX9s
	 x7/OxjTRy3ppOVfwO3CGeCb8gmKam6IqQ9l6JJwcfZTB6ekHHZBhqRXDxGJmF1kaaloLL
	 7GiDfpPif7mfhhv7pUBFUAwTTh+hciXhcbWWIp/VONJ3hFKycKol3nG2yV20hLNAfMObi
	 yU8Wo8K7Iwk8PlV3bBYuYyYQx7G3BZmI8+zcEF0S6PfbPMx6eVP7/tm69zajcUHiNsV6T
	 /Vt0Wm1fa46fJMQ2JQz090tIwOmwcktRS6Mp8zCbE2UJ+9UJNRI9k7E0ut3zURGuxwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791900276;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=pR5ny0GwYO+m8Q7OeVans07++/tZQG7/DDls+U7pPj0=;
	b=E8VkhWMyH3gpa9fxW2cYbPwW8CtowjIDovW4SnrGXicVaa7bc5W30JwjtYqi6Sk9iUYU
	 1r+cZhLknRvSdpHKTBQRlmkb/FS18J1HLw1Gl6I4u0ML8PyIaT6ZiftLihcMFOG7spX7r
	 JWWprlDO5bposEutRrZqN6NA91SXesf3h0h2+rOz79dZuJ3J4wV0FyKPvuG4Xe+dONqY/
	 c/2Ad75s4DYAhWEOo7E6oYbBgd20iANoOK/Rs8+ZovpqGKtsOcI5GfxbukbpgFNUkqf7n
	 0sX9iB0kch0DnTxVda9Pu705mHAPGPtCMAJdVtILtwqV/XTGm/0AK+dnyUWpFmSTUrA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791900276;
	bh=pR5ny0GwYO+m8Q7OeVans07++/tZQG7/DDls+U7pPj0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BrnXghI9M7Gm/Xzh2mVpSVQYAuDbl9Whqe7RjpRJ8VidkvQb9lYLUOlP3G3XIJxYW
	 8oEgaMfqnraD5pO0idM/sofgMUNbtFsqJ/etaMW8dEjGPXDtta3tuwTgndsvRiDAdG
	 IQv0c/2Tey48WJnIe1yl+ir2YM3vxl+NfC3TmuWFI0pKPyzgy/Vls0KBRUjRGDkM7/
	 mMtrsjlT3+kJchvfVWniyLxEU/2uLGEmMZ0szkD6yixDN9pFsmEvLrW6PAhy68rnLj
	 ifOgrrItwNYAblOMLLj/xJ8nm1gCiXk6OQXA5IKttK0Sg/u1f9aLPb1IwcqmJKCfWC
	 tCTd+YmRUjmuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E38D605E8;
	Tue, 13 Oct 2026 14:04:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 881F0235
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79A11403CE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-Lgv6_Mgbv1 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 14:04:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3446C403AE
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::531"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791900274;
 b=T37/5XhvBLMr3/fCSdANsjLcd6fcmaBRJrB6+ZjYq03jl0ueBMFlYAvblySrtlYKijgF
 sQ0tsbLNFfupXxWmrVPWF8b3N/6UEQ3Uo9ZojBqcaeBfAmlNjJlcRfLn4qvZA7a/grj4H
 cPC+wi/8ZavSatdosymZBy0qeL0IqYV4t0h0UOmnyYMTWDcKdnXsaRjIMYzzSHxTMNdqU
 BSxYna4qcemRgV6GNOjl3vCva300FswbXTr91+s3gsAOh8nzrNUqAm90LrI95/jw/k3/h
 IZIhutfiSQsW64u+9B+fwQUGMUOfDhyqgQvUE/ajbBdRX3WpnZCkfgxxQXkBz7Dpv8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791900274;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=NpNaH5eN8O0Gln4KcB2iRdrz0nTAIMTynIspyJmUHc0=;
 b=iCC8NNeamiiBYL7nZ4Vf1ZsTifH1f3sU75Y9S9JwLb/+SbIP/Xiuc0HgrWtOWWDI8F/b
 /N7j5DWxved43WqmzrgdnSucaXq8CjNmcGx+ID8AZLOsoYi5Un+AljGzFhxJWetBvpfHa
 Z99OwWj1qbGuVB310xmTbOT+oPnsmJneP2ogpmfOPAjpgUaqU4B922VySC9vkZcnaCB6w
 BrNjw5mKSLrN6zoMIufzdhsD1o1ie6rCRsAqeUhEwp24GFM9R2gsS9r1T/f/z5CktXN/1
 g4wOtKsa71sfoxVruUDRRr/YiMq5pkbgu2v9ZEel8jilBk2lqQWmwF/jY+NAiiah1Hw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=dRmRDTu5; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::531"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=dRmRDTu5
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3446C403AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:04:33 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6a374bea882so4329300a12.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1791900271; x=1792505071; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NpNaH5eN8O0Gln4KcB2iRdrz0nTAIMTynIspyJmUHc0=;
 b=dRmRDTu5nvVfMe39EgxTpVvlXSzCn2taYLqmrwsasON0ofTi1i2ECeM8l8RoEje65A
 JIKPwp+PnK0NgiYg8CC+vDy1zPa13mMuuNBfm20e7cEcZTr0xL4OcAmx69V1Pq+I0rct
 UO2Da3IMIfPZo3JD2kHstnOvWLfx/qTDJSEYJLvbfqDoUbbriYe2KdL8kzZroyLD5mpV
 2/iaALyrioC/FcLI5x+kAw65iNLXFwY0YX+U2jqTQR+u3M/k159/c3Xqr2rPICXF/s/l
 Z4ju9eMj43+SmDyhFWexdhmeqO2/Qx9hNZgIPmWmS67B9LcOMBD4LRk087YI7ntO2c+D
 1GZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791900271; x=1792505071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NpNaH5eN8O0Gln4KcB2iRdrz0nTAIMTynIspyJmUHc0=;
 b=vho+B5Gw7IiypkAopxcTul0RPMN+f65dU4Xn3KZg8xNz3hldmXbWsjjJ3ickOX1W6e
 TdTZ1Q9yToncfCEQW3mQjV40Ztcc1FVS3A4vps5Rd19Px0kjV0KLSktm9o1BNCZLunyx
 JN+9em83mrovN4juczQscWZ7gtIkdZxxTYdA2IZO7Lhahckxt8NWNHIuYOen7+fLTU3T
 vQlPhNsFqZzPq/Gh9hRJtnC8ewsj1/EU3cCZWVqFcvIZgnKU5Aa6L8sgLcGDNS6xUE8p
 Mh2zLgMRt8iDWGIA/UiEdnT9/ezyfE3E45amL8k3/bzTqe0+cZXSbfROvfjWV1wn73ID
 Txnw==
X-Gm-Message-State: AFq9FYKqJj41MG53vlbbAe3gcSWuyM/+pRdrG6EadgSraiVP3+it+EgJ
 YJ/RynUDMqzLu59ZeKF9/qVIcOpjWySXvj+juQYMhKfF7wNqN0CYgs9sKIMNtw==
X-Gm-Gg: AYBFou0oshw9VpwFjq5nn0WDzSqIlW6IeeqTyJQNTl15NOM9pE3xAAWQXuODnT8yjlf
 VcICRfId2MKejGW1dNeSJQ2zJlp0hjxpK4El0Wt+2tbElJDpICmTY2BzJxFfmR/NwkXPxcIxukO
 EMOQAFGd0UdpsyaYHf4EgH7Hem351he0chaBCQxHfHoJ63DHDUY2H1WovFPmvYRJKAq0AzJvtnu
 ERquuFL+WrOR1XZav52333kqtZHLwkGZQGyZP+lpWSnMK4JIpmShLmLRqnPqrCywmcgn4NjYcuJ
 VzBdwFlLWmMuB1Xduf0susaJdFiYJDbmWjYPC1WdknU+WMMH2aQqyGW1A018yD3eQFwbx2ZIUMb
 lAKJZhjtDBPAf32SzmH9LlJYRdxKjQGND2jxIZb/DNczyXCNRSfjrwK/8wP4fpbzO5JUANac9tQ
 KOqrsQUq7ZTIIKH2iGmbroomC/7ID8/2h8auTmmVYz+3cFy6mQ04VqotLun7xa9izJWuKaRy83X
 PSmCrKMBhO8uk479/FaEqjJpoTUsZnIj8WtnuE/XKWLtrqn3rAk8g==
X-Received: by 2002:a05:6402:c522:20b0:6b1:ac0d:6f77 with SMTP id
 4fb4d7f45d1cf-6b1ac0d7117mr4389186a12.5.1791900271190; 
 Tue, 13 Oct 2026 07:04:31 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b179dd5979sm6646461a12.16.2026.10.13.07.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 07:04:29 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 16:04:23 +0200
Message-Id: <20261013140423.1941069-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013140423.1941069-1-yegorslists@googlemail.com>
References: <20261013140423.1941069-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-zlmdb: bump to version 26.7.1
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

Version 23.1.1 ships a vendored copy of flatbuffers as a top-level
"flatbuffers" package, which conflicts with python-flatbuffers that
python-zlmdb itself selects:

  FileExistsError: File already exists: .../target/usr/lib/python3.14/site-packages/flatbuffers/__init__.py

Starting with this release the flatbuffers runtime is vendored as
zlmdb.flatbuffers, and py-lmdb plus a patched LMDB are vendored as
zlmdb._lmdb_vendor, built as a CFFI extension. Thus drop the
python-flatbuffers and python-lmdb selects.

The build system switched to hatchling. The build hook needs host cffi
and setuptools to compile the LMDB extension and uses cmake to build
the bundled flatc compiler.

Update the license information to cover the bundled LMDB, py-lmdb and
flatbuffers code.

Fixes: https://autobuild.buildroot.org/results/e3b026cb48f41ec531e5bdae9e07b8e581f1a06b

Changelog: https://github.com/crossbario/zlmdb/blob/master/docs/changelog.rst

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 package/python-zlmdb/Config.in         |  2 --
 package/python-zlmdb/python-zlmdb.hash |  7 ++++---
 package/python-zlmdb/python-zlmdb.mk   | 15 ++++++++++-----
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/package/python-zlmdb/Config.in b/package/python-zlmdb/Config.in
index 1edf993ecd..f6b8caebcb 100644
--- a/package/python-zlmdb/Config.in
+++ b/package/python-zlmdb/Config.in
@@ -9,8 +9,6 @@ config BR2_PACKAGE_PYTHON_ZLMDB
 	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
-	select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime
-	select BR2_PACKAGE_PYTHON_LMDB # runtime
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
 	select BR2_PACKAGE_PYTHON_PYYAML # runtime
diff --git a/package/python-zlmdb/python-zlmdb.hash b/package/python-zlmdb/python-zlmdb.hash
index ed1b6db8c2..e29bbea280 100644
--- a/package/python-zlmdb/python-zlmdb.hash
+++ b/package/python-zlmdb/python-zlmdb.hash
@@ -1,5 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/zlmdb/json
-md5  4d96b46d1724b9d4cb6961874e5b4a9a  zlmdb-23.1.1.tar.gz
-sha256  ddcf680bf49352cabe35bfb5bfe3acbd5d6b8d481cafa508c423e0b18d654d05  zlmdb-23.1.1.tar.gz
+md5  186642d7df261a781631a734244f785e  zlmdb-26.7.1.tar.gz
+sha256  3cbc9447cfbf3b33dad0a30f7e671d467d72b41e5bc4e999b4f41914eff5fcb9  zlmdb-26.7.1.tar.gz
 # Locally computed sha256 checksums
-sha256  8a139bf325dcca11e0e476ce537bf791a6cfbeed8899a9b6ddc55238e180d230  LICENSE
+sha256  0ba0c0c595fd01ee19478ca417f210b75740f9b84ca937ebf783154e1cc01174  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  deps/flatbuffers/LICENSE
diff --git a/package/python-zlmdb/python-zlmdb.mk b/package/python-zlmdb/python-zlmdb.mk
index 70538ce63c..da625f9777 100644
--- a/package/python-zlmdb/python-zlmdb.mk
+++ b/package/python-zlmdb/python-zlmdb.mk
@@ -4,11 +4,16 @@
 #
 ################################################################################
 
-PYTHON_ZLMDB_VERSION = 23.1.1
+PYTHON_ZLMDB_VERSION = 26.7.1
 PYTHON_ZLMDB_SOURCE = zlmdb-$(PYTHON_ZLMDB_VERSION).tar.gz
-PYTHON_ZLMDB_SITE = https://files.pythonhosted.org/packages/56/b2/abaeb5419435a6224a0beb2b5edad621ec975fe4802297963ecf1728b883
-PYTHON_ZLMDB_SETUP_TYPE = setuptools
-PYTHON_ZLMDB_LICENSE = MIT
-PYTHON_ZLMDB_LICENSE_FILES = LICENSE
+PYTHON_ZLMDB_SITE = https://files.pythonhosted.org/packages/87/21/5b877e438d652f78bcf88aec83474b373f8ab1b98b6c0c5d47db3481d6b0
+PYTHON_ZLMDB_SETUP_TYPE = hatch
+PYTHON_ZLMDB_LICENSE = MIT, OLDAP-2.8 (bundled lmdb, py-lmdb), Apache-2.0 (bundled flatbuffers)
+PYTHON_ZLMDB_LICENSE_FILES = LICENSE deps/flatbuffers/LICENSE
+# cmake is used to build the bundled flatc compiler
+PYTHON_ZLMDB_DEPENDENCIES = \
+	$(BR2_CMAKE_HOST_DEPENDENCY) \
+	host-python-cffi \
+	host-python-setuptools
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B5FCD98F3
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 17:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E30C606C9;
	Wed, 17 Jun 2026 17:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqBJ9aWJFp-e; Wed, 17 Jun 2026 17:42:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF99A606C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781718145;
	bh=TzXpn2ahL9OTdT0uYyI2U7P5Vipl9IZep8B+Oi4Vw20=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PgooU7XriqyhC+E8R/APdTiVVRMvVR1dD4MV6pzNLmX7xrlmTLaP2wl+G5Y9a2buF
	 5RrVPg6w3CXVhJFWw6Pbt3tyqCLs1BMFv8iKQFm56NTuipoffEfib7+6kOgTJrcFlf
	 nc+GuMCwnCl7vuKXCrqfeI32rd7HWfbne8CyUA9tgxw5ugYpzarT0XcfsmurnpSiri
	 uODU0MqKeFIHdMTgyxn/blQ4PhWU6SK5Bw/3kkg0h/DYR2cQSJpMnnrM9Ne3bU3jsZ
	 mJ24k7TrK4kQWvq3UZC77/OIaF+la1vF20oRwwfR6m4i/O9HLDbRERrnX4RxWZK9/A
	 IRv+Ztr/medLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF99A606C2;
	Wed, 17 Jun 2026 17:42:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C5E83A9
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E0D34011F
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Ay-yCPfCsvA for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 17:42:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3AB34400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AB34400FC
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AB34400FC
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:42:21 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7e6b5c374e5so31806a34.0
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 10:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781718140; x=1782322940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MX2S6twXG+mVRkoVb5E4Gx/WKIFSFo607lCx8hDUtUU=;
 b=TVIX2LX/gypkrLQQIPEA5a7Xm2Imst+emOYMiP0J1IrqL6i5n+1VMCP9QdaPP8NSSD
 oiH0hQzoXtsQJGU+TtyR22ZI66M0kIOq7vsw5dFDpnnKV7ewUCrYoeso+DTvSZ/UhdyU
 lOIEOTBapPRjcKAJzBPPz6n47CeTQuLizuo27QyY/Or60rRc0hzuDQ0b7jhsmCJDfyok
 hAy+tkk/NcDStT3nvM2+vvLnJDvGwRhGE/HQrChu3aZg3rtYi7Aq5sj1Bi3vcZD+sjeQ
 bugEGfIsSkIxc5Qf8Ict7bhk3okOLkJtpEwgwXnGyUonw4QLtG2YPvmT9W3bFTqXMqwr
 GdAw==
X-Gm-Message-State: AOJu0YybZl8Kcdh1pIFAw326R+HdGbzQ1+2gH51fusOb4+xknRkw/fBo
 8shc1kz9szReXcTCKov8b/VuF1OpJWGm4RhsWrWWAFvNnSDPqZ9AWCXDZFi9aMgG
X-Gm-Gg: Acq92OFVJSdcj61koWLTWYN+z4VKJ/jDCXaQIjBRLlycV5jd7UB+f1zR0fSDnvYmfgi
 RG4OGqcY7BzlfZMYjJU6Z/bmaffQe/59GPCz2mJ+wpHXrWlGTzbS2/UxlZ0e07oLRYxSx48g/M2
 edj8Ks7DIbKBbflqn06vGjYHXzCBhuN+/yN54wyqCXmblWHrxLuy7r2RBQ39KlGIndyK1089zzR
 rZVtQFaEMX8ePKsWp2jSmbJOHV70+mt4AAyOUPTts5dy+4lTauDa1v+QWptp/mPWzqD1Pl+lugF
 DtcbD4TFMEAaw/M86b3dMNIXYnTQ0A0z5WsrnamV2UXwaMZgCQ55E0rHRTRTZVP2oO7Cx9SybTa
 BuDzHkH5WUDVKmUwBX3mb64T3en3XWY2Iama+iMAnVZKVUf/vbENuIaDB7lGDejtvBvqXBkzwcc
 K8vLo745i54c93nmkbzRTJKkZc3VwWPfcOGuP72OqQ6GpXtjZjhy7kgktwn7/DIZiQZqGSjOjfu
 tLRP5Ez3v40RK32S2VLWwOrOPSOe4TkZUg9YRT54OHyMuWqgOzqpAmjWEwT9GdxSTAp0KtxVbRy
 SmlLLT2NGLwqS2Q=
X-Received: by 2002:a05:6830:6d24:b0:7d7:fd71:f2d4 with SMTP id
 46e09a7af769-7e91aaaeb61mr386929a34.3.1781718140076; 
 Wed, 17 Jun 2026 10:42:20 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-16-141.hlrn.qwest.net.
 [174.29.16.141]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e79f5bb5fcsm10323561a34.9.2026.06.17.10.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 10:42:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jun 2026 11:42:08 -0600
Message-ID: <20260617174208.3968183-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617174208.3968183-1-james.hilliard1@gmail.com>
References: <20260617174208.3968183-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781718140; x=1782322940; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MX2S6twXG+mVRkoVb5E4Gx/WKIFSFo607lCx8hDUtUU=;
 b=ToHIJX1HmCE/5uB8HeNSdqzbZkbCSNmi4vWmtRHFn6W+Q26BD85LytI1GEay0tKDKn
 YT8oJAberi+x8H2MgF49tQ0HG3cd3yBHFgdpStHN9xHQJG3VEcIdXnaoz7sM0qkUq4HM
 ZgzBuBU/vko6jETlijj3wwAijb2GO3s0BpWWnEV8Bv9YFMiRc1+QfRR2nAIegUX3lqA8
 FubQ59ihBvhANOrH6lI+eQxjz1KqPEPv+9yfSY2B3NQENgz5aEeV8682D771fq0h2Ll2
 lzgBn6Ry056wa/V/aXVDuY96ekwKyCyaumwjipItVF9EZnJ1bCWSD1V3CAhcFk9gZevc
 hEwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ToHIJX1H
Subject: [Buildroot] [PATCH v2 3/3] package/python-async-timeout: use
 hash-based PyPI site
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the blake2b-256 digest from the PyPI metadata and drop the explicit
PYTHON_ASYNC_TIMEOUT_SITE assignment.

The Python package infrastructure can now derive the hash-based
files.pythonhosted.org site from the package .hash file.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-async-timeout/python-async-timeout.hash | 3 ++-
 package/python-async-timeout/python-async-timeout.mk   | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-async-timeout/python-async-timeout.hash b/package/python-async-timeout/python-async-timeout.hash
index 451c07de5d..c812b9c6c3 100644
--- a/package/python-async-timeout/python-async-timeout.hash
+++ b/package/python-async-timeout/python-async-timeout.hash
@@ -1,5 +1,6 @@
-# md5, sha256 from https://pypi.org/pypi/async-timeout/json
+# md5, sha256, blake2b-256 from https://pypi.org/pypi/async-timeout/json
 md5  566a39011e87cb8044ee75369e69b327  async_timeout-5.0.1.tar.gz
 sha256  d9321a7a3d5a6a5e187e824d2fa0793ce379a202935782d555d6e9d2735677d3  async_timeout-5.0.1.tar.gz
+blake2b-256  a5ae136395dfbfe00dfc94da3f3e136d0b13f394cba8f4841120e34226265780  async_timeout-5.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  e18d7bb8f513e2c46bb585c94b585bd30720dd3ccb21ddb0786f72d16658f92c  LICENSE
diff --git a/package/python-async-timeout/python-async-timeout.mk b/package/python-async-timeout/python-async-timeout.mk
index 2835368003..017ea548b5 100644
--- a/package/python-async-timeout/python-async-timeout.mk
+++ b/package/python-async-timeout/python-async-timeout.mk
@@ -6,7 +6,6 @@
 
 PYTHON_ASYNC_TIMEOUT_VERSION = 5.0.1
 PYTHON_ASYNC_TIMEOUT_SOURCE = async_timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
-PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/a5/ae/136395dfbfe00dfc94da3f3e136d0b13f394cba8f4841120e34226265780
 PYTHON_ASYNC_TIMEOUT_LICENSE = Apache-2.0
 PYTHON_ASYNC_TIMEOUT_LICENSE_FILES = LICENSE
 PYTHON_ASYNC_TIMEOUT_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

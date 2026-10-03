Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E78CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 02:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A371860B2B;
	Sat,  3 Oct 2026 02:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jeNLVU3rQrEJ; Sat,  3 Oct 2026 02:31:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6876460659
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790994668;
	b=Mfi3ApLY+UybIz0/qfp+RVu70bWPaa9Mu1ii59fqIufyqQYjQZfLsr3VhMUfq8OA0bcR
	 Rhs517i0oy1++A+dAulAnxGcoLXQf68yvrA4rmOphQYkgwAlVCbI9k4JGV7AvmhniK74H
	 s+iAazDFR3wOeLuUbeEHue3RbOxMqsOUhquUzGm4oFeQICn9uiAsp5minhPfSnH2CXrUg
	 twth78wnQahsNFYD8LtWV2xbezbkM2XlCjjMV4AeOBD6PjQe+HVsfmP8LuzA5mUVbYvdw
	 GthYPdpdG7EZCixK2IdAUheZ6GIgaJGcF2rN8juwVOgPBM7jeOiVF87z/tWzryvSlYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790994668;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=uMjSZsYMAo4dX82hFGsdzSC1DpcKhjBlHN2r4aeVheo=;
	b=nbOJMywWC0Y9kt0WpGrkvGH+aNVSpYs0R8x8Lf8leN9Gu3L3PlXwqoCK+F8xp9gqn8Z7
	 2JZBiUT5ARUh8Gb92wEHyH3wmS/Luco+RDdlUkEqsZdDxMxsm+V2lOVRWKOmQf7ZEwBQM
	 IHvzDyNk50PQXfol7RwJA1leJ3YrLZg1kKFFOeCahNF6e7aTNMMm3QIFwhJt3+ccP/Q4b
	 +uhLDNWiO117Tv27KOzj7eiYsCujiNQrmJXPVdUxbz/pChzcnnya9+EqIiKiisU7BD110
	 IpLmea0NbB4IqZumeDfkDXJwi3Yxqkf0l6ksHhLQ7Yjzxc4QPnvPIzdl9944mTnq5Jw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mZrmaCBL;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790994668;
	bh=uMjSZsYMAo4dX82hFGsdzSC1DpcKhjBlHN2r4aeVheo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=b+EfowVurIyPAAv/rZ6noSFp3V0hmX7pebLBRDFRqXyAjHbq0GFfxdE2D7GjFB7Lc
	 2bQRy8mwujRJm4dCdr+0PAWRHfgX5THj5b/yYgiFCl8FbkMyFFAkliKV0Lh2NwhJTq
	 HIyfB7YJirbHSVRtPzBY5R3NurMWPalq0rU9mfk0lA7Dx+JwqBzyu0JIpDloOPMBZ4
	 O9jSMjKo7eFqu/zw/qY/5cdmI87152n4MZMePWd4Vk3YjgRuw4RRI0epbuZHPCSlCM
	 IQNeUf8B+OTRDx48N9YbcyqzRLQNkSLt29kKguTvHiI0EGj3TN5HoI4rr/h8dZhl9I
	 TSF6TDPkdL0OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6876460659;
	Sat,  3 Oct 2026 02:31:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3349432F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1917860648
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTKn234k91Je for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 02:31:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 33A0060643
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790994665;
 b=tS0JDKsXykJEA36bFmo8Gfm5JNkkQUms/f8IbdpXlhjCVqyCvhFaNhYIDOikLEkEK71b
 g/UWFoH6W88ePuNi/0SvglStNCOLfBVM3q2hZAosOLcJ6krPl/V5bCjLbV8AZ9bke5y6U
 dbUrmkfNWF9dU6BOzj34zIwH6nhtwJdad2WvvorsXrGymXRCWM0x1tcwPPeP2+D4xWCDM
 8vBdDGV4jegnmSY0z9zsktSNcE3tIRDHYd9qWhb27+A6pysFFZzAGbZbmhRAdiIJekZw3
 CQw+CXWHreSYJnBqRYoDuypX70OmV5vXqGl7mzmE6en5CY1GhDv13Fo6ozHBcN5RLQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790994665;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=PeEE+NiQFBCCwDtYprFdWujXyBe9hW+GAEzuYGKWMSg=;
 b=QJnpuAeqffA5NN2bxGdeSIHppX3uVyDJaXEWCXCDByhPl805H173Pf18Hg8z2S6S082o
 MxrmTpNfiih1iLgbtLcxbbghuZTndt4azAOlhj3eIaWFGiU+CHVtxIgtdNmxBMycY4fyx
 lAHM/bYxeJWCfjWo0rhjrDNQrzFTr9RNkVLlmwQXhLm4vDLB6GwZwCKA68aJF9YAEWtT2
 mC6RvtFtxX75gvieW3Y3jypR4XczsZSD7NyRgnMnpXNzDK6SzgdECMjrk3LiBNyOel1Jk
 oextbl97CO+xpEktgtbsmZPznFXOPB2+Sd5VOax9BtPkKD8ZeoUf7TB/yMZjcPLrIXQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mZrmaCBL; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mZrmaCBL
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33A0060643
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:31:04 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-822f7e70796so391209a34.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 19:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790994664; x=1791599464; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PeEE+NiQFBCCwDtYprFdWujXyBe9hW+GAEzuYGKWMSg=;
 b=mZrmaCBLYUXkTWtwsDSEV3a1gIdcO1aIjg/qS7haXm7TUpjMVRtE9XfYN+16seQH4o
 jATTFq0y9Hibxr9TS7771vD3qkIVriLeQGqG3JNe6py0kKNEj2XmM/jBwsBuFJWI9C8x
 Odhmb2UAMQ4DmjHP1UlkoaDAOcljNyLWRnoiv0HKOnyxtOWDWYPzkNgab+Nnqj9QELyO
 M6NqVwzu7RS8lyGLF+Lk8WPr9bkFPheit3AP+dRB6g3dvLBZkYwRIZVsF/32+rEGlSoH
 n/aFv+ktadDgbq8S/Ly6Uou6W4WefGxcvdp7vfrnGwZt0OZWqz9Up33zV9GaZdRonzzf
 CGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790994664; x=1791599464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PeEE+NiQFBCCwDtYprFdWujXyBe9hW+GAEzuYGKWMSg=;
 b=YHq57xpVPywx/WARVhx4qQiS/bj31mqb2YeGl/vRQp7HpvAjyHFN256fpWHjrLvjTC
 xwovn4X/pHO5H6avpFd3I546HOUbjxSHwN1Qi+mJPVuux+S6kyBJ9aYBvQRkFnFxsd1h
 EX/kB9PEg0qVQjCqdtTl2ThpQXWjg8YTz02ZPcsOwy4PESt4DP4xE9q8Rsc+jivrTHGy
 N1WxquKb5O0nJwGJnpA5AwV6cEwfvOW/elattEhEqUj5Zpdw9dtj7dwONhBVhI6hmaln
 X1DC6aYU+PFLupqSVQnamh+epFLtMNnP+4fEMlq5jg6HQ951FiT/6TlEQT88D0Jdek0m
 +HiA==
X-Gm-Message-State: AFuF++k/HAsFLwy90PkpeqWwTHlmTJWwMgWkeE564DP2myl8qT0Bc2l2
 PriMQ5T0c2r4L572FifW95Jz0OifKOKkCUMnVMjwgAuxLUIXkeMD3IMlTQCyqQ==
X-Gm-Gg: AYBFou2aOhGMYCIVTKuXkpw1yzxSqGSSA/PclVUVnI7a5q58y50gQd+igWkW3fTneG3
 dgNv3oVVNjBylYfZzYRxSjsL0RMqjujiocpbiMfErHEBb+C2NzvDfFsqIsFH0chDRWEDPqX4v2k
 tgkkW3ZTt+mu0bhkimqBfEXCa6X19r4N7rwOB0NjwsctlNjNN+oNW84M5Jd2I049SRFRY92OanY
 aC3tQNQDXYg0afmkMkeAB0ngIG5V0aO5j3aZVGU25A1E0Ns1iF8JJLI8H/vGFykY2UeLOWnZ+2+
 1kasiUxiT3KfubwXjvhLWUFom1fuEiZ/6fqeh+qOuW3L/SKUFrx3H2ZDymJ856Z7WD0410U0+Qp
 oo3zUbGukwIQQm0P5ojPhGstLCUMa1ucvtoRif2YFNh/5oYcQw40NX980N9Zdv9nE/JUPl+fBse
 gUh9wzQMbKwWBIjoeKRf4EX9K5e+zy3Nz07Ul3tQH9qeE5PJxcPi187m00l5P7VP8y9wEwXHte1
 ilOWH6hyv44mWCxWDfoSsSHG+z3o/8Hs6nHuIdYbV+kMqacVTiIeomZL5FKqJ6Jz9SItCO8+dsg
 mgH8K6j+r6LEVxfgdwRP/Ht2UbvbU6BNHOw0PHaURSo1gKr124DaebIi4T+ttcmdP4yk1HcVpYB
 K9KrQ/SZNRYVv8rcSCUODX+v6zQFUgOiCcJMXnXF/VZnI4DhIMC47
X-Received: by 2002:a9d:6167:0:b0:822:b35a:a2d3 with SMTP id
 46e09a7af769-822b35aa750mr3684462a34.9.1790994663736; 
 Fri, 02 Oct 2026 19:31:03 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82279395f6csm4913620a34.7.2026.10.02.19.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 19:31:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 20:30:57 -0600
Message-ID: <20261003023057.452151-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003023057.452151-1-james.hilliard1@gmail.com>
References: <20261003023057.452151-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/python-asyncssh: bump to version
 2.24.0
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
 package/python-asyncssh/python-asyncssh.hash | 4 ++--
 package/python-asyncssh/python-asyncssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asyncssh/python-asyncssh.hash b/package/python-asyncssh/python-asyncssh.hash
index 03427599d8..1708412546 100644
--- a/package/python-asyncssh/python-asyncssh.hash
+++ b/package/python-asyncssh/python-asyncssh.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/asyncssh/json
-md5  0b1bd9d856dfc1b283ae1cd07d2bbee1  asyncssh-2.22.0.tar.gz
-sha256  c3ce72b01be4f97b40e62844dd384227e5ff5a401a3793007c42f86a5c8eb537  asyncssh-2.22.0.tar.gz
+md5  2f0985863b9e59fea8b4a825ac6eb57d  asyncssh-2.24.0.tar.gz
+sha256  4064c590e59ce2e8d82a2f66d35f3120d765828b4df5e3dbfb07b4a8c24686c9  asyncssh-2.24.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  LICENSE
 sha256  68c286b0cf4507bec8922103efe861adb0bd3218003b1ec1b25e2e64bdd76bd3  COPYRIGHT
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index 5d4a056d32..04e095f595 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCSSH_VERSION = 2.22.0
+PYTHON_ASYNCSSH_VERSION = 2.24.0
 PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
-PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/fc/d5/957886c316466349d55c4de6a688a10a98295c0b4429deb8db1a17f3eb19
+PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/dd/7f/2d79247bacc562104f312d27efe541673aa177feac89de291bd61bca52be
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

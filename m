Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADE1C88E5C
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 12:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 702E580E42;
	Wed, 16 Sep 2026 12:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Suf4FVB4DVvM; Wed, 16 Sep 2026 12:46:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 95D9180E44
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789562795;
	b=FDsq77wHQtciwkwYIHxbd+5X/PAnZXwluQjrWKum+R46zI5bIEe141aJGEnonQpEleJU
	 ZoYlGElKMYBtQj+MsrkqMF3L38pjXuW/6dCNXu655oeo/JPrmDnLJOviLGh+Us7eNpyAj
	 iHKey0YpnbbdQOzqE9k3ccQLvSPsPJL3WalPQjerQaVIx5+lpX7SPAKlMp5RVxuT2OB6O
	 zyzZG7YHxLZBhv7GSaf9VuWQFSG6yDmLaja8iIHVqErTI3JmgHNIOFcZscSRvVogaZwNQ
	 WKWsRwCUcpoyPwy1CIydt7k25ZRwcwnMb1C2GjQVPX8dzPtOABs7X+vprXfGmwQMx3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789562795;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=W9KZ8/FOYSKlxgCbtcznOkPkZFH4yVYvCium6j2wmMI=;
	b=GVSZ1Rkn+kN8oYqX4UCRDT9b6vq4S0G35nhFCZ/JGy+EKNSA1mMl1srbIboZlsUj4u3z
	 Ak9LiBjsrY6HKkS1tVdLU4SXPprIK+QrkgDTHabQPxM1ibl5Ol9ecRDyp8DDgN0syhIVP
	 ITSWP1a+NhS0tx1+Bn21fxo4mf2LWo59+aOnR+gDpFvey3ITeCCHDdYf9m8sX+OP73LRI
	 YCQD+QQuUEDU+VtrF34pRRYQjcQ4MNCttTOZ2BGl+ky/uZVBsvhtVmOCd0kkggjMhRa9B
	 UKQVsHDHbFrHDS5DZmvl/E2dLAaIJBwabYtrQW4jtuX5Wr5rCRdwCveuoDruiUpftDA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789562795;
	bh=W9KZ8/FOYSKlxgCbtcznOkPkZFH4yVYvCium6j2wmMI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XxdnwLie+jOP9apYrnZZ59Lz1Q3sUEbQy+m4skOpD1bvtewWpEgDkzqPQYpdX4/7H
	 4GFdf0NMRh0R+1DO6hRkXCrSw6P2nBCvtU9szun899QcfIZyw+WEwTugbrpupeZ47T
	 qNTcy58/v+TQqojDOq3V0rhCbUxMjIAfYbXNwlqLjQvzjLIOZrVpa8VwCkxpPcFVaU
	 rFZx9Jqu56F2DmHsdKjuUaHv7PWg3TgkTW94osw2f3Mg4RRFal+0ONQWMI9AXQjjy0
	 1HkIbthbtqASjv8IC4tcvQMtm9eViV+0xpcHldkxIp7SGrV0agK63JoNlH/ikIJbpI
	 Lvuy+oOhe3g9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95D9180E44;
	Wed, 16 Sep 2026 12:46:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06D1F29B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E090380E44
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJTSRaKeK2Mv for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 12:46:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7367580E42
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789562793;
 b=jlyBptmASDQJ5ryKSkU3ad0L/kPFbhBxLPXDrUhmGUpdiJ91laKrxAqrXEV1g/sswzbZ
 BL14nyPIFdtu7baq+X+i4DdCnxlr8TFxmntcKR1CzqUmBRgn0HVxbIJIwpauM2ZsVLZ+g
 o2A5A8VVPfsqRhnb1IqhihSJuk1fCFrcLtI/3iWB3paFBWUkpHcDzWNiqMhNgr49a8YLQ
 5zXIKyS9/7VBgXabQHij1dxPL6iujYlQBJL9OxiW4LkvVBGsyklcGx2XthhHl4StD123V
 Jb/awYRtaom1FS/4upST2o/BhWR8yHlBF/+z6rHRgqLAER5B4ut678BPPy/jo2gaEig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789562793;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=5sWkwrTojV1JFstsJz42vuJBATl+m4Trb+tK0/lk9Bo=;
 b=HMZH/F38Jpv9whS1He0GyCgFSfcQuUu6ZFatMgreuq4TG/pKEgYRVIE0qTKTd1wvOsgU
 SPfk8bl5B2e62WjS/jnk181seLPqt3f3SlkBaSxUbupaY6Ih/FATXYBTQWcNKmIhXbHXR
 9Og2NZ6csbz36OlHKBX4GzSEUsnOyddc6spil+NyR3yzH8opYZAYKjiCRCojIK2DQ4ojF
 uKe0iDC7hXaQ1VtiOb4TYRvwAt0o3ANSeWo5TxzlXB5+1JyfYjLY+TDAOsK1rrmbXg9CQ
 LAFnv0JaLyiv7wGKqbrxcYj2wE3mKbKSAz0pcEjof0Oc/Rqqf+S0GJDkC6nXDX5ctJg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=lLOMZ4R1; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7367580E42
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:46:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3KPg-1wfpwt3w0I-011mTP; Wed, 16
 Sep 2026 14:46:30 +0200
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 16 Sep 2026 14:46:08 +0200
Message-ID: <20260916124608.2644663-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916124608.2644663-1-fiona.klute@gmx.de>
References: <20260916124608.2644663-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:CfVxw9hmRXhZQAxqu9svu8ai0OfwFlQvL2C/Vds6zbY+xPMHG9H
 jANgcZqCwDkkMzuVklOGetiP7gLAgcdKhcVNWPv8av13TznGUXqWIix0ZSoz64eQws1YHOM
 kTjSJzWNLdC8IdpEzDlXW8DBFANSOWro830OscCmTuF43Z0rxP9K3MyYioAeyWa683wPJa6
 Y4W8TZnpK+lCpOgsKBHoQ==
UI-OutboundReport: notjunk:1;M01:P0:eyA5Xg9IXoY=;8FGpHJitoZGP2/eMV2mN73O18tP
 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
 t6hQzm6r+4Hk2R8T20bw/2JXbQ==
Subject: [Buildroot] [PATCH 3/3] package/systemd: add option to build host
 systemd-measure
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

The host package already installs ukify, systemd-measure is required
to use ukify with the "--measure" option to calculate and show
expected TPM PCR values when using the resulting image. To build
systemd-measure, the "blkid", "openssl", and "tpm2" features must be
enabled [1].

[1] https://github.com/systemd/systemd/blob/v258.7/src/measure/meson.build

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/systemd/Config.in.host | 17 +++++++++++++++--
 package/systemd/systemd.mk     | 17 ++++++++++++++---
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/package/systemd/Config.in.host b/package/systemd/Config.in.host
index eff71d0d1c..fc9437d65b 100644
--- a/package/systemd/Config.in.host
+++ b/package/systemd/Config.in.host
@@ -1,5 +1,18 @@
-# Select this if you need host systemd tools (e.g. systemctl)
 config BR2_PACKAGE_HOST_SYSTEMD
-	bool
+	bool "host systemd"
 	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_HOST_UTIL_LINUX
+	help
+	  Select this if you need host systemd tools (e.g. systemctl)
+
+if BR2_PACKAGE_HOST_SYSTEMD
+
+config BR2_PACKAGE_HOST_SYSTEMD_MEASURE
+	bool "systemd-measure"
+	help
+	  Build host-systemd with the systemd-measure tool. The
+	  host-systemd package installs ukify, systemd-measure is
+	  required if you want to use ukify with the "--measure"
+	  option to show expected PCR values.
+
+endif # BR2_PACKAGE_HOST_SYSTEMD
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 3223915d40..290c2f1307 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -902,7 +902,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dmode=release \
 	-Dutmp=false \
 	-Dhibernate=false \
-	-Dtpm2=disabled \
 	-Dldconfig=false \
 	-Dresolve=false \
 	-Dbootloader=disabled \
@@ -953,7 +952,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dhtml=disabled \
 	-Dsmack=false \
 	-Dpolkit=disabled \
-	-Dblkid=disabled \
 	-Didn=false \
 	-Dadm-group=false \
 	-Dwheel-group=false \
@@ -1000,7 +998,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dlibcurl=disabled \
 	-Dgcrypt=disabled \
 	-Dgnutls=disabled \
-	-Dopenssl=disabled \
 	-Dp11kit=disabled \
 	-Dlibfido2=disabled \
 	-Dpcre2=disabled \
@@ -1018,6 +1015,20 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-python-jinja2 \
 	host-python-pefile
 
+ifeq ($(BR2_PACKAGE_HOST_SYSTEMD_MEASURE),y)
+# host-util-linux (for blkid) is an unconditional dependency
+HOST_SYSTEMD_CONF_OPTS += \
+	-Dtpm2=enabled \
+	-Dblkid=enabled \
+	-Dopenssl=enabled
+HOST_SYSTEMD_DEPENDENCIES += host-openssl host-tpm2-tss
+else
+HOST_SYSTEMD_CONF_OPTS += \
+	-Dtpm2=disabled \
+	-Dblkid=disabled \
+	-Dopenssl=disabled
+endif
+
 HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
 
 # Fix RPATH After installation
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

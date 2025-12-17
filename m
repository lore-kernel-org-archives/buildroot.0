Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16980D66B81
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 18:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4B746075B;
	Wed, 17 Dec 2025 18:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rP0spEQR10CK; Wed, 17 Dec 2025 18:48:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA6F460A7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765997309;
	bh=PVHNw0SMpkmQ5gc0pblsE2Wa1gnmSWl7F86sfobnZzU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DJbSp481fAkyuh8BR5YCGl0rt9txP6v1VXCmvycNDD631vXZN+lssQKMGXUTaEwRv
	 3dboQ5dx23C8Mls0vNSywOZ/vHwqcCCn3RlT1eFiLLNefK68Bcix7MTBgmIIA62HQZ
	 iW49pH3U1br7jq3cKdGUWFo6pj5sbH+t/Dahhkp79qxIXDGagr6y66QfCssUA63Gb3
	 eDufNVyrZs//2TjKKIiTHAYhLXk/kHMmUGZ3wRaKZZEcdFB0ghB514wYsVaoO/Sojk
	 dAw3xX4oFgKnY62ennazzL84EZG4gdFbb0izVidnPXSqkibdRVtPbiTZIR72bf+kSw
	 Y1zuBhCdIZoeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA6F460A7B;
	Wed, 17 Dec 2025 18:48:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D415261
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 18:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B5286075B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 18:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2_QCJuzn3Ep for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 18:48:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 24D1860B58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24D1860B58
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24D1860B58
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 18:48:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E49E3A4C420F;
 Wed, 17 Dec 2025 19:48:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49088)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVwZS-000000002xr-17ab;
 Wed, 17 Dec 2025 18:48:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 19:48:22 +0100
Message-ID: <20251217184822.3765937-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765997302;
 bh=z3nIrAUo/TAu7ySuNiIlSpQv93kFBCIEH1JfkjIrisY=;
 h=From:To:Cc:Subject:Date:From;
 b=N2eia6IRxEYG+pcy1AA8TQkKYtn+5TSaLp4r/IBxduQBSf4ZfY5gr9W2qhRVw21jD
 lU8XkvGE1fAceriKOpW0j9lQf26FX008UDamK29MeJ3Hh82oVelYOh9kfiKgoKG9Xo
 AZtjhbIHQ4+RB6AIAd7L0xDkzqU3f6BJUXjoalnhMUzdL86R5RZC3vFLkzobYkqKQZ
 omH67jZDdIB8jK7yJF6JNY9mguh+qQ9TcSl75Vc4wIL3T+65S/5/Hoy0f2VTEiSHGJ
 J/aFdfw85AitBMaTFumikkKmNO3+j8ilGEFN7s9IbyXEHGEMZnqB2IegLG73lIhZ0Q
 Fe+8YEVLjQkFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=N2eia6IR
Subject: [Buildroot] [PATCH 1/1] package/libselinux: host-python3 needs SSL
 support
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 285097051d4a7dd821f01d15c705867f7e26c635 bumped
python-pip to version 25.3, causing build errors when host-python3 was
built without SSL support:

  WARNING: pip is configured with locations that require TLS/SSL,
   however the ssl module in Python is not available.
[...]
  Could not fetch URL https://pypi.org/simple/setuptools/:
   There was a problem confirming the ssl certificate:
   HTTPSConnectionPool(host='pypi.org', port=443): Max retries exceeded
   with url: /simple/setuptools/ (Caused by SSLError("Can't connect to
   HTTPS URL because the SSL module is not available.")) - skipping
  ERROR: Could not find a version that satisfies the requirement setuptools>=40.8.0 (from versions: none)

Reverting the python-pip bump reveals the true cause of the build error
by showing these messages:

  WARNING: pip is configured with locations that require TLS/SSL,
   however the ssl module in Python is not available.
[...]
  DEPRECATION: Building 'selinux' using the legacy setup.py bdist_wheel
  mechanism, which will be removed in a future version. pip 25.3 will
  enforce this behaviour change. A possible replacement is to use the
  standardized build interface by setting the `--use-pep517` option,
  (possibly combined with `--no-build-isolation`), or adding a
  `pyproject.toml` file to the source tree of 'selinux'.
  Discussion can be found at https://github.com/pypa/pip/issues/6334

Selecting BR2_PACKAGE_HOST_PYTHON3_SSL fixes the problem.

Criu, the only other buildroot package using host-python-pip as
dependency, already selects BR2_PACKAGE_HOST_PYTHON3_SSL.

Fixes:
https://autobuild.buildroot.net/results/fd6/fd6d3edd5f74d094621ac9fdb93db24520b7a6e3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libselinux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index bc40e32a46..db5694e7bd 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_SSL if BR2_PACKAGE_PYTHON3
 	help
 	  libselinux is the runtime SELinux library that provides
 	  interfaces (e.g. library functions for the SELinux kernel
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

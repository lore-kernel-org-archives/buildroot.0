Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53921F31E43
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 15:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24A1560A87;
	Thu,  9 Apr 2026 15:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqVfCYoCNUK6; Thu,  9 Apr 2026 15:43:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2579760A82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775749417;
	bh=CEakKDSxWxFGpJ8iRxobN68rNqyYDfX5s3kLY29+uag=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Y54N1wAf0AwZSxbsALFvM4NjRbfz2CTdJKFTjJsNZQtbujSxy91p5DxI4d+JhSuBc
	 YsPV9KwEwI6Qx4F9VP+7risyYDlWCwlz1UAFMeBolpjOpEvL4i9zw/VAOBSfVZvpT+
	 5e7yxYmSbJxh3dKv9p0tOtxbA5cNZfjmYq5X6aA483U/03TXLqd6V/3nK9EAF1VtQ0
	 rpl9TlSoAM8Q5I2eCKtIHFimE2ttNsPSYH5kJi4ltY9D3eTwKZF006POukM5X1TjrA
	 2oGaizKt5Muj793NF85MQxS7VeXhcWsPhrIVErH4VT0tVXx2rnoIPdQTKM5FPqMRez
	 v1Lvwv8BFXU8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2579760A82;
	Thu,  9 Apr 2026 15:43:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F10441F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E10F560A81
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJbTyneOG7ij for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 15:43:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7137D60A6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7137D60A6A
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7137D60A6A
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:43:34 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so15219535e9.2
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 08:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775749412; x=1776354212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dYGLXHx3cw2pIs0/YrEp8oeM32XECOw3+dEfxArX/1Y=;
 b=AwPuu6rcLcMmhzRmQ9mMgW0tQYVZK4sCrAPE6L79lzYPNFUsSOgXy/9cPsqsj8XJLS
 X3F32q4BYycf77Qlp3jTEUuySs03IuWsqkLuiRza+yAG22zCLOsZLtG+nGpze4EOX8Gn
 c/GxxWLQhRTODMFWzE62Yc0dTUxjfz5g6WSLeXbRNoRXfmFEYRbHfSInUWCxCSeTSFZy
 xk3aTBcCcRoVSmKJCUasSsNjSb7njvX8GBJAr2IeS920SyOlwFyqreIoD60Y3QZsf4TS
 phpwf+tjw+INr6AP13vIIqFcOdANYe8Cw4f5f2HzaCmIhu/0LRCXQ90Iac5q2I2V3edP
 /zFw==
X-Gm-Message-State: AOJu0YxL1SbKkhaDDMD4g7ufj2RhKwij68HmZCUc6YVldLD4G4fwNjx7
 1YAfQfQ/YM6Ia1BNai29R8OmRrL5nFsEo83VjqC1FBKlejG+fNHkPgGGEXBVXNS3
X-Gm-Gg: AeBDiet0rSsKiN5QJBHgletM/hi0jBqFyiXMr2YPPCSdWSbheJwceDCdeAp4w89jqtb
 qS31iP1KryWT3nvZEbY0jyocCEVjGSeSq8mwZ/ClU+xi+KTjGBelPBq+bcJUX6RvwF8ONDywmAi
 WCqQTJngriU1pxsDrUaX1ElIT7WqRK5MZpiiFa/vRzo2hqEJeXV6CW/feigGLGdp7js83ZnSF9u
 PdSM2Pajvyx6q737ndvRwhP6zeNVs1p6Rciu4+cviYnVeXjLU3O5nzq1MgIelARCJd/O+4WVOGQ
 +knPTzPyr7mIErRfcCQEfGXRnYXkTi4fWuxh32BbJvBmA7YgK2m31wIPIqA8LgLJXtL8KmdQRlM
 yBRpGVVRrZx46mpaz/yT6nTt2NnQwSnpWOGP6nd4F0zJ/rozdnHkvDD1rXO2ImV6rKQTd7fDatk
 HBXA4rYibXCvhZ1xU5m0HyZVIkVhqvi6Rddr3lm1ZZaxmpsaHfWXnPFlbtoSUwk71Rt6nc1OsJs
 HWN
X-Received: by 2002:a05:600c:1381:b0:488:9439:881a with SMTP id
 5b1f17b1804b1-488996a6a6amr370198055e9.2.1775749412323; 
 Thu, 09 Apr 2026 08:43:32 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.173])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d53807d7sm8423225e9.10.2026.04.09.08.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 08:43:32 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 18:43:23 +0300
Message-ID: <20260409154323.6842-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409154323.6842-1-flaviu.nistor@gmail.com>
References: <20260409154323.6842-1-flaviu.nistor@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775749412; x=1776354212; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dYGLXHx3cw2pIs0/YrEp8oeM32XECOw3+dEfxArX/1Y=;
 b=IFCqcOsN1L7El31BTYmjew3f+KR0yEzFtC6IgIv2gGLsZGZTJwug2JJr1isYjocZeQ
 ZVpQzYXazFY/w8NrOSquWKV4OXvBFr4cgSdkSNJZcZD3swPAqt/Q9pdnbnGfM3dhHJGp
 YZwj97+d3j3AvVDf9/siRX5F+yFAN3AMIVeS2WiAqvE821rwOB5ypCfNN9e4VMBIU+Vy
 /PPonWCYUqUORjDdSQDrBgS4PUL13B9bEvs6BOLNNGgYAbo32CuVtA2Q6LAqA0lWVe+C
 LIB3dc2IkZabFZEYmeh0fMLQdzTdBhA51R948hZXkqe651yZRzazw1WgR3lNSSoBRFj4
 CP6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=IFCqcOsN
Subject: [Buildroot] [PATCH v2 1/1] utils/scanpypi: workaround for pypi
 project names
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Get the pypi name from the .mk file if it exist. This solves
an issue in cases when there is a different buildroot package
name compared to the pypi project name (e.g. smmap2 -> smmap).
Since it is not intended to change the buildroot package name,
this is a workaround in order to use the scanpypi utility for
this packages and still get correct generated files.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 utils/scanpypi | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 61879e39d4..afdc00c80b 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -216,8 +216,25 @@ class BuildrootPackage():
         """
         Fetch a package's metadata from the python package index
         """
+        # If a .mk file already exists for this package, try to extract the
+        # upstream PyPI name from the _SOURCE variable. This handles cases
+        # where the Buildroot package name differs from the PyPI project name
+        # (e.g. smmap2 buildroot package is smmap on PyPI).
+        buildroot_package_folder = os.path.join('package', self.buildroot_name)
+        pypi_name = self.real_name
+        mk_file = os.path.join(buildroot_package_folder, self.buildroot_name + '.mk')
+        if os.path.isfile(mk_file):
+            source_re = re.compile(r'^' + self.mk_name + r'_SOURCE\s*=\s*(.+)$')
+            with open(mk_file) as mk_fh:
+                for line in mk_fh:
+                    match = source_re.match(line)
+                    if match:
+                        value = match.group(1).strip()
+                        if '-$(' in value:
+                            pypi_name = value.split('-$(')[0]
+                            break
         self.metadata_url = 'https://pypi.org/pypi/{pkg}/json'.format(
-            pkg=self.real_name)
+            pkg=pypi_name)
         try:
             pkg_json = urllib.request.urlopen(self.metadata_url).read().decode()
         except urllib.error.HTTPError as error:
@@ -225,13 +242,13 @@ class BuildrootPackage():
             print('ERROR: Could not find package {pkg}.\n'
                   'Check syntax inside the python package index:\n'
                   'https://pypi.python.org/pypi/ '
-                  .format(pkg=self.real_name))
+                  .format(pkg=pypi_name))
             raise
         except urllib.error.URLError:
             print('ERROR: Could not find package {pkg}.\n'
                   'Check syntax inside the python package index:\n'
                   'https://pypi.python.org/pypi/ '
-                  .format(pkg=self.real_name))
+                  .format(pkg=pypi_name))
             raise
         self.metadata = json.loads(pkg_json)
         self.version = self.metadata['info']['version']
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

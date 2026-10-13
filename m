Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D07CC6B1D
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 23:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59AE160857;
	Tue, 13 Oct 2026 23:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75_ukk_iqBHL; Tue, 13 Oct 2026 23:30:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 36C89608D5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791934200;
	b=F9PjAR4GoEiyaUw0Wp3XLUa8GLy2isH+JLHWJG2aF5gMCaYUcMmWqc4sIdfpoJ+ZgMDB
	 LZA/JA96jVbuTJlAxE8GoujIQ91990xLzkWvfW/Qfk5j+VBwbcnmPfTNHqpPP764zJ/i6
	 RgwsXhy8XzlNRCSWRsqYxbBHmtB9f/ybb0QSi1+Y/HPBmwZAR6e/GB1BRfAcmIbS9vRK3
	 HpAHhtk3APjPS9Bx1iao97l1gCdyzi8Qca6vQg4VNP0Cl2q7EKvDTdfYFdWqzExKQcNgV
	 tcAc2eUgHUFddNmEnU4IJoBbAKskj/1KZP5yql3YkUQaVhx7ADozphAk4hveUh+mPcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791934200;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ZORIvP16Mj72RWAQx5vH2rAdHlw7O/+JNdK4iNV+TPU=;
	b=a6Wtzy7hlw3LW/MSwkIq7RVTd3lGM1wm/3UJvHKYPE7x0mYRz0o5CTX0712xXrG4xNDe
	 tIZUESGLj0z4nZvw5y6TxckDxvVOTQSGybnpyhWLthB2UyDFGPL1epHDRkKPxxN/yVXsj
	 h8QuuvdTSK+sqLegpJQWXoj/eqAsO3FMbaTpvJNGb9yfVMANjZoKRtcb6itkRRaH1qnfe
	 mDlsvR8MNqMNI7L8d+hjGtL1MjYp+UDhPJFGJ2dFblw1ApyurGg6TQ2vZgAQL2ZdKyY8B
	 WY8GzfVnoTX4i1tDUtUoag6Mwv3zcuyaNL8xeLG+TqWnbK4gvva+wLEwVHuh0gKrW5Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791934200;
	bh=ZORIvP16Mj72RWAQx5vH2rAdHlw7O/+JNdK4iNV+TPU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Pcf9d7sE83/jR+zDy/JJKQSWp2cpYuucQ7q5IPqhsthvh4BR/clLV4glW5Xy+Z2tv
	 XgFCiqECkENSozqzo0qJsIFNFiRzuWqvwJFwFpKobUyv+pyLZROFlWbqjUN+xRfKlS
	 mqupyc9SE+B0lcOYFcbbHdLAHVVPHIl+Tv6uEZg3JTvhDSI8wnnLSkLhsNoNCLTNWK
	 W5hcUrYQPlJVx7r6HXK4keSNdrNRMGiKw30U6be5oEXAgrsLcwmSwrGYn0eCxKCI/N
	 bkQIx1iceeqOFU7JzgmGiAqt1HqeU7SITuc2C6VEZSR1iP1QlfXX4vSoczfovBCIpK
	 ad6t+z/LAyfQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36C89608D5;
	Tue, 13 Oct 2026 23:30:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7890255
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9CCE4008F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUhNN9KWUNdS for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 23:29:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A32924007B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791934195;
 b=cKY8Hr0To5SKh0vEk5L37SEKjKTaG9l4hR8SbTlKRjuYDMxFmjrZShW/orPJbpc+u/rh
 13AqhcdOt+xsSTEFI9i5UgJNuEsRm7iVa9qN7s49NHiBPLHBl81n8Eo96SVqCYuL+r4Ld
 1PmsPQSFSF3DQTvGuHK/zIAt7r0EdJt70Fm11MVc6lFBV7VwcyXFx5K2Y9mrThTNiw8oH
 FyPIp961qjOolaaDkEA38tVN87qau606241hwdqEkK6ucbhGxYqdbEasF6896z7d3Y+Qv
 KDUADzlv0Dzzj3olzPBqPdYWwKl+tz9mXDDhQDCb9Y03+lk5mhQL2UjhgaCJmoyVNXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791934195;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=QwBAwBQs6GQpFMMIgnCJbvJMbj6v8H4zsuUzJrPv4mo=;
 b=AUCsBH7lQt4mw6up/NfmN3kgaMJT5UcKIIcYPjRvd3FQ9JRD8MADNsfAxnfHItogx5cO
 3UDB5g0QLCWP59LzGjdoZzSFlGuPssmvDvEyG8+LNrFyj+DAWccJCaRRefky/a/Sxc6vZ
 ZMxdFVfZjhcg8C2tWS8jiHKrGogR7eqEyPOqmY+wJUnlh7nnCypty/9TAgW71vGVUqrpd
 veR3P023PtoAffVheJxQzSfvWZ/g2uyv8+zxNH6GXhCN+icWSGG6jtTLdJZRppnkpkqen
 iEx7pWLNjjSQnHcn7MFjfB54EY7If2/Z9TU+wPGOil6gkVOuYexuR8R/oegFGueJXYA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qmxh5Xna; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qmxh5Xna
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A32924007B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:55 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-82395ae2ea8so308584a34.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791934194; x=1792538994; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QwBAwBQs6GQpFMMIgnCJbvJMbj6v8H4zsuUzJrPv4mo=;
 b=qmxh5XnaMX2T+xzvk85wTksF98vYKfhnnB20cBbePeGzMRKtKE/t/ZLH0aFqvVm7bi
 safd+cC4URFk+xCeAgxNaylgBlispRsSHYOHnvY/aHF/TT07vGCkwccXtOQLnJgiU6u8
 KfT0dV17f8au8BK4qt8R5uoaOzJvOaa8voshHTIMo2RlFksY02PX8GjBWKR7hMJN3nKo
 djZkAp6ni3SVhQklzEyEYKK+fgcPiG1iF0SvOpmx/WTUjbEydToPMYdTJuE3J7VbStgp
 GULuQa38EMoc5tKFPt5U9Dmkt902O/UeoSrRe/3EdYN0T2s472le6CbUu0ZPqmroWaKy
 28fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791934194; x=1792538994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QwBAwBQs6GQpFMMIgnCJbvJMbj6v8H4zsuUzJrPv4mo=;
 b=JiVjfJumgm0FaeXrZJS1Cpq+LfdC0OBXb5P0uNNt05PD+VL+YesV76vZITids5VgXa
 xqPErgmgeo24x4l9G6uQxn1NXqPKhHWAB0HJ7MA/XnwL9eXaDcvprbwKAHrnFrdL0CPL
 qrEcJ/XKph6Lp2z8uvFhWgFD11Y/+j1xsVwkL4YruIAzChgVK86m5O+L/NAH2eom0w4g
 /0UAETUGOZFYtqEXSqpq0XSpjSfZR9WEbi1+fpbx0DZZvMaSVAx42hpXBBdXh/yO6k7R
 VF2vx1aZ2WE6iakGofIcMo/XHuZnTwnAPcDJSx6orpVCIXhNdiwSa4VQNZ/v7ArF1z84
 KTLg==
X-Gm-Message-State: AFq9FYKiufHoAmYH5v2DGsTYKJdiFWWdSqweiyNvMcstbeNWyJp3YgcC
 x5yIXsFq/t7lwV1PKoqe2AC10e9YfSORl3dr5RgXnLEmhTtaqIj7omdXV3Hy3j0q
X-Gm-Gg: AYBFou0v57ybNcDFrWp7pfdWFmXCpVYdRgD1/z8btbooRfVttJwkRoRubbLVDMKZIqJ
 Zm4jdDRTshE/vVTjJNMZ/VRcaXnngAu4/LPNQJP4KOqgq2QKVJJchBpKVgkaPY3ODdIWl39Ljm/
 EiLX59R1NF9wumHj0uEgeVPx9P7vdaqvOWHlUs8EPAHOM3gwrJw3l56hTAO4TQKjEeu4z1ln/39
 06cFnyG7H+G9cSdbEXqTJch02O6ctZM3LDwSZjPup/wlz2NPGJsEExA/RD2bJ2P5SQ37cgILsWz
 A4gY/lS24IGLSc6RWF70fW/JgPONMANdMxTnRs5HIorFqPjgnvoM40uNw/zVMw4yDvcF21CqHtl
 9jMeKMLYyShC41Vp7nl5gmm0yW4YXgeANK25ziioMhpcDLCJlq7HZ0RYY2847qO6L5GHhk5EZeC
 WhGlklp2ETTXvsajrnXRkuNxB9LiJKrkR2C7w3djX1QaYEseW3G6nH7OM1VDfMgds52RpLk9cuF
 U1ybIib3cGV3GqrgGN9ptfVejx66sx7I4ogvP0rU50xCvawD4KK4q/Iy87DobiGQxVgy6+wGYoD
 OCPjFXPrY0PzTXfMCwXc8vGyhIbFZMJ6rEjNSoGt509yN3/QMwlz3+igVD/axH2LNSEMZ+DDEqN
 5MESoxvnZ08vYyxbZ20JPgAxPWFBIbUv73zEOhEThPlI=
X-Received: by 2002:a05:6820:811a:b0:6cd:3fbd:1d63 with SMTP id
 006d021491bc7-6ef12fcb742mr10727049eaf.77.1791934194175; 
 Tue, 13 Oct 2026 16:29:54 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6dfbd6a92sm828514fac.9.2026.10.13.16.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 16:29:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 17:29:39 -0600
Message-ID: <20261013232940.2690456-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013232940.2690456-1-james.hilliard1@gmail.com>
References: <20261013232940.2690456-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 8/9] package/python-pkg-resources: new host
 package
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
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Setuptools 82 removed pkg_resources, but older U-Boot Binman versions
still use it. Package the standalone PyPA snapshot so these consumers
can keep working when setuptools is updated.

Add a small setuptools pyproject.toml to build the module from its
repository-root layout, and include the license addition proposed
upstream. Supply packaging, jaraco.text and platformdirs explicitly,
as the standalone module imports all three at runtime.

Add a host runtime test covering resource access, dependency resolution
and cache lookup.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-LICENSE-copy-from-setuptools.patch   | 39 +++++++++++++++++++
 ...-metadata-for-the-standalone-package.patch | 39 +++++++++++++++++++
 .../python-pkg-resources.hash                 |  3 ++
 .../python-pkg-resources.mk                   | 17 ++++++++
 .../package/test_python_pkg_resources.py      | 14 +++++++
 5 files changed, 112 insertions(+)
 create mode 100644 package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch
 create mode 100644 package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch
 create mode 100644 package/python-pkg-resources/python-pkg-resources.hash
 create mode 100644 package/python-pkg-resources/python-pkg-resources.mk
 create mode 100644 support/testing/tests/package/test_python_pkg_resources.py

diff --git a/package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch b/package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch
new file mode 100644
index 0000000000..3ecd63fc8c
--- /dev/null
+++ b/package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch
@@ -0,0 +1,39 @@
+From a5315eb2caffc9b4a43439df81e6a0d7f7647352 Mon Sep 17 00:00:00 2001
+From: Achill Gilgenast <achill@achill.org>
+Date: Sun, 15 Feb 2026 15:58:35 +0100
+Subject: [PATCH] LICENSE: copy from setuptools
+
+Copy the same MIT license from setuptools, just like the rest of
+pkg_resources that is compied from that repository.
+
+Upstream: https://github.com/pypa/pkg_resources/pull/20
+Signed-off-by: Achill Gilgenast <achill@achill.org>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ LICENSE | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+ create mode 100644 LICENSE
+
+diff --git a/LICENSE b/LICENSE
+new file mode 100644
+index 0000000..1bb5a44
+--- /dev/null
++++ b/LICENSE
+@@ -0,0 +1,17 @@
++Permission is hereby granted, free of charge, to any person obtaining a copy
++of this software and associated documentation files (the "Software"), to
++deal in the Software without restriction, including without limitation the
++rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
++sell copies of the Software, and to permit persons to whom the Software is
++furnished to do so, subject to the following conditions:
++
++The above copyright notice and this permission notice shall be included in
++all copies or substantial portions of the Software.
++
++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
++AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
++IN THE SOFTWARE.
diff --git a/package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch b/package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch
new file mode 100644
index 0000000000..e9982cd1a0
--- /dev/null
+++ b/package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch
@@ -0,0 +1,39 @@
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 13 Oct 2026 16:36:30 -0600
+Subject: [PATCH] Add build metadata for the standalone package
+
+Build the extracted pkg_resources module as a standalone wheel, mapping
+the package to the repository root. Use a static version for this snapshot
+so building an archive does not need setuptools-scm or Git metadata.
+
+Upstream: Not applicable [Buildroot snapshot metadata]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ pyproject.toml | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+ create mode 100644 pyproject.toml
+
+diff --git a/pyproject.toml b/pyproject.toml
+new file mode 100644
+--- /dev/null
++++ b/pyproject.toml
+@@ -0,0 +1,19 @@
++[build-system]
++requires = ["setuptools>=77"]
++build-backend = "setuptools.build_meta"
++
++[project]
++name = "pkg_resources"
++version = "0.0.0+git.7fa76c17"
++requires-python = ">=3.9"
++license = "MIT"
++license-files = ["LICENSE"]
++dependencies = [
++    "packaging>=24.2",
++    "jaraco.text>=3.7",
++    "platformdirs>=4.2.2",
++]
++
++[tool.setuptools]
++packages = ["pkg_resources"]
++package-dir = {pkg_resources = "."}
diff --git a/package/python-pkg-resources/python-pkg-resources.hash b/package/python-pkg-resources/python-pkg-resources.hash
new file mode 100644
index 0000000000..e80a20de6f
--- /dev/null
+++ b/package/python-pkg-resources/python-pkg-resources.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5fc3f3fd8e23438a83d366897ce4389d2983d977b4339303359a0ffa0a33c15e  python-pkg-resources-7fa76c17eacf8a67c6932c9c2dd97861f42439cf.tar.gz
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-pkg-resources/python-pkg-resources.mk b/package/python-pkg-resources/python-pkg-resources.mk
new file mode 100644
index 0000000000..35076514f4
--- /dev/null
+++ b/package/python-pkg-resources/python-pkg-resources.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-pkg-resources
+#
+################################################################################
+
+PYTHON_PKG_RESOURCES_VERSION = 7fa76c17eacf8a67c6932c9c2dd97861f42439cf
+PYTHON_PKG_RESOURCES_SITE = $(call github,pypa,pkg_resources,$(PYTHON_PKG_RESOURCES_VERSION))
+PYTHON_PKG_RESOURCES_SETUP_TYPE = setuptools
+PYTHON_PKG_RESOURCES_LICENSE = MIT
+PYTHON_PKG_RESOURCES_LICENSE_FILES = LICENSE
+HOST_PYTHON_PKG_RESOURCES_DEPENDENCIES = \
+	host-python-jaraco-text \
+	host-python-packaging \
+	host-python-platformdirs
+
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_python_pkg_resources.py b/support/testing/tests/package/test_python_pkg_resources.py
new file mode 100644
index 0000000000..72acde3dcd
--- /dev/null
+++ b/support/testing/tests/package/test_python_pkg_resources.py
@@ -0,0 +1,14 @@
+import infra.basetest
+
+
+class TestHostPythonPkgResources(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-pkg-resources"]
+
+    def test_run(self):
+        cmd = ["host/bin/python3", "-I", "-c",
+               "import pkg_resources; "
+               "assert '__init__.py' in pkg_resources.resource_listdir('pkg_resources', ''); "
+               "assert pkg_resources.resource_string('pkg_resources', '__init__.py'); "
+               "assert pkg_resources.require('pkg_resources'); "
+               "assert pkg_resources.get_default_cache()"]
+        infra.run_cmd_on_host(self.builddir, cmd)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52948E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CD43606D0;
	Sat, 11 Jan 2025 16:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJcWv9X7rIML; Sat, 11 Jan 2025 16:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1255560AAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1255560AAA;
	Sat, 11 Jan 2025 16:28:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0173D940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFBB04000B
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_e2cDByMy0F for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:28:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D88B340017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D88B340017
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D88B340017
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:28:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso21884555e9.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 08:28:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736612924; x=1737217724;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h+JIKTQLRkTXW/km188agaGpz9cbYJGUpgRWwrU82ng=;
 b=JR1w8T6X0mdn6GuVz9Rq8PviHdKfa+nrTqYs/eTt4NcboT/PiMHwaHATLyvHa/7enh
 qprlsh985Q62InhhPip2IgVpmaOFpdD8gUw5fQMI8DwgdHCXPY8T9GHIMTDWgee6Kc9z
 FGNy30m20S3CyJMrajPwhq6xB+RGQqwvv8SatNpWSN9X+xWejrc/E7TR5YBo5HcewplY
 olV4RN+BIpEX6BANLFLv57xMee5DCXl/UhH6ZVp2YyViiFF2DTZzaC/Fi66kKxi6bMDY
 ldT46jYRH1emFJCyYAv0A9HC01TtdBy0JpgLCOYvcKxcssbvF1dnCfm/9MsICczxxjpz
 cUaQ==
X-Gm-Message-State: AOJu0YyXxM7Wn2/Z5GIUYBfDewyKM1fJ1xPzutKujSFGXJi1R9T3FfJS
 hz4vzVuoRDBXSXMhfugGtW0cxAP8Git+02TGd6ESZp0XNlAsWzFOLh7rA5WElzMrMzbgrKha6le
 h
X-Gm-Gg: ASbGncv4qqHoT/YxmNbpNeowCCFCKgCRnEd72/u3gGjhYpZKVD5sJHdYwHbrpgDqrRy
 2IE/8r31KsumRTWvOUr9XcazLeYu3rw4zAeXfHd77ICat3lGShUrreFfn0nRE81pqCleJIhvllI
 j8MLFZSzROFcA6o2RBRTlXCmKnO0opuSjHNBZdDbAUwl2IfSxsJvBxk+LMHaBtRt0FxzMpYGt91
 6b7UGTDF4IC2xkfyDYThQYiqZWblWJzfpUrkmkTOAhIP1jEdzwa9F0vysf+/y9NxUDn/k02+/u9
 ZlNrOF3Nq/NpSSYPbIq8joLfdbM2h8njHKy5kyvikT0W9GulFBaWQQ==
X-Google-Smtp-Source: AGHT+IE2X817SjwzmV4odE8pMSoWoUx6LHZx2OQjuXY4Ctwx2noJVbYk8yx7qPy0hEwxYnVb4/wl1Q==
X-Received: by 2002:a05:600c:3588:b0:434:fdbc:5cf7 with SMTP id
 5b1f17b1804b1-436e26f4aecmr121747125e9.27.1736612924524; 
 Sat, 11 Jan 2025 08:28:44 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9df958dsm86576155e9.17.2025.01.11.08.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 08:28:44 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sat, 11 Jan 2025 17:28:41 +0100
Message-ID: <20250111162841.3456137-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736612924; x=1737217724; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h+JIKTQLRkTXW/km188agaGpz9cbYJGUpgRWwrU82ng=;
 b=h38blFda4uf71aCyD/2982l4q8cIjT7M5Oc9i6becN1XVz0odR7VVGsFSlBk6/n4gG
 W2zxMcD4h2JtEmmLYW2sxZ8fHq3p09HrXpAdClJx2WmyeGxG2wNFqB+LxfCfDSL0ctAM
 vBI5A76lCR00bznFEK2snhOpdG2bGEHF0LpMQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=h38blFda
Subject: [Buildroot] [PATCH] support/dependencies/dependencies.sh: ensure
 wget2 is > 2.2.0 for metalink support with -O
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported by Julien Olivain, in some cases the "wget -O output ..."
does not get honored when GNU Wget2 is used as drop-in replacement for
GNU Wget.

For example, qt6* packages archives are failing (due to multipart
downloads: HTTP response 206):

  [Files: 1  Bytes: 46.00M [388.39KB/s] Redirects: 1  Todo: 0  Errors: 184

  sha256sum: [...]/build/.qtbase-everywhere-src-6.8.1.tar.xz.bFXkzc/output: No such file or directory
  ERROR: while checking hashes from package/qt6/qt6base/qt6base.hash
  ERROR: qtbase-everywhere-src-6.8.1.tar.xz has wrong sha256 hash:
  ERROR: expected: 40b14562ef3bd779bc0e0418ea2ae08fa28235f8ea6e8c0cb3bce1d6ad58dcaf
  ERROR: got     :
  ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Fedora 40 is one of the first Linux distribution providing GNU Wget2 as
wget [1]. Some incompatibility issues with Wget1.x are discovered with
early Wget2 versions.

This is the case here with Wget2 2.2.0 and Metalink handling that
ignore -O option [2][3].

The issue was not noticed until now since the download infrastructure
uses a mirror (s.b.o) as fallback.

Since wget -O is part of our download infrastructure since 2012.05 [4],
ensure wget2 is at least 2.2.1 or any newer version that contains the
-O fix [5].

[1] https://fedoraproject.org/wiki/Changes/Wget2asWget
[2] https://gitlab.com/gnuwget/wget2/-/issues/685
[3] https://gitlab.com/gnuwget/wget2/-/blob/0651b0a447e4d6dd3f100800d0d93db90f2bd2fb/docs/wget2.md#-o---output-documentfile
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/cf2486bf317e4bbf88c801fb96183ba62be78cc8
[5] https://gitlab.com/gnuwget/wget2/-/commit/15c06c2f2a5f5eaa962893beec97a5211743ec05

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/dependencies/dependencies.sh | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index fb0defd0c9..e49831a3fd 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -184,6 +184,21 @@ for prog in perl tar wget cpio unzip rsync bc cmp find xargs ${DL_TOOLS} ; do
 			exit 1
 		fi
 	fi
+
+	if test $prog = "wget" ; then
+		WGET_VERSION="$(wget --version | head -n1 | cut -d ' ' -f3)"
+		WGET_MAJOR="$(echo "${WGET_VERSION}" | cut -d . -f 1)"
+		WGET_MINOR="$(echo "${WGET_VERSION}" | cut -d . -f 2)"
+		WGET_PATCH="$(echo "${WGET_VERSION}" | cut -d . -f 3)"
+
+		# Wget2 <= 2.2.0 issue with -O : https://gitlab.com/gnuwget/wget2/-/issues/685
+		if [ "${WGET_MAJOR}" -eq 2 ] && \
+			! [ "${WGET_MAJOR}" -eq 2 -a "${WGET_MINOR}" -ge 2 -a "${WGET_PATCH}" -gt 0 ] ; then
+			echo
+			echo "You have GNU Wget2 '${WGET_VERSION}' installed. GNU Wget2 > 2.2.0 is is required"
+			exit 1;
+		fi
+	fi
 done
 
 if test "${missing_progs}" = "yes" ; then
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E3BC4345F
	for <buildroot@archiver.kernel.org>; Sun, 21 Apr 2024 09:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08D5A80EEC;
	Sun, 21 Apr 2024 09:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNkc6pu8IGQo; Sun, 21 Apr 2024 09:54:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 126DE80DBF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 126DE80DBF;
	Sun, 21 Apr 2024 09:54:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46E141BF95C
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 09:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30E47402AF
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 09:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4alKbrO-EDu for <buildroot@lists.busybox.net>;
 Sun, 21 Apr 2024 09:54:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F48C402A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F48C402A7
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F48C402A7
 for <buildroot@buildroot.org>; Sun, 21 Apr 2024 09:53:59 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-571c22d9de4so4263911a12.3
 for <buildroot@buildroot.org>; Sun, 21 Apr 2024 02:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713693237; x=1714298037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=29Tp5nFBIbiiAjhlfkbARueAlWqacRY5aGoBqBv1/4A=;
 b=G9Py1GUUPmjYuvLJErx6dKBr9FQvnZ+/GHFLdKE5vagOw9iXVBzt+FCXJsK1cNrh3e
 8iJWkWhxE5EjII1Jl6fkPcdGsjtNMC1Nhyl6upOHnNFX0VikJkrCgufrYfq2mKoJiPKx
 a6Rm6RXUgzSwdq5JNkb305260McUoAu8uBUr2bqNdKbR0684YrMaxev1BLjnQbfE2L4s
 ygrcpROqBvxP5yDjCop3yShwsBJ/BBNmf2ZHCzFtYH6ANAoUSK9C9MMcrrmm2i8DC42i
 JaPC3ow7k7My4Qy+YedZD4lvzAzz0ogV8uVBUZL5UZ5DncDuScTW8Wdd9h6Pf26lvSek
 Y2og==
X-Gm-Message-State: AOJu0YwyykEfYwAAi0fWWeexaVoS38Uy8l8tjoVZbAc3TIPfwZQZPXl5
 SkZ1+RRK++XLznd19l3Yie2dCr/H9ip0VHJbpZG41P2uyh7Hak382WUE2u1BeEx9qgcR/aQCocJ
 iO+8=
X-Google-Smtp-Source: AGHT+IG5JYfmztLQWklg+dgMDnoVIUzs5TCfe8Nro6vbpFJ9yGx8+U3hKMRea2WXI1oPH6NbLjBo5Q==
X-Received: by 2002:a50:ab1a:0:b0:56e:2b31:b111 with SMTP id
 s26-20020a50ab1a000000b0056e2b31b111mr4422565edc.7.1713693237384; 
 Sun, 21 Apr 2024 02:53:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 f15-20020aa7d84f000000b00571db231915sm2318427eds.78.2024.04.21.02.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Apr 2024 02:53:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 21 Apr 2024 11:53:52 +0200
Message-ID: <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713693237; x=1714298037;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29Tp5nFBIbiiAjhlfkbARueAlWqacRY5aGoBqBv1/4A=;
 b=O/pMKKmvPDu1cKGmf1CUR66GLw/Vq3kPkwOVkDfTYLA/UtlGUU4w8OBynySBcqZAaS
 OKSza+BydCGFeQcVbX+418prVPhrmF+pKwBYGEmqHjl5e6OJM2R4Gzz2xDwpmxKXOkpX
 sR+73O8hPrrtCtj4U5wZY+ZX8rbOGM67CRCO0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=O/pMKKmv
Subject: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh: support
 creating a bmap image
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Xuanhao Shi <X15000177@gmail.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch adds an option to create, in addition to the usual image, an
image of type bmap that drastically reduces the amount of data that
needs to be written to an SD card, resulting in time savings.

This makes it possible to activate this option easily and maintain
backward compatibility for all configurations already using the genimage
tool for creating the image to be written to the SD card:

BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/<manufacturer>/<boardname>/genimage.cfg -b"
+BR2_PACKAGE_HOST_BMAP_TOOLS=y

It follows that the script now assumes a broader functionality that
extends beyond just being an interface for the genimage tool.

An alternative implementation could have been to create another script,
such as support/scripts/bmap.sh, capable of creating the bmap image
using the same parameters passed to support/scripts/genimage.sh (i. e.
-c board/<manufacturer>/<boardname>/genimage.cfg). However, in this case,
the script would also need to know that the image is located in the
${BINARIES} directory. This could be achieved by adding an additional
parameter, but it might cause genimage.sh to fail due to an unrecognized
parameter.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 support/scripts/genimage.sh | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
index 2796e19eb778..72592ebb710d 100755
--- a/support/scripts/genimage.sh
+++ b/support/scripts/genimage.sh
@@ -4,19 +4,26 @@ die() {
   cat <<EOF >&2
 Error: $@
 
-Usage: ${0} -c GENIMAGE_CONFIG_FILE
+Usage: ${0} -c GENIMAGE_CONFIG_FILE [-b]
+  -b    create bmap image
+  -c    configuration file
+
 EOF
   exit 1
 }
 
 # Parse arguments and put into argument list of the script
-opts="$(getopt -n "${0##*/}" -o c: -- "$@")" || exit $?
+opts="$(getopt -n "${0##*/}" -o bc: -- "$@")" || exit $?
 eval set -- "$opts"
 
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+GENIMAGE_CREATE_BMAP="no"
 
 while true ; do
 	case "$1" in
+	-b)
+	  GENIMAGE_CREATE_BMAP="yes"
+	  shift 1 ;;
 	-c)
 	  GENIMAGE_CFG="${2}";
 	  shift 2 ;;
@@ -46,3 +53,13 @@ genimage \
 	--inputpath "${BINARIES_DIR}"  \
 	--outputpath "${BINARIES_DIR}" \
 	--config "${GENIMAGE_CFG}"
+
+if [ "${GENIMAGE_CREATE_BMAP}" = "yes" ]; then
+  while IFS= read -r image; do
+    cnt=$(grep -c "${image}" "${GENIMAGE_CFG}")
+    [ "${cnt}" -gt 1 ] && continue;
+    image_path="${BINARIES_DIR}/${image}"
+    bmaptool create "${image_path}" -o "${image_path}.bmap"
+    gzip -c "${image_path}" > "${image_path}.gz"
+  done < <(grep '^image ' "${GENIMAGE_CFG}" | cut -d ' ' -f 2)
+fi
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

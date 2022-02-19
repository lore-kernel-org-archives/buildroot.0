Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA236C433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 12:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BEB7408D4;
	Sat, 19 Feb 2022 12:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zwLqKeuFBlYR; Sat, 19 Feb 2022 12:28:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B73DE408BD;
	Sat, 19 Feb 2022 12:28:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F2F91BF3DA
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 12:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CBF06070A
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 12:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnDvrUf-iYsC for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 12:28:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43C2E605A9
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 12:28:28 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m27so7100219wrb.4
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 04:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gfkli/1pEwfSIftkzABJgIEfod2JBYlwBm2MGP1v8DE=;
 b=LQG1kL2Ya/8XBnK3u/OR56DfpQLs9nl/Kjt1AsMkb1J8u5B0bdvTk6TqLWvu0GxUHl
 IpfxSiI35a/RBUC/tH1N+oKjdMrGPb2eN3mILM5jGZli+KVhSFu+xtsVvUBaARdwJeZX
 gDBE10Ej6jxLJyNoKi8z9bjWpwb0N2wEhQkNxD4bDnOQ6Idejk6vi/UjNS2j0y9WISHe
 HYwYoi+Xu3xscR4+RziFIy4uriES6Otmt9OWz0xzTJq8fa7qncVb2ieby+MHet+ToG6e
 6/goRKI0+iJAjQ54ORc53gVbWUtoOw2XOtdUV681llK6NM98bzo6mLTDHAj2AW1ZIsll
 W90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gfkli/1pEwfSIftkzABJgIEfod2JBYlwBm2MGP1v8DE=;
 b=6x4IoZhhx03h72z4bM0XyeToEa0Hlu5CMriAETEtVa62KpozGbmv99ncndDHE/5XgI
 0PN+dFgyGTFG0wNVWj1Z1qbBID91oW6EArOPj5TGBdbFnpmzGEc1pSfbhTerbo2mR9Qv
 Y+a99fmm9a7gMWyjpLZppiyVtrD3obnkpwRKQtirIff2gzxCFVEjzXxtjK+huq33gVLI
 3CwdHfB50IVMybDbEoR6u1pV/jC2ETubt5zJ4Sz1CLbpt3pg5Wb3iIUTHkTnMs8I2ged
 HkRF6fafib18eHhd6JBi7c0+UtTJNAYsuOipGT0NbiYNJ332i1eRAzBB7+cQO8e0M9I0
 0gzQ==
X-Gm-Message-State: AOAM531ONh9nBsVEua/RBAzjHMnB23WSyN9Hj82zI346cyukgEN/1OnW
 tgNMDAt4jlc9Oi2svWQJ7nxy8MWF2xY=
X-Google-Smtp-Source: ABdhPJzBmAxIItydOlyDJGK+8p+V4c+F/Tb4C+02rIKSVneknRSNPowyFagxkMpwaNKPAIiQZS3xZA==
X-Received: by 2002:a5d:6d0e:0:b0:1e2:fa3d:7f22 with SMTP id
 e14-20020a5d6d0e000000b001e2fa3d7f22mr9323049wrq.142.1645273706288; 
 Sat, 19 Feb 2022 04:28:26 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id b15sm43364087wri.96.2022.02.19.04.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 04:28:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 19 Feb 2022 13:28:31 +0100
Message-Id: <20220219122831.2961097-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220219122831.2961097-1-fontaine.fabrice@gmail.com>
References: <20220219122831.2961097-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/expat: security bump to version
 2.4.5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Security fixes:
 #562  CVE-2022-25235 -- Passing malformed 2- and 3-byte UTF-8
       sequences (e.g. from start tag names) to the XML
       processing application on top of Expat can cause
       arbitrary damage (e.g. code execution) depending
       on how invalid UTF-8 is handled inside the XML
       processor; validation was not their job but Expat's.
       Exploits with code execution are known to exist.
 #561  CVE-2022-25236 -- Passing (one or more) namespace separator
       characters in "xmlns[:prefix]" attribute values
       made Expat send malformed tag names to the XML
       processor on top of Expat which can cause
       arbitrary damage (e.g. code execution) depending
       on such unexpectable cases are handled inside the XML
       processor; validation was not their job but Expat's.
       Exploits with code execution are known to exist.
 #558  CVE-2022-25313 -- Fix stack exhaustion in doctype parsing
       that could be triggered by e.g. a 2 megabytes
       file with a large number of opening braces.
       Expected impact is denial of service or potentially
       arbitrary code execution.
 #560  CVE-2022-25314 -- Fix integer overflow in function copyString;
       only affects the encoding name parameter at parser creation
       time which is often hardcoded (rather than user input),
       takes a value in the gigabytes to trigger, and a 64-bit
       machine.  Expected impact is denial of service.
 #559  CVE-2022-25315 -- Fix integer overflow in function storeRawNames;
       needs input in the gigabytes and a 64-bit machine.
       Expected impact is denial of service or potentially
       arbitrary code execution.

https://blog.hartwork.org/posts/expat-2-4-5-released/
https://github.com/libexpat/libexpat/blob/R_2_4_5/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index a6f43af291..cd2e8c7fb9 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.4/
-md5  a712d23b7afb32e7527cf0b3fd8f12ac  expat-2.4.4.tar.xz
-sha1  6028b04d3505fc519c4c7c6bd67e1ad1a08cd7b6  expat-2.4.4.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.5/
+md5  9dc183e6c1eebc1b658c1e71be0885e1  expat-2.4.5.tar.xz
+sha1  360a49b55c442e91cb7b328bc0335083909ddf4f  expat-2.4.5.tar.xz
 
 # Locally calculated
-sha256  b1f9f1b1a5ebb0acaa88c9ff79bfa4e145823b78aa5185e5c5d85f060824778a  expat-2.4.4.tar.xz
+sha256  f2af8fc7cdc63a87920da38cd6d12cb113c3c3a3f437495b1b6541e0cff32579  expat-2.4.5.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 250600c25e..7815d61027 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.4
+EXPAT_VERSION = 2.4.5
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84E5C25B7E
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 14:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55D4B4000B;
	Sun,  2 Jun 2024 14:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7y2ff2N5k91; Sun,  2 Jun 2024 14:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36499400BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36499400BB;
	Sun,  2 Jun 2024 14:55:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14EEC1BF82C
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 14:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DF27400BB
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 14:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xp0uz1NiS71T for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 14:55:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DEDBB4000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEDBB4000B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEDBB4000B
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 14:55:45 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4213870aafdso5415605e9.2
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 07:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717340144; x=1717944944;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4JDyC+vLjAebxLVHJfg1e5bgVccc61n7sn0vkn2jV0g=;
 b=uVjl5RG2ydUiQEAumSLrVnzCsCqBltWCKf68e5+A7dfeFy/ppetqxKmyqjTjzsEWMP
 dneZgG+KmOQkdK1t+ISyzKtda3tcLRuu/rcMlP5I/JVmRku66Ep7fiPpHpmzyiMUMwGc
 jHZw2nNQ5KtFBANWPmx+UtxsSqD8b2mnxu72KYeWlwgdx1qBB5IegtDDPYgXmK3W0Pp/
 KrooCSS2DV+mVVHY9qKKDWSzjeBSGNV7JYE/B/4kY3RWBRIMZXAcQFqP/pbW/d537rn/
 YsTmbEJPx0FtHb7UlPzir6/xHTjnaztN8l50R0Uy9tPcFtMFoz6Y7tSJEfsd7uvCs0fv
 vHEQ==
X-Gm-Message-State: AOJu0YzZOBzECK07yjcKySOont+Dt6XgUUL9NGCdydWm4hDTa9ZvWf0N
 kII+F3I44z7T/1odcqYtIyeM06vgs764K0lWfcl4TQ08tAbeBFeLUXbTeg==
X-Google-Smtp-Source: AGHT+IHTZGOKQvYKRdOLgIE4d21tfseMj50mK7fFThOUOocaa7haBVep8eDQHI5uCcBn334as7D7tA==
X-Received: by 2002:a05:6000:11c7:b0:34d:837a:9d08 with SMTP id
 ffacd0b85a97d-35e0f3335a7mr4744049f8f.61.1717340143616; 
 Sun, 02 Jun 2024 07:55:43 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd03fae7csm6419129f8f.0.2024.06.02.07.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 07:55:43 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 16:55:42 +0200
Message-ID: <20240602145542.2485828-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717340144; x=1717944944; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=4JDyC+vLjAebxLVHJfg1e5bgVccc61n7sn0vkn2jV0g=;
 b=alI5R8YSj8SjXVXccusWFMLMfygk2gbQF1rGlCiP4cfH6V9Yju5QAIrM0nlFZY8Kcg
 Bkb023TQnyfcXT1NAF/LDoV1nRrl4hl7iv+aafiZCNKxKiP+nJDZOYQfRs6JVvhwV+7L
 WhBCiOBf5HaZKB36fUJUo22/a2Kij9qjA19wuId3atcJO6IQgPx5lO2dmmpU9LR/oXns
 c1Mid7nBu8PGfQd2/1fX01fv/YMmFL2LckjqJcFqX6LiRB0cCJvgGGTtzVnSZO40wVmK
 /fgmu5aLOXG5hQk73qHlrYmQJPriaG3Fk8R9eimplwnEG++WC7AHMu5Tzazd4PDebMBy
 npoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=alI5R8YS
Subject: [Buildroot] [PATCH] package/pkg-download: use _DL_SUBDIR as root
 dir of generated archives
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, when wegenerate archives, e.g. for git, svn, cargo, go, we
use the package _BASENAME_RAW as the root directory of the generated
archive. For example, for package foo at version 1.2.3, that would
generate an archive rooted at foo-1.2.3/.

This is usually what we want, except in one specific condition: when the
package shares its download with another package *and* it is a generated
archive. In that case, the root directory will be different for each of
the two packages, which is incorrect, but was so far benign: we never
had any hash for such generated archives, and they were only generated
in two cases:
  - linux and linux-headers
  - barebox and barebox-aux

As we skipp one directory depth when extracting the archives, we did not
care what the root directory was; whether it was that of one package or
the other was of no consequence.

But now that we can have hashes for archives generated from custom
versions, this breaks the usual case where the headers used for the
toolchains are those os the kernel to build for the target. In this
case, we may end up downloading the linux-headers package before we
download the linux  package, so we'd get the hash for an archive rooted
at linux-headers-XXX/, but the one for the linux package the archive
wouold be rooted at linux-XXX/, or we may end up (e.g. with parallel
builds) downloading the linux pakcage first and linux-headers next.

That would cause conflicts in hashes, as demonstrated by the only
defconfig we have in that situation, olimex_stmp157_olinuxino_lime.

_BASENAME_RAW is a construct that is expanded to include the RAWNAME
followed by a dash and the version, if there is a version, or with just
the RAWNAME when there is no version.

We tweak the download macro to use _DL_SUBDIR followed by the version.

This is only used by VCS backends (cvs, git, svn...) and so there will
always be a version string, so no need to duplicate the case without a
version like is done for _BASENAME_RAW

_DL_SUBDIR defaults to _RAWNAME, so this is a noop by default, unless
the package declares it shares its download with another one, in which
case the generated archive will now be rooted as for the shared package.

This was trigerred by:
    https://patchwork.ozlabs.org/project/buildroot/patch/20240602070634.597337-1-francois.perrad@gadz.org/

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-download.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 4be45c9d12..bec213fb71 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -117,7 +117,7 @@ define DOWNLOAD
 		-D '$(DL_DIR)' \
 		-f '$(notdir $(1))' \
 		$(foreach f,$($(2)_HASH_FILES),-H '$(f)') \
-		-n '$($(2)_BASENAME_RAW)' \
+		-n '$($(2)_DL_SUBDIR)-$($(2)_VERSION)' \
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
 		$(if $(filter YES,$($(2)_SVN_EXTERNALS)),-r) \
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

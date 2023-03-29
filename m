Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C42C6FD18
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 18:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FB4361563;
	Wed, 29 Mar 2023 18:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FB4361563
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wg0V6z9vlMBC; Wed, 29 Mar 2023 18:17:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 813496156B;
	Wed, 29 Mar 2023 18:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 813496156B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD46A1BF33B
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 18:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95CAC41F29
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 18:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95CAC41F29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YU78StvMBkbA for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 18:17:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9274E41F1D
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9274E41F1D
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 18:17:26 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so17038959pjt.5
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 11:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680113845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3nJce0lE/qBg0R4YzDHhdZC13i10Czc1dAqxk+LPvhU=;
 b=g+8cVBeRDGRiCHtdYgcc2LIvygM6r7v7ww2xWa1eb85oPZaPENCk5D4fh+WdBLEYX5
 Bp8rUFqbQy8BlC6zPvAzCnEkZzszpMMGvW5lP0McPLdkC2JPOzTuPYlhgBNy2Hz0+qR9
 tBLiYBQjqhcnBNF1+6vxsBs43+6LmlvMpkuKatrUSprB0IOIsfLWqIj+hg0bw0nOCAYx
 vtzfn4sh5c6jHWqpcO0joS2gqY9QagvDE8halYrCx0QGvFcmqorHxUwlF5B2juyDUz7d
 DGJ7MDcLowEX0bpJBmdY0LJA+Ed2w5iEMc4sH88QjIZ+O3jQ3uk3YVoRFarU8PDYUbfL
 K8hw==
X-Gm-Message-State: AAQBX9crHJlt/OO7w2dZ9wSpPsGNeGcFjgVzcfdqacqS/DT/JLnB3Mm5
 Lql63aRwdTwNUBdG9rtDywQ4FnjJWOY=
X-Google-Smtp-Source: AKy350axoTZgOoJ3ejCgaxUT8kWGlfuW3xkYQVH9f+JoJIaGo4Fpk5nBlx+52zZ/jNiG2nEMdzYNeQ==
X-Received: by 2002:a17:902:e54c:b0:1a0:42c0:b2a5 with SMTP id
 n12-20020a170902e54c00b001a042c0b2a5mr28051179plf.24.1680113845583; 
 Wed, 29 Mar 2023 11:17:25 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 jc9-20020a17090325c900b0019a87ede846sm23314841plb.285.2023.03.29.11.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 11:17:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 29 Mar 2023 11:17:22 -0700
Message-Id: <20230329181722.242619-1-christian@paral.in>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/runc: security bump to version
 v1.1.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the fifth patch release in the 1.1.z series of runc, which fixes
three CVEs found in runc.

CVE-2023-25809 is a vulnerability involving rootless containers where
(under specific configurations), the container would have write access to the
/sys/fs/cgroup/user.slice/... cgroup hierarchy. No other hierarchies on the host
were affected. This vulnerability was discovered by Akihiro Suda.
GHSA-m8cg-xc2p-r3fc

CVE-2023-27561 was a regression which effectively re-introduced CVE-2019-19921.
This bug was present from v1.0.0-rc95 to v1.1.4. This regression was discovered
by Beuc. GHSA-vpvm-3wq2-2wvm

CVE-2023-28642 is a variant of CVE-2023-27561 and was fixed by the same patch.
This variant of the above vulnerability was reported by Lei Wang.
GHSA-g2j6-57v7-gm8c

In addition, the following other fixes are included in this release:

 - Fix the inability to use /dev/null when inside a container
 - Fix changing the ownership of host's /dev/null caused by fd redirection
 - Fix rare runc exec/enter unshare error on older kernels, including CentOS < 7.7
 - nsexec: Check for errors in write_log()

https://github.com/opencontainers/runc/releases/tag/v1.1.5

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 6c8fddd397..eee2e34cbf 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4f02077432642eebd768fc857318ae7929290b3a3511eb1be338005e360cfa34  runc-1.1.4.tar.gz
+sha256  76cbf30637cbb828794d72d32fb3fd6ff3139cd9743b8b44790fd110f43d96b2  runc-1.1.5.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index b60f1da2e7..9c6b5f9b37 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.1.4
+RUNC_VERSION = 1.1.5
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

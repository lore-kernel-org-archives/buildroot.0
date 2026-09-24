Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233CBC9830D
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 00:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89D7F8156B;
	Thu, 24 Sep 2026 00:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxytSqYX5tJt; Thu, 24 Sep 2026 00:01:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 81B4581568
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790208114;
	b=MVnqfAuAFMtBhTTY2bxcJLCqme6P6ZEndk+vYILzg2cx+TxADaItipYiaMLXe0O+97eo
	 k1VntEQ9Mi127YjDCi4UbSWVZx+qfEjbCLp6YfoY3z7k6HVXTXfE9wJvNHp688yOlJyX2
	 AGa2wh9VTdtrWGbEI1a28MI3f0OdavZZ0ySN7vJmPuVGz6KEHWSXv559bLqKb0gmeZo+L
	 VFSGrm4WxJ0LIkEJ6T9ub1+7QXUoKwDoVfiV5VWASzTbs6H0aA/xICyMCCl09jfhZSAq5
	 Mv7pujjmIYJ7igwH6b2VIPAiTh58kVAGg9FDdjXTtV4HadsfRazSnP8fcYXSSaN4xMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790208114;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ErKdqCGlSrq7fIcSjt/IaJMbsSNkOOETL8BQPm40CQM=;
	b=UntR9NqRzDTa3p+gdMf2yQtYghAMCGAW/p5Aqt1oLpqXn0y1WqaRAuWflbk1LvfFzA+z
	 GBjeuyp2OOfnfJcdvqasuShnV0nBMYU/rzGhD4MmcutX0a2Q+GHU/4qGBUTKNUbXhpBtD
	 u883JzNO7j67khRpRemXDvSqk7EKK6Mt30EsjVeJNImsJmcQhQQ/D1HlX26rvvQrZ4MAo
	 qGdA7ror/ZtXHf9NZYl7o/HSgaMSxcBgMH5IETne7jJPkzA3+GSfOWI8Cx4ZuUbLzvzgC
	 unuOcuzgQSDFPo9fSts0Sw1VM0iw0GeX/omEVhQRnzc7kG9cIwZ6kL9qzyIh2r35TAQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790208114;
	bh=ErKdqCGlSrq7fIcSjt/IaJMbsSNkOOETL8BQPm40CQM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VOfymUsS0+g5oJ4ldYMcf0YXrXOuZE65Fyuj9nIDjpoFae0T6+dMUY8RSFHomqLry
	 uyx6sRfGSOgqpRYGsJ/O25inB6cno3IREqjx45kcbR8zmu4yQpxfSp0qekDsddHP3W
	 3NINaZZd9OBmkGm10UH3IHVEyafR5bWPvLA1+q6Fz7+arYsHPP+SvKAu05oZL/Mm/z
	 MuT4/vwX8DiLcNFxEXIKdL//onouYESKxhsHgkDF01MhiJnxyRKQr1zP9g/v4u/ewD
	 LE5ddI8YAN/DrJZnOC1XL6yDn4ZhTKH2/bApdtDCt468jsJoiMMWE1CULdhRft9CPG
	 gMgBSdQlK2jgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81B4581568;
	Thu, 24 Sep 2026 00:01:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B1241344
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 00:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C6A781568
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 00:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYwq4xjQG0Rl for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 00:01:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 28E358112E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790208111;
 b=QEsSQ2C3Q7dx3y2JyDXN/dBD3xPKlSMR8t4zLqfBovBrHPUKWwSgDXT1LGcWZNdXjXtx
 O4zF1tv0lLq8d/OtigTtif0q3wrzr0WGwrhp++qBP7Bc4Ib0YVc0U+BRpt3povUWMjeO8
 IRWxbiNWDYMdySRwR3grD3K0YXb+asho/8fa3qxaSfw1IXR7iD6eE/pMH2Hu5mVf7t/8G
 BG9sXIX85+hOVndJmMG2+OcYgY3CSn13ldkqN7JlKmy4q1bckdUs6GETTjaa7X8TfRdKR
 1PkWBlGW1T6b844OPkhj1fB4vQ9AVX1+sVWoDsEn+zOrt0SAO9r/ocmZXdB0xud/xXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790208111;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=IaTdFpacJCLEWg9jmzPxrYf83a4lYwv/RykpuQrPwXE=;
 b=LuF8LClKPVkQg+imCMfLQb73qYzRuseslQTAV1bdKwQ1la5YG6I2eIFaRf6EAJsH/gDE
 NV0Cr56Ztuk3QhJOAszfXSs1cBlHI5iaqENkCvFyv2T6RdEItJSmYK+iN/GRNvIQZjjvv
 k1BSQIAztMaPhG7y9t4YgQRd2RwpphWZ+Wvloo6gTlnvmtgp1w7S8mcDtY4zdGGHKXwnV
 mKLLRTvk5cpvMmKZznmoUix/LKkL1As37Ktk7TOY8VceFsXQcYmLiO0bmhwHKEN9pQkSV
 ZhWJr6P8NdJBoFpg7OUxuub6Mqhwc/yuhVQGWndnfssziJkCqDjDGliFX+0b4cLk7pg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=broadcom.com; 
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=OSbF1dKv; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1061"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1061; helo=mail-pj1-x1061.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1061.google.com (mail-pj1-x1061.google.com
 [IPv6:2607:f8b0:4864:20::1061])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28E358112E
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 00:01:50 +0000 (UTC)
Received: by mail-pj1-x1061.google.com with SMTP id
 98e67ed59e1d1-38d489b6b71so472632a91.0
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 17:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790208109; x=1790812909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=IaTdFpacJCLEWg9jmzPxrYf83a4lYwv/RykpuQrPwXE=;
 b=ZZDxEjboe+5hSJqC5NGNgJ2PI2zNa0B83zPjJ2XAn6JmQabvTXPNTTHyLcp/c8u+S1
 FhxMhEu4f4XYNDTJmQv4S9EAl8I6P2iiYGpaMTIJUDDTCr11pQoG6FY3aGPI+2lYrR3s
 qNftwYGXvvra+OIBlUgx/dWMDH2gBl66DAJLIZUyUKfYRjvqb7MCxIrCfm242jV79t5f
 WL7KfA5q79Jrz8xAsPMz4ng3oFx9m5sj/9D55E6VClFexa7y7viGp1mdYCkLFQh3KROd
 AvZFEBDefdNpnUDr36iAedjZOahwHyaDanyngDa2mtmgjl67+1drWVVLFSGgat8hcp8w
 8IZg==
X-Gm-Message-State: AFuF++kQV8tCvRZm82fXZomORvua2k9n6DMhipsE8Ikn25VgwQ54GJ04
 B0Yug+31o109BKjGQZeS82kx9MmT5acjTcho2FatUdJ7ODFARfjxKCjBj6j+OUEdlGygvpZjS//
 ZudT/hzw7U2LZvbHc/7GEWDsTBgGUpuhiWHBaegdnYU7yAFVp8tNETnzz1H6JK82ugLj/90fleo
 dT4Q8YONcb79jWUcnsgbxy9lyEPEXo2Jvv5OVlMiL6T6Bpf/xlhav5gSssc+nkiKz4DcmvQqJWQ
 gJPUwMEoyyY
X-Gm-Gg: AYBFou2isgdFiJBqbxDO4qZPKZibkgz2VHMku7v6UOCVVznEWUjCrO9/FQI4b0Y6ezB
 raNJeqACw1j7mIcgUSwK7e32A8c0tQAysxq0hhA1g7VnBn5Xx+hXC8c9MRJ6eFl7PKfzqmqAzTX
 1Zhk73hv0MN5Nn1at8WxrzaIRJGbkTjJiAcSAW+QL0v7DnbehU8+kk2RHE43VllgPpY4KA9KzTM
 A57jIH2NCuwGEFaF1wXQijzgLfOT5ZAglPzEygXM4xV3nxdc6PL3OdytQPxoNbCvcUF1zlYzY6P
 X41xOdXFG/TxZTEtY9XM0hJ2CkSAxHuYHcRtZQpmMvbGlVMuff3BJnYiRZhTPEaEpOV41N4Lk+h
 o2/iRVNhTQHit5+dhqkyPjPLHkklvTNcAYYaVctH7P7sqrrrUW+I6VJsSAuxHD7DPhGwpbTJt7P
 DzTs1r5nRX1apZJaaoMLkar5Uh5b7UgwPYgOMkLQ==
X-Received: by 2002:a17:90b:2e49:b0:3a0:4146:2954 with SMTP id
 98e67ed59e1d1-3a09875ff59mr545488a91.27.1790208109420; 
 Wed, 23 Sep 2026 17:01:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3a0972e9abesm498286a91.3.2026.09.23.17.01.48
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Sep 2026 17:01:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-33baaba6371so405056eec.1
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 17:01:48 -0700 (PDT)
X-Received: by 2002:a05:693c:88ce:10b0:33e:633c:7f70 with SMTP id
 5a478bee46e88-34003ab0075mr529053eec.35.1790208106334; 
 Wed, 23 Sep 2026 17:01:46 -0700 (PDT)
X-Received: by 2002:a05:693c:88ce:10b0:33e:633c:7f70 with SMTP id
 5a478bee46e88-34003ab0075mr528896eec.35.1790208103267; 
 Wed, 23 Sep 2026 17:01:43 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33e95c7cfd9sm9233869eec.5.2026.09.23.17.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 17:01:42 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 3B758B0C; Wed, 23 Sep 2026 17:01:40 -0700 (PDT)
To: Buildroot Mailing List <buildroot@buildroot.org>
Cc: Markus Mayer <mmayer@broadcom.com>
Date: Wed, 23 Sep 2026 17:01:29 -0700
Message-ID: <20260924000131.833732-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH] package/linux-tools/linux-tool-perf.mk.in: fix
 doc build issue
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Address potential document build issue when BR2_PER_PACKAGE_DIRECTORIES
is enabled.

The perf package wants to prevent the documentation from being built,
since it won't be installed anyway. The trick is to create an empty
GNUmakefile in the proper place. It did this by using a POST_PATCH hook.

The reason this approach works when BR2_PER_PACKAGE_DIRECTORIES is off
is that the build system ensures only one package builds at a time, so
Linux's "extract" stage and Linux Tool's "patch" stage can never execute
in parallel.

However, with per-package builds enabled, there is no guarantee that
Linux has finished extracting by the time the linux-tool's POST_PATCH
hook runs. This means the creation of GNUmakefile could silently be
skipped if that portion of the source code hadn't been extracted yet.
If, in addition to this, asciidoc happened to be installed on the build
host (/usr/bin/asciidoc), perf would detect this and enable the doc
build stage. At actual build time, it would use host-python3 (not the
host's system Python), which does NOT have asciidoc, and the build would
fail.

  INSTALL libperf_headers
  SYSHDR  /local/users/jenkins/workspace/[...]/libperf/arch/[...]/unistd_64.h
  INSTALL libbpf_headers
fatal: not a git repository: '.'
  ASCIIDOC /local/users/jenkins/workspace/[...]/tools/perf/perf-amd-ibs.xml
fatal: not a git repository: '.'
[...]
  ASCIIDOC /local/users/jenkins/workspace/[...]/tools/perf/perf-data.xml
/local/users/jenkins/workspace/buildroot/[...]/host/bin/python3:
No module named asciidoc
make[5]: *** [Makefile:275: [...]/perf-data.xml] Error 1

Turning the POST_PATCH hook into a PRE_CONFIGURE hook solves this timing
problem and guarantees that the "fake" GNUmakefile can be injected into
$(LINUX_DIR)/tools/perf/Documentation as intended.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 3238948d7608..6d58282ee0d9 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -140,12 +140,17 @@ endif
 # distributions.
 # We name it 'GNUmakefile' so that GNU make will use it instead of
 # the existing 'Makefile'.
+#
+# This is a PRE_CONFIGURE hook, not a POST_PATCH hook: linux-tools's
+# patch step isn't ordered after "linux" (only its configure step is,
+# via LINUX_TOOLS_DEPENDENCIES), so tools/perf/Documentation/Makefile
+# is not guaranteed to exist yet at POST_PATCH time.
 define PERF_DISABLE_DOCUMENTATION
 	if [ -f $(LINUX_DIR)/tools/perf/Documentation/Makefile ]; then \
 		printf "%%:\n\t@:\n" >$(LINUX_DIR)/tools/perf/Documentation/GNUmakefile; \
 	fi
 endef
-LINUX_TOOLS_POST_PATCH_HOOKS += PERF_DISABLE_DOCUMENTATION
+LINUX_TOOLS_PRE_CONFIGURE_HOOKS += PERF_DISABLE_DOCUMENTATION
 
 # O must be redefined here to overwrite the one used by Buildroot for
 # out of tree build. We build perf in $(LINUX_DIR)/tools/perf/ and not just
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

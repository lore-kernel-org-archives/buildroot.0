Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBD7CD3446
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 19:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDDDE83CA4;
	Thu,  7 May 2026 19:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_TIMXL2uVYy; Thu,  7 May 2026 19:51:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D911383D24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778183464;
	bh=pOR/jxLOfOoO6K+eNX/nJRu3S8EFtb2logwJ65gkTGc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GldWEPmSxbYS8+oE7nm2MoWNda8rqqBySUY4IIvJX0QCHxgtc7sPbc06Rog+NZVo3
	 goRHEzObgDjWCsMVdF3DonyHFsUqw3/7LDBLQ5nANMIonHWahoAfKONCyIgqvVDZHy
	 QkkZIG2vfatW9G6snemfZfcesRJtxj0R8aW1L64ofnKp7O/weQO1z6bd0LMuGFBdhz
	 E1SGnUcanmwIp18sWdUQM5NqUeZC2tiYXsMesuKx3RL5M+bn7mkx1Ghk6u3rLs7xHZ
	 gIchrOPl7VEeRfJKfgDeAyY3zhtrJhQoRWWyio7buYbksbkL3EZKLZzbJvfpzWkiMt
	 AJP7U0Y8aC13A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D911383D24;
	Thu,  7 May 2026 19:51:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5231D317
 for <buildroot@buildroot.org>; Thu,  7 May 2026 19:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3840541220
 for <buildroot@buildroot.org>; Thu,  7 May 2026 19:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5RgFNveF6Wr for <buildroot@buildroot.org>;
 Thu,  7 May 2026 19:51:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A0EC940FF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0EC940FF9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0EC940FF9
 for <buildroot@buildroot.org>; Thu,  7 May 2026 19:51:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -964494309; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 07 May 2026 19:50:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wL4kG-00000004CnI-0B5h;
 Thu, 07 May 2026 21:50:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  7 May 2026 21:50:46 +0200
Message-ID: <20260507195049.1002469-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507195049.1002469-1-peter@korsgaard.com>
References: <20260507195049.1002469-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mBJWImHv+MXRknY9mbM6Vaj/OwphbVoSODIMiUgp1E1AKz+4IZbIGNPBvaXBR+baUA2y6lCEeU/d65SRNSwHegSQl8VktH2iG316GCfr987jI5ox4Q762NK9moqY0Be4g5sjqytJs/rKUdFmxtaQFDfIIMyjYa29JaRVYhO2Cl2BSxrjaLftsMrEZD+AJ5/mlcagRD0UE2rjhP61KEFO/wLABXRJ1lDdHQ7ViGpyBmZKbkqzsM8sZ9+2wJKGqNcDHjYK3NoySNVIv8VPALpC4HnNWYHWH4P/SY6mbsbi7oVOxrpjXDKbdEnQSAPdndi8sVQhIdwUJC/XRYB5EDbzoQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=1vA90lMagWE5StTeeXOlNsINA9DqB5Vi6HCSJI5Tl5w=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=mBJWImHv
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 2/2] package/go-bootstrap-stage5: security bump
 to version 1.25.10
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

CVE-2026-33811: net: crash when handling long CNAME response
CVE-2026-33814: net/http: infinite loop in HTTP/2 transport when given bad
                SETTINGS_MAX_FRAME_SIZE
CVE-2026-39817: cmd/go: "go tool pack" does not sanitize output paths
CVE-2026-39819: md/go: "go bug" follows symlinks in predictable temporary
                filenames
CVE-2026-39820: net/mail: quadratic string concatenation in consumeComment
CVE-2026-39823: html/template: bypass of meta content URL escaping causes
                XSS
CVE-2026-39825: net/http/httputil: ReverseProxy forwards queries with more
                than urlmaxqueryparams parameters
CVE-2026-39826: html/template: escaper bypass leads to XSS
CVE-2026-39836: net: panic in Dial and LookupPort when handling NUL byte on
                Windows
CVE-2026-42499: net/mail: quadratic string concatenation in consumePhrase
CVE-2026-42501: cmd/go: malicious module proxy can bypass checksum database

go1.25.10 (released 2026-05-07) includes security fixes to the go command,
the pack tool, and the html/template, net, net/http, net/http/httputil,
net/mail, and syscall packages, as well as bug fixes to the go command, the
compiler, the linker, the runtime, and the crypto/fips140, go/types, and os
packages.

https://go.dev/doc/devel/release#go1.25.10

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash | 2 +-
 package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
index 5e40ba7e6e..58391471d9 100644
--- a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
+++ b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  e988d4a2446ac7fe3f6daa089a58e9936a52a381355adec1c8983230a8d6c59e  go1.25.8.src.tar.gz
+sha256  20cf04a92e5af99748e341bc8996fa28090c9ac98765fa115ec5ddf41d7af41d  go1.25.10.src.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
index 9006e5bf44..85468414a2 100644
--- a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
+++ b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
@@ -6,7 +6,7 @@
 
 # Use last Go version that go-bootstrap-stage4 can build: v1.25.x
 # See https://go.dev/doc/go1.26#bootstrap
-GO_BOOTSTRAP_STAGE5_VERSION = 1.25.8
+GO_BOOTSTRAP_STAGE5_VERSION = 1.25.10
 GO_BOOTSTRAP_STAGE5_SITE = https://go.dev/dl
 GO_BOOTSTRAP_STAGE5_SOURCE = go$(GO_BOOTSTRAP_STAGE5_VERSION).src.tar.gz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

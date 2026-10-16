Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C306CCF2C3
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 21:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECBA18142A;
	Fri, 16 Oct 2026 21:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QApXe1deEfu5; Fri, 16 Oct 2026 21:12:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F18F68121D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792185159;
	b=D/OQOCV0+yH68kjxehNg5Cr0VIcJFgUW3dQ0z/gk4fSB33WPo05SYXQuWUAQux+/ukKs
	 IYU9eYKYYQKl/TG9aIBCQmXShN+QSzA61pwjndPjzwGbWGNzy70vNAAKqEvu/tc9qd7QC
	 vTgJjaVlvP7s2CLLvmVsDx+mwt2gpUvVa4s5+jssS4LtsQhd0ktPs77GBXA/V/IdOgJE6
	 yDvolkMvgzs0AobndUBG8DF0YUqvb2I2+cyS7zHNflXzNZAiKLFz/DPM2TexpXPa7hYOe
	 LDoLKUe2YqMsqLg6J+zXjL+Ev6hSHPFFKBfr6pMPScjPyYS3d7l/8lr6fvsltKevXEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792185159;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=o5fB/7OJ3G6N136RG+x6dFtgWsUNK65PE2r1fjpXPN4=;
	b=mVegF7H8U1o4SS5pWu6eM38kNnoP/2OBxBA0WPaATp8REehJDfuZCCPBuXu/uQqVO21P
	 WZr1iK9WqJAeSsregBIa5TWAaqY1ZivG3hv7bmkvb0/ixOpL01TSgvF/FLPmSNNkSfW7C
	 N7zYtk0mzxMDtZ9OJCNSyBzmea7dMftNOY9T6V6Lehex40ah4DABJWg/BYee35ZRP5ssd
	 0x6J7pvPgFc7V1zujCj3lLSFHi8yRugq7K/+XiI572P6Vf7fnJhdC3zjjtd2xCePX5Th3
	 lh+51RNDfe7XjhyfBiWKAKRYrHeVtSgKAd58OKnysxrf/3/NbxVBOK0uJ3ZYn3ZvA2w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=n621.de;
	dkim=pass header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim header.b=BqL+FDP3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792185159;
	bh=o5fB/7OJ3G6N136RG+x6dFtgWsUNK65PE2r1fjpXPN4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aG8fJbItYJ5lWSprxqmrggxodVL7T2YE6fGamV88x4rrC0IjH1Tf7M7nsZP1LEL4/
	 rTJruva3Wj+RTAJdWpqIj+nsib/bV4IIBX4kI+rFXekVDU0GaeG1AFVbpc5hz+Gb80
	 +MxYL/kE1x1mWZrY+Q3rouS7nivSP64ghEjAUcbcX9eFk6hFg8rFcHPFxmSNtSZ62J
	 aaWnrfsaonp0G3H0x2yoCIPQI9a5N/rh6+WHHqj2kfvjXwubvVKcW4GZawWKvWQcWx
	 RwhaURDJO/UwgLpckoFjv6/s4HjUtDn7u6kZu8HbDeMEgmaeY4ZBzWCMv60g/Tu+XN
	 Zwj0x+WSJFRzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F18F68121D;
	Fri, 16 Oct 2026 21:12:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44AA779D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 21:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35E928121D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 21:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vd_hadcaJviE for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 21:12:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E79A481193
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=136.243.2.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792185157;
 b=UaC97Z3PV1jl/GfpiufE7p40E+0qahHNLwQMVwb1GVyI7VOz9Vu09QzxiLefW4dvVxNP
 eFnAvYe5I7iLk1yjMRWN73ta9GvevRZGeDYUAt9ddFxz7lHXi9u78tZaFXmC8cMjszrFx
 flP/1J3jfv0VeeWxq3F/hkoUeqMmshPQgUiHV1Y3tT5UZVRP+15UG/XPiWSMr4yByNKwN
 gjbIE8pVlm5QoRj5NephXWfS7RTpXOIlDO5fOVZ6SV42Ku0GjI8Ugn2u5nG+wh6nyK/VV
 tpfETSFKxaP8nLhLUCc91abdvKXhVSspJ+3UPCiN/JuD1h7p9LAr4bHZw3xQMzwYslA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792185157;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=tXJwtN7e5Ie6dsr3fJ5xvCpG8/jLwAtFymEWY9DAtUU=;
 b=kpKajGPV4x8oypMj8/4JSLdgCizKSFGbgwtpZGhMu3GASikoZXPkGg7L4mMzOMK7l0qb
 X5WNS8tn8rjmdsxyXb1YRs4uOexAs3JCj2irbu1PLyHIP0Iwe3NWCr/9czDsgXj/1t4Jw
 bRZhFyCpdlqIpkkqvrU7ODGbwOKO9h1zwr2GqenQ+FxOOoKV7+GBc+LRMYYlk0TQP3gMU
 N32d8sjY7QjleyVSV7JdGAvXObFLqMD8DQbpVs9mx5nUF7M/uj8dj3LOeXHKIOAt/0LG3
 WWsLJzxQb0UFLmOjjRS93Bw6wqRrzLDOPHJMJP4GmgmXTSolXbKi0XghmzUlH5evKvQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=n621.de;
 dkim=pass header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim
 header.b=BqL+FDP3; 
 arc=none smtp.remote-ip=136.243.2.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=n621.de
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=BqL+FDP3
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E79A481193
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 21:12:36 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id D92EEE00149;
 Fri, 16 Oct 2026 23:12:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n621.de; s=dkim;
 t=1792185151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tXJwtN7e5Ie6dsr3fJ5xvCpG8/jLwAtFymEWY9DAtUU=;
 b=BqL+FDP317ikS7W8ugC7g9iGkQDIGmDformi7gpbM8l8rO+8zcXif1cGb0TgK5+e5SSanH
 45jPpQJKMB364Gjb+udp/YW/W5Yea9XEEq2IYrqjs7ZatdeQ9Vjq925d32OEjvFbGAD1r9
 A+0UKGgXaEDn9ecLXpk29YnUfmqbGB8=
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Fri, 16 Oct 2026 23:12:09 +0200
Message-ID: <20261016211225.30380-1-fl@n621.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sigsum-go: bump version to v1.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.glasklar.is/sigsum/core/sigsum-go/-/blob/v1.0.0/NEWS#L1-34

Note in particular that this package now requires Go version 1.27.

Signed-off-by: Florian Larysch <fl@n621.de>
---
While this nominally includes a security fix, I don't think this needs
to be backported to the stable branches because:

 - The security fix only meaningfully affects log servers built on top
   of this library (this is to prevent log poisoning), not the CLI tools
   we build from it
 - Those branches don't have Go v1.27 anyway
---
 package/sigsum-go/sigsum-go.hash | 2 +-
 package/sigsum-go/sigsum-go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sigsum-go/sigsum-go.hash b/package/sigsum-go/sigsum-go.hash
index 4e3cbeb2d2..70b0dfe67e 100644
--- a/package/sigsum-go/sigsum-go.hash
+++ b/package/sigsum-go/sigsum-go.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  01ff9b579012bd36715de96f5474c8bfe7778daf4cb04d3049004797fa6cb5e3  sigsum-go-v0.14.1-git4-go2.tar.gz
+sha256  048ec174f8fdaae3237472198ad0e4c9c81fac1d9b83a86290ab3a6c48ed8d31  sigsum-go-v1.0.0-git4-go2.tar.gz
 sha256  6a1e3378dcd18baade08ac30ec4ba33b72d1b1697c00226ef85b9c9cefdb4e65  LICENSE
diff --git a/package/sigsum-go/sigsum-go.mk b/package/sigsum-go/sigsum-go.mk
index cd99e786b7..9f0176644d 100644
--- a/package/sigsum-go/sigsum-go.mk
+++ b/package/sigsum-go/sigsum-go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIGSUM_GO_VERSION = v0.14.1
+SIGSUM_GO_VERSION = v1.0.0
 SIGSUM_GO_SITE = https://git.glasklar.is/sigsum/core/sigsum-go
 SIGSUM_GO_SITE_METHOD = git
 SIGSUM_GO_LICENSE = BSD-2-Clause
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

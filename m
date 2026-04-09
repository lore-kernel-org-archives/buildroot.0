Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9759E9DE66
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7AAB40FCF;
	Thu,  9 Apr 2026 08:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3--GO2FQfr37; Thu,  9 Apr 2026 08:14:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E18D40F33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775722468;
	bh=yfQAffLfpsUbYztxvvAT1IDp1BlwkyBX08OvTL+xAsE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gchVksqgkceE7Yyuu869C+NKYyWtlQgsZb19rNdaW/+ci5MkfPuXyZx674UfjC94s
	 VnjU9Ktl0jKnUH3LY/uvqzApsHzWA59W7DY9l8KuSTxk7VKafcH9XrEXzNSgXmsr4a
	 9MlCsyYLvVwBVo8QW1/3/EIqmiEUtDUdVW5Znzjv8R+VI5lorWa6Y7AHobMQr62dYH
	 BeDj2IdCPH1gcmXO4sK65YawoDFU4NmoHmP/+ntbs5tFMjyUYitWD1hthKXBPIEi54
	 lDtMHKqWjZBCP6HlxIAI1std1fzngh7+ENyb/XLoGrezJFodHVRD0RO6xEShtjKLfH
	 Ahg9waZOU7sRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E18D40F33;
	Thu,  9 Apr 2026 08:14:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94CDA23F
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86CF84039B
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ykIdBZ2jNOdb for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:14:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A072440264
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A072440264
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A072440264
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id EFF635A000C;
 Thu, 09 Apr 2026 10:14:18 +0200 (CEST)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FzIeNl1SO3l; Thu,  9 Apr 2026 10:14:17 +0200 (CEST)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id DD9685A0003;
 Thu, 09 Apr 2026 10:14:17 +0200 (CEST)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  9 Apr 2026 10:13:55 +0200
Message-ID: <20260409081401.2060709-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1775722457;
 bh=lmWvSNjxjQqovUCc1LkaU+wje56JdDg56ZxGnp0LtXw=;
 h=From:To:Cc:Subject:Date:From;
 b=PTW3VAqNywDWMbUoGkdGnuI0LqzfKek3Xr7qAjI/fTkj9/KUoYitJ3LjSudtr5X3D
 QPSW4s3XdpjD3G1l40F/WiV2Mq+CvksfOG8+wUiJvAbOh7AOEQy0S9/d4QlzD1P6AR
 cGQtp9nKy+McjJiCAghpps5ORdobaq7amzj0/dItIUzEt+MzD6F2f5eH8nbfQE+H+I
 91wqGPueywMWxv6RDRQYg8KdGLH4TkV8CmeoSa0zBw8pISI3vrADh8l+ejhg9U3QiM
 q4lm3h0YxMHhPYx4kdJSwbHmZLOyZutX3pemNVBcf8wNMBu8+xAgCb8ZJa4oL/DhRV
 ZS+oAj/f/XbNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=PTW3VAqN
Subject: [Buildroot] [PATCH v4 0/6] Extend CycloneDX metadata
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

Adds SBOM component externalReferences with source-distribution URLs and
hashes, basic unit-tests and a minor fix root component dependencies.

Changes v3 -> v4:
  - Fix test data to properly model virtual package provides/dependencies
  - Add docstring for root component filtering function in patch 2/6
  - Refactor download URL extraction in patch 3/6, preparing vcs support
  - New patch 6/6: add vcs externalReferences for packages sourced via git

Martin Willi (6):
  support/testing/utils: add basic tests for utils/generate-cyclonedx
  utils/generate-cyclonedx: remove indirect dependencies from root
    component
  utils/generate-cyclonedx: generate externalReferences with
    source-distribution
  package/pkg-utils: add 'hashes' to show-info
  utils/generate-cyclonedx: add hashes from .hash files to
    externalReferences
  utils/generate-cyclonedx: generate vcs externalReferences for source
    repos

 package/pkg-utils.mk                          |   7 +
 .../tests/utils/test_generate_cyclonedx.py    | 240 ++++++++++++++++++
 .../cve_upstream.patch                        |  11 +
 utils/generate-cyclonedx                      | 110 +++++++-
 4 files changed, 367 insertions(+), 1 deletion(-)
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx.py
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

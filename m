Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD64DCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8655960B5D;
	Fri, 16 Oct 2026 13:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2zS-booFPUUQ; Fri, 16 Oct 2026 13:09:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 90E0460EF5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156185;
	b=TIVoQ7NvlO6WWSFFF7Vyy+YvE4tc3TuUWSiFnbjGv98vrJlrgQ0M0ExbwcAhWrjTf/19
	 gt4KDAX1FOz335GU31Wp0Qvk7GwONUe62+8nqBb8dHAscP0PJJUbeQp7mkV5y/i1bWKkc
	 eKkMJskd3AUmyYRAupfNtLJVnz3wQT6Le+qphUgKhb03K8xlaEKwhMHOLNT1pRcwd+QCj
	 Zu2UQHIJYhnrcrctFNvIH8boQ0yhDueUSeW9zO8kGPJW8Y4YxMUiB8zdO45QMr99clC4Y
	 Mp9odg87qPEnGE2VRKQRKovPS/aAf6dhRG2jVty0DZCTbC2ZfSHfMHNFkvYfzzyP72g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156185;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YzGMNc0rzqilwaYMgT1V0sb7LXw2ZQkaTIwQBgSelZo=;
	b=qrvpNmnOUQEzV1fLKt5jnB/Zx+rsL3eX8qmT2IdxSrzNVxSKHANbfi6mjzUCF83zYmib
	 wue6U32OFn7i+UEQkdSPrcYqzwSa0PXlufDBEzonSjWOTb9/J6w8vWw3UhcDF4yXKyTkn
	 0AzHQJT8JN6IloqdgTo/mDzVDxOvdUC2KoQrAdH6oOPPJTMFYIFxb3DNZv1hW3il9S7DL
	 wT1m4i2txSFCnQWNt041DDcDySnnHtI7eBnwPzUEhiDuZsg8YE6tMBAoQW160q2Wh61u3
	 g5Oq6HfwBtnx+agTa2u1sOtmZ5aPce3HsGv9j+NoaSOUrJTtqUPCpPY1EcHvjhy7tew==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156185;
	bh=YzGMNc0rzqilwaYMgT1V0sb7LXw2ZQkaTIwQBgSelZo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bfyyBShdjrEBizvecLgjNszhZ88yRHf66PBZGlFTTuVEeKdpC9fCqyUYFnwFibBlr
	 bPWTbXhxTA65PcXznC0jMMAC0BjkkMLZ1yvUdfBPp2lTjOWoKm5l35Wk5TFiQBowfb
	 IwWBSzRc2BgQhO2/baHak+GKAp2tZLA2q0bHzWQ6J1M4cR9ZDUxPgdOI8GWvIStSgQ
	 JkLcEvE8zzHTnVun34zJHe4LCB2IzQBkEd687XxCg0cVUq0gbRNmEz/bIUAsIputtS
	 hFA6S4PltNfKIxf3dvLAr9bqsSVlMvS7di6Q1QX7jD0HDkirnx9ULSs92aAXKuR25q
	 1/M67W+eleZHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90E0460EF5;
	Fri, 16 Oct 2026 13:09:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A82C8151A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E94881539
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KsnHcWDb8IM7 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9F0AD814DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=IYjQQz3la3BlvmDojDeu7wMgpfrFbD9kGJMPtxQDObixBVMW9htxY79T5u2uL3BY2gyn
 mTQdx0VeHVc8PwdoHE6bDedZ5JdTsMA9NJQnvDxRIlJVHvrzFqgnN11M0DAC7AJbSUQYR
 pIub/Yg4cqJkYAfU/my3Oroewa+QPu+eX8110Lc/mb/+ZyCVpKDEc7XsuLpsouSrl2C8i
 0/wj9l/PD2He7pfdPTWPm5DhRscGPlrqjD4gK0FmC1c21dIzi2l97Q84usZajfIYinW4j
 +oFL9weT2xN0wfaOsg2J376dbhHRskO6D2+bvzxFDXxSSr12q3PiVELgiDzE+Neu2KA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0cvflnshG6vSv/yLaOW6okAsY2NliT7lD2i3VNX4/x0=;
 b=VlBKcKQgOOhSk2HlKQpgXv9l8en1yFOn8VpsbWcsLvoRxrLpSddnBBzSD8zHj7jKE/aV
 KHvD4agVT8AESur+4AZmjk7cxw5+obF9Atgr27jpKkw7dYw+I52Ji019SRsFHrIVD05NF
 ttuoGnGlcZ7TK3OwppwdnFcCACVGimSAuMKftjRKUvSY/+PdY+dSbK2dOMLkqV38/3Id0
 1gysSK5bSfi6J18P8fhN8INWDUcZMcQE7J6Yksa/ypsSgwKAUAbwGWxSRz/VoHMCSjxib
 csc6I+PkMrGm+obVDu3csP/j0cgK/nCkSOQImigzJr62D436gyjzxruB82GmlVaJ2kQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F0AD814DB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90253960D5; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4f4acd09d5e34842e4230fdbe84a70076acaa799
X-Git-Newrev: 68b09e4428c7218a147b0ac5b64d4e2007c4e9ab
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.90253960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gawk: add CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0146272984494800499=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0146272984494800499==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/68b09e4428c7218a147b0ac5b64d4e2007c4e9ab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The resulting CPE ID is:

cpe:2.3:a:gnu:gawk:5.4.1:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2023-4156

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 2ee591714dec4ea3921e2da33c8022447492f0bc)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gawk/gawk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index fbb620be7d..c7be63a661 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -10,6 +10,7 @@ GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
 GAWK_LICENSE = GPL-3.0+
 GAWK_LICENSE_FILES = COPYING
+GAWK_CPE_ID_VENDOR = gnu
 
 ifeq ($(BR2_PACKAGE_LIBSIGSEGV),y)
 GAWK_DEPENDENCIES += libsigsegv

--===============0146272984494800499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0146272984494800499==--

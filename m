Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCBBCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FC14612C5;
	Fri, 16 Oct 2026 13:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3OWTMCMTB8K; Fri, 16 Oct 2026 13:12:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 10E12612B8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156375;
	b=BdDYkRh25rHd7zLopx1N+eh5OkSaexoI+/L40BHeU+g2wfaeQxt1jJFmVtGi90Yfb80r
	 SBHfsUeNr3ap20323lJj6PwCo0trRkrgQDnT0O2aBQe9eVEc2eRHqgms50fWTUJnVMoRL
	 4iNlb4GT8X9vS6JqvMDHEwFK5qvW5cpCB/q1g3zH0cOKETLX9eq1Itny9VwYATRLl78iy
	 GEshLPUzTsPNikyy3G0LhPFyhTuSX4jLER1vcT/JQJlItb0UTSRA7Pbq3Qe6fGV7mxbkW
	 U9gjXoELhy8Y+MrdVcV97OPhKq3JoGqhDeHNWSonImZdOErAn93cOKBLdH+RigMMXAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156375;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=lLQzW65WS5EtKHNKHYjTCqvjWnHmA0UGRI+yZ3r6Oq0=;
	b=fpqLo9CkQj0gCIqpCBu8BYR071Zng2sp+10qgC3+AQRBSAGCgp7WtePBFJaMf5Y+Zeuw
	 jWUds3Ij39aczAYrKH69ewUuuUxQfZkPSEh3xNp/JcSO3rXaH21S3lN7+Cc7gVRJtZpbC
	 c2xDdXhJvoRz43IrQ5GkDkVd8NMsy563vazbXjn1+Gacwc7RUR5/1L/P+tQFo6/U06bs/
	 r5QdSdyXM3v156aGTsi6Yw1y8fdWPecwK4WgXumXLxPAzy0AAqIG9i0Ci2Jk/2mP+coHU
	 nzS18kRKrXzPF37HrwEF3y+ndFYAfkDfN8gvfha2KEWd334TZJPY4tABj/yO7Ao9QkQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156375;
	bh=lLQzW65WS5EtKHNKHYjTCqvjWnHmA0UGRI+yZ3r6Oq0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RM/oeIeaspFJPdqEhh26O8gYUO4Lsy758zIybyacpyWTUQOkF1ytD7ZdfyttA9hi+
	 3ag/xLPzgbf3Z+V6Jr4zpN7WXLlYmmGdlRF3HgZukJwZe3iz9oPb215KJ81qcdTI2x
	 Mo9TwZTLW9b2iXm2enUGyoMXNcDcUbbSOGGz+aEcXDu8jFpEyGXJLhJMg4e0gwMO4k
	 3X3+GliNnJ67cLGFvwoh+CmP0H73hcGG9Gu1FUEjR4kxQY2BuVILr9WXX6WrK9L2ck
	 3hcBgunF731INFpissvpuc8W0DXGOmBtx8uAqJu9dOyScKf/b3d45xJFa29dFpnnWl
	 RD3ofwgBso7mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10E12612B8;
	Fri, 16 Oct 2026 13:12:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72F21105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58C4E60F1A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fanvHy0O98lE for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 337A460F31
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=Vd2OS37FCghnyT8UAOM93/1WxILb7qxXwtP2LuvrgD8zV6nXyxUoOTYu148VEDZwpXXd
 5ptBVWSgcVHS8Bp1AK53+tQUf5t+fA6mUI8hXrsn5r/iJcvFumbdAmhzH7RtsIV5d1Vj/
 8mJ3rMSt90rhmSt9SbEgo5bsZSgWRNZfENfF6mX/c7pPllnpraH9lWDDIuKiVewwVvcSd
 vTfJYbgBn9PuKFGIeuKElAyh9TCE7D1mDQT2p4GMm2tyoy17QfeselTNdjN2hSRr4uisc
 swsfo38nrOu9doLFiYmzYL1+bUiJmHO8lP+Wyidm7d66JRUNVpiq2DVUZpS2LbKP5uQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ruSAFH5NIkupXJkyMvEbtawVOIz6fVNh/3/bf6sfhf4=;
 b=R5Tt4d5VH0X0718GI8jyTJHSdl5K03IoiLdFmt8KNw5HO69jgk1KmCiUfLAaQ01LZ77e
 6DzROyU4V8udpNPHRXh/IA2g7H388A4KEZQCtgBhM0p5T8O07TyFFzjy5i7aQVsgL1bqL
 nv4oUznpu4V3olyVmj0KEZJhi8sB/eHfw3b9U+RJ1rA27ZUsqwjOsjUZ6VTzjUFP0As8g
 869MWNWf+1Un8hq3nZOaT/wdZtO9MKp+PLbh+gXcYG9MgcB3Uh8kgC7cJaRvHXQj+9kvW
 RIkuH/LJUG9LAa9OUhpE66yzUKKfOncijcKywMBF59vv0W4G16Kb1QZAzQUv9f80wpA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 337A460F31
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 236D0960D9; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:12:08 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 736e6bb469d5abb675935973cf806736c22ba54c
X-Git-Newrev: d4acf5377e82fc75617a28c7fb21f6bd210385e3
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.236D0960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/gcc/gcc-initial:
 add CPE
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5384938461634674664=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5384938461634674664==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d4acf5377e82fc75617a28c7fb21f6bd210385e3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

gcc-final already had a CPE.

The resulting CPE ID is:

cpe:2.3:a:gnu:gcc:15.3.0:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2019-15847

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 32d08d194509a454c80fdffa7657c9564fdddec7)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gcc/gcc-initial/gcc-initial.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 18d5cef0f8..3c484c901f 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -10,6 +10,9 @@ GCC_INITIAL_SOURCE = $(GCC_SOURCE)
 HOST_GCC_INITIAL_LICENSE = $(HOST_GCC_LICENSE)
 HOST_GCC_INITIAL_LICENSE_FILES = $(HOST_GCC_LICENSE_FILES)
 
+GCC_INITIAL_CPE_ID_VENDOR = gnu
+GCC_INITIAL_CPE_ID_PRODUCT = gcc
+
 # We do not have a 'gcc' package per-se; we only have two incarnations,
 # gcc-initial and gcc-final. gcc-initial is just an internal step that
 # users should not care about, while gcc-final is the one they shall see.

--===============5384938461634674664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5384938461634674664==--

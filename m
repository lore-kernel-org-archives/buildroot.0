Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AE8CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2528060BB5;
	Fri, 16 Oct 2026 13:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u0o0H78K80_6; Fri, 16 Oct 2026 13:11:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2F40B610DC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156288;
	b=pr0J8wyaNho7wQdwH2P1YTpo4saxjfuaqvtCzDDUBhVBPFvf6PuEggtwnjHXsuBuq1lz
	 ib8zScLRFuWZlrbM94NMq5CPC4t6jaxaBAfIzn+OAlauE6mIgau4IQ+DfekNH8cI6xVM+
	 ifelRgX2gr1f84WjadrPZ/sz+j9suqzoxxWfDzO3KgyBpuHOO4kakZKoEK3m/T11uIkZe
	 bYw27n9q3cZXzWafSSB/1p+MTBu5L/GzI0vIKvA9xLIsWlNzCOE8Xk4HIq+HM+OEuZAnU
	 H6tKOMaghX58IHCkcbU/glJp02Shz1G2ApdOHEvieAHDyIhOUre3BDLcz6qahOkL8ig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156288;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=KROvZEiLRUdQkgq2rt9Pl8L4wOp9qE79WoaTPrOBS1E=;
	b=BxjECcAd0NuwbmRhDaXKxzafq78Rnvg05T75wZ1ZnctBUr7/oWRqhTywSozHBaYwxicc
	 Zs5z9mz0tZjwHqAwlzosde3/ftIvvnAxqpG7BIv1fFo6nSXUo8s0F9k8p0Gp3ea7r79GT
	 rVz4tSZ+Egp7iWzmM7HBk4bUUXEzEdS5qykdgv7xMU4KYZw3/CXrY/TI+CTnPAh19lGfN
	 rhPax/zSdzptoMYJJK05ofQAIJDDlEbFhM2erUwvLAqHA8TOYtdRdCofdQtDro4dxLSej
	 y4ifx6BB7uHjM3niB0fjigKtk7Q01CKzY6Jb8pgkF9Q1Uuscfw2vKYG10p1hbeClbSQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156288;
	bh=KROvZEiLRUdQkgq2rt9Pl8L4wOp9qE79WoaTPrOBS1E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MgfrU/8EO+LP1Rzv/N9VRE1JAlxYoOLDcytbyI6qXf6bo3aK6neKMc0aKykjIQLLz
	 VXXYee3mf1LKAzvf+kTP/rhILsg93AgGXFQbmBF18n8QP+x7ZBjomYCcautM9Sb4jZ
	 x7WRRbBmgxGhwhooU4BxsDDoU6ngkzZ11c19mWvaf/nwXBIu3JQAVrn7ADajOFUsvY
	 fbMg2WF2hk9s8Q/gYgKnLU77JNBLA8xh63lx0E3wNB+hsccSLFUJNN2rIzNAemxSoy
	 GyKGQ0BVklMeaWlAysaoBsb9Jo3IuUpcqKWYk/qpj5hNlB9nbvhUq7HUQ4BBUwSEaL
	 Z2VNg9zIO1ReQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F40B610DC;
	Fri, 16 Oct 2026 13:11:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24F47920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16EFB4016B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_mXpSPmwMk1 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7D5F34016D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=rvNRvbc0+mFEprQhraL0ZNe5jpLjydMBVV/8UxCo1uRux+oU8LSyZL2H77FmfGRjUx+M
 NQn2WVuUDd9D+mBUY2e0aCo870Df3+7sevMcufw/Lk2cai0hKkmV4Pcwa7LlaPkXYBB7V
 ghqKGt5bvWoQsMz+IFCQGLgLxJEh36GzpsRZXWxYOti7HsFK2BLJWiF8WBQpcvGSNUPms
 dvLEBfDj8tA9Re0d7xrpkKAKdrE6XVzCQ/aX+JKlSv+dSJ5Th54YfDfWGtZlvB4sPYed4
 Glm63DaPL6um6hPEn5/f7R4WHBcC18bazrdnhvX1YH7ezsMLBW5BKG/Vp3pMgyz7xtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ByrzwJv5Ik2n1k72sL7P4riV9/ln80PQ5ADyFyTklEs=;
 b=q/dUXLbjgSzmYIc7joL/o70QX4qQUFKRDuWQPN+j7ShS0p+KHiafxYgKnPKXDtjw9xKb
 pU4+RstcZ6zC0lITsF3x8Y+hRwB3KhFuRhPZzy1AczhpYMOEQTqsmKD0ibMeXoaixxBMU
 puIHvjj3G9Ml7tYHK84DsYVMrcP66Y1MSlN0fvLlr2a0bJx5/x6uO6g9pYnUs305W2bVM
 a2Exo/V6wZc+m2/aTP8edz3RlwVjHlXBz/633EZ/30JURQiWSTsWIjfJTt5/9ql87kdyT
 lFjc04BJdomkV4BE17MG7xunRulgsrpM8TZLcpmTVdK18t0C//WIWo1kUjVj9fvycSw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D5F34016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D39E960D9; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:35:40 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 48a296c33c46e5448c120789a7bc8f8de4b028d9
X-Git-Newrev: 1cde8415afc563e038d02fa536f09af11aa1c087
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.6D39E960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/patchelf: add CPE
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
Content-Type: multipart/mixed; boundary="===============0539747118441020873=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0539747118441020873==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1cde8415afc563e038d02fa536f09af11aa1c087
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The resulting CPE ID is:

cpe:2.3:a:patchelf_project:patchelf:0.13:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2022-44940

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit ee8a99137dfda8f7ab88ffb6586e3feaf152de4d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/patchelf/patchelf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index c583b228a3..911db48e18 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -10,5 +10,6 @@ PATCHELF_SITE = \
 PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
 PATCHELF_LICENSE = GPL-3.0+
 PATCHELF_LICENSE_FILES = COPYING
+PATCHELF_CPE_ID_VALID = YES
 
 $(eval $(host-autotools-package))

--===============0539747118441020873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0539747118441020873==--

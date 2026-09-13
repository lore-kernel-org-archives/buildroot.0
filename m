Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574BFC88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 20:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1D8D80C73;
	Sun, 13 Sep 2026 20:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvJ90CxmcD1L; Sun, 13 Sep 2026 20:01:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EFBC580C79
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789329662;
	b=jfvJusVCLcRrTWXYByYb7GvlKpWd8qFXaiEd2gBXFF761C/6icJp84mZz7vgiUCvmp7i
	 yMYsuc899TNzuhlnK7Dqh3OQ5Dp2aa98H4Y/ljhE2tyLbLWm1UwyitJm9fYI0dudJc3wK
	 CbFN/Whom3BAsdDF0wZ/DxEY7WciKRbISrAX0mGGmowYos2liGeon8Ousw3AE2qiLuIGi
	 oC/k4fuvHB//zYkZuObE+lRiqt/xi40ob0fWXflcYnlvb+kOCCPNUtCo2gawM/GuekdRj
	 Qf45i+wyp6etm44J//dnllh0XY6I8WY0csfsOeNp30L3P6RedPRD4IxMyFKNPSzK4CQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789329662;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uhk7H1dS2F8DiYIhsnTcNrHQG4NyKYvMwgiX6AZepjs=;
	b=TxRniDMxyj7NjoGAwu7ogVnfFYvrgWpn8gGhY+5PMINiSx6oo4U2DeIsMFPhXZxNpc4o
	 tXkHGXto3D3fAEnydpAmU+50syy6BfA9ieMgGV0pi/90DjWMDyX8APF4fpi8Nb3hcrc4E
	 l8l99b2x1hY+D1k3ibExGGHtmPyBw2qWmRvsMl0jSdKNdGZHsUzQHZOHNpHJaOrukrdNU
	 cLQqhc9i6G2I8cDIj4GWlAC0wBL8FFVivUg2F4MpTQlQPOI4JHy0g6KfH7XD4nQA2h17H
	 Q13eVLpF5hIdheV1CSQCvDO1Aa1Jrialye6zkPAWew+icqMlHjrLvtj5EfZ+aCJBQDw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789329662;
	bh=uhk7H1dS2F8DiYIhsnTcNrHQG4NyKYvMwgiX6AZepjs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iPUz8ghrRXYy7s2Li2v7PZz+BHlQAidwk3L1fhM4TCyrofmCNuXk20YlS9rFnPyqY
	 Z7Z8Ie4aIs3jTCAk0IMBHRzTHzDkgbuxeYqgo0v0b9J7Q+K7PCe39B1mslr1MTZszm
	 T0Gk6Htrr7hVRhdMu2GFfaYMeQndKQXml9uvkHLqm8GxVxI2jWNRNyTYiu3qIeMj/o
	 z3CIrwKPlLePi6djCwsc4O3XB20vMLS9XoZCYWXzyw9P78rNLbRr8mgLuItpHC+zcf
	 lkaO6hcX1Mn97jAyF6KrPwZOSoDY+CVwMFhBLc9ci3pFxldEx+QX/qiNPkf6BAAqRC
	 B/kZYkhcos4Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFBC580C79;
	Sun, 13 Sep 2026 20:01:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79A8A465
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F98D605F8
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCJUaKzOG28E for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 20:00:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A43EC605F7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789329659;
 b=RfuBf0thm5CNldzSOxUoJ8ZcyHF3zEpsFA5nS4vOMc3pq03uEq1GXsmlrAoGPYKS+Om6
 eD9CewkGqCJGNWJFkgIGnVxaLDAFsYf/5QKA1daHwBQ1ss/+SNAUBnExmuhwn6vs58L2p
 NM2BSPpuXs1PAhyDbN0ZkLMLT96B2TEBIRiSvP84SqjuzMwywM3zac0YoZ5HnklEVC0PC
 IW/IWGfOhXiWraleAigBLo8bmfgvt7CKbBmFm38eGG4+gihbx7kRtbClSPFzmJwBu3jaf
 89bu/vgPsGWydWdeVCZ8vNg0g/+IBcmNNl+38N2H820H+xcrtDUi2CG4okMpGlYqO6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789329659;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xtqWSUoEUJkJvrXxM1GCz4BI+wLQllRy/OtVHN9COBI=;
 b=Q40xzuRq6kDaM7dqMeAJKtxj3E2jPZxOYMZBuhexGpTN4ZiR8GiNnNs9YOdeGjQvpF+W
 feNVKT57eyzpgeLswSbaYPOYMYcnkDS6nSpvYqDcFdeGclBfDsLHt8JYiAGCvMVIVvgG7
 DcyOCIOjrsMfdNwLvz2iQaDnR2CZMGyK9+hmaP6KNyEBn+t046dfB7XnlNRVfBIkVXpKD
 LD9u8CbUp8zgRHxP+g3/6HZ3Lppzboc+qKHMXJeSzKIOPC4GIuNrc8D+LnkY5fTh0z7xl
 tGcFbPNbcPTGkualCfVKimsm38IGGixj3A7vif18bcwWpPjeoavr0Znyf7rsxASSkmQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A43EC605F7
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:00:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9611B95B0E; Sun, 13 Sep 2026 19:59:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 21:59:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f5bb493e2e4abfeda1f56381b17f00a3acb0997
X-Git-Newrev: 39b840beef568ab7e671e9145d186b5c993a1b07
X-Patchwork-Hint: ignore
Message-Id: <20260913195954.9611B95B0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clamav: add missing
 BR2_TOOLCHAIN_HAS_SYNC_4 dependency
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/39b840beef568ab7e671e9145d186b5c993a1b07
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In commit 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa ("package/clamav:
bump version to 1.0.1"), select BR2_PACKAGE_JSON_C was added to
BR2_PACKAGE_CLAMAV without propagating the BR2_TOOLCHAIN_HAS_SYNC_4
dependency from BR2_PACKAGE_JSON_C.

Since at the same time a dependency on
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS was added to clamav and
Rust is not supported on the few architectures that don't have 4-byte
sync intrinsics, this has basically no effect, but ensure a correct
propagation of dependencies.

Fixes: 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa ("package/clamav: bump version to 1.0.1")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/clamav/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index 839518ebd6..92cd75cf70 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_CLAMAV
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_HOST_RUSTC
 	select BR2_PACKAGE_JSON_C
@@ -29,3 +30,4 @@ comment "clamav needs a toolchain w/ C++, dynamic library, threads, wchar"
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

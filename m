Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29D3C88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85929809A7;
	Tue, 15 Sep 2026 17:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82Qw48QZc_s6; Tue, 15 Sep 2026 17:10:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8EB07809E9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789492249;
	b=SCdtI9SwSHEOkzLWZB2coErPcW8uTkiNFyrhZUGvPMFVNDGXoSFArsmreiqGRpGhz3ke
	 TPzZEJMTJY/KmR7pjlhaPJbnGOYK+zgnUlt/VlBgPjAuCxL90aI2eGwkp1UnFB5z+tv2p
	 Fd0RRM5/m1IllNPngLwUwQoZeX3dOW9ohFOoDHY81dv4JmS7O4LHS50mYfoG3I/cCQiWh
	 72Hju7Svpuj8/hl10Qw0aWTmcHRhNUX/3FXH0l3bwZuzfSep7xu8E/3H0w9tWMLaUfQ26
	 AwC53ErG3H0V09OMWtGu7i2EkQkDfl5WysNEzagwWOabnEe7oAFoKR9itPeHzHffYvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789492249;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xp2McRMzJ9usYB/HqaDEF0DewuppNu2NiabtDceC1Ag=;
	b=rsBFKrNiKYzTbA2/SblbLLgEdC9mhayVIs7gfBpK0sdySQN94Zh+s7Ldaw5Wfi7Bf9ID
	 Lu+PR710XZ6nVrnU4yp2Co/0h74nadGsBnMVj2XbbHzBG2WhtV81ZRv8ipP0dN2E8woyB
	 37bYIT7vVfzZCMfxtggEIsiHFruz+ZYuUrii11uQe+sLX9YEb21gisCfyCq0SgETenf9w
	 7+n1V8dL04TgX+ovFC8K1AWXV/96qqf6xgMt/hUDRXXbde2EHWXD9gkhHYZ/1SpdUzo+E
	 CpPsoRPZBJ2Vsua6O7Dv+Hp/MWpmStZQJsBQRuXAE5+pqM03ldsjsd+lnQHj56NPPpw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789492249;
	bh=xp2McRMzJ9usYB/HqaDEF0DewuppNu2NiabtDceC1Ag=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=akxMiYZTr5Cyp3TsZq7ZWq2jtP959GfCsiNRu7QBPRRNjynCmqJFyUQtXVWGAslKv
	 RU4hCyyT3IyBGeJhDOKM9LEEYJB+oGeOYfHCVOt2lqO4oecF1PlCB8KwTfm4MVcpOb
	 isl7UQ0I2ev4C+5d9vGbfS/+8LcAWiZDALtY22sxJ7ecPdTppqDX1TqzVrOycWO6v0
	 poaOizxbqGUhFkvCRV1NJg6ANp2lDi9hdeUHShD0Ic1v1uOzEjH+2zURpVDrWq8k3w
	 7AN4APBvacqn65lPj9tjE6mJT2lLmBN9nCS2hiunyGyDISTpfMm1lyq/s1KwaQKIP3
	 ppe0sY7VSNxYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EB07809E9;
	Tue, 15 Sep 2026 17:10:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C4642D0
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6268240111
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ssutfH65n3k6 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:10:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A96B6400FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789492247;
 b=JnI9Kr8PJLWcAUZEXTVD2VhvIUel+R3WNJTjTPy0e58heVCrRKYreDf5p70VO4GbXCNx
 AZqCflIh/DXm8kIo4Yud0iB6pcs92iIobjyV+dE+qKY0+HmcNCaIk+SRHKISIR74Cw/vo
 8RrmMchKbA7Qb4aXvk1GGtZZt1FFbmr07l6iarnGB9Rc6RqGNZsJ41q3VJ52BEOWbrkbI
 aXk9K+D+p6ckwb29cyhNRrOm5VipnpKZlpKKuwul02nX+0HkPCBBMPptzE8aoklhJEZKt
 qFqKyXMWTub38zwfTIP4TwSdx35n4+69SowhfdKNy9UEZib58od4MXt/q+tXzmqma2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789492247;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IjICV1A5C3b65c//nY9Ca/8uxjJh6oSKoQ6n7KV6MuU=;
 b=VvyYhdN9Y3QPT+pKzY4N9kstLvMJOOKrgXBzKhaUY1L5ZGOyKsdD3SFaaGkcMhAXSd6N
 BfnnTHLXzgv6cKQPrh4tsxOyFaKPXmdPg80fM0AtbQaJHQYs1TmVMUNy0TBMFpxVa3BiV
 kDAfMJLvBL5ZOog31qh5a1PX6+FEFO9qpNF6McOeb6MulHs6V4eqfv0AJAwW4mqT6O/O+
 ogJa32TLGAwwDjFnVfsRqOTLEWps5/ndIn3yTtx+eGOBICXY7/u1zuYLTSb3tKzsFdjtY
 T2mr+YlHhfpdvtKUdbxTS8f83B7cBtSrucPB2VJheu3L9ht3gEf02x8bq5OgJnzz8AQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A96B6400FF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:10:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFF4495CEF; Tue, 15 Sep 2026 17:09:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 19:08:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 489aefc22af70996cae8d49694f5646be67d90bb
X-Git-Newrev: 592d5c517ef6ed003450189cf0c4d7af8801de59
X-Patchwork-Hint: ignore
Message-Id: <20260915170941.AFF4495CEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/getdeveloperlib.py: fix regexp used
 to find package infra
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/592d5c517ef6ed003450189cf0c4d7af8801de59
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

There's recently been autobuilder failures on
toolchain-external-bootlin, but I wasn't getting notified in the daily
autobuilder e-mail for those failures, which sounded odd as DEVELOPERS
contains:

N:      Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[...]
F:      toolchain/

And indeed, testing:

$ ./utils/get-developers -p toolchain-external-bootlin

returned nothing.

Turns out that the regexp FIND_INFRA_IN_PATCH and FIND_INFRA_IN_MK
used to find the package infrastructure, and ultimately decide if a
given .mk file contains a package, was a bit too strict:

"^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$"

This would only allow packages named <something>-package or
host-<something>-package, but the <something> should not contain any
dash ("-"). So this works fine for cmake-package,
host-autotools-package, but not for toolchain-external-package where
<something> is toolchain-external and it contains a dash.

We fix this by relaxing the regexp a bit and allowing any character in
<something>. Consider the rest of the regexp that expects $(eval
$(<host>-<something>-package)), it seems highly unlikely to match
anything else but the line we're interested in.

With this fix:

$ ./utils/get-developers -p toolchain-external-bootlin
Giulio Benetti <giulio.benetti@benettiengineering.com>
Romain Naour <romain.naour@gmail.com>
Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This issue has existed since the toolchain-external-package
infrastructure had been added.

Fixes: 1c99d70e5210f9d7b475736e0360ed63d16584f2 ("toolchain-external: introduce toolchain-external-package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 utils/getdeveloperlib.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index b5e7b89e72..4321df8bfe 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -12,7 +12,7 @@ brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), ".."))
 # Patch parsing functions
 #
 
-FIND_INFRA_IN_PATCH = re.compile(r"^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$")
+FIND_INFRA_IN_PATCH = re.compile(r"^\+\$\(eval \$\((host-)?(.*)-package\)\)$")
 
 
 def analyze_patch(patch):
@@ -35,7 +35,7 @@ def analyze_patch(patch):
     return (files, infras)
 
 
-FIND_INFRA_IN_MK = re.compile(r"^\$\(eval \$\((host-)?([^-]*)-package\)\)$")
+FIND_INFRA_IN_MK = re.compile(r"^\$\(eval \$\((host-)?(.*)-package\)\)$")
 
 
 def fname_get_package_infra(fname):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

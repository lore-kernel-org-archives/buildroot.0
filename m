Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56128C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 16:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01A044054C;
	Sun, 13 Sep 2026 16:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7KDPQDx6Upj; Sun, 13 Sep 2026 16:23:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 05C8540541
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789316587;
	b=J26Q/xGS9/ZoQW7tEqg/8GHE9Il0M7C/Yt0XoPpWhUsldozITJGxikDDH/m1pRD81akO
	 oQXsMRBRzOzD5YhT/Eqp75xcQsWE6BVQQmkfjCB3Iz/px9Gs8KruDILwAYqNSxsYh7y3J
	 8q/tUwki8aUagskLwB80Wl+eXnUb6w4Hdhb6DiM10uGkT6zqyjTV2XY8CY+Bt8gicrpjY
	 39AIqymAL1gZ+ZMvRBzL03ETX1HIHQFsK5abe3Udz+VyeydDl0Bdg4IytVN75Nkxvt/9v
	 Et+7MliLXehPR+DZItam+ZWlFVExz8KKWgcE0jtd92InXPzbBzKMN9TNtTofqUygelQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789316587;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0l0lyKHZ3EDCj4iPGA2bw+Cc4epdNwAnnpm6mJkn0j0=;
	b=gCpt7gGbg3Qz417e1Pk27TNv/611MGZsnn6JB+D+Jc8rsB4b9a2crvY2BgobfrQAxE2+
	 bFsCIc0Q+3WcmpyiVTURd0IXEicKbprbIkQnZZZFwk1xqiYzq6zR0wzU0szrY7DNNAowN
	 EWGKfRV72dCUkVxgQkpxSHXyUaThTKJmul4IKBMT1UnuP3omfyNRWz1id057nQJOMQkzk
	 dI/exEcsOh4wyZDeOUByeKRGYtIEJUF9HhmPHtnuK2hE5FcI4pu6xU/JGQNOFbZpOVePF
	 WBN8jvihvuxzO/Uv2TIWU5OsgsXwVvW8hbwevHh9aGbpQsUWE/WcZ6a5AG4555Hva5Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789316587;
	bh=0l0lyKHZ3EDCj4iPGA2bw+Cc4epdNwAnnpm6mJkn0j0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LRDPcWI4NOifFd3z3H/CbIHRrKnYGIjZBumdAbA9NozYrXCNe89ATc1jAQWJr1Aeb
	 JPXBl5GAUU7JqAkoAi3wrscgO5UR1rO+cUACVZk/mDFwXkuNxl9zNHjh83RheS+PmO
	 vwED66p7tO41ltFoseG8AhJ89ZxwPtPAFwM/1vxbjzq+hhpM/E80hv6VmKt1xoYuFl
	 +yI3L5YxQ0/hDR+el/0TV8thyYlSJx2bi3CDypd1MN2LmnLeI8M9ZOQ2VO3YXec+J1
	 /qnjUKUtlMQMD7ATVs5HffXAs6v0RYOmmCn2PaydLW19e3s7eeTQh1dHy0w9AwmuVM
	 E/dDPvf7pmsvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05C8540541;
	Sun, 13 Sep 2026 16:23:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 694C93AF
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5968540076
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAcV1eWHCiz1 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 16:23:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 731AF40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789316584;
 b=rECJM9VQaLrXoDZywlRd6Iy0JnMU5I3rv54IBFT2utLcYyespCsG+or9MNOv5kmx2jHD
 Nzyd86tH1+1iT1CJR/kfGB5+xEFPcvtIxGrq0ybRTGIiE6WTWKcTIbWgaacEcv+6o2VJx
 E65Mx05wpghjOp8sF8z/LH85i33IIRE7xPKeaQiiBcMkFZfx7jn4JKEeDgGhapJDhpfjI
 yfOFCBSgitDCQygH2g/JAaRW33AllXyIB2qGBJE2R73jztsyw8K2b5MRmRYNQu6esoSBe
 o+8GLuSWuGCsppOqxNPUCOzXUJAUlhOeLq3W32ptDrOl2RGv8jW+wO2b3FxzPCrnlmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789316584;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wFv/qMq6krFPb8l3mWherDOS1wtmPq87PfKxVx4mAv8=;
 b=gGH6Bh9W2JcRWHRqLfwjHq6OJF0NHP5LxdzfXtWOGrDmRcu7cvW/vxQz40AwgkGM2AuZ
 ZAZgyHK/Jm/jGw34t8u+I4oWOBOU/LbVUzR9UpBU95mZYm7tzpbvOQdVo0P7k4pggIblO
 dYE1ssP0oo+fxpFS8NTLzhqor3ooELQYllsLf0dx7O90+ho8ctgp4t4PcH3n121sLFuK/
 2pewr/KDZv9O3JvytRBmy+bLKiXJ4SgadUei2xX7V5pku+aqD4Qi8M/AbCh06Ncf6MP3U
 MG9ovmcgO8a0/5Eir1wEkBE49i87z1UmDrZbcTKI+lCm16bW1R6qRDN5+f0N3dtgJuQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 731AF40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:23:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79A3795C2A; Sun, 13 Sep 2026 16:21:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 18:16:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56c76fe2cd436baed9e8c33c0012d68bf8e9d155
X-Git-Newrev: a38ff8ca81b72c4f33081e8c7563fe4bc90ea694
X-Patchwork-Hint: ignore
Message-Id: <20260913162159.79A3795C2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8822cs: bump driver version to
 latest with support kernel 7.2+
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a38ff8ca81b72c4f33081e8c7563fe4bc90ea694
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update rtl8822cs driver to latest of the jethome-iot/rtl88x2cs.

Fixes:
  http://autobuild.buildroot.org/results/d4705d1a933528bad1f4afdf8f621c71bda8eada

Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index fa5c9b1f89..e62ecdfbfe 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  eecd40ef41e3dabd7263f48330d35a138092637063c5d5d4cc3936939502df82  rtl8822cs-55971663534233fd8d80363ddcb2fec1c01c473c.tar.gz
+sha256  31985c1180b337bc0e89c73dccc37c86d9bec08e983eabbfa2d5bf464d1a8557  rtl8822cs-f4263fc6ecd11465bf60ce142aa76e2e85e2cbf3.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index 531a07e60d..348b208a19 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = 55971663534233fd8d80363ddcb2fec1c01c473c
+RTL8822CS_VERSION = f4263fc6ecd11465bf60ce142aa76e2e85e2cbf3
 RTL8822CS_SITE = $(call github,jethome-iot,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

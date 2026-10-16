Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018ABCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA27860BAF;
	Fri, 16 Oct 2026 13:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjsnP5OersJC; Fri, 16 Oct 2026 13:10:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 829AD60FBA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156230;
	b=VCpGBGE+e6sbxORICQYPgHwuCeWoWCCgGCjiWqZwdlrivQY0j8XoDnWMMA/CTIVhUkpE
	 G60kauuMWFbJKs6lDwQ+aAbDmbpyX3LRymgO3ztYczHnbVjzj/7Tq8Df2Xp3BDjKZQVLR
	 xlmnP0OqkBGXehY0WBE6tsYUVuhXSk/oG9qVmij05MV+zf1i7BkopE/SVuXc+szObstA8
	 VCotubuYAgCepZCM1q4mokcx9+vCYqPbXF6LpXyvuzFly1yRt1AKXiAhWVMge67oKkLHu
	 4XVESPyg9GGzUh1L+/W6QUQt8riOcxG+6KDG13fWO05ljhm1Y+OpFAYFp41IHqPv9mQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156230;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/Zg/9bx9iB7Huv6RgPwiG6pgoxL2aMyvKy4rkBahVJY=;
	b=kVEeWnIKgBXwQ+EBkwej9n9CB0fo1Ct1m+RX00bQCn8S3X+y81hjBZ2nz93A/5+E6rE0
	 7ayg42AOmBeiFfTf7gRuUf2VN8t7nmTisH1mXs48SyXIVjAf1ewYHxfTsxG0AIKlMJxl5
	 CmUQEhc6jA4t3eYXxXMd1omTHs6nrcac/csMsaLv0HIRRb5bbXeNHXmkYgLGeULzFykgk
	 bsaJSz5edjBEYY8ICD9ov86MHan+qHPh2AcT10Hpw8KzKix2jmX4MSd59FeaKeS0+UZY4
	 H1x2fxclL2/BhLq9TVpLkDV1WpsmNWf6at382lOEtBxbUb8GZzOErfuCpqYd2WY567w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156230;
	bh=/Zg/9bx9iB7Huv6RgPwiG6pgoxL2aMyvKy4rkBahVJY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rS8xedI/hngO0n9RfeJ6KjhbjcvP2FtdzMOyqJcNUrFRHaxifY9l2yxenNTTq9lNh
	 3D5z9tkqkI87tc9W0gCADmJVSpNrQHD/p2yORVe3TBLPRJB7a/ZSkuUqZDc/QPg9Ts
	 Hb1Uk/FCrwrA5JSBgvEdb6F+daO+OrBskF4Rj7qJ0Cs0u/2WRgKnKRvJqmQlIaKSdU
	 on6foAA0DDHxXthkMErMzZ8ZxRHSP5DbCKLeQyi/33y5pDYS6l4VotnjDfjH5mKHz1
	 eZ7NYBhcmrYG7pfe+ZobiKraIW6weMbv7990YJABgZ6VU5VnsAC4Aks/6tLevR56rU
	 pgRP0xqVpbwtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 829AD60FBA;
	Fri, 16 Oct 2026 13:10:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D8201F70
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3349181489
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BaBFijtTagZP for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 84F918150B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=MmtmB2Y08iaEVp1G+na9LylTcxm+ddkoPd3FBSq8U3AQBLQ/9DO2dZ7zQZ9+DCUmWhLd
 1BuvmuA3sRCe4wlWPVkbuY4jASkTqzD29dvJMVsinEEi4nZ3crKSRZNcE2LxMRxWZqr5N
 eXEpTbSVmvVBw1AfhYnpHvo2oU6R/vkeoFDrma2MJzaxmuYD+nnBjpOZ6e+jJtAu0bzdE
 1GJZ3C4msyYA36CLOdr5ah4UIW68HuRbsCErUsW7swSplStnLte0SaHiSUZss85tyCC6g
 ini4mPD3LKZKhIhqsbfFW1tr71tn/8oUoupzh7c6+XJOlDG49i0GfBFgAQ2rFFQYjPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aq84AWRt/YFQNmTDX1mxyfesUHxx0GQ3M6h860kQc8M=;
 b=EKgL0CWE7w/V/nsGk4MJE6iYhtv+VuqD1KrmJr4LZyEcHDkK0FyjQWnjscm2S6UK6k5y
 MU7FHrPck6RKfsxlfbhIt6Fi7+zSrq0iv9sUUoydteEq3EYr66qsvIVw1HDpk7/usGw6B
 8rxgHtCBBvOymeEvGfNEbDIAyckljdN0vjQMLPQ3eGPutlrcweLzsouTuuq4Mu8uzGmvr
 /ItYvb9bcdfqXjHk0MBcpCOkP3xsGOWc1jxaBL7FEZ4n78TLjj92E3RQ5jMr6o/aUVFif
 BMEiD3AZNaokA5/vh/RoomVP+ZBdFdo241aY21n+A38QI5zk9X4/7Rdey+IoSegwLxg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84F918150B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7633C960D7; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: aa65cab492c0e1e25b0ba62818c14bae1b0b4dfe
X-Git-Newrev: 94bb5ba1e486df811a1826ae23ff7b9d46823b84
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.7633C960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 mark host packages as excluded
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
Content-Type: multipart/mixed; boundary="===============3490457776201143967=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3490457776201143967==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94bb5ba1e486df811a1826ae23ff7b9d46823b84
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Mark Buildroot's host packages as 'excluded' with the scope
property [1]. The excluded scope is defined like the following:

> Components that are excluded provide the ability to document component
> usage for test and other non-runtime purposes. Excluded components are
> not reachable within a call graph at runtime.

This fits the usage of 'host' packages : a package without a runtime
purpose.

See the mailing list discussion around this property [2][3][4][5]

[1] https://cyclonedx.org/docs/1.6/json/#metadata_tools_oneOf_i0_components_items_scope
[2] https://lore.kernel.org/r/<de0bb761-ca88-4bc6-8d7b-6bd14e9d1cbe@cherry.de>
[3] https://lore.kernel.org/r/<20260409204208.302842-1-thomas.perale@mind.be>
[4] https://lore.kernel.org/r/<bd0f43c9-ebdc-4717-b8d4-783ec712bed2@cherry.de>
[5] https://lore.kernel.org/r/<176c5c42-50bc-4b39-a7b3-845b085f010e@rnout.be>

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit d8d02d28fb64f69e97d2169740687f761f93667f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/generate-cyclonedx | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 098f62bf2c..44b9b80847 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -371,6 +371,9 @@ def cyclonedx_component(name, comp):
     return {
         "bom-ref": name,
         "type": "library",
+        **({
+            "scope": "excluded"
+        } if comp["type"] == "host" else {}),
         **({
             "name": comp["name"],
         } if "name" in comp else {}),

--===============3490457776201143967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3490457776201143967==--

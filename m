Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB7CCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A96A2612CC;
	Fri, 16 Oct 2026 13:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9YJz9TFRo28; Fri, 16 Oct 2026 13:13:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3D3A9612F1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156385;
	b=jVORxe9LMeD9BzU0+fP3NPyxU4vBRqO1CXUC4zFCTAP4XRtqOWnWVNbrsXmHF693F1g3
	 /lPN46UDzQx4V3EnPHdlWNJARYr8kGp/KzD+vxR7Ad0lftlMqGahQVLltxsfEq8nf7LYF
	 d12Xs7tjl3SDjULxQ2yg9bqbUAobV/CduPi8aMFEVIdlMmn18/DnhN+ULSqPA3OOTGah3
	 XDHignJIrey3vdKIfYLarA2XWg5BNKdinkK6kxspfij9wgzDMJBwoa4LuA/2a9uGgLIKC
	 IZFhwradf71XeO0o++UpjEdlhgirypcFa58U3Z39WxrS8zxkRclO89fNFE73SznYOfQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156385;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=WxlzEWagQwTjzI59T+0tc8W5zz5VNKFOzDace+dpFN8=;
	b=SXk/xqkNTFg8qoYplX+LNJ1XNqGw68lk+qIVtqHM3g9GHrdw3qAaJj00lY1eQIs2q2IQ
	 ZodriAX+53xMWIUuFT1+EUgVxN0pB2+gXW6KzwU02yVuICz+ufw8BTUmm8fXkYUP1m1Ju
	 GexYZ99MEN7L3/hTPAENhHJZsb4YaTQt38fwsLH/LZfggBMamPPBiMLxGlu1MXBuxW23t
	 PUuHF00XYW/9yJpnTTsrNuxTHUiZ2fM7GFMYw/geMbDXL3AGDZBQTbaiML9wEKXfL4sE5
	 sZZdo+mO0+Jx/SNut/17mn8Rq9uKCZiLK20h7SI6yFS7Rg3+IDZI5trdxqg4WTrtufg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156385;
	bh=WxlzEWagQwTjzI59T+0tc8W5zz5VNKFOzDace+dpFN8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cn57jxdfa14BvK+aZ4TGu/jc1aKDNBqp3iNJlAOfHCzuVBYNhMDTlwkohWQ+Y9GCz
	 5eZ2bqql18aLxstmpDu9vGh0zs43qVol1Uu+CudVjn2b8eknTa2jxfey1T49TCUui8
	 IeOyG45HXjef5A8raAY4VCuMV2Vfe4xSW4RVcn2DJDwv5V/o00Gl+qu5OsbAXUF87v
	 R3swwaDK7HsRcDLDBuagf8N8rkiGqSWsTTV33oqP5vSR06pPXe9pYZxQsE3Y8xjENo
	 0/jEkpgAVAFMcky5MrZdVNpe473kiAof5c39NlJY33cmU0Sk7exWolvD9dyXSWSGL8
	 n84EEpQmL/i1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D3A9612F1;
	Fri, 16 Oct 2026 13:13:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA09E920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6C4560F1C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id doiJMfSDHnRp for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 58C8860EFD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=AI4MFLO1W4+19p3Ahyr6ZUT5DZg8gxghjkkyOC3jKVic682jLkSRrUcu3NGNsbob2Y8N
 J02C07NgVNBK2hpWm7i0z5IISIfykgQJ+//Igy73jlIz2JT9fuETk5wMqPbXxKWlxMo12
 3QO7lISfrIfqYHwgLAuOSkH6LMtJUZ/71IusPm2tiUBjLGGFgwfs+zVyH4N7fBB0tnBGm
 G/mpAW73BSKMvFElAvcZNwHBG4uLS0tPNiFVjXv8J0eIxnpAxlDa3kpZoA8HG4IBQp+X9
 QtrFR3Q/bnxCVI/k87/PJy/4Pekr3qoDFZatwsXXE8Fmc0yCu8CMKiLFnTYr4BpqCmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9drqzpEa9zEejTXQeeR3Ke7va9KJxyOUkTVW/VnJyek=;
 b=phwMuaz+V1wIk7l1wMJst3aPkz5o2/wEU+FLRSafUj0mmIYk/qc8f7dUO4CClDOLCdQK
 5EiqCk9I0KAltnOcUdZONCCOnfweqWFATeawx2sJGVGa8WvhDym851UJs5WSgaieEsSmM
 VAJ/y8gI/U1CETX19O8bjARQdHMlm/u6Bw7Ezzt1agsvrI6SB+Fckx3tOhTVQ1wBxtXxK
 xzxgfs3cEWoizUpmBo5zH0XpAlMbRtu/qtodfEcXyTReMXVlz7iGYfvjGLFGiP1VC702q
 CWUAqX53V8FbRE0RVk4fiPJZPmMActsPn9jsJa5rZluADmF10Kg6jJYxgLSOtVNES4A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58C8860EFD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47F6F960D9; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:34:01 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: e20d53bb75fcea14c4abf4a9b7d795a308f67897
X-Git-Newrev: 43bcd4d4de65e66816c45f8dba796bba94e043cc
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.47F6F960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/kbd: add CPE
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
Content-Type: multipart/mixed; boundary="===============2160144607359348867=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2160144607359348867==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43bcd4d4de65e66816c45f8dba796bba94e043cc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The resulting CPE ID is:

cpe:2.3:a:kbd-project:kbd:2.10.0:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2011-0460

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 93df82900d7774672f8d37bc8d967dbf2798c195)
[raphael: resolve conflict]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/kbd/kbd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index a0b48d7c63..2e6d149048 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -9,6 +9,8 @@ KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 KBD_LICENSE = GPL-2.0+
 KBD_LICENSE_FILES = COPYING CREDITS
+KBD_CPE_ID_VENDOR = kbd-project
+
 KBD_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf

--===============2160144607359348867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2160144607359348867==--

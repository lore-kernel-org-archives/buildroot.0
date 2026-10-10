Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D610CA9EC7
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7492608F0;
	Sat, 10 Oct 2026 15:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sh0B4rYmytJj; Sat, 10 Oct 2026 15:19:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0C94E60672
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645544;
	b=YuRNgXLbrl9NMr3F3Bt6YlE101uAtveo/Tp9YE2vuOVU0NVg3jblOCPR4BNBJg84FtTq
	 DHP1SEW3ir9aIPovgtfEjogVI9erh0gkNNiowZFll5KYiarCTyMIvStffiQwpzrerahKA
	 q0LYd2rQkUnse7ehkMdRReZqFo6haHLEKgS6eogFVofna8I7mpNQMsPZfiBHHIiX+3Q7s
	 k0wQFLP7Z/d9XDBkdNv4eo3r+2RGzDZETjUk1QwdQcuUn639a9QBCxD56xrZVjrZXd6wn
	 kVbdRAOhJzEpqnk8hMsbBP9sKMi3fzLYrgvjiz4iAchZ7CJwdwQGit0abSP93HUu76w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645544;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tu6wEUnvB8FIzDYQVxqUPDmuDj2vd3ASwDq5vzdLY+E=;
	b=huZfsh4Oo3763jr2/ieDM+ckxmcQvWmVcrL8e0XxdB1ey4u4e8Q3DK5cYISiVCaRitit
	 zyONMDM9uz/toHS3p1UhCi/MsqiTD47A+LCJZjhXMzNav3HtTq9GCeN+i+rdlagIRdkW0
	 6DFK261dojvIom3TAbmxn79h1OAB+YHj6sr0yM5LIJJq0NBdQHu/IU8yzKugTEuYV0lI9
	 IBmeH+J3Gnf103O0NYkIHvcbyGOExfxHDYg/Cbjlhxjl7emaPH98p0OE5Um3nGGtaxBDp
	 GV6yr6fgCRFW9AFky99AzrgzaiScw1cE/Ut9n6p80mYZ8BiMgNRnxrdKe+HdC9P848A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645544;
	bh=Tu6wEUnvB8FIzDYQVxqUPDmuDj2vd3ASwDq5vzdLY+E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dPwRxrG0nYAHx/osJ6yZb+48eVB9tCVjtkeqFI3UhTW+U9fIWwTAGXplOabzvOOiS
	 IG7QrvIux2vKJWRMHbKFS2TKgIYcRiv6nTE4Wt/7SvMzP23DyMALnlNN/4AlEN9aMq
	 Ytfyq8VC484nQ2tjyrDYr8hQYN/jEEYpUtdC29CVbNQ+wYIVpRUechxcBG3t3n9Rrp
	 bW3MyAmfWJl9Al34f8OzrEF1V5u29yf6EKIlbH4TujmMkD6u2MajY/IMUroEloZ1wE
	 lQpDdKsx3yIuPO+oOq4b721IRWtLGmy1UgyGDEGC+ieFvluNO2KJfJTDkuCq86sDk+
	 ZS90DjwA/Kn4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C94E60672;
	Sat, 10 Oct 2026 15:19:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA1FBDE1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A90A18115F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXN-TMsqf4mX for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ED59C8112C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645533;
 b=Wr5iB8C5LRZV1auBbK0PtdzemMQBc/IZu1UFCKTaOrXObr+KnNnIBU8J8epJzivV195L
 hICAe0BblHdwvhsUaM/FX6binPvDM0d0aAB6u7qeBm5e7nDO7ENi+U5d25oyjcM+D1QVN
 T+DSPpSzSpzVpjEjlO2thniCfoqXLMvQGje2ckTCJbHR+LCyMlupt0+rQ97JWu0HmjkNF
 vnOs8NVViyaU1Hbcm2h+ctOpXbcTT3UQFw78lrbi8LdOjS4ertDDSqD0g0/GFj4ceMstP
 vf4HkxL40T3FyTpHural7wFq6vuchpex+3MLzfkdjURu3/1rklmPo79r+rHXs54cnMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645533;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TpsYMS5snt+CG4qMyByVdS2Ff45cEhdxmHkoAMYuBjk=;
 b=n+KFlDSwMCfBmBGiluj34K4Zcxjgr2Eekm41TkIud5WLzOsqqqCkajqzwPTzyYqRPwVl
 2dm2NVThZYGJ+bJF38MIpADzyOrikj+e2XnoO1JlmtH7jeNwfbZqN9ff2+gb/bHiPrV64
 rYqh4Sff3kliaVPC+r6iObyIDXF4t75GMga5ftU5b4BkYxJpVPC7B3LlFOHsOjZu8scxW
 evU+Iprr/cPGTmnb9K3Sq9Yy0mX0b7iPJS6Wl4jkCwmimDLguPZqGVl7UNqxUCnP3fw8Y
 5q2k7+wTBOS67iBc0+lYP6V+Os8kGIirSPxR5UR2cZe3Xud7+PLpUp35etSU67V6fVA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED59C8112C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B917F9222A; Sat, 10 Oct 2026 15:17:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:17:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93df82900d7774672f8d37bc8d967dbf2798c195
X-Git-Newrev: 7fa4b3c8b4eb62fb0e997cb3cde1d43756719d5c
X-Patchwork-Hint: ignore
Message-Id: <20261010151734.B917F9222A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/m4: add CPE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7fa4b3c8b4eb62fb0e997cb3cde1d43756719d5c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The resulting CPE ID is:

cpe:2.3:a:gnu:m4:1.4.21:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2008-1687

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/m4/m4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index d498754b35..da739a5f0c 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -9,5 +9,6 @@ M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+
 M4_LICENSE_FILES = COPYING
+M4_CPE_ID_VENDOR = gnu
 
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

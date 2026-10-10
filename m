Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65F3CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B343E605DB;
	Sat, 10 Oct 2026 15:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4g5vXixEM5i7; Sat, 10 Oct 2026 15:19:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 623AD608E6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645552;
	b=VhNEpdiJtxXp33CHfCNGra2yVlehzkMl+kVnuuBMSK71X1xmRBqXRsOottQKfwc8oM3l
	 1x2gyXYdGE1JzXBjAGag7vtRBJHiVV0bxpRVVWi6d1yJbh62xyeFHCiHyGepu1NhS6ma9
	 8ck0aXIuegH5Xv0wVhQyUDfDJ+pY+TOE4uZKfGZ1vhHUrMLKO9tTQxtA4/GASNmDcYTvf
	 OJQ6TtcSNB7CSHkCtzSdqB1TdZ+E+d+R+CmbV/zf/cog+ReZwbT5/0D14mnUwfffiM+D6
	 520Unv2WzjYJrDV0a5bNQHP3HasIpwGJQK3y+QLS5Tymgw4sYl0oyfLW0S03NkVNT6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645552;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nJ6m9iYumvAixabz/IyL19timfCq8hfYc8LSjqRUakI=;
	b=VNkt3ixyn/jfFro9i3JBE812o2mKLsffEsK01K+lVjSAWKwIslRCTf/kmdsmF6TD51qq
	 0YdyN+7woavwUeU/RtrRh4mE9guPXdnrRCwD8GvIO2b+A2PZOz1mcwvUvv2eMbAD+Q3ZH
	 9FiLXbBVFQcPvgslj0Ocd19CPW9URkviZk+zoiR5ikXJrw9/RqIZh4hGsjtLmxzXkiCMx
	 MmDnFF1lroDxP6nmMLrvSLHXA72MlPzK/hPHyj8ezY0KsDjXq69MyHEMFdU3O1YVS7j7+
	 T8smCA2gAH/Bt+beRnlRkczCgLEgykYCTorrmbLKLUJJ2ZrL4v7EIVgEADrnUJ38I4A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645552;
	bh=nJ6m9iYumvAixabz/IyL19timfCq8hfYc8LSjqRUakI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XJFV9coY9tuCFW6C+kMZqUz6GKTbvX1gsbEVZZ/CoSCp9HU3SQAUflWQOJa26fTJE
	 IjolVrCJGX67ahmi3is7ka5+LOpC5A4C1pw3yQ6ClU+Y2kY6oGFad/KsCVUwqN3OKq
	 YbsWQLw/efwdcjC+t/zSf6jAVcdf9WB4gnaaTyp3QbdN8igXiny4M2nUN/6FUkJHIa
	 ougUEp9uuzEt50tqAWZxrn0vz+BRcE0NtyqFkysG7iqrjG2e9kNGLACf2afGdtngJ2
	 ojNE0eGIK2ijAov6QsGex0KuXwbIGDP6GrqNGM+hgOZgZHVhswJeud6UHBKWq0d3Wb
	 ylRmyCVkXnG6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 623AD608E6;
	Sat, 10 Oct 2026 15:19:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA5271A6
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FE1780D56
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAfLgSbFIq8E for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0108281149
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645533;
 b=am0llwx54pxpQ3KpbKk77btrMNCzzYE6QGffesyJsJPAGztyUlcAsQyDDoNKvPxEuq6k
 b4X6x34NbcCjI8XRP9P5W+OOzUWpi0Zh4qFLTu5XvF/C8xHdW20WjP0cihb64e3MbR3o0
 SvyjhgayG08aJld7KxCB3jtBlZ/4C9SQXtcLAETuOWSb6PA+38kDACXQ0bGrKR0WyzCHr
 wRg29WgcKs92InbNuGKClEYJ6XZPoSA242V5gJ7GePIK2Be6IIHFcmvyuErKmQxNB+OIB
 XbLsOSgCgk+YovGPMPSDSwPBIw0AnwLYkpvawlU+f+xF3ZBEI1Aee2T+8bB6bpreUPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645533;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xcHAKztHYDO6ePWQf73kgC8Die+nzT65etdZex/+2os=;
 b=p4FOi2tyPQuOH7Y3Hh5dsnPrv+gSIIBR+i2PmvBOGM7nvpmpSRtSm1nj9px0NwGQhYIK
 oQTKhkP5h0j7r2CuqpWNcuIFjjCKTT5oaMkQSbIfX7H+iANc4xr3iXwshE641Hkg+QXHR
 v9UDcQgBRpIkLJ7wuFhALitFyYnDjaxT4tGTT4waP7OUajql7ZSx5ZqJqGjQVYQMDMlBt
 XtTPHlD03hZX/i52rnzj4TLvqBSw5xbmHiHTjVNJzcR0+/B6kZO+ZNcSegv+XRuJxLMyv
 oUclgINNjRsPlI6zMw1X17Zcy4nrBs4X55HEj2wo/LSC7fl9n3/rqsf7fTqwqFs1bpw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0108281149
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1B1D9222D; Sat, 10 Oct 2026 15:17:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:17:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fa4b3c8b4eb62fb0e997cb3cde1d43756719d5c
X-Git-Newrev: a07499c8f1cb41a021def4752bac0429bc879da2
X-Patchwork-Hint: ignore
Message-Id: <20261010151734.C1B1D9222D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nano: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a07499c8f1cb41a021def4752bac0429bc879da2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The resulting CPE ID is:

cpe:2.3:a:gnu:nano:9.2:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2026-6843

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/nano/nano.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 0a12b528cb..3fccae0dfb 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -12,6 +12,8 @@ NANO_LICENSE = GPL-3.0+
 NANO_LICENSE_FILES = COPYING
 NANO_DEPENDENCIES = ncurses
 
+NANO_CPE_ID_VENDOR = gnu
+
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

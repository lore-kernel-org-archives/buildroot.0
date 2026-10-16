Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6ACFCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70C2E60B9F;
	Fri, 16 Oct 2026 13:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RR5JVZ5fqo-e; Fri, 16 Oct 2026 13:10:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6E63660F9E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156226;
	b=k/z08jgp5+M+mU4bWCbwAQZhVtwMSoWrP/eW/R1E8nLF1BzQ894ucYYUUa6VfMiVQvGA
	 tuJbhzNjB4JpknLvZWrfUT8gya9PtIjhmWYDDBJztrzzu6LCvtzv4O0hN3t9BRpwgB5jc
	 vl3nkHYZIhLJSy+e624MoKEER1ZIlsPchEr7Os08ndJgJH9Y5lV/Q3FQ+GstoAtn4zcsx
	 4j8oRqL8KAcKHfD4LkToY13bTNmHk/s6QQhbyfBdEJrjLHbLhWE5bhzvHKwe3GWPwn8IC
	 KkVp/SA2ay0k4XteChyH579AjZYYMhXeaJFcP5FmIOsOBFXwZ3dx2tQ8h1DFHvnyY9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156226;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=9gdfjQj9cEw+iezmTRNPZIQztxemy5O1OR8c+1HZTa0=;
	b=H0vYTz7dt3G2mPNCQ3hKhzdoUALEOIlmfNq0nG+AN5a9PZis0wzwkF9rBhH2vMS9ih8K
	 P5EHy/V/Mgp1SoFa3ndN6FCPeNbVRODEiFLXOQbUWnF/kyRJqTZZNcAxZ48XO5oiYl4yF
	 W4pEWYe0r+tnxLf+RW71DqO6yJ5i0OHPkr3ERJXeTAPAivZ77SSqn+8x4iwfA4SoGZTq/
	 CUrtawEWo3wh/WLB2tID67/QFCd6nir71wSSHA5I8Sgh+qOYPkGzE+X0DS/1RU1IkWx/D
	 dsoSMEEgc7F49jDvo8GliD6pPyBgmLw1MabX8AeoDDwTJ8G+ohXq90akARJEjfYTs6A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156226;
	bh=9gdfjQj9cEw+iezmTRNPZIQztxemy5O1OR8c+1HZTa0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F5/B6OpW/QIOqcwRpIWKYOryzvR5ZOzd1EjAjOher5Ds7a74AoB6ov/tZAjNbPjYz
	 Yg4aJAPS1nom9iFq2QYZxGnTmYKokAvx/6hBKkIi8yu/+M1IconakD2RPKOfyk3SN5
	 zKYGHAG5nCLaq6G+fINkDLYf/+Otrj7cd/wPb48OQLY4ZLRVHX+HxuP12vHk1LjYkd
	 vdDa8k72ScYuzyq9c+7YzMMU+fruWlbgQVNiGwcdeeK+up7NIThTeEpcXaToUwWuBU
	 F9ruSnd3zHDHAsqLvTKBb5jgH19z+lPo5S5ARkJvoJSzJkUmUgnIu5PF/qykw144PH
	 ZJtEUFSm/9Gsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E63660F9E;
	Fri, 16 Oct 2026 13:10:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43F421C64
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40502814BA
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Zr_7j7fl7u2 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D8C69814E2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=thCRWxjMc9pYTuPBsdBjDfjNVl+uztK4RM36EHHKrPtFxpGVtzT1QRGOdRJsv93QydOH
 /kVn58r0adBabKliMR17uy8yV06oP/YroxQRdWoL2SWAohPvhWhBu9nDpZzTDhrFKaK8c
 WmYKD6K51u6zS5RvwUdc4va8eNbO/84WBXYhKE06pyx0S5Wyb7wGxzk/l2h+1B2DUSwR3
 tYev9YeFnpzAgqwGwdQ2FiljHInfXeBjQltzq2X0EnB5dDTUlLXiqQ2wmCaAb6VPdLw59
 kxlK/6aYKnSHO9izfhQrGeYyr6pZ12WiiuNfiTazkjFyeRLsMKems4zp/vqDLYIGv0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=W/2Fcb20IZwHD+WXULbckZtcX7mffpSwDAz7LafcNME=;
 b=mIgFi/WYhuWb71HCx3f56sY7JdYnzYLHFj0ZjkK3UjTIyLvs1C9Iv1WApmi3BnMt/8ci
 qGUUD1gHmdCLadt1duVb3jizP76YKE9agwQOtWkHOecmGxFVOAComYo2oamWeKA2TC2mT
 b3Bv4b7iZW2QBCm+M5j75/T94BTGw8Q0YynMLJ78b0HJmzbuCF3qOScTxm2QJH89q6gis
 Ca3lv3GiwWaYtTqomxT7x/L+L192kUb2/WtapecpjwG6d4JBazLj75EduRg3zX7cuDGxa
 vYaueLIVh4cM7X0lv0ZQqZlZR2vFE8UiOl5sHc/9M4P0TqhWpuB/BcFaf0vT+oCduUw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8C69814E2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9F6C960D5; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0051bcb24ed42794fcd4626ecbdf4d27747c053b
X-Git-Newrev: b16510494383501bfeaaa1725433bbf3a370434a
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.C9F6C960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/nano: add CPE
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
Content-Type: multipart/mixed; boundary="===============1491117184871234445=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1491117184871234445==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b16510494383501bfeaaa1725433bbf3a370434a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The resulting CPE ID is:

cpe:2.3:a:gnu:nano:9.2:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2026-6843

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit a07499c8f1cb41a021def4752bac0429bc879da2)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/nano/nano.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index a1b94c90d8..4fca0db80e 100644
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

--===============1491117184871234445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1491117184871234445==--

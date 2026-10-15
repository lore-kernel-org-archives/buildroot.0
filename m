Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59363CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D383612F1;
	Fri, 16 Oct 2026 13:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iz0QjEvGjPX6; Fri, 16 Oct 2026 13:13:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F370B61307
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156389;
	b=O5iagAKnSfrJLhMSar99Wj/b40pdM1FDCNLkOkeF5dRewdq5AOFAUI8WL3Jm/juYOlk5
	 C7KQLUj805ScwJnb6AjRGwOCNHoWx/Tw6V8Fe8wyHtfeQlsB9m7dxc5V6jWH1imo9cvad
	 vhS2gGe6+uVCD9XeaxxAUHUWSPCZ693XTjkNyPAYQdPViqIohFox3PmSGRzHsHtPyQXSl
	 J20EJoii17M4imVXcBQbFd3dTXVwXW9L4a0ie2L1c1sZ8EKgYq6HHmfhXFUkWId3S4Zwa
	 9FvYZGCQhi0dRcwYG6bnhLgESxQ4UFc3/5DQyx9p9qfByDG10NtiGTYIaNKl1vB6ljQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156389;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=5MrXpo64BGeoY7b8qXuOM/fG6o5FVKxSFcSY/pwD1Is=;
	b=tdPY1cOq590E6JZM+zw0ZiLtrrzJnkMCY9NDzIpHkl4u8F9x/83+dWkMD/nwPOO0uvXZ
	 8hRljFuR2pwvybshCGRiefpKAA4/q+xJ2qKsbkjOUQugPsBUwP2ivf5QnnijnEO8Pr7Wf
	 me9G+54aSHBf2WQpx6iDrippJCpNea9gCQrcHoK2NmkvOhN0b+h8FXH5+21aGc/NfO1hq
	 kDdxWrd+CT/EHE9T1ew9a5S/YMCIBNFNR/fu1hBeBLxwWsXqr5/36IBfdN7JZhGVYzClq
	 FSYMqx/OvjJrjrcoO6sUfWv9pxmoq5YaVrxjyY3ACLXsd9TlHpPbECR+5NgP9uihFyQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156389;
	bh=5MrXpo64BGeoY7b8qXuOM/fG6o5FVKxSFcSY/pwD1Is=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hPoXan1KfsUW+ECk1vlTf6g94NbTAxfp5K5bTwnJDi0DDAeKMwm8G5QMIupvXhtzO
	 kg6AaBZD5bKKy7dAtws2uc0AcCZCHyNSTdecLqGTAmLhbrdFZG0p3zp+In7eAdr0T4
	 NQf9v3CerfCr9tCQlhfFutI95rmB/5Djo80UsXiiGafdbyVFLpnGMkMZgZUPuJrxzg
	 AoBPOvlK1jv/6l4LWI9YwQUW91ApTLb/mV0ZfIpxOsvQb40f01SAV/D4yg/lWGm/0E
	 BREpM6fB4E8fpvtqQfT3GwFTkhuf1doL5MIGwFh1qZr2kWmUrqOZKAZ19dreYGFIKf
	 NejTD+PwnF58w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F370B61307;
	Fri, 16 Oct 2026 13:13:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EABC7151A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D08A060EFC
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IO9vj-JB3sW7 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 400C260F34
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=kNwbeCGFOVoHqh+OIRbYQ2P1k0LpXfkOna3qySP+wBLyW8vZDVTk3AA07G/ekdWopzo0
 zniwJY919ezd4qkv7AkLA9DHJvyAw5rfr+aAwW6/VVZcSp8azhoykujIloKoXZDhcurTG
 X2wPKToGtZmVBNOw00Pe4ZdCJSXSTuXdLWEo9bniL2wEeCkEEbL3i94z2bwngqQWMok2O
 ZBFaGYX5zsheUZXC8S002p7n60nb6bPpJbjocCJlahY8uRYj9kVqtr9BeMrG3CMKhTN8f
 NpG3WfpqJ7IbShdna6t5W43PB3soGPNiKmq5Q1lkF39YOUiMOJ5+csrjBzbFkgDJnAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NAMXqxS0FGGZW4uRmRPwvJaLNbUmf8idipSfIOxqFFM=;
 b=LQ031zgAVPyADZNM3jCmHrDMZZ+nhlBgBFzO/w9/UViA14atCXBejShbUZfqiXq98+rV
 kLYc7csQSWNlT/VnovToBYPp8udoMGCarJXwc4c1qkl/sF5HO7aDhVrGHaQpf+WRtDlfj
 0Rl0EuNj0I9WTZ+e7Da4Gi4FfKTxQHlfhdcpKIwWWnu1jR8Fd2fazuiPGUhJbumFgRtqh
 TV4bL7kR0+RQgVDyoCSwTXNVd9Y6vwDH2v5vk+ZpSVVTrGFIjnU32abSZfThRkQIcw/ue
 fxeO2B/4Z32+UsOikxrTaRbsgFe+Garw7wJ4wpx27Z1pGvx8toEB4WZ8qmHU/UcFAWQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 400C260F34
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3015B960D7; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:12:14 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d4acf5377e82fc75617a28c7fb21f6bd210385e3
X-Git-Newrev: 06485a786790458687ad5e73d465e793c3f018b2
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.3015B960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/htop: add CPE
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
Content-Type: multipart/mixed; boundary="===============4907602503495271301=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4907602503495271301==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/06485a786790458687ad5e73d465e793c3f018b2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The resulting CPE ID is:

cpe:2.3:a:htop:htop:3.5.1:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2008-5076

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 444d769c0a575916767f54238c4e01dbd56eeb7d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/htop/htop.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index f42d7bee36..313518d8b5 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -12,6 +12,7 @@ HTOP_DEPENDENCIES = ncurses
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 HTOP_LICENSE = GPL-2.0+
 HTOP_LICENSE_FILES = COPYING
+HTOP_CPE_ID_VENDOR = htop
 
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
 # provided by autoconf relies on wchar_t.

--===============4907602503495271301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4907602503495271301==--

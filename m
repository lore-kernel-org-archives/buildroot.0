Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D490CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FD7E608C5;
	Sat, 10 Oct 2026 09:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVUyisHzYVxr; Sat, 10 Oct 2026 09:28:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2D10C60F12
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624485;
	b=leFlsJfUq2hAm5zbWdD0OZb1Tj4dI4lZ8NFAzeeKqnMpQ0Gs1w4PiJM7/JhHtgEHKRwX
	 PzDhRtnH0BZCODzLn2dJqPj+ok4l991n1sCnP7XSNRmJnfnKgBpGDsxF7ij0nM5Q071Gd
	 uahqZxAj9B7H6fIDZZukP4ZMYW+mOw+ky7BEWtcU17kc3F2TEXRRHEgJhzj+UW3GGOzZa
	 v4UOkqaWJgI/9cYvPsXKc50S1y4HbbBhj1CE1ddv8387vOR9XSHKvlUJK8E8aDZ1umB6t
	 yn31O5M/geCDERc1n9HVkGL65/E2p8uJL81QgFVu+9jbWBWs6OmALvK0d5SE/dZ2Fzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624485;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=4lap+SvO8tRg7fWTVEm6ZqqzNL5J2eajj8SDtkpiLLE=;
	b=k/fNWfEtJRLfRiahxtu8xVQ+6XBF/A+DdrBw2NLPqaoRlAcnA+OZBhLu/cDEts5yq7fx
	 XBow5i2RTiZNJmLTfEcWK08eWX43UUkf3BiabBt+zbYp8iW/O0jVKRMASXi1T+Eiw5h1K
	 aBOatse/lNfC4VQ77o/Aypeg0sptmVNx6gO887cJt/EfMGVuxBcJXIQNdsDXTAUUjBgxG
	 rPQjWgk1WMyxCrASQ9CemhIndHuNoV/PWvN9fWHXgyWVaxZ59wZvU6GMfbjeNkWvCyYJd
	 0hTwkyYvtDluiCOwfjPdVfudy8uUQMg2wBhle6m5xAH2kkNVBmaKiERq6qyOXJeXzHw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624485;
	bh=4lap+SvO8tRg7fWTVEm6ZqqzNL5J2eajj8SDtkpiLLE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OXMel3CXpqE4XtAOLy0LPVSkYOLh22TZvAsi+HLyrL8adX+2xBiPcBf7Gc7n9Ek4L
	 3t9ZKAE88eKGya7GxpUil6SST4IamfMtPIC59YU2CgR4tdtPziKvn4gI7+DkocKSb3
	 ckKHfAohfwxmiubSEmQJ9kRuGJCPIUpiNYMx1HNUvg/Tc2/DtjFVB2gscdebrH8DX5
	 srnMAEy4SNrPTlyYrYiqAFgZGbD4RDYHPZnIVIYEtOZQnCD23EDa88FvQ1LjFvn+4r
	 LnJ56dPvjrPTd+uOIMgwMdsjYqZqzKPxzSxQ+AEoAPiYawGo52CyiXPsXBjRijGiUa
	 hBYQasy082Aaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D10C60F12;
	Sat, 10 Oct 2026 09:28:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87A7075
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7852881126
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wns-JgOM1x3o for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6325481166
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=qnCUiLz0z2xcp3rfecw2QKkVOEkpNcm7Z0pgKim2Tj4WGy9pMNxFedd9ANYFQHOikDyC
 TDqsEaWHEhWxS/NeESxKohLIYJPFphSNC3KzqA+za3BgcBgmeIZdn5zfeq9f2lzeMdp6m
 iVs1t5JsFZjO+6VXVPaiAwT0JLVJZGhvSBTA2xIiTA5np+QouEBxQi4k4FaWUGOvYo2ex
 uV0ZELhHwIb9XBeXfobhMdgkkpTb0XEH7TOOgozKm1xJ4x3Rds/i5nR92SzznSoF5sdhE
 tv1420tQOpXOU7t92wF2pDN0De4PSZ+p7RtW4ZxXurglpPCOotnGUdIOFsvhussWfjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6/P637P9nHHzMZpqQ3D+N4old2cAuZpT0xrFdxcsp4E=;
 b=Eg4b5g7P28NXrkkAMM5KxYUzRs79yLz1wQK5Dn3RcsJvs9o/daUrxG1VALgvqGZzSGIb
 5YGfDAyfrwFCvERwKHtK9SDgkXGxn+sEXAiBWm3uchW5isaskv0evdbdrmpQXM5ST8oHy
 Ug1HqdrR/kwdgdEq5UuG6o+zqZsNsM7Iob81vcazWcOTVgI7dQOJNOGqJuk1LcSTC5AUy
 s/dQIweNJ14mAiQK6KN65FqgJnqOgY+eRjALDyRgk3hVjE44q0sb+Glu0F5z3iVWwRLbZ
 jtH07PRzZz+WYF2M/BkrhlgXSEuLRf9UTWCStF8HIyMiN48j0NEOM1z02yCHgfR4cpw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6325481166
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C9D78F1BD; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:26:46 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5cf40d817a0667c40565b26f402f14813c19b724
X-Git-Newrev: 9b01c2a336ef77720f6d20f97b19f513c05a8545
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.4C9D78F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/chrony: add
 50-chrony.list for systemd-timedated
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
Content-Type: multipart/mixed; boundary="===============0446013553384487369=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0446013553384487369==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b01c2a336ef77720f6d20f97b19f513c05a8545
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

systemd-timedated discovers NTP services from ntp-units.d/*.list.
Buildroot's chrony package never installs one: on a systemd image
without timesyncd, 'timedatectl status' reports

    NTP service: n/a

and 'timedatectl set-ntp on' fails with

    Failed to set ntp: NTP not supported

even though chronyd is running.

Install 50-chrony.list, following the convention set by Debian,
Fedora and Arch, so timedatectl can manage chrony.

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 079f168792e1520b615c64d436ed3bb100d9b6f5)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/chrony/50-chrony.list | 1 +
 package/chrony/chrony.mk      | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/chrony/50-chrony.list b/package/chrony/50-chrony.list
new file mode 100644
index 0000000000..6b9cca00bb
--- /dev/null
+++ b/package/chrony/50-chrony.list
@@ -0,0 +1 @@
+chrony.service
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 642e1d8fd6..2c0a7980f1 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -85,6 +85,9 @@ endef
 define CHRONY_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/chrony/chrony.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/chrony.service
+	# advertise chrony.service to systemd-timedated
+	$(INSTALL) -D -m 644 $(CHRONY_PKGDIR)/50-chrony.list \
+		$(TARGET_DIR)/usr/lib/systemd/ntp-units.d/50-chrony.list
 endef
 
 $(eval $(generic-package))

--===============0446013553384487369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0446013553384487369==--

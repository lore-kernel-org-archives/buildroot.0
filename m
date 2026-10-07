Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008F4CA6004
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 06:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E90A406CC;
	Wed,  7 Oct 2026 06:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIyvGlre-jiI; Wed,  7 Oct 2026 06:05:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C5C11406A8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791353117;
	b=U2xUhgtscY8co7N7raeyT2P2gKatbGTQQU1JHaoODGSah4pVDe+TQwp+3PcrkBSRGW7v
	 C+wOGERVxLuFHNXdlb9cTTg0+vulzJ4y1IvxncNh2UULyhodPX8f3m0BdIDIJCpA6i1Pd
	 O7KNaj7efAgz80mvke0zth/AK5IeQ118vpEahNKDuiauVNtU1YEL2i8plSSLH0QvUHm+n
	 qydOiFZvNjfuSnftT5BPoXS9DZrXLdepaJxa/6vOmXAoxTLXtLTmlUQ+5MaHT13FsSEZ9
	 tvtJEqVs7q9m1Q02Kr3pLZUCZdAN5JdMUZjc54NXbHNdwgsYqucjT3iRbbHxfxkh6Hg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791353117;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=KtEmwo7ZpoyyXE/LrfbAxiFtxanEb9FXE6rwuReXvGg=;
	b=Pkb9tTMBZeBOyZAlDfkN/MdpsvIxdYDzhx/9Kzz2wI7J1vy5i+mRbsMhLzrMVmxePOe2
	 wFeNroS7e/paOxibCi6TH3M6B/Na/XlO5EQSGgLTN1CdB3Ch5BniHxL9uzxRtvu6rlRF2
	 llhnsJ/JLg1YmBlzd7DJA1BXCZOpPNYXLPGUR+WDdtpKbQv8IUmtROVUry0BLPRuRLA2v
	 zIi+4xUicNbjNHlttHIcUkToaDq85d9RBObhaorcpctNebONSe5DM4y2B7RoaxQOGl2jn
	 P14HA+GqzKo7WapLKijA+JQhxdd2gNb2qGe9y/CDq2O3zoy2DPSu5XghPibfCxVNKFg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791353117;
	bh=KtEmwo7ZpoyyXE/LrfbAxiFtxanEb9FXE6rwuReXvGg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hdSbNg511tMR1o/8ZLHrsO2jrNY/F3y6Z6nemumgIMgCxWZSYMf9YaqYFq9yFtDfL
	 1Mhq8O//cZTBp/1sVvAcfqIS/G3uJ2YoS041zXjv/evDFXSsPNiTCrf4hYu4S3eYNR
	 OYk3UtlvE1zN7iQYyjzP/UWzAZ7AGMcSF3WfPYQvW1EFXNibfJXiHRA7EJTb6ZUIvm
	 akHuJh7jQhA/yIB/doGvzrI4H2xPZP7iPMp+38nUGQv13xMDypf+i+GUzBTfijfnR8
	 /bepEQ7FLvg3r0irlJTsTaX3Eq5Jsz+yMzkVWfZhsM44uytm78iDYYmRgwAKFotWrR
	 aM9a/09783VTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5C11406A8;
	Wed,  7 Oct 2026 06:05:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84BBF32F
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 05:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 756E74053D
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 05:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Jias1MOhEBy for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 05:47:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8BE92403E8
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791352052;
 b=WHWvPLd2kax4b3K8s9q5wC+oKPbudzo20I782lHKic4WQCjmSfxWeCWFEC2wqoedlON1
 /6V/l2cMbY5jtqvTsWXXp+UDjHEkfGfpv+p7dVhZap0edVwrkpYDiKYhruZCYYWeY9YAK
 p/fn4zMTXNZXP1WD2knAEUrHICt1QxpgLadgW6l6814ztlah1iREMOww4AzX+49ryC3tb
 6en0HzX3gWfsUgj9UG+ztsOKjtZj4WA38rOEpmKH0ZpQztCDclwHBQ5IspFUu/AYrPY5m
 No6OgDGydpYc+oWlYX7NcxDQKQHDJRLcNO3cAxR5TbN/yVUVyiugVVQik+b8+9EmvLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791352052;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=maSIra2KPvisO6Ey64AIQ9n0SxovoGi5ObFuJZ6RF7U=;
 b=g9bFTMIl4QlnNB7JDLfDdfKhIBkzkq4YFx0TvKnM4MqxW1NNq+1s2SR8a+anbzZXvjOL
 8p695/hRgGrTtCy9s9dVpN3R3rvOqHx+UqNeu++MaRgT0+nFDNndgYq/vKXvISfdx7A4M
 ZMqO1fe3J3cheVNj3Xc0P13Skx1/aShdOrbJPYVbF+gjSz8kh7ubuQT9YRaokiABnQVN9
 6JYKb7HbmjIRgzV13d58qm3ClzY8Vz/P/Z62+5wMgXBDwci2t04tzEd3MBi7YzNpyTnPB
 n6gYqtmztrPh6WKnRmNchtmuFIoxSmPfJuA5+L7Cw8+/Bl8lfEjka5dBhE1WDvUpobQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BE92403E8
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 05:47:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBDCD8DA9E; Wed,  7 Oct 2026 05:46:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Oct 2026 07:46:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 846bdb2222bc03c26be61b4be4101c80f1c21463
X-Git-Newrev: 042b25792ba0e3eab1e70c614278664253fef1b0
X-Patchwork-Hint: ignore
Message-Id: <20261007054615.EBDCD8DA9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: enable systemd support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/042b25792ba0e3eab1e70c614278664253fef1b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

`--systemd-install-services` just installs samba's unit files,
whereas `--with-systemd` enables samba's own systemd integration,
used to send status updates to systemd.
I needed this because an app I'm writing needs to know
when samba is ready to start serving files.

Signed-off-by: Jesse Talavera <jesse@jesse.tg>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 88d2c598c4..1fd73b2bb6 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -199,8 +199,10 @@ define SAMBA4_INSTALL_INIT_SYSV
 endef
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-SAMBA4_CONF_OPTS += --systemd-install-services
+SAMBA4_CONF_OPTS += --systemd-install-services --with-systemd
 SAMBA4_DEPENDENCIES += systemd
+else
+SAMBA4_CONF_OPTS += --without-systemd
 endif
 
 define SAMBA4_INSTALL_INIT_SYSTEMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

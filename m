Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EF4CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F8F40981;
	Sat, 10 Oct 2026 09:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VY__ACYlTmdT; Sat, 10 Oct 2026 09:27:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 720254052E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624467;
	b=obBwmO58fIHbLnGUSMVkk9WwYeF108+LQFGyRAgHMZwnmq9iolBBtuvORUsJ6TfLW5gS
	 mU41Ibb/AtVU08SVOCUmVgs8on0pfdjZXVKCDW3OGvposGJH03e3Ca6C816LyvFsnJ7BZ
	 Wmml/hZPbxpbVWOSppL11XE7EPkuyigsu/MeNP3sBxITwZkZ5VcZrsVGuDazJcHwCZ6cO
	 vPrEGaEp/IQRRuL20p0u0DqOuEmD2fFv+5XMpDRAlmOv0+lP9E8lR3613vohH9V0TVWTT
	 JJYx9sw5oToXrhLSdAICEb7BKsGuswNKTgNeiK2opwqX42oNposAUq/Ae3/J/rCdSdg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624467;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=QtMElS/2/bR3lZ0kpm4pSxueS2DQyeQ7HWkH66avyPw=;
	b=TAS1Y3huXEonXb6LxvDhNmgUg10h5Z+rlcZj1LVN28m3X1VAw0vWchyftLq5fJF3x6b6
	 W7rhcZ65qHfIdlipn4/924d9pdJpzD+dBqHHvAUckN2+pp/qGy5WIRSlSTZYyWMGCVmhz
	 +ERTu9a5Y+YvrSbyYeVcx5yWUF9oN8uj2mkcOjWvTe6btVaqKTZMS1ixE0+jwvRZPQBkP
	 pZN8rZLpbVeuLpja/rBDaI/1CXo6blulypw4W5TS4BHCiA8P0tW+Zxqt4Of1nV+w76w29
	 JYZ9KhEXx/mL5alME/+hfR4p3uKXWvmqeV4qYkBE/zDVLQiWi3x5t0BPYUJtNRKT+kw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624467;
	bh=QtMElS/2/bR3lZ0kpm4pSxueS2DQyeQ7HWkH66avyPw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=meBD+m3QN92HQiRPZNk7pKfCZKRtCo3nPE8r2e4r8A81TpuP1fik2UZnjA57EcMcZ
	 9ECq0WztC+GT15U0H+a5i2cBG7ULu3I6mFUmJJ0qCZsPXrzyxTepKatlGoJYF89JWx
	 DKriGqRM6tKPkRIlTug77NZBtwE22pQtGLyh2bc8IBp1EWA266mEMZYA8tDoXGuaHy
	 N62JA4m+hGQapQAHy1wp7jAE4CbpkqvYoFYdnmpybStgWLpPf/tUl9n5o7Ib4tEdHW
	 Pgda7M/QLTbta8KmUzuC0g4oI1CvIIctHtIYewj+14IseEJy4i5llG0jbkuYdw4tLG
	 Tx5hl4BGzYIYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 720254052E;
	Sat, 10 Oct 2026 09:27:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 078BF9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E25DF81213
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ei2PQQsIppgp for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CC69981184
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=C8TGT7pSxoN+Vy/WhcV7fwCyTPTsdG987odvPy1Z8GIYBo4muZYGWx6PqnnabT5TEVLZ
 yQiPr0IGQKLVHJyJj0btx1cdvXykCrysVb1lqmkR1cdCRgfIY/WJtvKkxczzSused6VWJ
 h5uPthQkTp8jmBlcCX9nyCA8g8BTaGnxy1G76hRSnD2/qDUtrK98jXf+RKjCZL501S2Ar
 d3hF61qSAVOTKe7rU6/+RhDRxUWk3jH5jHhEjPfAbcqQZ4cI4yGYPZ3eCMGl4kPfohhhw
 A99IyocOqPLioN+J5ijkX+GPadiGlzdLzABXSnAtKpjc5tHIZyeAVv2+vnGWgN5MIrA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Df1QK1cvVmHnMtcDXNYL2BUwsUToybiFj0PFqULqJEE=;
 b=kzzt21XVJ84hRddJ0iFTIcD6qvp3Qac74o4X0sRa4xg0BP5ujqm59M3SlYcXU/I8B9Qx
 /RfWayaXwkBLoQ7pJRJjVEJK6CMbpSrIObFvkDGE/i2sjdsS9+7GHlbRBYziX/lI5TFVw
 ZODby0qFl7k3SBANXSM/Bs/7FrHiMNAZ6rNxliIIoYBIqff8cWsZFjt9gpUOO9VBM5y/U
 5fVtPx/ez8ybYZUwIhEpfJE6RVlDIGaI4MsDDXm+nlvkWtJOLNpQbdINgNqDrPKeQxF5w
 CwS2FMDv7z2rvaH7B3ZlKiqYhwotof1IKWDtKzRLHRSYgDQnzb+O7GXRGQHm3PtjsgQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC69981184
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4FD68F0B1; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:02:44 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d26ff664dbf313c16c1b0426300e69bb6df9d030
X-Git-Newrev: d42116810e6142fd7c245660cb807c2a05cbca62
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.B4FD68F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/network-manager:
 set modprobe path to /sbin/modprobe
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
Content-Type: multipart/mixed; boundary="===============7519770838401684615=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7519770838401684615==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d42116810e6142fd7c245660cb807c2a05cbca62
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

With -Dmodprobe left empty, meson setup searches /sbin and /usr/sbin
on the host, and if it finds modprobe bakes the path into
MODPROBE_PATH, which may be different from the install path on the
target.

Pass -Dmodprobe=/sbin/modprobe: both busybox's and kmod's modprobe
resolve there; a missing modprobe only costs an error log at runtime.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
[Fiona: clarify that only /sbin and /usr/sbin are searched, not $PATH]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit dbb77fc03fcd505a02459a3833f0a8d2af4440d0)
[raphael: resolve conflict]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/network-manager/network-manager.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index a0f6af9ffd..9b8618cab6 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -29,6 +29,7 @@ NETWORK_MANAGER_CONF_OPTS = \
 	-Dtests=no \
 	-Dqt=false \
 	-Diptables=/usr/sbin/iptables \
+	-Dmodprobe=/sbin/modprobe \
 	-Difupdown=false \
 	-Dnm_cloud_setup=false \
 	-Dsession_tracking_consolekit=false

--===============7519770838401684615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7519770838401684615==--

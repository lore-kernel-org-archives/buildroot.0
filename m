Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCE4CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06E1961334;
	Fri, 16 Oct 2026 13:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id gOw6npWkd2eQ; Fri, 16 Oct 2026 13:13:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DF0F961377
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156408;
	b=EGI6ukjiRPWcWrBliAl++k4cRccpqJ2yT0Qjmz1eQGggRSRd7me6J6RX7Yh6A1ST97Q0
	 kg9EcMGndgryHaeg3/02+BQgV+jFOehZHPMZ7WEWJ3BhL4a3j8kEi8C3117ey0y1gmDJl
	 aoLUs0ixntIOYabnbtEwyoCA9K3hPYaQArYJEm3jv8NVM47CpLyDS241gIBmqDIW6Plk/
	 OLx5sdd/cn8I8wlXpQnU3SwTRpS4fRoK4w8fU61yPYMhuShKPj7xvIwCm4QOCFpRbc77S
	 Xc0uzDP2o5Gz4HhxIxSu45TuYOCq5DfLzaVGx6SPVB4QDEle15VeygYuB0hqrXEMz5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156408;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=X96WnhEaVSedUGNRlVHBP7uS6Ku2yJtdWFpTwKOng4Y=;
	b=bohTdSMosklbXWzCNbiQNVXJbYEIjCa8RM77HXzwm84zWzFb5YDYPxtIDlZp+3lllSvx
	 LTcijqgYqDVOq4LCV2O2OdtBfp9mSWaM6gl0P7K2ezLAoNuHLacxpa8ApNfB5BsxZtVPY
	 V65y+AWXgIQC+msmW/WFCpwjOBloOElnbemUKQ+eFZWHmywhBSsklMU3ISpa48K6Hteos
	 PVD9Sd/ad5HPE4lPfkgWTWb8EN5VadgDnzF/uYmAFSQHYro4Hji1Daex97ovaJ9Uls1Ht
	 4f5URm33172JHK8EuRhGz1ml2JjNmytNd41RAPZGtfIEGKWxiQ6mPrLLhbYwKOiDZ0Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156408;
	bh=X96WnhEaVSedUGNRlVHBP7uS6Ku2yJtdWFpTwKOng4Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bkvoCfNt5L4Lz8neROmAblzR1/YRk8jsEGLQHF7zwslOdoVZh7AjMQmuDq0HwoXRO
	 QJ9YtcJwnZABKK3kkOit9bPFvmHvvmKF1f4vBUiXVirL4kH0LI7A7VINjLxVZNA2hU
	 UHE2GJMrD1bfheFe9p8YArOul7wmezfczSqOtQ3BfDSv3AwtqczjemUAtLuhjPXHXS
	 sh4obA4Z9//xLWaDO07VYZSR3YtpYJNY9wRjcLbkhpkFCuw80/HxdnzE1XQXZz4zsc
	 vKzWtvpSIrxZEYJkOBOTjLQbF6vUqtGZNqdohpHiDVd2IVw+zq9hY0Zc07OGVR4JYL
	 ynnn6vdPY+0mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF0F961377;
	Fri, 16 Oct 2026 13:13:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36D74920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AE3160EFC
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ihja9OWy8d0J for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 19A8D60F3B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=llt6qLbqCOCuSC02p9HUOL8RhGUs3yPIPI5NTGSDlAO7GOpxOrFPEY2XS674VtXWu2gm
 dlQLYio2uaeIufhkqUjrub24FK0W8NQdDIUF+eWtAL8oLXpQ46wg0BwIaenfAv+qau+li
 jgD5fM9GcPCyVF6pRPl1qOFc3xxAk54tGNA1EppX6isQDuLotcIDA4n3q3J4m4v5Ir26J
 rwOIZsu4jLY1OpuvQlXtPSv6H3WsaubDcIHsqmIo+cJ+/kdkVH36lvnx5yreWfXXz/tZp
 wgC7/vGfeYtRAANLSfxrGzCnTcRJEQEOYou5NOJ3HaKIvuTJNpygro/PadM77Mp0VRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=L6a5b0l6gR8n4qFqaqQevVRqF9SMTbsmrx3NCJysLqg=;
 b=dnlMJorJd4jH8A2IJp08RBWiAn16H3g/S8EdneHW2CFn/5+8DzoSn+3fBIsCVCU40Heg
 f51YcqlweQACE4ns93OC34pTlF3azqlUqHOJHWZt420DvewYwMptpRlY2KVEHAhM3jqB2
 TbQhkLJTXuzjUKWZt9Bn2b9rpzUE5JCFa+MvykIiOttBL8QNFt6NsI0TDcBIkTD8fNBu4
 TrbUAmgne0uNaZc31HK7YY5QmqMEVEEHUq5yiCtZAbnXNedVjSg1damBQp6ZnkjNxOugF
 K8dN1yzPeXa1CylxmZR8vip3X1dLx1OR7/rLj+ciQk2YCway65KPDe1xFiTiOOGlAqQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19A8D60F3B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09315960CB; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:14:35 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: ee301c0b16064269a09b1157cdd1f0607e26045d
X-Git-Newrev: b18021117a819a445c34ce55a82816f7e607e526
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.09315960CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/wmenu: switch to
 Git download
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
Content-Type: multipart/mixed; boundary="===============2650242907964488344=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2650242907964488344==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b18021117a819a445c34ce55a82816f7e607e526
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Codeberg has changed the way it generate hashes for at least some of
the generated tarballs (see [1]). Since we cannot update the hash
without changing the file name, we switch to Git download in order to
have a different file name.

[1]: https://codeberg.org/Codeberg/Community/issues/2861

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 39fdbe5bfe31ff2c7f341041aedeb5c35839be87)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wmenu/wmenu.hash | 2 +-
 package/wmenu/wmenu.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wmenu/wmenu.hash b/package/wmenu/wmenu.hash
index c4941001f4..235a46ad96 100644
--- a/package/wmenu/wmenu.hash
+++ b/package/wmenu/wmenu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4e6aea3f8975fec720f6eb87aad620d5297a8a5a137615e4cf047e95d2b9d308  0.2.0.tar.gz
+sha256  a77c0c9cdf501a06d011decd07a80569a5eae2178816e9b14a5fda70ac815171  wmenu-0.2.0-git4.tar.gz
 sha256  500f0a221b2f3667676f6a084fb4e92ba4f74d09f45bc492e55aec4dd296bff2  LICENSE
diff --git a/package/wmenu/wmenu.mk b/package/wmenu/wmenu.mk
index 7454dba8b9..8ecfdb25d5 100644
--- a/package/wmenu/wmenu.mk
+++ b/package/wmenu/wmenu.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 WMENU_VERSION = 0.2.0
-WMENU_SOURCE = $(WMENU_VERSION).tar.gz
-WMENU_SITE = https://codeberg.org/adnano/wmenu/archive
+WMENU_SITE = https://codeberg.org/adnano/wmenu.git
+WMENU_SITE_METHOD = git
 WMENU_LICENSE = MIT
 WMENU_LICENSE_FILES = LICENSE
 WMENU_DEPENDENCIES = \

--===============2650242907964488344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2650242907964488344==--

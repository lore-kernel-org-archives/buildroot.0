Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57804C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 224CE81265;
	Thu, 24 Sep 2026 18:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSlVAPWVcFdA; Thu, 24 Sep 2026 18:57:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4009C8125F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276227;
	b=Sqkc0AlY/98le/orimImG1I42e3KXTQmy1/PxEQmCz8RzZGZNVV3VN4eBEIk5IQSzfyb
	 1Gytg1JeBBL8/9kVnv3TQgNUbAlQdJRoTe9tQcoOVw1ZnEwgaLKKMGQ43enSppg3z387w
	 9ypal/TX0wUQWQoNJy8D4yOlpBr9d630a3I9//bVoFsTwUeXB85G5qCrWx5KWXC5dvzke
	 /+cTQvurs0mHYUbxNsMtZq5e5BEAkbZwqkYbGPzV9eglEfWf3AQ4No1ptmFZ5/rMWq+nc
	 anm6pDRgidYj6aBGnmH4Z0uv1KMkvOJvIuBoyAM1geIfd+nZwVCbWNDoLkRt3/kXGWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276227;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=EBOx/vxuSnsxWkVzYvZQvJKqe+LYnwtfj4jRbIuYoPk=;
	b=oCQjAp+SydL4RxNQq54X67yDOh5P0G3Gsw7XzDFya0ABw3bD1kjokg0AoD4BVUAt/PbN
	 hHIpKVg5zDs6ubhyzGcT/8cfXcWFoniibO3d2j+NiP1YGDn68FNxW8+ceY1aMBEsy19dh
	 VT6hqmHnRdNrKKJ0ltDCQI994mmYiRunMmvlJR8zVMMH+BDHWI0nb29DOR6WsUjWPW4u1
	 I+nrVI5fjmTdFY2VlJqbBgPyQ0wYPpbp5Znsx5yOmUxnbxGES12EkcNGOXtEwvUYoi+Ao
	 vtahm8QsLsehLRYDzOtDphnYn9jeaF4MKGeLKY8GDNL8HfhQpUjCBSLE7skzEBVTekA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276227;
	bh=EBOx/vxuSnsxWkVzYvZQvJKqe+LYnwtfj4jRbIuYoPk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TleW2F7I+exB3ZStMnRkpQB09dUgRlUCEOahX8nvdJtCq4VSMVCArUYLk8myPj/11
	 0qHagt9QN+CI1sNlXP8h4chh3DGmv2nMImRTM1YVHpLBKeUHUjtuCzJ7srDsd+/ykz
	 zFb5Xz8z51E/xME5Slly5E6GzNsTn2NE/kDUeghOu5wuTv1PykMoSpnt4000PI7gid
	 XJdvcbwlgywmITPJCbSt5rDyQ15Nm77iKkVY5BTb5zGv24sVfBXNzgQ35J2VT0RtnK
	 rgZX/HhBBURKCjH6POyNkP2hNWPhzp1CAkE5h6+aQTvDywZuxZPMoXXMHVjeH+BQvH
	 94KbML5tDNMlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4009C8125F;
	Thu, 24 Sep 2026 18:57:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 343CE937
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2557B40ABC
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FP9vSyq4Z3Ng for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 771FA40ABE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276202;
 b=HZJnx/6gIhI0eIcerwSLdXE4AjYDRHI3XmVMUo2d6WCsuI3ugw0dit+yhl7pFElaNTk0
 MJEnObHH1ZP63+UJvjDNWdoT7KRnl5OBAdyH6UvrHLEZJVFyqMKGvQaHDcznK/3dnBlPg
 guUktPb1OHhRg9hCRAKswiu6RRG4Zkn6WJ9RivwfTK8sW4YJtu1bKF5S3+bV89fORI95Z
 wgEdWRQ7jkspSjA+sKjJcVm2n9QbIwUXxBFZf5++HNQq46b0ei1BxSAO/jVE5jeopckxz
 1OqsqjXPo3IsrTperELA0/nenl2myNzHVGbwwAsnAqRvK3K66gR6/1w5PpDhLpdIE9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2pEc5dGBHXco9Fpw6q3P2erV0watHyz5LUGWOExOUIw=;
 b=P0McdKtUF8E5hglw7dcfnQAaaGFOoi4ohegbSxS69tlGQ6ENF9uY+MYfz5mQpVf4U+L0
 7rhmVx7TI+SE9CB2MUwRKJ0L4ABF39fAhutuECpyz/Dno33PiqGtCW5n//9+ctAh0NZLn
 vsmBwFTENqb+iPIaogCJEpr+jiXgRacXXyCm+7e8RWqTMjCX/doVEyIEJ6mi5OINdUPdR
 R2MJ/UwS0rvxDS2wFR7CzqDM+sy01lFJ1JlGzw3urwlFsfBXoNUsqtubx5e74QCe/WBT0
 bc5zLHLmBSBoR5S7BoFM8bYDXV0T6nq6sTEcch/76iU9H3/rNJ1SNzLorhPALEg4oxw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 771FA40ABE
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BB3598383; Thu, 24 Sep 2026 18:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:47:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d75b314ec81b3040520e9eed0ba61f27d8cbf7ff
X-Git-Newrev: 20974a249c710ca795e9438a35f218b385aca106
X-Patchwork-Hint: ignore
Message-Id: <20260924185532.1BB3598383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/netdata:
 propagate gcc version dependency of protobuf
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
Content-Type: multipart/mixed; boundary="===============3999503998303099898=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3999503998303099898==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20974a249c710ca795e9438a35f218b385aca106
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Since the bump of libabseil-cpp in commit
76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c, it requires gcc 10. As part
of this commit, the protobuf package was updated, but not its reverse
dependency netdata. This commit fixes this issue.

Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump to version 20260817.0")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e91ffb1afbfab37a6fab61d01619c8759ccf8162)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/netdata/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/netdata/Config.in b/package/netdata/Config.in
index 527d4d39af..2c7d456528 100644
--- a/package/netdata/Config.in
+++ b/package/netdata/Config.in
@@ -23,14 +23,14 @@ if BR2_PACKAGE_NETDATA
 config BR2_PACKAGE_NETDATA_PROMETHEUS
 	bool "prometheus remote write backend"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_SNAPPY
 	help
 	  Enable prometheus remote write backend
 
-comment "prometheus remote write backend needs a toolchain w/ gcc >= 8"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+comment "prometheus remote write backend needs a toolchain w/ gcc >= 10"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 endif

--===============3999503998303099898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3999503998303099898==--

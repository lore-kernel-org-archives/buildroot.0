Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE9BCCF2C2
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD53B61279;
	Fri, 16 Oct 2026 13:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1YQQ4zhVViAW; Fri, 16 Oct 2026 13:12:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1AF416123E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156355;
	b=Xmsvme13T7rfYBoo1EIoktgJ6JmOxpxgG0wYfopBpHzNXusfFH4cUn8mEAoDVhV+OGby
	 pCvjseMZpYwmzaWl42KM6cpyYlqAFtQGwGFCZYFG5nT9Qpg/HIn1Ebyxk3b9w4Fs4yzMK
	 FPCVEn17NPfvgkogc/uav0v/mJsU+OIIwpJRhp+JV6TQXNySwsNhSFuxf7nQb2P3dzAmj
	 taKo798JvVUerHDbm7RHJ+J5nsGAu4XM8ZLn6enkui8j4TGhxR6U+8XIb6RkL613UdzUV
	 aQ1LNRNv2E6niv0OAQEmP73KlXheaxeclwVpihF95XxDSczDW58Qus0H52MClSLy4fg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156355;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+/s/S1kSIwi1stJpbUeAnG9ScGVOuC758iL/TRnasB8=;
	b=MOn34q3yOFdJ7/243aBV/FeSOIW68GbLHrSUxJiuW+MELPm6kgyrjbc3L2Xm0IlpsdUZ
	 dBDxd92mYRuwTbXUO8JjMCPDrhszGPzZtvmRpHjKOKrR8qztf9WJNBjHq79sHZlvUEs5w
	 LSVn/fIDHNSfQk+yQHKOkTVw2EYZHgb7GHoDVDCnDPCYEziitdq2A+ut9Gq5xJ7LgSJaS
	 AMLMWiguhLiuNhclZ2PmctlPT22X6GpO7GEi6SNXvb+Ll8tzA94a0grkgFkrrGX7fVPCh
	 Wp1OXygERj1faJpBJXv0kds9vwTiysnMcyweGOi2nDHCBrCOhdYz58AGSO+OE4EKnQQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156355;
	bh=+/s/S1kSIwi1stJpbUeAnG9ScGVOuC758iL/TRnasB8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mdu1FOXjx2MiDTjg5xoHc9JxA3KXu4sqreTAkcrfGYQgQcs1WcsDl2QZIHs1ZR2PY
	 RWcNT5+19Nv/oYHUIK63VJxnJadzsR90bLdMr2XTVR8rEyjk4uBt/ysfYvzPluAq47
	 fQlereqJrwAVAmMjDAD+WX77M3DxyDRUfcp4V3Mgp/+UYJx15qP1ffn1ogP+FwiGDj
	 1IS67HU+XUEy5DjfdiEd4s+TMRPStEeHMx9HaMtFByMoLDzSAFtIqcGMIOltNH2Vzu
	 U+fwniL1pTQe3gcRQcEaUrR/rSD6sg0RWir8QM8jy5tYQXlZ1P2JrNkx+//rcu84AL
	 rHd3SRxDwNp0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AF416123E;
	Fri, 16 Oct 2026 13:12:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA620105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A591660F1A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eiD2h5HpMh1g for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E65CE60F2B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=cP2KlxUhWHV9VWYRVXG9LkREtkEbZIY1PClcBBxprzWi7CswLt25L7gLNZOX3RN1k6Rv
 kkLzAaKsE40sf4dLWtqlsJcoLO9HU7mFwmELPYkAKC2Ts9GBbqF+9pZ7DfT98X0fRfC/E
 kjBHKNJrSXva///WmAHJXRMD7oU117lBhIkVNMauniRAJSVSJjOtvBGNh1sfxp51hHGJp
 BUYJhAac2lctY6M64UjUaYNfyCoyYdM6Wxk6qpRbdffN/pDVZxg+Bv048ydqEi9aTO6WP
 tJutoRs9UB/DSVPX1btnK3R6jwQsVkAcW7C7CTe4t8N53eNG/xKLhZ4Z+G3XEI8S1RA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=g9PxJlSADOPNa5E+EVxeGdF90LcFsxK6ZzfV5M8yAiI=;
 b=V3Ojf1xGQj62E2azdThMNP45Vl3ToQvtY7DsSUBunGFhLNuNPb4LmTWCkNyvFeTrBbJm
 QGHPuOpF1tl92fl1M+oK1gnNmAmKlORb9q4yB+TABLlalY15OpjN3d46gpDhAs08PiJhI
 9hx5VxjGsvG94nUhNfe81AgRWaX0eIJ0CRwqvscZu2wa/nAWpHkVUtkXZrlKVs81M56k5
 /UZEqVY8wlHUObkflnwFSj63+qamImR4iU060Y+FoeMBQW+PCKe1qSosxHvWn9biceBe1
 fZyUun9fapbJgOrJt2GAGqYgo49i71bYlxE4NOGj0bnPnbAL4CBJTfXYbeh32B30LjA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E65CE60F2B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D671C960D9; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:11:43 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 9d96d396ec4db0ae4166d29bc081ba37a0d6e5fe
X-Git-Newrev: aab81c2f63d2158b702eb044a97d884610b64123
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.D671C960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/sqlitecpp:
 disable stack protection
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
Content-Type: multipart/mixed; boundary="===============7372705699949687758=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7372705699949687758==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aab81c2f63d2158b702eb044a97d884610b64123
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

SQLiteCpp has an internal setting for stack protection which defaults
to "on". Since Buildroot handles stack protection itself this is not
needed and more importantly it causes problems as the option enables
stack protection support even when the toolchain doesn't support it,
as can be reproduced using the following defconfig:

BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE=y
BR2_PACKAGE_SQLITECPP=y

Fixes:
br-test-pkg/bootlin-x86-i686-musl
https://gitlab.com/heinemml/buildroot/-/jobs/16865965418

Oddly enough, there are no autobuilder failures recorded for this
issue.

Fixes: e74059b39ce2f ("package/sqlitecpp: new package")
Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 39235638d171f433b3790c6cf9226dec728cd105)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sqlitecpp/sqlitecpp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sqlitecpp/sqlitecpp.mk b/package/sqlitecpp/sqlitecpp.mk
index 95ddc953cb..418860fc6d 100644
--- a/package/sqlitecpp/sqlitecpp.mk
+++ b/package/sqlitecpp/sqlitecpp.mk
@@ -14,6 +14,7 @@ SQLITECPP_INSTALL_STAGING = YES
 SQLITECPP_CONF_OPTS = \
 	-DSQLITECPP_INTERNAL_SQLITE=OFF \
 	-DSQLITECPP_RUN_CPPLINT=OFF \
-	-DSQLITECPP_RUN_CPPCHECK=OFF
+	-DSQLITECPP_RUN_CPPCHECK=OFF \
+	-DSQLITECPP_USE_STACK_PROTECTION=OFF
 
 $(eval $(cmake-package))

--===============7372705699949687758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7372705699949687758==--

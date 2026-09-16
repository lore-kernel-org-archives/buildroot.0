Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CD0C88E7F
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0ED14060A;
	Wed, 16 Sep 2026 18:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hliqh_t6_Fy5; Wed, 16 Sep 2026 18:42:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 33C9940367
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584147;
	b=heC095dtiX9GVtV5Zj7dssEMl1dMHeeV152+cWqIZoPi9ecEvE29RLn6XRS+GimxTh9n
	 d665kJfq4wEuoasNB+ds0YY9OmxG1W48aeIYWN29nKbph2nqgpnCCx6xTivWjUdp2ok9y
	 o1j7fwEm63VgtduRPN/bLUqz1r6ARh8zHAG5hL2YPh/rtTru+mZWaidKxnKvQrCWjFnPD
	 XW7I+vnzzgTlCLQ1IIr3PmyJERnn+TCTw3HwmHCadwnBBJLPglJ31YuoDId6qlFh7EJjz
	 Wae4jRudODS5WGXRET9wLw7vE5B9Se1qGSghjBnMtXg2DcHLKhd+9zVz8vuEkmqR3Iw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584147;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UsU3dK0vG49+ENawIZf7rreat0WtPDr19+ysycR1zNU=;
	b=jInxYWMbv+pR3eBz7CdFzzg/DU3AU46eS8o5WdHB/yGra26w7DgjbHEti/Blh1heVYyy
	 UvQmA6vhQfjukD1U/GMy+eikVxu8eOaKvmH1FXzK7xKc1D2QGPkNLwVgiEn1Z8Sw3KwUx
	 TYgEa4r+FGWzJnbQX4ZpUgXhtfjALie8BLOgP/WbFkWwsGpMqwqR/fiBXOzarnY6a7Ww/
	 O89ItEvrTH610Z6ibLTzYQBJuo8YaUe4ibgwLtxk4PGOUvr5+RFdZ2UzFgwzGKNCWAgDf
	 k+FZewR8DdFHz4Es8FMUsnHhXvwjr9NT/GgdSpjNwsWyFj9I4iJS/SNol4cNM9S4Q8w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584147;
	bh=UsU3dK0vG49+ENawIZf7rreat0WtPDr19+ysycR1zNU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OlPY1eS0t75l1cpHm0KC9knTZ43Zg3GORMtMPox3AfYrTjGNjdVECVkBwbAbbt+zS
	 bfoO8Q1PmGeUGnWajw9/lWjtGkf59apUEb9ib0uAaT720jgo6ZHDKt8k82s/wL/KQC
	 +7JQeq5QQOz9RPQiJsltLjEk+aToPwLrYKQ+LNk1AfAe0ubQreLtbrA7vH2x0MkuOl
	 LnfcJ56pUtV9bvGP/BB6UzeZHP8ZqMq4sXXLtK+BElUk8WMGToVNo3jtoHPur8xdMD
	 35sm7yoE70WdcoX1kXIFrIpKSWdf5mJm28NCDU/RETM6+WBbJU77mjih2W2hkpQ7M5
	 +ZKtYZPY2iPmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33C9940367;
	Wed, 16 Sep 2026 18:42:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD89824D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A40DE809A7
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TDdqyVEP1VH for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:42:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 07ED480993
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584145;
 b=YQZkRtwZf7m/YguMVG94PQcJY4bdyqCDRORM06C5beQrTOl2EOBCdiDBRMAIAuIOJsU3
 AIu7oEqFPG9yuq9R4ZRIg6bairrfbqleXf0NFn4+Spo/Cq7Ud8Qzh9P9fysn5zjJKuw3G
 kwzl5X/UAULfZCbC4wOA08PvtVY0qFXiRzRrDWt47VVHIC8ODu3x+EShBoNp2qq1PCC3m
 6IXecIAgBgrsqNgBqDVm3GLV4O1F/5SP/0tTtQ0448cq7/cHhXPH3tM2WYxPsWzFHH/K9
 9rStIEIJ/lQKqd6pIlkiN+C1fEIgApuLLo+ztQ1mrL6XlXPkBWi34LqDPjMIZuQ/ABg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584145;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VLaJCzfVEYY6FZYKDjDhj9KrEYUX7D4mAHpafKvRTkA=;
 b=q2dDzHxxyt2rEbEJSV0swWodQDmuCC1MjAXHbelN5qQHGVhD1fBB6MzBLoDWTsrCdfM4
 Q4Y48dVks9lmeG43idZ61xAVSuICKF2d5Q08V3cGs/UGKWbRWo0OQYuP+RJ+peqMpvg/u
 +Da8FTG4UdV1BtkvFtlWljTgN4+qmoRgNnPAg6lQBM6+VfjehpjVEhZvAyD4TfzhEeY3U
 afFge8QxgnxQPfZJB712H4geUlELaI7MQ7T8jc0bGWknzjz2QCh4a2+4iGFWVrbgT8AiC
 IqihXUSs6io1mPEsmmoK/74iinGmjCCS/70JeJ6Dhm3oku+luBIq1vPyv2RkO/ysZOA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07ED480993
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:42:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81D8A9605D; Wed, 16 Sep 2026 18:41:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 20:41:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f63e5724327c890c0e5713fc102a4da1e302c587
X-Git-Newrev: 5279b2303c53f61d21bd3c682d008df5875906a0
X-Patchwork-Hint: ignore
Message-Id: <20260916184118.81D8A9605D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: fix kernel headers
 dependency due to seccomp select
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5279b2303c53f61d21bd3c682d008df5875906a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In commit
0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to
version 2.5.3"), the kernel headers dependency of seccomp was bumped
from 3.12 to 3.17, but BR2_PACKAGE_WEBKITGTK_SANDBOX, which is a
reverse dependency of BR2_PACKAGE_LIBSECCOMP was forgotten.

This commit fixes this inconsistency.

Fixes: 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to version 2.5.3")

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index c4ee5a27f7..03e9eaf59e 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -73,7 +73,7 @@ if BR2_PACKAGE_WPEWEBKIT
 config BR2_PACKAGE_WPEWEBKIT_SANDBOX
 	bool "sandboxing support"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
 	select BR2_PACKAGE_BUBBLEWRAP # runtime
 	select BR2_PACKAGE_XDG_DBUS_PROXY # runtime
 	select BR2_PACKAGE_LIBSECCOMP
@@ -81,9 +81,9 @@ config BR2_PACKAGE_WPEWEBKIT_SANDBOX
 	  Enable sandboxing of the processes used for network operation,
 	  disk asccess, and Web content rendering.
 
-comment "sandboxing supports needs a toolchain w/ headers >= 3.12"
+comment "sandboxing supports needs a toolchain w/ headers >= 3.17"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
 config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	bool "multimedia support"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

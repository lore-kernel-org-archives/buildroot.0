Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0517EC98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8EB641206;
	Thu, 24 Sep 2026 18:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2QgXD_n96pl9; Thu, 24 Sep 2026 18:59:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 488A7411FA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276388;
	b=SxBqQGP/GCGO3T6M7a6k3qgRQGTpfQRO0ek3ecwfUfWhWf834byg95ZY+jJsXsM4q9F8
	 LBcnH4UjtNWHDqrFLskm+VlAnsE70TgldLNoKGsAsVa/DLXlliITpMlCHHZTRvCek1W19
	 4H4jBZS5nEId4GjoNMi3E2hTsSU/ysdzUiDgKJxQNl3yuHYwB/3HdLwkT4cthq+eOKv5Q
	 EeHaXx0+eQ8rqbqRuOfxRpj2HTqDuoZEokaYP0ZBoYjBaZPmcucgkdABd4Eq5q2TkGm4E
	 NzflvWU16DrEPl7w3hsL9VrWecUnZcgMIe5ZBWljEtMRqStHEIcfv87mpatqmWpXX2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276388;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=rUnTLVYpj/fpwSqWuZzrhRS6kD4oqf9RUtNFgteWHW4=;
	b=id0KJrgMkR/kO+TJS6zz54uivcrZ3G+UQ00a91GOrTywWTaLGWT6Vp6ajujrtMwlTaJV
	 drYuVWPvhLkJMqROjY8i/feTKuw9UXS3WYqBDLGDXXj39lOnNdHtGqo4ChRTzepANoYJg
	 dC7nwsvCcxsVlVTsWX6HANHlKX0QIjMnuD3RvkZMamnqGEeE+d6bueIxyGTRu4jhZuSpP
	 CXqLEpP+AvcnMfa1K/n77lzGxDI/4ssD/gxm7CjCNFDfndrXVi23AK/ODfcJvfNaUlOlY
	 XyQOoC4ZlE/9J2k+mswKkvO9n5p4Jkqz5zP/Wvx7t3j6I16W3GRD202aj9to8m3/KsQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276388;
	bh=rUnTLVYpj/fpwSqWuZzrhRS6kD4oqf9RUtNFgteWHW4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gMOVyc8EMwRaybH7uokPFOj5XRi0caRMrIkjwvRvNgOdtHM6MgFX/yJnIzYK9vuEI
	 8KJ9MgQ+qbQw5JgLojuxbFtg63RUVf2LyYcq2dC9amWMDS1OmDFNI5o5OPFN5t4Tj+
	 gAJt3S7OMGs7M+4oXozexKkxiWtj2D2di2tftjfOiW9qM+1+vtI6IOJIz7qGeOMXnM
	 IOFI2X/Tz8nGBtBwScfI0paGzYhWD4zDy6BkGd64oMW80bLZUVJCeZl/d8+ZMO7RbV
	 LXzBQKmHUNeXGrtS9iltuKJ5GZUiiATKdYq+7far9EM4La6EmqJ7+MUo84qC605Yu8
	 QrS4Q4fmx5hug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 488A7411FA;
	Thu, 24 Sep 2026 18:59:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CCD5B392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEECE404D8
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1F10GNUBvtUr for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org EAAA6404CD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276214;
 b=EOrasIAQMyDqATD1H+0vpAZjKOvBy0VWjJA/rsb3nyjyqy8qMKdCVfA2V2kVx5jo0xbF
 ZWEJLnLh+9iUEJquR9+X6TAqGFqENjDmRy4JUbSjUu/TUjyLFoT9p1EOUqFsWKMyHtP3I
 wOkwPvczYYiAdtu9JtC1g5a7LQDKNDid5wIfkCorBrY6GNvrB9Ow/+1fCPNZLTmlvCsvv
 ILrW0DkHTO84bjv1pAD4lrsc+kmWYEg9VJr6m7NrXg4rjefJIXkqc+r4RVAYhPNYaUPN4
 vEMSdgb9qO3SWpRHwfjGb8BEtfITey/1KLdEXzUX2hRYMsUl5EL0s/BVHSsOJd4YeIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276214;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=b/EMwuTo/tLSvL+WgydANM4N6uIDlr1BTk9zL6XzMs0=;
 b=kXrdxLnh/p80hKWr9dmGg/6LDFY3t1awrpUOxvU9c0NaSNOQGwSjSSSDPD6buSaaOgjI
 cJQNrtuZpVT64+09M/WzsiafnN+XOp+S0Y2WGgYfoyoJq28n/E0CFNjaXpGEGbyF2sxPr
 HrHl2AkHYD5pkIDJpe7DmvsJzMCZPK2EU8FzIJr86ZUkDhJTWa6JNqhbIzzyQAbcyQqYE
 B6IZiSdosPJWstMzIB/tYihnv5Y3ZOae1ns7R3JiIHii0tCr0oGSf7riOhRj7mAFcTw3N
 uMfZwRYFq4/BG0FM7ND2+775MnV0ou1kdFnUC4tUS4mCDigbbhAvTx8tA8fzHgYTK9A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAAA6404CD
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E80E9835A; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:33:27 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 18f78bdd52b130b1f3aeddfa6ff9bb026ee6939a
X-Git-Newrev: e776f725143d341ca42527a603e7b0264e7c61be
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.8E80E9835A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/mali-t76x: add
 missing license information
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
Content-Type: multipart/mixed; boundary="===============4722631415800769911=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4722631415800769911==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e776f725143d341ca42527a603e7b0264e7c61be
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Added MALI_T76X_STRIP_COMPONENTS = 0 as tar archive follows nonstandard layout with license file being in the topmost directory

Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a4346a385811e3ef2ba209ded9a604f1cd7f38fb)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/mali-t76x/mali-t76x.hash | 1 +
 package/mali-t76x/mali-t76x.mk   | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/mali-t76x/mali-t76x.hash b/package/mali-t76x/mali-t76x.hash
index a754b98074..61671eda29 100644
--- a/package/mali-t76x/mali-t76x.hash
+++ b/package/mali-t76x/mali-t76x.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  5a0b00438edc8066b374481d3332a43c07ec2bd3bc73265983a968970f754902  mali-t76x_r5p0-06rel0_linux_1+fbdev.tar.gz
+sha256  b0ca7cedaf4f604a1c863ea71f741d6ca1474aebac7e606ec43d725b3c74cc63  END_USER_LICENCE_AGREEMENT.txt
diff --git a/package/mali-t76x/mali-t76x.mk b/package/mali-t76x/mali-t76x.mk
index 387685c033..113c541a91 100644
--- a/package/mali-t76x/mali-t76x.mk
+++ b/package/mali-t76x/mali-t76x.mk
@@ -10,9 +10,13 @@ MALI_T76X_SITE = http://malideveloper.arm.com/downloads/drivers/binary/$(MALI_T7
 MALI_T76X_DEPENDENCIES = mesa3d-headers
 MALI_T76X_INSTALL_STAGING = YES
 MALI_T76X_PROVIDES = libegl libgles
+MALI_T76X_LICENSE = ARM Mali GPU EULA
+MALI_T76X_LICENSE_FILES = END_USER_LICENCE_AGREEMENT.txt
+MALI_T76X_REDISTRIBUTE = NO
+MALI_T76X_STRIP_COMPONENTS = 0
 
 define MALI_T76X_INSTALL_STAGING_CMDS
-	$(INSTALL) -m 755 $(@D)/*.so $(STAGING_DIR)/usr/lib/
+	$(INSTALL) -m 755 $(@D)/fbdev/*.so $(STAGING_DIR)/usr/lib/
 
 	$(INSTALL) -D -m 0644 package/mali-t76x/egl.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
@@ -21,7 +25,7 @@ define MALI_T76X_INSTALL_STAGING_CMDS
 endef
 
 define MALI_T76X_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 $(@D)/*.so $(TARGET_DIR)/usr/lib/
+	$(INSTALL) -m 755 $(@D)/fbdev/*.so $(TARGET_DIR)/usr/lib/
 endef
 
 $(eval $(generic-package))

--===============4722631415800769911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4722631415800769911==--

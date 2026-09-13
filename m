Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42887C88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4508C80D4B;
	Sun, 13 Sep 2026 19:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZqS-o7jQ-6jb; Sun, 13 Sep 2026 19:34:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 449CB80D05
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328067;
	b=QsNHpVdO/fBJIXB28+JQEBA2TPmWkwvTB7rVSxKsaElo4GXL13T2WnUs57PsJt7Dtf5J
	 itLFESHIXpA7A/l2BNEy4qOkvZ3K/bA4ZVeZ79VkjMtJhDmY9qEuHluZPSU2qQWQPoltb
	 dkD97RtA3qh1IKt5pcia1sDJNoUVg2AO8mAPoeVbaAyT14YuVJaBHbIGJSSejQ3JJWgJf
	 y2ilFAc9cw9NFIhX7A5s5DA1oYf/VTkJzkv9yCx0Zuj3nSBLNDDIH7CK+0QtDvu26lch4
	 VBQ1eH6bOBUBsg8YvKqNlI+SEBPeDD2K497tMX+N9yqr0Je7FNlPPkIh6lf8xwU7LTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328067;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jn55UM3MzpJfYx3uetpQoff11jM7IFbaX3/bBuXsZ7M=;
	b=BfRYiOGkZdHCMHxpP+hVoMz2ZqQXFtSLMi0aKMNSnhwNkeM6lew8kwHU2WY2+GhJeTrX
	 V10gnm5gSuVvuAMjh1bFDxgkbTGq/AD/csCCyvZnaZyRH5EpavUvG2T+SOVEQhPvzNfZD
	 SFTMNPo8eREFzZkaex6WySx7Tt0MEBQt8PNduNS07bhyoIGOvOq2qacz4R09/EQQU09lw
	 jhF1yih9yq0AokZgVEwk6yalmLCjJGsyF+FdoAslYEwwQ2wPfFj7/N0tBLgJGSYSUdvbf
	 2RXxYunHShmukf1/sv11ZQdnFUSRDMP0K+5O9RpOK0t+TIx4z1mDFuvhIaKKWpQ44xA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328067;
	bh=jn55UM3MzpJfYx3uetpQoff11jM7IFbaX3/bBuXsZ7M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=niHt4Eq4Bbt+KUPByTOEwwt9Q4dlRZXqSlGrO0Rw3RXACsAgYaeJ3w7Smvs0ccxsY
	 vto3pcRhysY64H607EjuBdMhFkt9nbHiLiOcJZhd/VAAJKEOlJRj8n/iYiVBhKi8qd
	 V+otOmWyqzQsjvYOZ/tZk9qtBaXYiNiTpG/74qhI/n0gcsWjhrOHB6LHQyEH8VEwt9
	 voPccoPVQjDfrK0BZIc5tJcImWrsW8YW1n3LicqnsmF4mHG0UlDSlMuUsxGS57Ugjn
	 31KCBylQoOW9zGbHkrxYJND/hPwtgmWXDTGBMZ6YKLo/K99uQE6PoPwLBiVQlpE0eK
	 3AtaNBxB61qDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 449CB80D05;
	Sun, 13 Sep 2026 19:34:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67363224
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B77B605FF
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBlE7p-i4k0D for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 80331605F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328060;
 b=LPZZHL70h8V0m/KjYav4Cx1agbfT8qcHTeHsZ8SW4pFaC0w7fgOt0cgjOkykKo+ByA/A
 5Kw+Sbx6SJu4LyNmRLj1P++pIL8v19mmSrz/C/Zc0Dy7XUlJtOgpeWEVWCUKueGwrsVU8
 uOzGcg/eRxph6SVfkOTCJe1QmOvZyHrLsHjeQYux2nEqh+X0HOaLfjbQI3iP6bWrhf5hG
 6M+cr+mDxhgTAKsK6XZ4H/F7DJQD51Bc70Ma1iLycvfU96eePHIzc7P+ZDRiYFv4sGMQW
 IUF538T0Utkb5GzXZE5hIGEWHTSXd9dOnajnh8MNcqw6Z2TWOYnJd9jzHLHFcTAL+Ag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328060;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RcKkTjkOTMBYh8lPPVvuHI2uzou8g7fDXaj5PCc4NbQ=;
 b=p4uiFLn2DV6sI6rSEujlNrMUWMVACqqgl1oBvZOGlMYPofsYwV4R2OR1CBK9A0Rwz8qH
 L424BwV9xiz1AN7X84tjGGlmrp+xUDvjcbLt7ygpbxjSuVYtAILsTiJXSI3QII2TqLvkN
 GIRpQF64+tHtNUtRBmUClKBFqB9pTdkjAhwrH5oow3b3e9WaRrG57AXGjPAThxv/tWYwH
 UIUZwKy6FJctrI7wRBOatcstyxpQ2BtOLqgh21HZoD2Y6h7InXoz3xlb8Awxa+RkpwxWm
 DovsMaF8YitSN4mtNoDQFTAcfv17hCHSRdnX5jWUn4M3klvph/b2jQDPS1pQNlYVmLA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80331605F9
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 751C595C74; Sun, 13 Sep 2026 19:33:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 21:23:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef92929504e842a1798128988eeb4d959a1a8931
X-Git-Newrev: da906556371ca3728b05ea4f33402891288cc027
X-Patchwork-Hint: ignore
Message-Id: <20260913193315.751C595C74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: propagate gst1-libav
 architecture dependency
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/da906556371ca3728b05ea4f33402891288cc027
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_WEBKITGTK_MULTIMEDIA selects BR2_PACKAGE_GST1_LIBAV, which
depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS, but doesn't propagate
this dependency. In practice, there is no issue, as webkitgtk is only
available on a subset of CPU architectures, while
BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS makes ffmpeg available on pretty much
all CPU architectures, except Cortex-M, m68k coldfire, and some
specific cases of OpenRISC, which are not supported by webkitgtk.

But for the sake of having correct dependency propagation, let's fix
this.

The other packages selected by BR2_PACKAGE_WEBKITGTK_MULTIMEDIA have
dependencies that are already handled at the top-level
BR2_PACKAGE_WEBKITGTK option.

Fixes: e6e549b9e40d42dbb6a551ecaeb040c1e401f21a ("ffmpeg: add BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/webkitgtk/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index cfb05fd0d3..13a65e57dc 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -112,6 +112,7 @@ comment "webkitgtk https support needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	bool "multimedia support"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # gst1-libav
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

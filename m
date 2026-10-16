Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436DDCCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06AD26101E;
	Fri, 16 Oct 2026 13:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYD1HLPxTbRH; Fri, 16 Oct 2026 13:11:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F09B26106B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156264;
	b=evsHhyXXNwt6YGd79qbEYu/8t0J0cHzUwyO3D/IpJSBZ6fNMz3GmdZDDPgEA7m9DXBnf
	 P2gCA78p5U+WOIMGib5kcCsCpahyJMtcYfJshCL9aRDOwLoJBOG2k1OveDr+vKxQu1aBj
	 b7kIOg9SJ5bovq0liuPHbWBPK5rw63zlWMiii6FsrY5e7fVTp37frT0yrE1FZvejZZhCa
	 EFUusbsIRyhiin05+te4VKvdCdypv7UM2WOLQgAKMcIn4JVja5Moq0JIvv6AJaaQJKqKt
	 5n3BPDhNFceZVk5TZm95wdA1ij/7i69LmK/fcw7+XiX0vr6MFy/1pSxzlDgm77RNAaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156264;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=4ZzkpA8qC+D/wHSDQCephaD9I0kP2bp2+Q+/iFaTUYc=;
	b=hDwKn1ph4/Rhu1QDIzq3GeLd+UCNvdO/IT8eKiSLfN95+UJzCqnSJJjQvTSn90MxjvPx
	 RQI8PEYVsbHQijn82dLg5Plco/3EPaXeJCDVEMm98xX8sW36YTHZr+1Mvtr9wKlLwfSLW
	 Ev/cJXOYbyu95mDcR+dCB+yhXwcbY4fPUzJg8j+alXnVSfd1Q23A31UPi8ZCLYFeJazId
	 PoZZrJF2H6zXd8pc+c+NeVBhaBtC4mqpSqeGEABdzXDtpbsZeJVx6h5UeOIpRQQNny9Gp
	 TyzcA0Siu2MeQg1tljnDmfmt2QZjdFyy0GeUvITx2m5JU9Y1SVf2gMd9YSJ/JUMLOvQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156264;
	bh=4ZzkpA8qC+D/wHSDQCephaD9I0kP2bp2+Q+/iFaTUYc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TJqSlQmjdkPkgJ9iKItwwquM7Cg8TUh++GxIxYyfIm4T+Ik64j8v1dBBgd8DSoCc2
	 nl29GgVWk/4k54Kw5w6kv5hl6UOxDmAIEBoTK+XKLijk5BgtLVTq3+hH6Dm2kWc0M2
	 tWaqKd8X75acPOUkWEu5wIvV2GUW6QpD1MLGGkrhsrcZl0jCNwYeARgVN8qHuIoR74
	 P6EpDkfacUa5KzWVwDWSJ+TW0wQKib07R7GtWqJqAsdb+UloFVjMVdsq1voDWiflrL
	 MhNRgGgeotpqpnh0/7x9tWb1gjnD6z9X/Sn8+8UzidYF8U6nhZqLbSdLk+Aw6OwSW/
	 NS/aa1kxPm/6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F09B26106B;
	Fri, 16 Oct 2026 13:11:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DDD91F6F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C8E8814BC
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVwz77HRQ6-D for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4E7CE81514
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156109;
 b=La7XwonRxujRmtY6EUSi9REaLz4jdmXLNLNMepHgFLRnTV8b0ODZV+1URP7PZ2q4lsc9
 kHMzQ1jqAWabZ7mTsQm+Oyomtjwqn1l+tYYVx/OSllGmF1WeN65iLAF158O/FecOwLz4X
 kmdGelkt0wDYgm6eLx90IY4bbQYJ8d35yPgczU4yRtrahavvXFK2jubRNCBMLSmf2cHHT
 HAFt9jkFxGf7XiyM8NUjBmZmvXDhvjZS67l+rH80knt3H2NGpzIpTrf4FBdySTYo/wD7l
 WxyeSjcBQ+V1tzrdrtJJ0Bra/dprDl2TvNNLJPwo6c7Nbn0iFWV1Ha6avrqrPCwVKOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=UnewqPi8v5tQ3niF5quMpZ/isju/YNrecV48pfNXMMQ=;
 b=XDcT4waatJrK6+UP2K2DtPX2miTuW+s2zc0DQPIfkWZUpjbgqXKS56xY9NP5Hq8MPZzp
 eGRjm+GQ+1BTTONlcQ+yAlrIZrDSD3zCHApNzJghRMa/2+olTVseWelvuNCRumDxNp4a9
 exhL0Q7bizaBeDe0f1/JpJw1gMAEeBnEkq8C8mTmA0Gr9+SRl2SjPXmQHuh+Qy4R+4QGT
 3ckgAwiCn1rYOhTMrIQBAqb6Ge6PPdV+SqRfB1FqKnCKeYjRtlhtMbf3337YLX2zyMq3q
 e+946poernpHMLr7kQkveMeqoWVCKFsx9LIqtOWAsnoiZVeouqvxkrw3PHkMIaVuJsg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E7CE81514
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FB53960D7; Fri, 16 Oct 2026 13:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a0fb500aef58981f72d1c2291c837d32ca49a8c8
X-Git-Newrev: 14dee75302f7d2b6e6345369aa5c15c1c080d81d
X-Patchwork-Hint: ignore
Message-Id: <20261016130708.3FB53960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wpewebkit: also
 disable internal ccache in the build step
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7643071114416661437=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7643071114416661437==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/14dee75302f7d2b6e6345369aa5c15c1c080d81d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

WK_USE_CCACHE=NO is only passed to the configure step
(WPEWEBKIT_CONF_ENV). During the build step, ninja can run cmake again
(e.g. when a cmake input such as toolchainfile.cmake changed), and that
run does not have WK_USE_CCACHE set. WebKit's WebKitCCache.cmake then
sets ccache as compiler launcher again.

That outer ccache runs without the CCACHE_BASEDIR that the toolchain
wrapper sets for its own ccache call, so the cache keys and manifests
contain absolute paths, and the entries only match in the same checkout
directory.

Pass WK_USE_CCACHE=NO to the build step too.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 4422d99a4e1c7676def18ec700f3beebea26b1bf)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wpewebkit/wpewebkit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 1f5f4aa5e6..c424a3c4b9 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -24,6 +24,7 @@ WPEWEBKIT_CMAKE_BACKEND = ninja
 # Buildroot adds support for ccache through its
 # toolchain-wrapper, so tell wpewebkit not to mess with it.
 WPEWEBKIT_CONF_ENV = WK_USE_CCACHE=NO
+WPEWEBKIT_BUILD_ENV = WK_USE_CCACHE=NO
 
 WPEWEBKIT_CONF_OPTS = \
 	-DPORT=WPE \

--===============7643071114416661437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7643071114416661437==--

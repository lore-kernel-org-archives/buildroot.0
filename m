Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B9ECC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 286F560849;
	Tue, 13 Oct 2026 21:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QATJdfHhWR9A; Tue, 13 Oct 2026 21:02:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4C8C760818
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925336;
	b=a/OEhoW6nQw4zvSwNihjdxZNhazcRtUNPR3Nm4qjwpCSxhH5i5BzNPcWoR5tTf1pLcN0
	 513RQLfJ9jNHVr2IBKzzS1iGlDO5xpPeAmQk3IqEDl8qazJz82xmOSumdNU81ycD9k8M1
	 aYyDAlZwzCW5NLJ1PzXGDEoTEJsdrIJkn6VxRVpWatf6K0Q+lpmEHBHpTNy3GtykZhbh8
	 1bb71VkHdH67IT/VoCnv5zCTbbBE2m2toW4wpvArJbl3bCH41CAiVqFIWzbIy1HwPLIPG
	 KBa0B00lhpcC5VqYc78JfDtNhswrNzSEqsygdWkyJYZV776Uo2ce17zN+b0XE98zPaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925336;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ka2WlvM1F7IW/tNIu1eY3NFZ1EkAhv7m58vaK6LFDPo=;
	b=rn5Mqs8SBeidWIMu+HIL4o94lwJnOSazi8BMmaKjuOKzCqrRgGghSNpx+7xb0DO/Tq27
	 VGn6eU7kIteYF9IPW1cPXU/j6DOMN4t/UUOo6nJQ69GejW2aeKDmO6EHHOXs9PqOj/bwf
	 +Opqlr+oexQlhmWVCtoDfYMZWpj5fE5D6cGZfMOOEuPi2IYWchkZ+6LLrckwWNvKEPs5I
	 etkFl1uel+m2T14E1DPILnztRbUoYRKrtTyXizKIcOhhcXbp4Gx8KmSaigZqaTok3Bi7i
	 l33JGjvbWE3SD8goGzI8h0jgnlYs0D1aF30ygFbwmjq9qXhK09Ojhao9smgFyc88WdA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925336;
	bh=Ka2WlvM1F7IW/tNIu1eY3NFZ1EkAhv7m58vaK6LFDPo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NmrjezBg5F5UWzh1QJcZLZNVKCewb3FoB6bjYHggCrITF+MgP4LPNc8srObxlFAYb
	 PY7dJJ2YVyGa8xA07kApvUi7WDs2DZloJLGDeLYk4ZSPBef15rxIPf/xtTog8+2m7Z
	 xuwtj7FPExNVIVqi0BS0R0lAqH6VGXHmg5L6+d1/+S+XLo/3YcI52yzGrXMmlPU2G6
	 w00GpULDKytrgsoVtla6+m+C342US3dBfd6CWLpimxEIlRWDxz8Ze5TT8WuDZASg7w
	 JBcCFXlv3WCthpoQer4VEI2c9mR8pelLq2BAS5QghrtDB++DjFAtowBpAYrhxwbxHA
	 xbhzv2HzbVYRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C8C760818;
	Tue, 13 Oct 2026 21:02:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3560235
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9CFC80C0C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lonh7sRGmKv9 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:02:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B3F1D80ABD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925334;
 b=c6Vas/rmqBAgulPDKGz7/07PBnO7rruhnBraNiDeoTpvGaZdj4Ay5uA/FO8xdjv76z+8
 cfpuu4yvvLiQwd69ErIraQ+IOZ0ogHyZMcAtqDk3fioGwJU5W/gxJD/8ZoZ+6t9yqiiqG
 TI0aH4lS8pn0svjXV1NV8vTEoANuqDlQu51xl8EeHo7eeztyDXO1md+W8gQ/INiMZG945
 gmRkWXj8hOdrN1W1R6i7omrG4Gf3NoA755u/4Fb9DWqIHj6OSXEfkeUTCBd+T331P8OKt
 lKUlMjhB9ZVbZd10CUUqRhSTJtBYF35jKgyQEhipBTTV9QDL/jFyBPg6GlSJhIC+RTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925334;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=p1gZwriMkipjoqgITQxOQ2YfDS31a3a89oIkLn8AX1s=;
 b=nLx0JyRMfWKUGqlUVnwO846rD1HI6X0yeLo/PO1poBgGB8SGQ13NRsTHg9kdbZmQvjtl
 kzfMzlrc4KSFz/U8LDfnt89elfZjc62JqrqJ6mbS/uP1QZAoyCAj3Tj8yp+YQVoYCgUot
 pUlKvHKhj/JRw4ZAyIcOszqD9+1Mc51CPRIg6WIqlWeHPlujEJSYIJW93z85C/wGo0VDN
 BKr/6ZxtPURNGPpzrTuD146/BE0bUTWbOMNo4Nvj8H3wZRpShuUtzgmhqiqh5oJcYsxNH
 baj2JyC4/FL7fT0G5q3UEXjquPJP+aRsIoFpGFUla0CKm5YcklBDpvDKlt0oUxNfr5A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3F1D80ABD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:02:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC50095B68; Tue, 13 Oct 2026 21:00:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 23:01:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86cf0d32ddbfab7ed066df3bcf6d72eca2a43afd
X-Git-Newrev: aaafd2d6d9822121af5430c48f6e272bb5c333ce
X-Patchwork-Hint: ignore
Message-Id: <20261013210054.DC50095B68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nettest: needs SSE2 on i386
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aaafd2d6d9822121af5430c48f6e272bb5c333ce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

nettest depends, through rustls, quinn and rcgen, on the ring crate,
which refuses to build for 32-bit x86 targets without SSE and SSE2:

  error[E0080]: evaluation panicked: assertion failed: cfg!(target_feature = "sse") && cfg!(target_feature = "sse2")
    --> .../VENDOR/ring/src/cpu/intel.rs:26:9

This affects i586 and i686-class CPUs that lack SSE2
Make nettest depend on SSE2 support when building for i386.

Fixes: https://autobuild.buildroot.org/results/d04f770538412bee77851142ee007f2ff107e0ec
Fixes: 36fa00354730 ("package/nettest: new package")
Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nettest/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nettest/Config.in b/package/nettest/Config.in
index 0ec4dcdc4a..096ae79406 100644
--- a/package/nettest/Config.in
+++ b/package/nettest/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_NETTEST
 	bool "nettest"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	# i386: needs SSE2 for the ring crate
+	depends on !(BR2_i386 && !BR2_X86_CPU_HAS_SSE2)
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  nettest measures download and upload throughput, latency,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

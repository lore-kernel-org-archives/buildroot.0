Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C1CCCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B9C561296;
	Fri, 16 Oct 2026 13:12:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8II20pIDwSIv; Fri, 16 Oct 2026 13:12:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 03C3A61295
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156371;
	b=jFNQuquL29gd3hegmsuNImbQ2BbhC2CJzB5aDrv0sMfdEqGepp3p5jUwdAApKZ2/e6Ur
	 FaRGYp8aenasKnfm+SbyDE6Uhp9/Wt9a5gDpd7I9F5595WMo2ScNtr59d5k9m5a5gIgoq
	 5B+COP4EwCGr1Wm1NXpNIlfDM5av4neTeceoloRflMsC+KBUsUA3MdGDQ9gcn/w5XNohy
	 0A96XjdojBoSOfKTpLGi72pobu25heN6Rz5iDGwekl1x/fgrhimx4ZO0iw2u3oJtw9JgJ
	 AjxXhKbSGTkwHrM21ni2Ma2UTQz/qb37ikaEI4Agk+QdjPmIdvBnxMtYcpE3lgXorCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156371;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YTLObR02b8Mxzd657pWpGxHhlBedWP9B2sIharUa5Dg=;
	b=A8jYKszoENy/hyJl9rAvaq0BPebWKRuhmm82FucERS3RFum2+MnU9gRvXR4UT8fubNhT
	 ohd1Y1KU0GnAdWyPVdN+nij2J9M1zsg5Cd5sKs3O1of3IN9fthhdRv7lkj+HeM0OC652Y
	 gc4TDzMKzR/xKsYEfaG6OhokDw36z72FDYhBNlT7jV1EdTpYOq29ftbI6OjsexqnXsNYP
	 udx28wM6OBWnfrDcGv5Z+DkC6YgztmtWUEAFYUTWUfR/ghIU/Xu4jQilEaxYYQli7nLw/
	 SWDiAku0qdHFK+BxJFY6GsLBAvRBB0uvoUYBx8hBtxBZ5HJr5fMOXFfoHx4zbPRh5dg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156371;
	bh=YTLObR02b8Mxzd657pWpGxHhlBedWP9B2sIharUa5Dg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XgwOl82O1I2e4WeGnF8ieFVvThbeDG/tIE9+Jfg6xMUUJ3xo+tiMZ623B5IrsxZD+
	 HyaEE8KUSq8fY8VoEs14ZbBGWpfn7QKoHzRBxVPvrt8HlH+F6qoXo4N6bBH7Zoh6di
	 QIzA8yZ8VEcq+mvjU0mg6GtTBPH1AD7XkrhuVpYMoKuRWuT297nMSMNBQlCvxoaPYZ
	 bSyM8ZX0IAEe6RU0jWMGVckPSuV7+AXAhQJ8R8jmfvsR3LcqHwlOsd8IJmivLxB1El
	 Ei0ye4biI1RCAM9PLphnBok2A+P9AN9riGDVZ5QUqNQrh+u9O9kXoZTOmAajleMS+2
	 nzmahS/h8dtDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03C3A61295;
	Fri, 16 Oct 2026 13:12:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E592A151A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5B2C60F1C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7U5j0zOjASv for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0265360F01
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=Pepo8p+jwFduwK5uDwhPRjDRsqunTv+ZHyBUqVIts6ISCiUeF3upeC+hNU9PHXTB1L92
 VvTBKsWcsECIPk46M/G8P4zXVs2EcP88x/aAjQZ4GldAS2nQoYC2BBT//G/9IpVbpK1PE
 FkqmiiOdJeOx0C7bpQMX9WhWC7E8iQoK/XaECSoKL+07x4nvDlarFNdqSb11ytCCZRsoD
 62bSNgouHu7Eog6nPWZ/0ma5SzClnEisX30hPfHVKY6pKmDhBIxfGOFXVxAcFeIUAyivX
 5aBvd8CWk3ZK+mWGDX8XE0onTuul+ElklfJSyZh3rZ2bBvAjJXF7tuxhC1aAB3wBkVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KBuor8iKPG7UlHtwPn4fGHnhG4Z1RXQe9OdJTydT5F8=;
 b=NiC8Uzp6plAz3pFMou4bfSFszdQd0ZOusbiiAAhKL1E5B/Rk5mrHN4ApXeyuyPhak8p+
 SS4dSL8kpclv2KIVKbZ/4Gf0QXl6yLzOPM58MOMtDzg6fQPhLZBVSmlxXMg6boL7npmBV
 edzJqhLKJQPfqLxMs+2mFirLXpUiD/nvgqhK0EvutEOeBgB1vzu2jA5/B98MSUwuxEa9W
 RKBAda3IUvbsaU47YA7pT4lZ4qC5twL8VrSlb8pcO+bQP73cZF3iqdWvAo59TruxKSKbH
 xaGfDf2R1dpuTaAdxwwjVB5vC9sINLaRdZNO4ysatC+Fsp1m5N/jbjYMhiIGxp5p+7w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0265360F01
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5F91960D7; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:11:47 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: aab81c2f63d2158b702eb044a97d884610b64123
X-Git-Newrev: a049d34e641e9c29523795a17b817ebe0a23ced2
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.E5F91960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/sqlitecpp: needs
 threads
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
Content-Type: multipart/mixed; boundary="===============8907541231283366996=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8907541231283366996==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a049d34e641e9c29523795a17b817ebe0a23ced2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

SQLiteCpp has an unconditional dependency on threads.

fixes:
br-test-pkg/br-arm-full-nothread
https://gitlab.com/heinemml/buildroot/-/jobs/16865965420

The problem exists since the package was added in Buildroot.

Fixes: e74059b39ce2f ("package/sqlitecpp: new package")
Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ce4fc125fb32510c1378cae250040ecb9c8fb25d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sqlitecpp/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sqlitecpp/Config.in b/package/sqlitecpp/Config.in
index 31de9a3904..614c46cb54 100644
--- a/package/sqlitecpp/Config.in
+++ b/package/sqlitecpp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SQLITECPP
 	bool "sqlitecpp"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
@@ -10,5 +11,6 @@ config BR2_PACKAGE_SQLITECPP
 
 	  https://github.com/SRombauts/SQLiteCpp
 
-comment "sqlitecpp needs a toolchain w/ C++11, gcc >= 4.9"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "sqlitecpp needs a toolchain w/ C++11, threads, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

--===============8907541231283366996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8907541231283366996==--

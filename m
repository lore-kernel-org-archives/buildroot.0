Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5372ACA9ED2
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63176404EC;
	Tue, 13 Oct 2026 11:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdxLAfKXSHtR; Tue, 13 Oct 2026 11:57:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 35A4840515
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791892666;
	b=FLwGgU2NJhyXMf0yXiuVkUYLl05jFu8X6EmvIAbwc5KFnZ1pPuiDTeuOd4ANHFasyz3r
	 hYoAD9tk0ybXCtZM0GHB56p9cgNwj8Q9TlvH6Nq9nsm2EfFMbHR5ac357azTMdk61mWc1
	 IjjsK0lEDedjndA7kHxjjaJJR//Mw6TL1Ks0wEa2ESAnG3Q7rNHSYhSO8mD45Rti1bMfg
	 4OFv6tXKQ/kUKL7YQT3zZxBqHxTOY+9dUiL3DVIXElOOkZdmSiMOpmdHcuh0s/tjSb/Or
	 8ewPLbPDJAd6M9KIxBpb2iJQXQ7dv2wyzsraWLmuuG72ndeZ4Y94IHYsLYlZIgDa7ag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892666;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/iipO8bnh/dB213u1KU+gGeh/C6vDv6GJ/Q+pJH7Cco=;
	b=p/omnGZarCCuiAgw7vedG5+ZIZ5+zcGJrcf16OF2xAAsYIYOhOk28P2gtsQuYhVV9DMk
	 5EBLfH+l2juiSJFRQlWUNkq5MODfWHQNKkLUbea2/+Kx5myqKd0NbMgg6UKkzVAaWbJYs
	 oFhbmkwq9JVNSo/qFwpi019bl1wZwVdTWbpwhYNpuefgSRpGaocBNyYjnPPx3NJXUh/Sc
	 o/7jkVzQG5NI4voipzpORxG3c4+GwThSReJMZ7C0n+oUocLiyBDlQLZRIwR9Gv0i6bXTw
	 cZ17dbzm/VlO3TsuAStjgjn/YLVZLBSwbWBfCtnCJAPaiUS1WHq+8pW+Kzdt6zgJ2qA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791892666;
	bh=/iipO8bnh/dB213u1KU+gGeh/C6vDv6GJ/Q+pJH7Cco=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OmfgpA/gOmNGe/t6TOy/hNBLiIPa/AUaIh/I97cS4PAdjmRcfl+tSP7UuB0JhuMqM
	 df47YMJBLKT9b9crJiJy7bUwJPTw7+/sOqZ4zLHEJEVS86/MdccYUA2LrEw05qe+ZU
	 zwnVWfn2IGZ2P8GSUyAct/hSP4qjbMs+djWEPfaoV2yK/FEHd28OB773XMD7dTeIMY
	 hpXeBvz6vVERrYzrMG9tMdx0uLY0OIk/zsTOKKreiUE1wHDPHPIYT9KoSS3WVHjqPU
	 cpb/EC6PY6NEiipjSpmFDJCdOamJmVUFX4YkNEkJ0M3IpbBsDXRTGmOKrPZC++i65l
	 39IWh/mDIPWgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35A4840515;
	Tue, 13 Oct 2026 11:57:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F2E2129B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CE6A806B3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3JIovyAdL_Vs for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 904C680564
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791892657;
 b=QWrknWAgaYJTd15vAF8DbqpKsNAXYJJHdcwFPirgbl44OtNpImt+ouTPHaW+1hKsS32G
 kdNeZnuXOajpLrjdqj7YEoLrlF4NoW/CI3zstMOD8wKwmi72JEtfu00oI7eGtTjaxUm2B
 IS9ef3eKJA+wrAQdCLfAGD29Laj2QC0JoxiS4qGIffJ+zgvNKxSYzu1XbWZcHvJpjspEn
 WGjg/Pt3hPKBKtAv5VYdJPfmpz1M9SFz/ZPiL2XtJoeFjw55pltprR4PnDOiFh7TeYVdA
 qf09xTKILKKJ4TY87ND+Y6gBm688cBJXbLDazdLFiSl+ZpZqesBZnTah30SVMFyHFAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791892657;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tvCmOxURwUC7Lzz2DeR/HyvIginCJJpTcYDaCMH+TcQ=;
 b=riw7kyvWB4soxmwE0fMpkRYtjHYz7R464XWAzpr5ZOT9mn165asKDSo9zehfVXOjes7N
 tJvbiFE9qNuNZ9hHIk0DtnZeSf6SMCwiGtOGy7XUdDjf03WmK7tRE6CT0avlcgcdUuPfF
 iB6tKVDV8Vf8sg90/vZyUZbz5sXuK5XGsLeclp5+IfTpCr9qgCOqzf0r15EqD6jZLS2bK
 OmONxiqijNeSmK7NR+g5VnmSbNv4ytrqEThe3bG/MzS57WuHmJnlVCj7G8tk2WPczLnKj
 0bTAYwupG+DbZSsmIIsS8CSRARSEay0vSF9AXFp2/7qlQ5oD9zUinf2G04cS7FbTTGw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 904C680564
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5A93956A1; Tue, 13 Oct 2026 11:56:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:56:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef93184f20f63fdc71b94e90b046a7b31c35fd33
X-Git-Newrev: ceed25f8b6d1fe78bab9d3a5816b880517abba80
X-Patchwork-Hint: ignore
Message-Id: <20261013115617.E5A93956A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-http-cookies: bump to version
 6.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ceed25f8b6d1fe78bab9d3a5816b880517abba80
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

diff LICENSE:
see https://metacpan.org/release/OALDERS/HTTP-Cookies-6.12/diff/OALDERS/HTTP-Cookies-6.11#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-http-cookies/perl-http-cookies.hash | 6 +++---
 package/perl-http-cookies/perl-http-cookies.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-cookies/perl-http-cookies.hash b/package/perl-http-cookies/perl-http-cookies.hash
index d5aefaf830..3531c82034 100644
--- a/package/perl-http-cookies/perl-http-cookies.hash
+++ b/package/perl-http-cookies/perl-http-cookies.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  80017e7e56bdc8ba16dea75789748829  HTTP-Cookies-6.11.tar.gz
-sha256  8c9a541a4a39f6c0c7e3d0b700b05dfdb830bd490a1b1942a7dedd1b50d9a8c8  HTTP-Cookies-6.11.tar.gz
+md5  d5cd1ff70175fbc44a0cc7018ccd9525  HTTP-Cookies-6.12.tar.gz
+sha256  4e460c4bae76285bfc726f641349402fc9038fcd9ca0f33346bec036d73876b8  HTTP-Cookies-6.12.tar.gz
 
 # computed by scancpan
-sha256  d864d8998d1ce086dc35e5644fbfcf1b46dfd08b0ce8d76d3e32bf86e6953ac3  LICENSE
+sha256  ff475f885983812d894a319f652b2e9361c4df9c2636464707198d9687f6a10e  LICENSE
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
index 6d87bde2ba..db3cc4be70 100644
--- a/package/perl-http-cookies/perl-http-cookies.mk
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_COOKIES_VERSION = 6.11
+PERL_HTTP_COOKIES_VERSION = 6.12
 PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
 PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_COOKIES_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

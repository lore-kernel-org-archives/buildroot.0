Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FC1CC6B10
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE2FD40572;
	Tue, 13 Oct 2026 11:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWtbKl8e0vC1; Tue, 13 Oct 2026 11:57:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 300F340536
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791892677;
	b=VU1hcMTPE853IbOtYFiGqWoiZeQz3llLZnSS0l97UkUxKhHYSniD1+A4nHL5Rpe2/gcA
	 62y8NICQO48rJdKSSas78yx7mqqqoBvrKZEc/Ps/eBLyFj9on0jRHYR4RgRE51LR44CBn
	 cXgJ59EWswLpsIR0F/6Xm+Vh+nevK66bMooPxGAHjeJv8c+73+6iEfnK2NhbYtJId0r58
	 AtmZG676JGe69OrS+8zH+aTqqmVE0KbkKB55xiLD84GWBMgDG2fhcgcb7MvbLMiG0NftO
	 P6Ma96/Q4sqTTs0HeH4Ok9wKHu3jQuYprMKA5JsdgPSDAyvAriOwJouZlFzBTu9w6XQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892677;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7VfyV/mivuGKa+SeL4WMPdi/5yTeL+QAAqa+Op9vcHY=;
	b=cBN3UE00NSF8naItiZ/0VYU0LF6nQmmvBUh/b5Gwwgyw3uY9jE4y1sFzGg4IGoPsUEhS
	 DiukNnCUKfdJkkXUhH2pGkFURMrW4s+qbTvyjJrGsQBgJFyM+rR7DL13M22mfZBQ7oTWh
	 BD3Xafi12ZbZ85z9TBbEWh9qUsEBKlZvDso+dFppCSWmEhwadHrWRpI7Dgm58z9Qy5Dtl
	 WaUKOY9aZkPG2hLhjinXF27zcOOlT7s0+j3kejinbAqspuOuudWNkZsOcaFbWwljzxHK4
	 r9CtIRh977HSyy51rZ8ich4dkceMTdFg9q0Xv6b0JWA1vJtO1nSrCL+priwih6eMPWQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791892677;
	bh=7VfyV/mivuGKa+SeL4WMPdi/5yTeL+QAAqa+Op9vcHY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y6NJMslK+2nvhQwwrfNhUkWu/9ntFMRvGdfW3IEv9G36+AWtxrQFsfbkrZpCaFUHV
	 sV83f64/DjP5i6i9msXncb54TJNuHIrdG/dNs96hn9TahebkP2lpk9ELxQrg5kp3sw
	 On2q/Ge2RsWl4HenbR+AaX2YP3JCE3Yh1tCNxX+Un62fNMLmyqu3bBcOdqJnfK0n2N
	 EYkhqExGJsPJ1hbcW5g+SeVimQvLjVlKeiKcYcsHEPKU5efCZghoNQMOAiEgRJM/Ef
	 xnS6ZCWnvQnvh+ESZ4TapuK2BARnrH11jlOxr3smzNhyRu9BTCfa8Wwcds/W/nW4Qa
	 TRSk7soEkF0VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 300F340536;
	Tue, 13 Oct 2026 11:57:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9835E1411
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79DEB605E7
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QlHdJI-FI0wg for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CD3D760643
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791892657;
 b=l8n73U9Lic0QXHM0gOEfMwy9TKuTBlK1e6XXBoKslPsoIznFTjRz0aVgeSmLm6IstmWH
 ySs1gYYzL1TkogQ3U6v0sJ0zvDLsv1D5XRm9IfG8NluSkFegSRBfI0mLev5/hKk5nE4TL
 oEShwU+6GMxwkrFH65O97XPEXlog5WEhRfrAEXogY+jAl2TWETw7X5nV7fTbTrpUh9OuR
 vzcTZJimO+PPf5F3jZzEOWXx5jn8ci/WEromVdzeP70tHDleyzHb3IXI685XC3sSGA49l
 fCr43CChRXuDba20ou+wNO8x7gR1o3KycPkrXSn/CRdj1Gz4h+oePrvizXrQiI8Odgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791892657;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ayGr25kfrEH4tL+7quJOZMaTC7BYMqE1N+oY/+LX0d8=;
 b=Y0xbY1+UXrlb607QqZj9g0kTiKtnLlF6DN0EQkf004roll9+n0ejDBizHMvHOK7kh6sZ
 GWnCJH7Za/iFfqFqBOYtAuMVYao0qaUKkaFhhg/KkVAxY/CH81qe9ofK8f5vJCQca/QoX
 gBXdiWyWsTmhX9DgBRVv0/5k0WHz+t/ElB/PShPnKrheh0knm9C+4j4lhFeYRED/hXHr4
 mQ7/68alELD7W6Ygc3T8stmfqPmRWES08YtN+6lotaRym+NAIcqP1LqJM+Y2KGkVBIwBK
 o+DKHIbUGeFUTltjDfS2dnRbIPLQr3PzasJITWH1Ju+nfmu/VrnrPHIPHp1GhiVVI4g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD3D760643
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DB21956A1; Tue, 13 Oct 2026 11:56:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:56:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eaa880c80570abd43d03de5644d445ddb25a2912
X-Git-Newrev: 92754e04e30cad24c1c19dd63fb9e34459424b35
X-Patchwork-Hint: ignore
Message-Id: <20261013115618.3DB21956A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-uri: bump to version 5.37
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/92754e04e30cad24c1c19dd63fb9e34459424b35
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

diff LICENSE:
see https://metacpan.org/release/OALDERS/URI-5.37/diff/OALDERS/URI-5.34#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-uri/perl-uri.hash | 6 +++---
 package/perl-uri/perl-uri.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index c1548bda3f..0d8fa868d7 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  3736f3d6efe1710176a753a7029b7606  URI-5.34.tar.gz
-sha256  de64c779a212ff1821896c5ca2bb69e74767d2674cee411e777deea7a22604a8  URI-5.34.tar.gz
+md5  e204d211b2c865212d92df5d382864d2  URI-5.37.tar.gz
+sha256  5a8750ddd8ee743d7cc89bebdd542a9b78a34023164ebe19dea0c248e121c21e  URI-5.37.tar.gz
 
 # computed by scancpan
-sha256  a1730c55839ce3c9182c92e3387ba8f683ad6ab8b4a3257553a20c4db194c2cf  LICENSE
+sha256  e956d5d73e1b569e04b5603864903f5135103686f55f7ed2a8d92b416514268a  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index aab2b484ca..6623088c29 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.34
+PERL_URI_VERSION = 5.37
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic-1.0-Perl or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

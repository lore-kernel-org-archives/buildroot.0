Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25396CC6B10
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 166254065B;
	Tue, 13 Oct 2026 07:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGhDKFHKeUn8; Tue, 13 Oct 2026 07:45:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 558184062D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791877557;
	b=qmVYYuufcM7BzkE8/TkdFmUIBcSJjrjvj2HW0kR6TqYAp33nx8pef57YLqlHHj5egO8s
	 RtkTcAwOjzm5L9eIyIbEGzAFA1NnlUYc2/Ou7rzlkVK5k8dLS8uZMpSzCk074Z0dHYkPZ
	 ojOzd05PDpKGAEMKy8Y9vVYdvYMLACy54kh9QJC97kQMdquEyHE45pGhziGMpUxepm3H6
	 lBxJujddxAFJXy3p1WGCeK8lR5XTNX0ZP8KA3T/+85hrAQDMx1Eh0/dsZACExJYrDksGW
	 fTWIcAyiN7iU2dsQSw37bOD1scBqtsKE32XStGYRu6YxtFVpNS8XoV7exu7cKa3JVWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791877557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+TMFbaoaaNkyEgFMotCplbRh/DgNCP7/vjD9s9n8Nlw=;
	b=JV/2JHhulKzoD0aW3Xz4NEpcUHRKwHNRgTOgSTbeqs5AooEokPgtTYtW9l3TyHeVeZ8D
	 330jQrXjDi2yN0h627smIAYyPBz5hYR1/gHvRtIG6Wh63rg+13ZfBw1w4qAsmCBkuPAbu
	 0jk+B0qg8V5hbWVYO+bLCygm+7dHtevWFh69cOGncw4Flk17Y4QHQ3QGUZYwbQe3WhqkF
	 QBe7wORJKoGH3TRl1Ef8FmeptdP6I+ev3LDYQrxFkw+xSquxSafPip+GhuVCueJdb4Ry/
	 dyCdKIq1oRUBx3THWhtMuX1wqkz4qwISyrFnZxoVP/OSNc+rlXXql34A1UFXNV/G2gw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791877557;
	bh=+TMFbaoaaNkyEgFMotCplbRh/DgNCP7/vjD9s9n8Nlw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UXNivTYZ9aVGrlnLiipkz6Jo12D3w7OSwe7yXizlgNPv4Jwxnwcg1M3d3TA7Uk4i/
	 s5GpMmYi/3694ciZxRfX8mLXRAuZLVuEpWvEdRmGcTVEctyFHWHPnFB3YCsKWCxtOF
	 1t9qlcF7sAz5OGJNKDAgwtO0kVoq9tA/eBUicWdaB3b6jv9sL1qgWRu1JdM6Xrisgi
	 vRVCXq4kV33eeYh4kP9tITvehqq+vSh6AW9jgKQuyJkmoui5iZEcg+cbNyfzW8JsKx
	 vwxOyj0hGI+a9uKNfMP1SCEBjTfufd8sw8MEQ80g7gyEqCjuiYf1CAeeEeQt5Nplep
	 HcuTMXFVLzN8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 558184062D;
	Tue, 13 Oct 2026 07:45:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34A2C788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 198E240634
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35MskgQ8nd2p for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6820C4062D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791877551;
 b=ABFw9PS8LiOH18R/fS0HS9jLaN1PyejolX/abhVmWDcpSkKX/HUSW0Q2pDDFWrGO98tG
 8xciaCRcfd/qD14EM+UXxi4seQ+EPyVbqMu6QOWneB0TH42nP9kgmYfUSuuKPj43XIlAY
 wu5OAqkYNgecsh+OdqNM1CEkL4T9gRvFM2GfZSfLBIfqsxWD1G2D0c3sRb7y6MdykATWp
 SIj42bjlGVP+ICBtgnZEBh2xVx6nAW63vuwt8ofzQMSGiTgUbRZmFq93291U/26d2xFXE
 /bNiTCLYQLWQ01MHQs4sNOy6ckLg4oHLha1CFvqRoCiTjeI5a74mk6wcK7Aedt2n4QQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791877551;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aUMTGOXWKPDHmvmZ0ov8vfCfDopfjj2C/PZN8rV4geE=;
 b=tI1XsF+e7kSDjx+Mt9Wro1muUXTh8980uSPMUCzBK0BDEVdDeZrOVv/FzElHlE6EFBP9
 j3+I623LZKjxZN6dqKKEcyjKKEu53jnJIzrdiUBec+jdwobAvvFziRAx3Jxmwcvto/RpO
 pcMSdEGRKnWfTC0VBGzx3d1QHElQeCNnba0oJsXvcw0HrMMEYzFBXkckfvefET+rQCZq8
 2G8qQGyMCMbcBTJpHGLNfNxQYeANCm9kdJAKXsJ/AsJr6hXrQSoDVGu2xpbJ93sA6wgpT
 Vy7FyGY1tKhGBhN37lBPMegd9iFiWz9NeT+Vss0rAxJWHk+r/pZ+JkIrTp7R//bHVSQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6820C4062D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEA8695444; Tue, 13 Oct 2026 07:44:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 08:41:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d1d80b796c024cea88acac2e6b8616cea9074c3
X-Git-Newrev: 58bfd1a7a9685e0a152edb182993dfbd8da27402
X-Patchwork-Hint: ignore
Message-Id: <20261013074431.DEA8695444@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-libwww-perl: bump to version
 6.83
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/58bfd1a7a9685e0a152edb182993dfbd8da27402
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 4 ++--
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index 1271c656f1..f89c627c83 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  dd84e119517e07a1af261b8eb1fafe1e  libwww-perl-6.81.tar.gz
-sha256  ab30552f194e8b5ae3ac0885132fd1d4ea04c4c7fe6555765b98f01af70c1736  libwww-perl-6.81.tar.gz
+md5  dfca8f917f4727ddbdf3d81d0979172f  libwww-perl-6.83.tar.gz
+sha256  e75f0fa9d3c6f0daf5a5a72fa9f8b1c9c0d23e3a84a8522ccb4f835232b95505  libwww-perl-6.83.tar.gz
 
 # computed by scancpan
 sha256  994ab45a4f8ef43f47b7baabc48d100838c42d226d8d161d6ac1f49c5f9d7c84  LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index ff1cbba459..a0db618685 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.81
+PERL_LIBWWW_PERL_VERSION = 6.83
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

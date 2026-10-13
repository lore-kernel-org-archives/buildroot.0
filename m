Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6304BCC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95FBB60770;
	Tue, 13 Oct 2026 07:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WuNK0TllGCf2; Tue, 13 Oct 2026 07:46:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 793E660769
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791877560;
	b=S91voB2UwTBIBu1YSNy7m9/IX4I/qetMQSI8c89hDq5ERCCZlJKmsIJ4dRqsHQ5ylbF8
	 3F2m+qk3PcblQuolLerLGsfgBgZhrWPeSMkFkBv8xWpRpUQ4vP0dibfcSRyD8XwaleTuf
	 L4lpXOrV/OnAxumJCf4sFd0SoiX5W3l83yXUckLvxDVsKP8IcnSkMKTED429QZcs1bxR+
	 yOr1dHCi7DeVb/gc89TOjcJzP7v3aRRYk0yogZRsVMdG335c1AjXeWX8Ofvi192cyJQb2
	 Y6MVKKUGdVJDLh7tV3YJf8Xs5eosMpW/AOHBNsqLYbAyss09I3KS+jJBjqCok4Xc8GA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791877560;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=c5O1e7+xLYv0AnfczYS0hJwJJlnyrGpdVJWG/Rne5W4=;
	b=jhi5NyiqiLohUmFS8oR3v/WkJJ+iPxl18e9ItqcdHFOGUWtxVDGElpgy/pv18yJCA3n/
	 UtEVdRH4NU8oB4PHd1MUpnK/gT2AudJc1jzxLiuIsUH0ACEPzUZv8xyloGDgMw/dRKYoP
	 6u0V4E9giLSy7+qcIN0Dnj+d7J9QX0ZDDtUbNCTHZS3h0BQ9x7iz+mebn/3WJBH2x351N
	 xJuhpB79DsHpE8GY1OQ4UfPiIl02fWr8mz1s9BRETiEkH2h6c5cn909gd3uH0uohrUhR1
	 jZJnBS+nGJYPmGkhYHLn3I4z9hX3xb3wGHv9DFm9OnPPY/kq36OgyAFt9HL6cIdvLpA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791877560;
	bh=c5O1e7+xLYv0AnfczYS0hJwJJlnyrGpdVJWG/Rne5W4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LvriH4qgI0aPOMBiNnqeiVTa6s06/fzJyDpyaefUBFxiExYIVuIXSiNkW8+C86KRP
	 c928nru0podJQ6o72FITtJCS7rMZNFMSBkslPuubVdjF6YLw7k+iQ4891IiywzcGI2
	 zBGfS88ft61BNRn8YIkXzF0H4yFIrQsY2y+shlez608cA8hFpP/vKGr9pPlRnbE5xy
	 BVMA3VVyMRbp70el7dV7JsVsLOR8/zcB9uVhiTNTVY4Phuui8Bd9cbxqPZi9muRGgR
	 6wM2XWcGvCWjLfN1cy2Od0O0FEcmJRvBLz4sZX9JXQ9LumZ/BYlGMDq9UgHDKverG3
	 KR/HZeyNbVePA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 793E660769;
	Tue, 13 Oct 2026 07:46:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45C2D1399
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 355194025A
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FB7e0Jziftpd for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 84BEE40068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791877551;
 b=Po7BhSwiv+Vy4NiMXzyWrEKIQCpvzYgJYFJ1KKCMT3pM3E1bh67hzzYOMa51zqkYemyI
 HX1Pxxxzy+T+zUrUaeDOilJ/nzouPkR97NcGqhQNznvgmyBffeD4rim7bYW4Y+jmUq13n
 yWWwHxAbM2ZJsSUe/C8FEIrmEXva6dKmwzDoC5CdpS8fyvuOSZxxJeTvenwtB3tJ56mmW
 JzgzWYnmVEVRW+JU1DzGO8oePO3yO3mhAlm0ImH7pxyc4qJ4Fa7i1nKNTVuV2xLOgxUmZ
 WUyL5/L5bufGc0EAGqG8W3yBV50GZCGsT/52QXcKDO+uZ1E5WHaRAB21AO90ypVzcTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791877551;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FoQzxdOu4BahbKDjUftcoQ2mJlCq79XYJAmHu3+IS1I=;
 b=DHwVADXLIfLXCXf9UH58beq4J9qJ+lC3+962JcICB2PLXFcnCsb3G+y9BttzSc3AALN/
 ADqDIG8CM2hEZm2WpXgUJH2RyKwvUcG1a7DpcQceS97uhW1BO2rQ1La95cCtmJxjP8P0c
 l1h24xj03QQXmu65lOmKOy74IjLhkMn09XQFmzW/nPRAE9w8et84FW0piEDFFkii6IEkh
 L0zJSh2tB+spsQNLh1cyawsgib0KLufJ195dS/kDoRul0qC2nDc29frAv4JCLXDMB0geX
 ppnuG0tRt0enbwQl75wKjDtCaHlphmA6a6DEMixUe2OmTG+WBjVpz59u1Mdze4sPJQw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84BEE40068
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08AFF95442; Tue, 13 Oct 2026 07:44:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 08:41:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0550f417d52a820c4e1c446c53836c1528caa85
X-Git-Newrev: 1361b5fc4b6318a566f1cf33b15b887febbd09a1
X-Patchwork-Hint: ignore
Message-Id: <20261013074432.08AFF95442@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-mojolicious: bump to version
 9.49
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1361b5fc4b6318a566f1cf33b15b887febbd09a1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index cb40c94878..b58573b393 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  2ef7c909c3650a570737a11ee04a14a9  Mojolicious-9.42.tar.gz
-sha256  2328b51da0371e416a85372b9acd04433f5213e997cbfae4ec84d4c63ee36c8a  Mojolicious-9.42.tar.gz
+md5  cfd3b41597f228c945f6b25215410cc2  Mojolicious-9.49.tar.gz
+sha256  281933d4f9b821f669a3e93a466daaad5596443ea2cb167fa7c019752bce6d66  Mojolicious-9.49.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 6da8d2f4f3..a96af20c4e 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 9.42
+PERL_MOJOLICIOUS_VERSION = 9.49
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762F0CA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37F0D60638;
	Mon, 28 Sep 2026 21:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iQRVgE1t9Lh; Mon, 28 Sep 2026 21:29:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5EED560607
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790630985;
	b=da4rSUh8sIyxUpOKFWH1IBgQ3XucheM2+BY933n3h8DP38JjF4gFGCpx4b3JD9h0tvPg
	 CLqiKBgIBj3BCE/ttSOxc44zrm2/ie9/IFaiCZ7Z9L7fJ3VGwx/bQyZDQxNMJokMLuwt1
	 WdHXhpMfmPjSmKDYJ1myEljuQWRjESsXIDBXe4Vl60b/Qg6qDl5vyvnRoVqd2u+wqiuxM
	 +wO/An0yYvGPgAdbjEneyVvZO4PBgteVplQtrnAviKGTexdx0qA02MpP2AbIzWEE6lCUX
	 aGbPaAOh9LOZ7OaUY5g3t0/OZjdgd313sGFgQGphA1GV7EqJTkmhg03tuL7yeMbYARA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790630985;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sfz7F992j1ZDsiW9CxPpeDC49njGaqV0Y2E9vo6dVIg=;
	b=cEXu9BDUN4iC/sszCNKFsNj1e7O8S/QfyLZSjak3gKmAB3Ta14kj42u33fcxXWbkErHK
	 epIiNPbvmzoTOmsK48j3yfdOclisjrL5gClG9aR18BY1gQNi2P1Je73440noRGRhrgcCY
	 BwWvxIcnBQRkJIguKSJHDNOggAeVBpxthvQsZc9G8uOR3htPSZz+saETFtAGkbwdYrITv
	 QblB8ytHPgtPFOrXLJi2zZyqNXNEPg9IpWJxifc1cWVYhGWIcJlgYAV7H2kau2l7wg7Og
	 ldTBZE2qSzVWceCa7krw6GJqBEr+dDL5ax2VF1Dxuhs+PhXbSz6mErd13Cn66WcNGuw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790630985;
	bh=sfz7F992j1ZDsiW9CxPpeDC49njGaqV0Y2E9vo6dVIg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Rd7A/iCzu4lvmisxTNy1FfXjvlnXYZpZwxRRvNPrpx+ez4n9sNl6kjoU5OzAwkD9Y
	 yMXYnQ0+8HmOjd6+E3RsrCBzF2fePUoaPSCohY/waUhn/q+o9BMwK1vYfdmkE9HX+k
	 qyRwTu8jyzIwPFom8P3yUwelLnMEtUhe6RU8RH91xaD9db/0nb0XDAuLo+4eGkkPME
	 me3Mwb51wAveihBVoSQ0VtrtNMwN8PRsjth9vqaidYSxzOZoSDqw7md1MQ27dlnylO
	 anNcE4eRZ5rz+pu7LTsBElfeSbKshUwoUK5RS/F7UJdnPLDaw/LzetgDjX1okvMvpC
	 //gs13ijLPJLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EED560607;
	Mon, 28 Sep 2026 21:29:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B8143D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 216F340525
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2AH9LN1uH3G for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:29:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5B5784051D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790630983;
 b=YYRlNm9p6wpPMOb6zI90XZm8bvHuzMO1R3p5m7hFrv8DEIV/obdpgAa1pWY5YGF6dBzi
 BEfGH/dv6pFTQEJ3NQAyrPeVDHRoipfxuriOhaNuDSa6jJVc5YY5HdIB7dAOq8Q/esCgV
 1WQ2luN0O+1SFrwxu+hoIwxsE3L9qOrYxzbB4fWE43Gg6RsFoQo/GvHo3xr0yINrpv6mv
 kPh31zyVUY8DW/X8StRlTUWQnlOtkI8ZpP9MoHnh92BoHr9Spp1wB6zUmlBGfgFHigZLA
 rUeGyQ+plIBCa4AY8U6+26HNsGh5qqjl91R13LW69p/Hu7XfWso9ly7qYcSsP2JkEWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790630983;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IPb0KDZwXRjnq1PBGE9HQV1mVSLepjlBZtj5p91X30M=;
 b=GbmDTVskk5/aI4IsEpfMurpLa/XuLgRW3DKQgFXUkyGin/vt8xY2cxMZVIieBU70FLAd
 j19ewuLTDi7u9i+j+N4ZsYBjUKLIU75qjLihpF2KStzwW5QiZn1cgc5pjNpC3Gp+eoRoT
 FenijTssndiqWKt3S5QCWGP9WfSveRvMLInDNHHMe1f0BJ/E36X9F237vymFFvyzRDbAD
 nOug042v/rgfsu5PJZKccGtq5j6ZvRHIW3iEzYj5Vc/RcRUvpUeFDscACOvRrQndL4Icg
 kwCZ3xKwocR8IeDu8SJEPTX0W4UvP7Hg0vfkNH00lpkvfI3YpLt0vwcg3sDjL7wCgyw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B5784051D
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:29:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E464098407; Mon, 28 Sep 2026 21:28:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 23:29:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f4e6fcd9599419b47cce241916ef29eb0dd3e72
X-Git-Newrev: 6276402ea1913a720edc6ce83c58f01bcd5be3f5
X-Patchwork-Hint: ignore
Message-Id: <20260928212830.E464098407@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/daq3: bump version to 3.0.27
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6276402ea1913a720edc6ce83c58f01bcd5be3f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/snort3/libdaq/blob/v3.0.27/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/daq3/daq3.hash | 2 +-
 package/daq3/daq3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/daq3/daq3.hash b/package/daq3/daq3.hash
index 524c0eb868..a81ae595b4 100644
--- a/package/daq3/daq3.hash
+++ b/package/daq3/daq3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  651e38a2737d179a224bcb01d8a06300667708ee614d19a8b411fdd212cc035d  daq3-3.0.25.tar.gz
+sha256  03fac3da27e3230a7d26262f2480cd65a409cee3596c6758a7f9eacb7f24601c  daq3-3.0.27.tar.gz
 
 # Hash for license files:
 sha256  64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  COPYING
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index ec3f4ba670..43139ee065 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAQ3_VERSION = 3.0.25
+DAQ3_VERSION = 3.0.27
 DAQ3_SITE = $(call github,snort3,libdaq,v$(DAQ3_VERSION))
 DAQ3_LICENSE = GPL-2.0
 DAQ3_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

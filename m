Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5327C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 21:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48E17812E8;
	Fri, 18 Sep 2026 21:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xlsx45vmSvO4; Fri, 18 Sep 2026 21:29:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7DB7581253
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789766960;
	b=rdtN9CYqdRI/VS0wXrwp1XwRTNuaykcTI8LN5ZvU02Kfee2mVxTtW4hoM5TFlcdpk/eg
	 gEZigdv+CmsLVEqHCOaSk4q51h3fyEhH0R/pRzE6p7u8Wa3N2Rw9T3GAgD4gU137WmbId
	 cjUZ7FJVysPrVizWUlWGIfc3vHGOWraI6cCSOs6MW1+2EUQuU861cj/ZI/H/GCX2fKRLz
	 cYs2XmFEFu2ZH8dsYROc9Hwkla4A2Mx/FJHzHqVuxxgfh9zFeDbCV3KxxaYrjBa1+pxhX
	 EbDVCAerVMq49vsuye1PVZlAXOl0CwILxV6z6A+oSu8L9PX1yuLocQIONcaJ/FMtk/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789766960;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xPdUOVPK71gdVMJn8P6iJb4OrghIuUHyTTxA6wa3ua4=;
	b=Ji1a1gIaLWRZCNF7PYtmN2eGeRVd4SrRjWuzVg6+s5wrzcOSm4QtE0goimiog2tOt6L5
	 5mU6bPOrEiY9A26QPBgQM8Byt5JzFoV302jC1ak5RiISxk50SIf3MLpuAcVKN3jCFlUs+
	 uuF1x6KCt0C50ITmqd2n8ru+rGl17VND3Ffdq0Uu4TvRgvFaVrbrfmcSDvbaYb7ioLGYt
	 X4Bubm4L33FIlPWuKbspt7xWrRYXaVgm17vxw31rpmFfJoAMA6rBO800t7oJiHm6OnnbW
	 OCAFfmU8DqM/XkiDSf8W3WUWT/f/Hi4QjHcFfgE5zyZ24UYTOOjtrImO6PR7/IQimRg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789766960;
	bh=xPdUOVPK71gdVMJn8P6iJb4OrghIuUHyTTxA6wa3ua4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sUpB+fvsx1kRkFCH/8M0to//bEqVWQ2MY5HLJn67w9WGCwmxMBf5HBK6Z37DB+zVW
	 OrwUlSPPG4M1fyJzcMBVI8JNavoAiyk6UZg8Dv2EMpu/22zxZj+IvBR0x26+nZfVtM
	 /RQe6atQPC63yAQfl2RZwWFwHTkczfpaDZrH4BtGGn8fXwFKSFjWqipG+8p6GegEOG
	 qk2vSbcH6CvFIOhJmHUnS3S8+ULROSNDflD8PgbbClb4t0lXTbtH0ThUY5NMHKVE6j
	 cQIKumSKZR1oBpqyScP6Ql3zs1eNP1O8Tkn2/wbDeFB65FzcR5gWW2a9Of9O8htnZw
	 UPWtLxtTxGXkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DB7581253;
	Fri, 18 Sep 2026 21:29:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 711B21E9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 313A960DEC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jB1YGI9j-CR for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 21:29:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 823B960DCF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789766957;
 b=TJqLm78vZH3Bnc+CnDbHZPjyXbouZjMJ/FeT3db+s/rNBP8k1l7T5VYYAK6xUoKFSnZJ
 YiJuK2oiwNKUPWfDMI2Ec1D6Ww8l/wGZRvWn7MvT6RazoMral+AC+mrbN4i/Mw1zYiml5
 X7QhiwuuMrKq7O40O17I/GVdbXfIKNzedAGEVHq4IXf+p+xEex+VEg7NIYlkCNB1dp23X
 8wsBaK1su9Dw/BK7aFepSkFlubo2MBjufeZQgkLSSjd6/fktqzcGWtxKUchQD6fhyeTzE
 ZgZBMsHO8ya6Vg2BsdIeSE+jLPW4J5tI00JDDvRsx9PhElCiTZRf2Je4KCjSiF47xBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789766957;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jJb/zpigYMV8EtI46IQXKUJ6HboVEdTlsa3tClsrYNI=;
 b=c/k15Sb1HsXQWkpHlmCk79pNEsJtN1XILBrDbhbRNcLhqRBZ68dcf+SQ/T45im9rp7xk
 kQCBmXvs6W418oADhPQxZGp3185Sb4mFqwStrvSpzfdExJbQxsdyzy/4loAvL775v0XUd
 Ta+FeKYjnhafW9ONjHfHeTZmfjwoOGjhuWw2BX1I3X0Nh1h7k6DE+jzrJfV6LgA8yVhxZ
 X+xn7pWiVIg/cdg7AdkYTdCBJq5U8CDkT2qUhlDM3S4xPxp8qVRSrdvH2fIBYF4/pzUbz
 I+QzT8HEOf3ecRienr3IYuMudZY5z6bLoy5oLnB1+Q18ELEeGJSyqDSkEQGEWw1c0YA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 823B960DCF
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:29:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFA60976A6; Fri, 18 Sep 2026 21:28:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 23:19:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a9ed35b567cb90cbaf44a57f0a5e085de910321
X-Git-Newrev: e44b1c4195d14fc5b3960bf01ced0e3697358417
X-Patchwork-Hint: ignore
Message-Id: <20260918212809.EFA60976A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cutekeyboard: bump version to 1.7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e44b1c4195d14fc5b3960bf01ced0e3697358417
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes: https://github.com/amarula/cutekeyboard/releases/tag/v1.7.0

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cutekeyboard/cutekeyboard.hash | 2 +-
 package/cutekeyboard/cutekeyboard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
index acd2017056..9472bcf00f 100644
--- a/package/cutekeyboard/cutekeyboard.hash
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5e00ab346038e41e11662016b56c4e95fa08e7efeb7ca61aeab5b863a0bb7300  cutekeyboard-1.6.0.tar.gz
+sha256  50029bb5219eb72a4e89435f157235ec541c546ec82e1d5ed8056af27c48362a  cutekeyboard-1.7.0.tar.gz
 sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 12a6573d52..2b0f5a9f2c 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTEKEYBOARD_VERSION = 1.6.0
+CUTEKEYBOARD_VERSION = 1.7.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
 CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
 CUTEKEYBOARD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FA3CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 14:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2BE1606A2;
	Sat, 10 Oct 2026 14:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IaB4OZmjxKWh; Sat, 10 Oct 2026 14:59:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D0E516066F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791644398;
	b=oCRt+cO/OQ7Ex96s6sv9k7R5PmdxfcZRXCIfESBjkEHv0rhXq9Mpk8k2LaxZ/ea5XdOv
	 5MvH0tKNZCehbAfStC9L9UL0j4uvWh2Fa7rQnmEqqSSgBtrAIuFxhA7erJIDttsdA6OwW
	 05Wqk1quU2ENs7oBamjM2xicPI1IS+ZlcCWNnuAfF/rUUNU+Z8H3er4SZK3Q8qTvtbxOK
	 rnQ3b0p1IJIckfQTaFVoPWjB01JUMJfxYCfxd9/WLKLv1Zs6m4LuOQAKKIJlsfOGUalG2
	 a4WZIDlA5Htu8OWJJ8uyQHckxH4Bg69S6pKuX6tlgfhB/1WCS9wxIdaxY9a1qB52qaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791644398;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=f6WWNcRlf5yEL+//wll0GOspPxW/YsL3VL/BpIiLEFo=;
	b=rMoAboVPEC6+UPb2fViEudV0RWISbjFlxj8YJ/GST84TiPUHJUVIyILmpPNZfEkJiy10
	 SewBxZEYp15N5pvc+QyaYXnoog246kjbxyfKl0SYrHMiCjxwv0MigcWGniyy2NlMnVgTF
	 M+k4HbsRN1MVw+G0h19Yw5PEvpj2I3wtVh9IHLGf4BjNUST4j2NLLh5zDtb6KR75rXHIq
	 juVDWEbkgPibP+XDS94qLI/nC3mWDW4hCSfq1aIFZHkF7mKfHkNxsWLqdXn0T6B1OgvlP
	 7I+fNoF9bo0PzrhP6TRWbC0LFIi6ZiNN61bF56taGSOkp7Feu74tGUXe/2rbO6JpQ0A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791644398;
	bh=f6WWNcRlf5yEL+//wll0GOspPxW/YsL3VL/BpIiLEFo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ATANyn4hpP8JhL9GQoUpzuasjjdSkrB46PUZmpUCJIETUVbgaczmHKvm21YFizUNJ
	 ITjhk6rZzKnlTdIGtQqTvFTRbfqmFYhwXHkwleQE6caRIEQLWrwQB6Pmsw0AW/8lad
	 diglh/Hs0ErDpnLC5ob5QE4U6bws02xbs7ng5i+TNo1YsX+dXcRq1+lXOgaIJbfuKu
	 UC/mq+MqfqgtBXjJy6eGLdOP5y+6cOWaDmWSwwshT0Cm+rYfwVjSgp7TsOJnWybPmE
	 0dwcIMupYTMQjU6N+yeLl5/IfKlm4CDuHkhJ9kB3BZPOJIhwqf4xFeYgQ0sjiKwYwz
	 iORTyATR4unKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0E516066F;
	Sat, 10 Oct 2026 14:59:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C50FE317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9F388109F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4Ud0Fm_MkRm for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 14:59:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D003A81096
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791644396;
 b=jL3vCdXLQccvGsL/1dItuqsG7UMrlalw5x9DbJaFwtOru4tgLmFi4PrRTyIrLznmU2vq
 DOfCDEvkS2Ut2oHrX9J35yQThbu6D8LxQ2Vwh5Cz1hOMl7rHcuZS5yZ6E2Lvq78rE4aXH
 TxGh0c7O55ZymjpE38R+xsglHAGyvM8rtcdjWdug5PBJ0m5GTFPTHQ1hB7OS5vFHYpPU8
 lBjzimB97DyfLdY3ggEpGnDVcFTCN1uFhn7Y7/y2lseQuD1Te9VJHN6EIAIUFfnH17pQ/
 LqECgO9JvOTzUC5oB+S+aawQT0gmciUGyFMtfyEAtUL97zCRNZcIrom9L+GWIkrz8KQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791644396;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MwkOWmjWL0ON+BW3MiVe6ODiqLQZbn19l1E+rKqO050=;
 b=Ugac1JrtBYp5ssSLdeCzRTeDaNhP97/aVofDur13tqVRdqDwlV/+FbjkO4uMJC/jF3yF
 u6zzSRSlb/qxciss5i0jZIQMho47mJWC0tuMZ+6t7geXst7d/qYcxjsK4mec4OzXTv6JC
 FkN1OEMSDtnVVjuzPKOFupMjQCVafx3ttVFpdZ8YS6MuGYYHpBkvs9s84PrLNcAnLi1Pv
 k8qaN8OhVEPntzyXN0hz3wpSFkYuY0b4FLzm20wYWhVue4GX0E+XErgvc4ufPDb0Tm2lR
 96xOAbmYAXcdNj4hY/jxQjxwtMO+mojx1fZN7LL8cIyDyoE7C83lukxsqD3smcnRbkg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D003A81096
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:59:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79BDB90307; Sat, 10 Oct 2026 14:58:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 16:51:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 290cafef07c7c9421608d4b6df2df5124c11127b
X-Git-Newrev: 6fe0f0054ba37e9719df21d46e064a06daa68ccd
X-Patchwork-Hint: ignore
Message-Id: <20261010145838.79BDB90307@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwts: bump to version 26.09.00
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6fe0f0054ba37e9719df21d46e064a06daa68ccd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See release announce:
https://lists.ubuntu.com/archives/fwts-devel/2026-September/014232.html

Release notes:
https://github.com/fwts/fwts/releases/tag/V26.09.00

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fwts/fwts.hash | 4 ++--
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 89ee2a5e6f..6b606e4db4 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://github.com/fwts/fwts/releases/tag/V26.07.00
-sha256  ccee3375fe905a30311ea45f8baefc10af2517669f724f09f8df788bb8b4cbec  fwts-V26.07.00.tar.gz
+# Hash from: https://github.com/fwts/fwts/releases/tag/V26.09.00
+sha256  dd322a2392665113576da3392fd422884646f261dfbef72f741d7f6cc87c6503  fwts-V26.09.00.tar.gz
 
 # Hash for license file
 sha256  1ec8cffc8cf213afc5d854027d746c80e638a13b1688f2a352221490c681c54f  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 1f135c72c9..3c2fe96e11 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 26.07.00
+FWTS_VERSION = 26.09.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = https://github.com/fwts/fwts/releases/download/V$(FWTS_VERSION)
 FWTS_LICENSE = GPL-2.0, LGPL-2.1, Custom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D462C79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 19:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3F996060B;
	Sun,  6 Sep 2026 19:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQ_iRZuEtZay; Sun,  6 Sep 2026 19:36:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 24C63605EA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788723414;
	b=iy1sfFJU9YLgtOusNHs3HTvYPp0+J47ZbyyNnvpiFQjUFz1XQWA9tEXuftJNYw1Le/zS
	 zkYe50yLq0lA96yxOkwa2JbhHgww2xgMdGyzGWZd+R6s+3gaznTAeeQ0WMC2fTz4exZbV
	 iU7+tujnrsCGiMXk9qME1yVRFtrLF2Hw5ywGox2KPvKAzkyUJs+2I57ZNHtiWCltsdx2P
	 YQTNW5yGf9XqJNKD8jcBx00P8AcP5iTm+gCJQDT5QjMY3RN6Z4mmf5/Az4aHTCag7+joW
	 kiNHf/hr9+gkcLlZ4UadjGl9xL/pbk/yBNPp8m6Z75NJqpIL4Dp/SBwp6ixLlke51cw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788723414;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nixUWWpo9e9jBZCoOWfccFAneUhhtrz/cdF9UFqDaIE=;
	b=WVkBg2ulCAxpVuAs5n/ByKvx1VqgeV9akx6uwVQIepX5iVn0WkYd1+R/pnIYN3rUgAoI
	 /KNRYwpQiycrj6iLYMFIE3iBRrRbxSkbt6oT/8ujmfmdkA7Xo8OGug0/PBnAYCSE01Mgf
	 epSI2VUDiAd4msTHKTkQSlWS9QXmhtysQVHIuCgK+6Am4/Wy1YmirHc/RC2NHX8Fgohm8
	 Zrl5I02JX8O6uJped2gLwBzZMeZDaqdWO+jz6M5G9LNZm3XjtWDUEyQKXuOP8v5DDMe7k
	 GZfpLFfpbAMigJCgB3K9/tGRTtqhEIW90igZNdqBCtmDyPWn9XAmgziV3h1cSOgeOsw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788723414;
	bh=nixUWWpo9e9jBZCoOWfccFAneUhhtrz/cdF9UFqDaIE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pKj2tvuO03dbvGkUIqV2UNiuRj6e82QAWLEvoYjlFhhe7VTsBdW+5o+O7WadBWx3d
	 MT6TF+4CGx992KY3IOW5Rb7KnsZd1n2C1DKLwfBNl6hJBGKkfnpMQhS3p7k8bpg3w9
	 vkf9Sfi56/ujy5OhEMw7wWGgaZJdWw53SennA71cCMW1urZs49SGIZshdMb78VnEfb
	 2NBg/9CXh+qgcODnTyHv+ae6IDt3ZX2mR1DVqDTWMel9HQhsL+zmPyM0RXMEYOTp42
	 QvOnuS47z6rtFIeEhbWUSNjxDXSFlmUuinPmaFiRJOAbl1yNbJDadndvyX6WJMOFT5
	 EjTMp0XC69r+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24C63605EA;
	Sun,  6 Sep 2026 19:36:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8EAD72C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAC7F605EA
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Pz0wZk2btff for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 19:36:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BABBF605DE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788723411;
 b=tcMnuANnbYh+tjrAApyS1ikuQ/JWwJGzhVD8V+1k2/6oaIWimGUnu4htCgHnQUx/QSGX
 vm8yChDPwD8AH8sj8NrhJNd958+KmyZxwuJN1TQMePlERgqbGRBDZBlIrzJLhGJxsZxWr
 Wt7bopvyG3+KdMFcBOB9UO/IRSh96YykvWpZSYV3NErA1WfziN+5gda4qP47asPK5OFZm
 ASaDqOBcYPvaZPMG11umQ8QMqSLwwKsLrK7Dim6vbJF+MVRs/kFVdmqYZE9kJvu10p9Cm
 9CclkCr1NrywKN7d21PVCrlAUAL02VeOCVlPjxHmJs8wzKyDaVUDixgxxWBXdlBcr0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788723411;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=e5r54uWIafH7X6eKI7uBmFyVPHahZ0yjdVGui6vhJl8=;
 b=A/5HCOBkH1r9jdXQ4V+/LnETA19XgsERZJRV+Zsfl4Qm9PSRxZlwLkkkzvYeXFeupCnQ
 MSlLM+z6YcYg8U3QRHJvuc7/CglUMfWS0CIS2pG9McuO6kyhiDshBxJcrvFQkOtpuMZ9p
 YeetA3cSSmHxVWqN2Ba07+jj0m8RK92fZN/Lb0BZicw0xbV9gpW6BpVA9YJ1bNhS74Yeq
 gb7HNxiLx9wqm7M+BZX6KWER+S3oKbY3/ojyMTeKaPrJ7i5fy43zEdCjpfYlrAiPMwNxY
 rMKblqsLwqW1C7zxRhPLJN5hyY6UiMMuVP/WdWNiCLqoknrvN/o5AEcI5/ajV10uwuw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BABBF605DE
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:36:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DEA19545F; Sun,  6 Sep 2026 19:35:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 21:28:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 612460dffda7566bce48ebcfb257357315ae73e7
X-Git-Newrev: e3c4a32d34bd70fbfba72f384d852d2603233c6c
X-Patchwork-Hint: ignore
Message-Id: <20260906193550.1DEA19545F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hwdata: bump version to 0.411
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3c4a32d34bd70fbfba72f384d852d2603233c6c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/vcrhonek/hwdata/releases/tag/v0.411
https://github.com/vcrhonek/hwdata/releases/tag/v0.410

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 74a7f5e7e7..0046b56c75 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  23006accc0f931dd5187d0307a57d0744e2b8feb85e73c37bc0f5229fb31eadd  hwdata-0.409.tar.gz
+sha256  d75462181fbd307228e0a48b8d1449f1773ea4b1f17e8a1d56346907f999ce33  hwdata-0.411.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 7300b908b1..20ecd799b8 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.409
+HWDATA_VERSION = 0.411
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26772C79F99
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 22:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C246680664;
	Mon,  7 Sep 2026 22:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lORMIqlLkxev; Mon,  7 Sep 2026 22:12:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D82C88068F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788819126;
	b=MOdscFOdHlsgl1Ei1a442xH3ElW/zMOnOFX24EqDMJ8pAN3Ov4rCKGkg8nAJ0sYTo24p
	 L5lRW0FjEUGcZZ4NetYvfi4vq3mFg+c0j4Dz77CDTBTM+F4G48FdAiNEu46d+gy88YDbD
	 vvcw/xNZqlPfUWb6R8ZJjbSqEZgMwUvOfXMx7WMVZjYLdFAf4ny30k/eiD82LijoWp25x
	 IHgNm4wez25pcZLClMg3iKNseBq5DVCA9dvb08USLiUKezunUq25SNQbGYoUCFOLreFft
	 I3iJ0FdYg5hukQAVv2PZtYhUqSKLoS1fTM0eW6nSDPQcqBuEhPqzJeCP0WhuBUeRwGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788819126;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:X-OVh-ClientIp:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:x-ovh-tracer-id:X-VR-SPAMSTATE:X-VR-SPAMSCORE:
	 X-VR-SPAMCAUSE:DKIM-Signature:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ZhC4yswX7D2J4iV5zDCY41CAwktE9cBDIXtfoBwLF6U=;
	b=mf+X+JPNct6b3wGKMWNzOuwmfmq5LqehpsE3zAaQRD0k6lSQ9it9wvBuc+uIP8WHdy06
	 NYyJ24HzZYFVCZvT2GfKCIy6smloksLDaG+fSFbm5CgEZCRWlxD2yDkoodKrkWifBxeXP
	 TkVCvZkhMRuOlY6NOiTkMMRGWWM5VPY+NXKHI0/nKudUpOenSWogPjEaCrrLRDGDrmcjT
	 Hk5tVNl/9mjRw1hu1ls7xgkc0GJZQqRk2qavQ4XL6bRyslU/nj/VOa3N9aahD8tBeOOwN
	 dAG9hx43XRC74xssP1Ewy3wyLe6106zD6j4ei/B2d8RvlM7aEbjp84nQVihtPuHd7AQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788819125;
	bh=ZhC4yswX7D2J4iV5zDCY41CAwktE9cBDIXtfoBwLF6U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OpJKKyF6mlLnrZfZs3wZDFpmVVFUf9CLw72XD2VzFRZYFaD6iTneEU3T5C/5rsrt5
	 3V4FMQp0ize35lDcG5lj+G0fT0wT87TOlrEIXEzI1EJBkfNQdM94Y/KF1kARxsmtbc
	 BEyXP0gxLksH5SMwnsy3wG0BTDmi1bmN4ZEUFmj3TL8jvSJkbL0InWV96BNasr4Bqq
	 W0vnQvIKB5vwBGLHW7/PnqE8eWVZxjSuCsJUNFjueJeLnEE9uSULN4LDNFps/UE1F2
	 HsfWNlRc70ZjOQaaUqEtnlUM1it6sBtd2S2U1QESKB9zlRZyDDQ1mD5aJgjrYfsXCY
	 G4FZz9wTVu5uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D82C88068F;
	Mon,  7 Sep 2026 22:12:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 343B0230
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 22:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A3F04005A
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 22:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WuLTSnPkSMUG for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 22:12:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6614F40099
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=178.33.251.80
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788819122;
 b=tgG1d/dEmkOU96QQX/gAtv0C0LIggUvM1aYwx/nyhwMfKskFha7j+U8/imD7+oLiviLC
 D4fiGG7Wse5DMoXqsdrrooOBVivDJsyeaa9OmNp3e7f+3qdAsCWSmdgJ9X5wjW4536Lrz
 UIQmtJIcHzrGh7zke7eawaesi6z81a5lLLKC1r8bVBRcCz86ik0BTVNhunriPR6C0q5m0
 k/iyoys7q6b7hiFKrFrg68nNc5ylUA8aRYqb+W+ZbS1SoJw3j4VGPMUa1CEHtnvh8nXPk
 r3JFy1auVb84uxNx+pM5WcVxbazL3+/BAGlyj3DOyFDyTXJC3R/n9rdYRSus2enGh3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788819122;
 h=X-Greylist:Received-SPF:Received:Received:Received:X-OVh-ClientIp:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
 bh=ox+xMKew9+DSbydpkpH+FNGGn/2DrjdeFUsVQ86XqgQ=;
 b=In1kaYyhiD0k/rdIuQ1Hdka92GJfkxrgWyDNo86YUwHDm5PEGvmEWCzcAyA44UBzNr7+
 ATyjfdZ4WvHYxj7iotWnt4ldk8lDC7pTPPefW3zd27xOhnwQpzlWRYmbCcqbztXbtuyiT
 mqmFj7Y7x09lWSsNvzPiwv9GLjllnoV2c0dJ/AVIapG0N7XaIjZ33F7tn1LOnj+5TlPLH
 qOR669QsR6t8r5T+MWVYm9gIVmsQM3oaKET33LNS8UWoMeKuiUpTVGrfjdhd4jROLtqfa
 Gu0beIzAlLWYfhToTnj+Gezq+M0pfvCS5LgA0knTpBNSNKEJo5WqWkRWvnUSo5HF61A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=none header.from=armadeus.com; 
 dkim=pass header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=YRXOo4KL; 
 arc=none smtp.remote-ip=178.33.251.80
X-Greylist: delayed 2286 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 07 Sep 2026 22:12:00 UTC
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=YRXOo4KL
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.251.80;
 helo=2.mo576.mail-out.ovh.net; envelope-from=julien.boibessot@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 2.mo576.mail-out.ovh.net (2.mo576.mail-out.ovh.net
 [178.33.251.80])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6614F40099
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 22:12:00 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.110.43.142])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4hf0gg4nNpz5vZC
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 21:33:51 +0000 (UTC)
Received: from ghost-submission-c7b579475-6dj84 (unknown [10.108.54.171])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7196FC04BE;
 Mon,  7 Sep 2026 21:33:51 +0000 (UTC)
Received: from armadeus.com ([37.59.142.103])
 by ghost-submission-c7b579475-6dj84 with ESMTPSA
 id ovR7Dr8tn2rL/igAscvRaw
 (envelope-from <julien.boibessot@armadeus.com>);
 Mon, 07 Sep 2026 21:33:51 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00562401a48-a93a-4723-8b98-9b827eff19f5,
 540C20C598E7A98CDF1AEFF49A5DA16D93750466)
 smtp.auth=julien.boibessot@armadeus.com
X-OVh-ClientIp: 91.172.110.41
From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
To: buildroot@buildroot.org
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Date: Mon,  7 Sep 2026 23:33:35 +0200
Message-ID: <20260907213335.3492307-1-julien.boibessot@armadeus.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
x-ovh-tracer-id: 3296353454909144252
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTFTLMFKE/x0Tu8CG2f+Xj/ev3C9M68mztKFz6WD8SBufEa3JfE89r0UmXt5bj7xzXMKIW++Z7y2vds4j0Z9J2CfMLPvv9q9siL+LYTqSSKwlR/P4kg3X5SRuDjZW/LJapKGVcsYSrFVfHGbVLlXqfwNSN8c3z2NQjIdHOi8FXeHY+90jyBdg3fK02B0mBpZ14dem7XWQRDGeuKtSCa7cLrAzgTtcoARIK25HgmQGak8brV9+xL0yWmunryT9CS46NR5itdX26CNrOXcGmpfgT1hE32rIDjob6tP0VlQb52izEnze2cNuiWMD4htRpTzSocmdXpliVTTMHgEh0XqLoDOWjppi9maWh1tPheHqgp+ZQtAE7empq+8btWOhyJS/Hdjq7BPovcmKWLwia9l53QNHomlFI4pRBLopd/BNRImawZZmCfy1zxay6KDtLx6rsSP/0X/mjx646IsoRNTktkNbXO7chrmUDzcM1HynqAEW40W8X6aUpISYZeuHnc49t+cx3aQzO3CUfsqty8ZW+uqvxn0CtSjDBvHieo+OMJIA54OWiM7niURXZN3pkrFFQdRke8cAFv95EqbzaaOBCrd+t+2X/V+wsFFidyjpsDNRMs5LCiSLC3B7p3nVzqhLm6TjDdDDqFU75+xqiM8HK56nuWzQhfFBOKSXZ068E3+jQ
DKIM-Signature: a=rsa-sha256; bh=ox+xMKew9+DSbydpkpH+FNGGn/2DrjdeFUsVQ86XqgQ=; 
 c=relaxed/relaxed; d=armadeus.com; h=From;
 s=ovhmo103079-selector1; t=1788816831; v=1;
 b=YRXOo4KLLegXZci/1f0wr6X1RI2fV7hQAVb9uK9wKEsE7Cb+HmWSCxr0iAuiYhryRuZFhq41
 uIHxJN28+/S2SDD0kFCCQEzgKanc9eOHp+N1pgusHVbCunV6q7Vc2O3x/9wji/wsKnHY2+AA1Mw
 CwAv9PIsfHNHT+942dnDb5g8vxFxps+jqyUAkxCEYoilY82WCASyTjBVP2Tp/9eOQXH4DkD0fhX
 CpQRG9chxeXJiFGCWCjwlbssD0tBktBjB5HcXsoH+HkUngxyemiFGMwM7h7AdUDl0An9ULnd6US
 6NNnKy6To65M6r6iIFQ5iOKB5eu0PYOr+YxPNYfJWzVmQ==
Subject: [Buildroot] [PATCH 1/1] package/libmodbus: bump version to 3.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/stephane/libmodbus/blob/v3.2.0/NEWS.md

libmodbus 3.2.0 adds termios2 support to allow custom baud rates (RTU),
but the TCGETS2/TCSETS2 ioctl constants are not exposed by musl through
<sys/ioctl.h>. Add a patch to include <asm/ioctls.h>, which defines
these constants on all Linux libc, fixing the build with musl.

Added tarball hash provided by upstream.

Bump requested by Buildroot's autobuilder.

Build tested with test-pkg (6 toolchains : uclibc, glibc, noMMU, musl, static, old glibc).

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 ...-include-asm-ioctls.h-for-termios2-s.patch | 40 +++++++++++++++++++
 package/libmodbus/libmodbus.hash              |  4 +-
 package/libmodbus/libmodbus.mk                |  2 +-
 3 files changed, 43 insertions(+), 3 deletions(-)
 create mode 100644 package/libmodbus/0001-src-modbus-rtu-include-asm-ioctls.h-for-termios2-s.patch

diff --git a/package/libmodbus/0001-src-modbus-rtu-include-asm-ioctls.h-for-termios2-s.patch b/package/libmodbus/0001-src-modbus-rtu-include-asm-ioctls.h-for-termios2-s.patch
new file mode 100644
index 0000000000..21b4ecebbd
--- /dev/null
+++ b/package/libmodbus/0001-src-modbus-rtu-include-asm-ioctls.h-for-termios2-s.patch
@@ -0,0 +1,40 @@
+From 5f6af9e0e3d6adebc103a1f5a45a5b0d9c5a7e11 Mon Sep 17 00:00:00 2001
+From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
+Date: Mon, 07 Sep 2026 18:54:00 +0200
+Subject: [PATCH] src/modbus-rtu: include <asm/ioctls.h> for termios2 support
+
+Since v3.2.0, libmodbus uses the Linux termios2 interface (TCGETS2,
+TCSETS2) to support custom baud rates. The configure check detects
+"struct termios2" via <asm/termbits.h>, but the TCGETS2/TCSETS2 ioctl
+constants are defined in <asm/ioctls.h>, which is not included by musl
+libc through <sys/ioctl.h>.
+
+This breaks the build on musl-based systems:
+
+  modbus-rtu.c: error: 'TCGETS2' undeclared (first use in this function)
+  modbus-rtu.c: error: 'TCSETS2' undeclared (first use in this function)
+
+Include <asm/ioctls.h> alongside <sys/ioctl.h> when HAVE_STRUCT_TERMIOS2
+is defined to expose the TC*2 ioctl constants on all Linux libc.
+
+Upstream: not yet
+
+Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
+---
+ src/modbus-rtu.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/modbus-rtu.c b/src/modbus-rtu.c
+index 2a063fb1..d8414d2d 100644
+--- a/src/modbus-rtu.c
++++ b/src/modbus-rtu.c
+@@ -14,6 +14,7 @@
+ #endif
+ #if defined(HAVE_STRUCT_TERMIOS2)
+ #include <sys/ioctl.h>
++#include <asm/ioctls.h>
+ #endif
+ #include "modbus-private.h"
+ #include <assert.h>
+-- 
+2.43.0
diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index ddca835f34..dc5674f308 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,4 +1,4 @@
-# From https://github.com/stephane/libmodbus/releases/tag/v3.1.12
-sha256  2f4d4191cd196c1fba131daec03b621db75129d8255c832fc66b259d9fc46e7b  libmodbus-3.1.12.tar.gz
+# From https://github.com/stephane/libmodbus/releases/tag/v3.2.0
+sha256  72239f319b9b8483e3d393c5a60865d734fcff18a8abbb2486e389834a2f6ef1  libmodbus-3.2.0.tar.gz
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 5d20aef35c..36e32fe5d4 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.1.12
+LIBMODBUS_VERSION = 3.2.0
 LIBMODBUS_SITE = https://github.com/stephane/libmodbus/releases/download/v$(LIBMODBUS_VERSION)
 LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

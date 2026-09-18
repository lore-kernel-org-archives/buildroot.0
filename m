Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F765C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 22:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4320812CA;
	Fri, 18 Sep 2026 22:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_AR_y3Vhfrc; Fri, 18 Sep 2026 22:22:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A56AF8126A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789770162;
	b=NXPAsmuP87aTLRMHUHzvkHaRUTt90dQl7eegqFAojlIuCE90J0a/eRWdfp1OJVpwWMq0
	 S2iP/K2TrkNsmVKgezhEb2y1LsE+FjmPj7w1Y2rccLwOPdX4l2gpcxLVUoYqjorpYde/z
	 ZZRFBg66KZ3INNe6xx/xLSNylFH2JTjExujysdhw3P7lmUCCWHWLxfVtDkq1txVJkrHSU
	 wCZEucDkECXOvwI8c6XZnHVnC1tV/t+Gz7tqsh0pcpqXRdSBR3/P9lb2NZoW5H/DhWZmp
	 MJP4c8aC2sXo+JDFEH86qot+sT4ce9yplGHDmUOqMZ+zHePjC7qUM27rQ9L/slIS7ZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789770162;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=21zzpZADBqXfcqD5QWHEoqImrgzRb+wSTQNKpAk81p4=;
	b=JO5IcPTs5rOxyHi6UcOt3WJ8AsD++WsUBwsLfvTT03h6lqHxphDGb9Wydojvi5bRDKWc
	 Vsr57uM8Q6JmiaEe1+lKxR3TADUpF8Gx67Xvgg4Xmn+DpHsAf8b/ZnhmBSPzcgZCqtFhk
	 uBvIewGnCooJYSBN5flfQVBIc2+fZzONn4Mffvn8jrNLZu/Lpb19vVKZU2PVwEBlNRNMB
	 w/YSTpew+1NIdCKDuA+p2A1yFQozJK4/3wzG6QkVn21+0UlR+CGrxEfBPfkEbsIea3xKE
	 H3SI/6uBKxvEJvGKYr0ua5QPUoAyau4Z87IxqLBxjwI1ivTYKox0OPGgLLAhCaiX3pg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=grV9pAD+;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789770162;
	bh=21zzpZADBqXfcqD5QWHEoqImrgzRb+wSTQNKpAk81p4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nBgMGgTl7QzySQnWx+u/CnI9FVGbDdE7hvX5mP+NoLi0/JhaChSZyk9TroSsfwQ2C
	 B4qfrWst8lT3XET37xljw4HehbGHk62/aDF9c/T31rf8XJn3+eTDDLR35aCJBhmHV4
	 cO0PRR5BPVQv43wdAhQCKBmd2cXQ0bGb6EA8hJNR5VzRO/GE8sYDZJl2LalQ08nduj
	 KSh47W3W8+6qTz9QY3x62dGgUzsVUDemrF77/uJZr2NvSKokC3YnZ+2NQSPVvPCXaE
	 G4AYT03zsz68fgUh+sFR0DSHXfk5SaIYv2gc4nqC+QgLsu/NvXC+g7Aki5Jz49an3H
	 O2QOEweYwrVVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A56AF8126A;
	Fri, 18 Sep 2026 22:22:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03F3829B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 22:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDB0F81172
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 22:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GkDa0IPQcE2U for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 22:22:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2EA168116C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789770159;
 b=mlgqxySwd29ngnQRPN7Z64ahRbPyB1wnsKfFCVTCPYz/9m5+zATwJsBKaaaXesvYY8uY
 tPVNdDFtZr7/6QjXO+fD+dwFzvZ5QtuUP0jfo3MBOOIkOMiAKxKnoq+1DeCUhGq1f8NaN
 XqnOQPwoZnP6jRYvGyi/APlNwN8paNibg3OSxAajm5DV37SG5X9pX9YmrarN/bNlQtsMe
 DKEbnbZF+HxuLRC83t9A7ibTXEU4F2QETkHv8FYPRu7Qmfbk1ALMWeKhPM7MvOvDK9zEV
 GcDqCZYXk197vwpcEYQn+1zzM+FeAwKHoosoiipeM4N34V3f+RRWfSzD3mzBdz+qfdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789770159;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=E/j+JXRBH6LUOgcsZ6Qt5AprA3v7RZWaRr9duPc6t9M=;
 b=F4RS9TD2TKyILZIBLaAgUNTo4sN913tV80mHEsGfqjfmu1aRqXSIKTFRQtjdFpDE1CSN
 wQvtaA42SDbeP39BD3R1LDoqWsJdCnmbj258yOpJdq0dwJmwa0n1P0nVj2VEm2vNkPwSz
 JFJi5TDc8FoOYSNEKaLXG8cZnprOVgN5Y0cxPEcaYyW8YuNeNBJo25GDKe1Q1teIFWiTo
 MZ+ahGNGhtH9iMhRVAQ0oW0PxRCKTsie/PdGIsBcBZofJDqgeA3Eng7aO0DqQt9Gbwn+B
 GJeFZgDHkXmINFIXuf88iOUTSUTcJa8w+cLRQOz+sRmKeBepEGpXGtyC98D/0CjXJvw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=grV9pAD+; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=grV9pAD+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EA168116C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 22:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789770140;
 bh=E/j+JXRBH6LUOgcsZ6Qt5AprA3v7RZWaRr9duPc6t9M=;
 h=From:To:Subject:Date:From;
 b=grV9pAD+dCd4mG9TzzQ39Ko9K9vsXRhwez2b20Np4hNdEAHPz3I2B39c0dY3kc23B
 xzeVWjkkaDxdj6CfBqFAJdYeDORg+IkRzOeKf+HplUidKIRWmFfYPaUialic9WMJur
 ebiVCf2X48d9S8V88TwymxnzpRwp5eQxHW8g0rBXWcIKmkGs/lX7hy2PGfvkBoYmPH
 ZvcxOEndF+Bv5l+uwpeDY/+xkDeQOJcqwbe+/v32oSgozTQHYMpA6khhzh6VN74KcG
 koGvaZdbeAHe5dTImFswyD3JAocuQTsmgixqxOY6eoFzvFCYwP9miDbUVuxUUE2lbv
 IOyNLsIKeYu0Q==
X-KAS-Sym: v3:f51bdf72230551df:kPCeqCksVmqjmwTAKqnT69Meb9SisD38n8JUkILamLW999TYjleoZerhLOgutHfjXRTCWyWaJFelpGs6t3XqWhskIK15noH3ylN0vGuCb7IplL2RkJD6H0wT6iHRwf4luO5yQAedAExsB3LXAU0986Web1gKaZQm88Lbp0QWxN371qvWwHH9GetgAzhFNhJDdu37BtgdSitw2YwdhMC6rdG6a1JJxHhrSGTmm+2WaJ5clpzrrLLQOO7dguMqZxFT9Uo3amDUEr7jLcw9kkKH/vs1XdCwV5BqG+sHfkkSC6UstymMW/xg3Tv2A+GfI8eQcWwtmrnPFim4yyJ2fUJnSw==:a3fLUnuJ+nvCjgbqIY3/yigQbmu1efgAS9YRSoUSrMb6zV5kc8TODm383u6iewdM9Ht5GzeDzIT/Xkj6KpDf8vtRdMfy3ZCDof5aB4AK76gqZG4YzawhgAjmtnKOMQRyECdurvO6yskOLh+wCcFBX0+16hihe211pyHcN7r/EdlVGGBbWebPznJpYe4DioK1bn5atXFourEdFsSBcQ+pvs224RXH4YDpYvKfp9PIMlALJlhK2txxGDQsGQZy4cwhmZY6PdNJz4o98QFh35Jjzs+9C9Qy0yUTdIksxzJFdQDbQX6fPaZQh5l8s/nDisK74MJ0hnMv/crKrnFHnVTn7WBoPI2754dSt6Xl4uX8MicdYmf4A113vnbcOP7Vb0sg6etSan1f05U+9Q0wVEw3ecpUSuXqO7yRfZ/3EfdRfbI+tQWkAAhLh+qRcgxaShHkBQMq0Ld+ZCKCRpUDOVP6b1oYGmqVVKGmQFNozzbB/y5diGi+J8C/nXm/bKa847Mvn83JpXz2rr2UAi+5ZNtO/5dV9Cgf3a0jBy/64vCiQdC2xAw/wIloOFrX9FZvjqNk4KEogkEXvUKCYkKeOm90ei61dNRq
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C6588A4C4063
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 00:22:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55708)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7gyK-000000004wh-1uzw
 for buildroot@buildroot.org; Fri, 18 Sep 2026 22:22:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 00:22:19 +0200
Message-ID: <20260918222220.3573878-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.3.5
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.3.5

Rebased patch 0001, needed after upstream commit
https://github.com/intel/media-driver/commit/04584f8839ff773f18e4b1542618a00b6fc4de1a

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...Update-cmake_minimum_required-to-3.5-co.patch | 16 +---------------
 package/intel-mediadriver/intel-mediadriver.hash |  2 +-
 package/intel-mediadriver/intel-mediadriver.mk   |  2 +-
 3 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch b/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch
index 7a2a2ee78f..a4ec03d307 100644
--- a/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch
+++ b/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch
@@ -11,7 +11,7 @@ This supports the compilation with cmake-4.0.0
 Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
 Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 Upstream: https://github.com/intel/media-driver/pull/1919
-[Bernd: rebased for version 26.2.1]
+[Bernd: rebased for version 26.3.5]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Tools/MediaDriverTools/GenDmyHex/CMakeLists.txt          | 2 +-
@@ -20,7 +20,6 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  Tools/MediaDriverTools/KrnToHex/CMakeLists.txt           | 2 +-
  Tools/MediaDriverTools/KrnToHex_IGA/CMakeLists.txt       | 2 +-
  cmrtlib/CMakeLists.txt                                   | 2 +-
- cmrtlib/linux/CMakeLists.txt                             | 2 +-
  media_driver/linux/ult/CMakeLists.txt                    | 2 +-
  media_driver/linux/ult/libdrm_mock/CMakeLists.txt        | 2 +-
  media_driver/linux/ult/ult_app/CMakeLists.txt            | 2 +-
@@ -93,19 +92,6 @@ index af622be19..40e4eba17 100644
  
  project(KrnToHex_IGA)
  
-diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
-index b066138d9..df02bab2a 100644
---- a/cmrtlib/linux/CMakeLists.txt
-+++ b/cmrtlib/linux/CMakeLists.txt
-@@ -18,7 +18,7 @@
- # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- # OTHER DEALINGS IN THE SOFTWARE.
- 
--cmake_minimum_required(VERSION 2.8)
-+cmake_minimum_required(VERSION 3.5)
- include (${CMAKE_CURRENT_LIST_DIR}/cmrt_utils.cmake)
- 
- 
 diff --git a/media_driver/linux/ult/CMakeLists.txt b/media_driver/linux/ult/CMakeLists.txt
 index 9fb5b39ee..f06b49011 100644
 --- a/media_driver/linux/ult/CMakeLists.txt
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 037b4d4760..03f85c2888 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  94558a167cf863b190aa83d02b69c2d67227cda15ba320541b30171fe3fc4f26  intel-media-26.3.4.tar.gz
+sha256  76f41c06cefc91d57e0b7d366b7a91b8420ec77939326491795f9fb26afca7e7  intel-media-26.3.5.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 90cd4189fa..8cf39a24ec 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.3.4
+INTEL_MEDIADRIVER_VERSION = 26.3.5
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

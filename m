Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2C1CD6E57
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 19:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D773610CC;
	Tue,  2 Jun 2026 19:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2Zln4I8_Qog; Tue,  2 Jun 2026 19:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3942F610BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780426867;
	bh=x11uyEQfVugQMbZYqWr1FpmM+K8caLVCoABTqckB86g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rkucYcuZdClEQeeAn/WQqEhvKg6D0zCniRwgpymQcdpa+MYmX3Cdqqps6D70XUkHW
	 J1vSi+aut+/m4dX51K1/nNeY252+6D5xDTli6OUeJPU0jiid0QKPfPnWXTMRxSsndh
	 fGlRxGd5/0X6sGvWMLdx5cygUc33CH7BEgY1JVlM1n998c6lr+lPWmokaHGmyZgjw4
	 MsdnjCYmTr8KIS7t8ACdpDJa/L4C0/VQUpP7wZIsiLJDw4ytbwUL1+Q6sz3Ig5SB6t
	 nmt/IDmrTPnoXUWZRZKF9k9N7YHIV4gh9DSvGsBmMM+0OB0KtArcKLijrweVzn+pNi
	 Y4aAjONqy43Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3942F610BF;
	Tue,  2 Jun 2026 19:01:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 90229187
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FEF8610B8
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjfnPzYj5HWB for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 19:01:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 130E5610CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 130E5610CB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 130E5610CB
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:01:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ef.dip0.t-ipconnect.de [91.58.8.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DA927A4C03B6
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 21:00:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49772)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUUM4-000000005yG-02RL
 for buildroot@buildroot.org; Tue, 02 Jun 2026 19:00:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 21:00:47 +0200
Message-ID: <20260602190048.2035264-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780426848;
 bh=e+b61V2Dfoa6kPrIDgzEIP7ajWspuGU1zZAEGYvRd9M=;
 h=From:To:Subject:Date:From;
 b=NtTpIbCupKxMBxnOLJNQRX/+Mjcs3ru5CsJSKta17OUFsn8CXawpS+2WDKGycYR8w
 vLm81uppEurQlp3Has5teRx2fk/TPj+Rb5WOWAsHDCuV0DuD5E6hTGm31O3c15Cl+c
 na9h4kCyvlPXNqtdDlz6oIPG8walk4McGijPHhfDwZHt/3Tv0C65j0oMGbCxddXTl4
 omYRlo6pLKQ3QfJl5RcpK7octFvdT24xIPLEKB1lk4ZfZo9hpbrhkeb1pk4fefMeU8
 jCkdBxDd19zpKPsUziVkeujmuTKvdSigjyfrR3RC2eG7jFdbOJ8u8X7ZU8ZtbYi+TF
 KxB+0y72U0yPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=NtTpIbCu
Subject: [Buildroot] [PATCH/next 1/2] package/intel-mediadriver: bump
 version to 26.2.1
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.2.1

Rebased patch due to upstream commit:
https://github.com/intel/media-driver/commit/ec210a9255e9177b571da4a42c907bd36ab63744

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/5f1eee2b3125380a045021fee62a017c1881dbc0

 ...ate-cmake_minimum_required-to-3.5-co.patch | 28 ++-----------------
 .../intel-mediadriver/intel-mediadriver.hash  |  2 +-
 .../intel-mediadriver/intel-mediadriver.mk    |  2 +-
 3 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch b/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch
index 6d0d972be0..7a2a2ee78f 100644
--- a/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch
+++ b/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch
@@ -11,6 +11,8 @@ This supports the compilation with cmake-4.0.0
 Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
 Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 Upstream: https://github.com/intel/media-driver/pull/1919
+[Bernd: rebased for version 26.2.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Tools/MediaDriverTools/GenDmyHex/CMakeLists.txt          | 2 +-
  Tools/MediaDriverTools/GenKrnBin/CMakeLists.txt          | 2 +-
@@ -91,19 +93,6 @@ index af622be19..40e4eba17 100644
  
  project(KrnToHex_IGA)
  
-diff --git a/cmrtlib/CMakeLists.txt b/cmrtlib/CMakeLists.txt
-index 9ecb1e4e1..54f907b37 100644
---- a/cmrtlib/CMakeLists.txt
-+++ b/cmrtlib/CMakeLists.txt
-@@ -19,7 +19,7 @@
- # OTHER DEALINGS IN THE SOFTWARE.
- 
- set(BUILD_ALL $ENV{BUILD_ALL})
--cmake_minimum_required(VERSION 2.8)
-+cmake_minimum_required(VERSION 3.5)
- project(CM_RT)
- add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/linux)
- 
 diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
 index b066138d9..df02bab2a 100644
 --- a/cmrtlib/linux/CMakeLists.txt
@@ -169,19 +158,6 @@ index 6b1f74335..bba044a97 100644
  
  project(devult)
  
-diff --git a/os_release_info.cmake b/os_release_info.cmake
-index b4a84e2c5..a3b879d85 100644
---- a/os_release_info.cmake
-+++ b/os_release_info.cmake
-@@ -29,7 +29,7 @@ set(_os_release_info TRUE)
- # of the local cmake environment.
- 
- # Set cmake policies for at least this level:
--cmake_minimum_required(VERSION 2.8.12)
-+cmake_minimum_required(VERSION 3.5)
- 
- 
- # Function get_os_release_info - Determine and return OS name and version
 -- 
 2.34.1
 
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index bbdd3eedd9..a5d012dc2e 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  32f984333d0804ec8f784f25cf443499ee86074a7da7791483d9a9afbfa97c74  intel-media-26.2.0.tar.gz
+sha256  65bc05de32869ed73bcc6e7275d425987adfff792152565440f45d6b54fe1b9d  intel-media-26.2.1.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 61d8dd408d..2cc7372342 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.2.0
+INTEL_MEDIADRIVER_VERSION = 26.2.1
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

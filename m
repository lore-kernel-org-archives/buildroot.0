Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B69C982CC
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 12:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 234638124F;
	Sat, 19 Sep 2026 12:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y95uG9wzFWAX; Sat, 19 Sep 2026 12:24:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9D94481240
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789820682;
	b=tL9CQcfOhGRKIeUGxqGHDFI9knkFfYxkL2zbrxh3BH5ABCylbShdSdFwlm1FmHP9vG2a
	 tRIxnmVfm6hbiZORhR/mBJKzJRhg8HyW7rHdPjspqxMjAmvN1DMMFJlTxiM7Uen65ReKg
	 JsgtzRuGC08vTjZsUzWNPVV+8TfkakUcRr2UoE8F6tQsjcsn9iGcQxLaVfgWV30oyXqv+
	 wvmulcWXbSqzLxM1Z/gAy8cmla0ao463xzkrISWXg7/5SglFnQvIEnlcJgEqFvJxKh7AU
	 quwKn+EnFinAgQYqjP8K4rT5JqtTxqCvMRpyot6ewNVasOhojWGPuqYeW7YDUumFt+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789820682;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eQv+zmLhfvuEsZTAnyhwuo2O1LvhFO6x9WxQRqpMAfU=;
	b=BG1RsphLxfExL3oWnQY1r68K6GQQh0GVkZsTX5GPJKmRbfTEgeSOA+oYyBHsnc4ymn2m
	 L6KLlfsOV58aurvW/YEleIUTPjjOZHcX2I0xSIPHoYyOoBHWwH7VCnW7YaIdYwJk611PF
	 aV+rNKfCYo6GaYOXcBbMVdCjI8zYh/txtnpz/XHMXFI/6faUDwTltZA4YuIYJwcRw20X+
	 Wr7htaKvQLpPRJ5xREaFztlxklAQbDE4k6RqaSGivKNbeztsUhs5gEuXzXvqmYKTraZC5
	 rd93z6tNNGci/TiW42+fE65u53I/lt7tQtyQt1Mv/PDQMZdb8hdEaUTQV6prbShD+rQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789820682;
	bh=eQv+zmLhfvuEsZTAnyhwuo2O1LvhFO6x9WxQRqpMAfU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S1/yQnu17LCFsgXpWn11z1p+85U02C4O1cmOo9Ulvdz2Jcq6xOeb4LdhL1mjxGWWF
	 ZcuJjUNK6yJMCRStIrygkY9CZBMM8EUj44MFnYv5iRIa8p40IFlcMk6w8Xm+ILnRlK
	 hIYigpzKAHKO+g0Ul3jgDBIjZpU+T55KAM9Ny/Q8C3CqWg695g049kd7MtoodPY/8Q
	 RDq5C+yYGKL4SyVXrmt4wqLgv+onTmi5x9WJQ6tx+36qPwWaFsBWenGZh79hmUdeJl
	 WYtLxkAMP9UB4ATDpMg7Gqw6EIcgKFk/N53DO0vKivqU/Jfz4kApbwXxZGimpR+6Ez
	 MkTqG69aTNLow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D94481240;
	Sat, 19 Sep 2026 12:24:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 096DC24D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 12:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE892400AB
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 12:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0qVi7aY8Vtx for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 12:24:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 04F2A4007C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789820680;
 b=E7kcMjKVVsn7knzE8N0zJvc/0pOKBAC3+L0aFt0rx/bw1LHu7jqM1opigCAlIsazRLvM
 xqmhR/Td995cXnmwPBcy5wpde3Z1D+osbzV1zgyU/Yuy4PlPriVJCORIuHWcbUY/ZORUP
 eIRAKXau4uqcCijQplcLgcJUBfO2GVonL74WJs99ZDOb1om0e0/g6RkLH+dX5ftxBEulU
 c2FnYZBCe5B/bbMQJENrdnz/FArdOEGoGgRForqaAdCLRMl//Tfk0rMr806cvlaWq++Zq
 wGF+8vHcsNEBXhsAIi0UhIHJk+0+9//PbX8zzh9UFMBGA/j0XBxuHV4T6/NNnm5lkYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789820680;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=irWKWDoCXyaqBebhhlnyuDO+/lnjLo4ACgj5oRtvDAc=;
 b=P3uGEOyu9Q3V08RT2EeYMIKA63j4hBwJsEMLZenEbJ8F3ek/bM2wYyLm9GJ4fxEFANB2
 Alij0hELLC2qxTe9TbP8IwTycvt0gq3p+smaHTwxda8C6P5myS2a3G4UcpsZNcYEenbG4
 MgKNpdfc/zGJ1XqcKK+zq9NnGJPTQNOcvpl4aOk1Fv1CXkNFN2eEfrLGLNPFc56Feu3E8
 4TgaJLP+9aHWNbj9y+9/gOHVR4QMd/r/VD08O/ib0qFLlozJMN0oPwRQ74RB1zyMdjmNz
 X32DpgR9JqsxSWZfcTe+E2dWhohIdztNmnx7iA9qVQ6o50b8iHYOknx7Hxm0xSQ/9zw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04F2A4007C
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 12:24:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D6F28D4C3; Sat, 19 Sep 2026 12:23:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 13:28:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a936a80d9e566234f3060fed521181f3fc7a2120
X-Git-Newrev: 6dce485ca72979ba0575a6ac82d7adfbf512e45a
X-Patchwork-Hint: ignore
Message-Id: <20260919122332.2D6F28D4C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6dce485ca72979ba0575a6ac82d7adfbf512e45a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/media-driver/releases/tag/intel-media-26.3.5

Rebased patch 0001, needed after upstream commit
https://github.com/intel/media-driver/commit/04584f8839ff773f18e4b1542618a00b6fc4de1a

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-Common-Update-cmake_minimum_required-to-3.5-co.patch | 16 +---------------
 package/intel-mediadriver/intel-mediadriver.hash         |  2 +-
 package/intel-mediadriver/intel-mediadriver.mk           |  2 +-
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

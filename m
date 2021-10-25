Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482D7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:56:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E414460F70
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E414460F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B13A380F24;
	Mon, 25 Oct 2021 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dl2RmVc8GIEK; Mon, 25 Oct 2021 18:56:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6BDC80F30;
	Mon, 25 Oct 2021 18:56:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 217E71BF97C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 116AA6088B
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qG124no0K9hQ for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F9EA6087C
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 97282887A9; Mon, 25 Oct 2021 18:53:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 20:53:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2380c4ea3d4d22de0d7fe01e42260e43b688275
X-Git-Newrev: a2c02a8c2f42dcd76e0cf6458f14afd642746dd5
X-Patchwork-Hint: ignore
Message-Id: <20211025185305.97282887A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xerces: fix memory leak when
 transcoding fails
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2c02a8c2f42dcd76e0cf6458f14afd642746dd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Seen with the IconvGNU transcoder when parsing "<aaa.xsdopengis.net/gml\x96".
The reason is that XMLString::transcode(repText2, manager) throws a TranscodingException
which causes the tmp1 string to leak.

Upstream: https://github.com/apache/xerces-c/commit/1bdf6d8ba878c1fe1d779824be70001fc0bebd2c

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...der-loadMsg-fix-memory-leak-when-transcod.patch | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/package/xerces/0002-InMemMsgLoader-loadMsg-fix-memory-leak-when-transcod.patch b/package/xerces/0002-InMemMsgLoader-loadMsg-fix-memory-leak-when-transcod.patch
new file mode 100644
index 0000000000..76b37c63d9
--- /dev/null
+++ b/package/xerces/0002-InMemMsgLoader-loadMsg-fix-memory-leak-when-transcod.patch
@@ -0,0 +1,87 @@
+From 1bdf6d8ba878c1fe1d779824be70001fc0bebd2c Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Fri, 27 Aug 2021 01:33:27 +0200
+Subject: [PATCH] InMemMsgLoader::loadMsg(): fix memory leak when transcoding
+ fails.
+
+Seen with the IconvGNU transcoder when parsing "<aaa.xsdopengis.net/gml\x96".
+The reason is that XMLString::transcode(repText2, manager) throws a TranscodingException
+which causes the tmp1 string to leak.
+
+```
+0 0x8791409 in operator new(unsigned int) /src/llvm-project/compiler-rt/lib/asan/asan_new_delete.cpp:99:3
+1 0xbd147f7 in xercesc_4_0::MemoryManagerImpl::allocate(unsigned int) gdal/xerces-c/src/xercesc/internal/MemoryManagerImpl.cpp:40:18
+2 0xbe8c73e in xercesc_4_0::IconvGNULCPTranscoder::transcode(char const*, xercesc_4_0::MemoryManager*) gdal/xerces-c/src/xercesc/util/Transcoders/IconvGNU/IconvGNUTransService.cpp:870:32
+3 0xbc22ca2 in xercesc_4_0::XMLString::transcode(char const*, xercesc_4_0::MemoryManager*) gdal/xerces-c/src/xercesc/util/XMLString.cpp:621:25
+4 0xbe8f4ad in xercesc_4_0::InMemMsgLoader::loadMsg(unsigned int, char16_t*, unsigned int, char const*, char const*, char const*, char const*, xercesc_4_0::MemoryManager*) gdal/xerces-c/src/xercesc/util/MsgLoaders/InMemory/InMemMsgLoader.cpp:157:16
+5 0xbc20175 in xercesc_4_0::XMLException::loadExceptText(xercesc_4_0::XMLExcepts::Codes, char const*, char const*, char const*, char const*) gdal/xerces-c/src/xercesc/util/XMLException.cpp:241:23
+6 0xbc48bee in xercesc_4_0::UTFDataFormatException::UTFDataFormatException(char const*, unsigned long long, xercesc_4_0::XMLExcepts::Codes, char const*, char const*, char const*, char const*, xercesc_4_0::MemoryManager*) gdal/xerces-c/src/xercesc/util/UTFDataFormatException.hpp:31:1
+7 0xbc4824e in xercesc_4_0::XMLUTF8Transcoder::transcodeFrom(unsigned char const*, unsigned int, char16_t*, unsigned int, unsigned int&, unsigned char*) gdal/xerces-c/src/xercesc/util/XMLUTF8Transcoder.cpp:182:13
+8 0xbd27d7e in xercesc_4_0::XMLReader::xcodeMoreChars(char16_t*, unsigned char*, unsigned int) gdal/xerces-c/src/xercesc/internal/XMLReader.cpp:1926:34
+9 0xbd271dd in xercesc_4_0::XMLReader::refreshCharBuffer() gdal/xerces-c/src/xercesc/internal/XMLReader.cpp:571:19
+10 0xbd15c63 in xercesc_4_0::XMLReader::peekNextChar(char16_t&) gdal/xerces-c/src/xercesc/internal/XMLReader.hpp:767:14
+11 0xbd15aaf in xercesc_4_0::ReaderMgr::peekNextChar() gdal/xerces-c/src/xercesc/internal/ReaderMgr.cpp:158:21
+12 0xbd328da in xercesc_4_0::XMLScanner::scanProlog() gdal/xerces-c/src/xercesc/internal/XMLScanner.cpp:1241:45
+13 0xbd31ef4 in xercesc_4_0::XMLScanner::scanFirst(xercesc_4_0::InputSource const&, xercesc_4_0::XMLPScanToken&) gdal/xerces-c/src/xercesc/internal/XMLScanner.cpp:549:9
+14 0xbdadcff in xercesc_4_0::SAX2XMLReaderImpl::parseFirst(xercesc_4_0::InputSource const&, xercesc_4_0::XMLPScanToken&) gdal/xerces-c/src/xercesc/parsers/SAX2XMLReaderImpl.cpp:500:22
+```
+Upstream: https://github.com/apache/xerces-c/commit/1bdf6d8ba878c1fe1d779824be70001fc0bebd2c
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+
+---
+ .../MsgLoaders/InMemory/InMemMsgLoader.cpp    | 31 ++++++++++++++-----
+ 1 file changed, 23 insertions(+), 8 deletions(-)
+
+diff --git a/src/xercesc/util/MsgLoaders/InMemory/InMemMsgLoader.cpp b/src/xercesc/util/MsgLoaders/InMemory/InMemMsgLoader.cpp
+index cda103226..6971fde96 100644
+--- a/src/xercesc/util/MsgLoaders/InMemory/InMemMsgLoader.cpp
++++ b/src/xercesc/util/MsgLoaders/InMemory/InMemMsgLoader.cpp
+@@ -25,6 +25,7 @@
+ // ---------------------------------------------------------------------------
+ #include <xercesc/util/BitOps.hpp>
+ #include <xercesc/util/PlatformUtils.hpp>
++#include <xercesc/util/TranscodingException.hpp>
+ #include <xercesc/util/XMLMsgLoader.hpp>
+ #include <xercesc/util/XMLString.hpp>
+ #include <xercesc/util/XMLUni.hpp>
+@@ -153,14 +154,28 @@ bool InMemMsgLoader::loadMsg(const  XMLMsgLoader::XMLMsgId  msgToLoad
+     XMLCh* tmp4 = 0;
+     
+     bool bRet = false;
+-    if (repText1)
+-        tmp1 = XMLString::transcode(repText1, manager);
+-    if (repText2)
+-        tmp2 = XMLString::transcode(repText2, manager);
+-    if (repText3)
+-        tmp3 = XMLString::transcode(repText3, manager);
+-    if (repText4)
+-        tmp4 = XMLString::transcode(repText4, manager);
++    try
++    {
++        if (repText1)
++            tmp1 = XMLString::transcode(repText1, manager);
++        if (repText2)
++            tmp2 = XMLString::transcode(repText2, manager);
++        if (repText3)
++            tmp3 = XMLString::transcode(repText3, manager);
++        if (repText4)
++            tmp4 = XMLString::transcode(repText4, manager);
++    }
++    catch( const TranscodingException& )
++    {
++        if (tmp1)
++            manager->deallocate(tmp1);
++        if (tmp2)
++            manager->deallocate(tmp2);
++        if (tmp3)
++            manager->deallocate(tmp3);
++        // Note: tmp4 cannot leak
++        throw;
++    }
+ 
+     bRet = loadMsg(msgToLoad, toFill, maxChars, tmp1, tmp2, tmp3, tmp4, manager);
+ 
+-- 
+2.17.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

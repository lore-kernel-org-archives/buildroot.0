Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9351CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:55:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C43660F6F
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C43660F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2044A4041F;
	Mon, 25 Oct 2021 18:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zbj749khLAta; Mon, 25 Oct 2021 18:55:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 440F94025D;
	Mon, 25 Oct 2021 18:55:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B2301BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A1A160890
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMtVoflMWc0p for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:55:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A5876088B
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:55:15 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id n1so3427459edd.0
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 11:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=k8PflmMpzFwDb4z+TI+yGcR36HbxSfoW7c5ytzG6ic8=;
 b=JBvPo4rDbtU0D42vvSVan0RnZZJEhTJz+JpB4CaO+zxvMEpHfJymg9VBgkMPwpkWEK
 aS33MoekpPZPAbjqMG4DAMgSpTnkhtxh/589W6cflTlREGjzjUeakSw/jFNUCO1CNcK7
 qfLiYy966I75eTC7zX3TDD9kfYIAcgnNS8UJpJ5Lc0vD/m3aGXeWeMVxfrDHDT00aojv
 d3tIiTurm0xN/pOrZAsCr5xD0hhIIK0CPk+1z3AeRVFh4rdk/Vp7dBXth9+T2kp6NBBj
 zNpgsQdPEgdJ/QSGGAf8HU1Ys8ZrxSarM2pQBFJXKKgosq8Ya9TJ5Jyiw0YGj7D2GZQs
 0O6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=k8PflmMpzFwDb4z+TI+yGcR36HbxSfoW7c5ytzG6ic8=;
 b=uPKsrIJDbPpIowR7xz12t3m70mAEekKwf2rijSQYr7wgEcTLmo23vIj4hoCaoU0Vo9
 BnUyTYdfyA/ITO58ZqO3a3RI/O+geNl0Lc0Axg5GvCdWgxjjzzA8lWlBjj6d1h3dXhLj
 DySD0ni3vMBKk/0RTohTNcQGXTk6coOrMLizo4weU5N/Oo0ZT1O70dk9+wXTXx5r+hBw
 Ka9PTQ5gt8Lgg273hZanyAs2+fDkJj0hZzatgnXTujT3OiZbSNwIzQUQ0zCQ/B2TDZ23
 EXCH1TnOSdoqWDkm4HH5KVUUx9JmEQ4jv2+8ikqo/q4p/L1YeOXiQ8UiMRO/lBYnnHKc
 uAvQ==
X-Gm-Message-State: AOAM531Pym+piStmXSgPLuIWHdAu847iJ0lnpeLCf4RKsYBj9MoTS6eJ
 JrffhGsfYAG89CvPf6jjeKZKug==
X-Google-Smtp-Source: ABdhPJyw6zCrwJCzaBzq+2Zwy4px72ZF0lFZpRvhSIgn3fiJmA1Tu4tLR8oL33blS4ojwLkZLLfrkg==
X-Received: by 2002:a17:907:7f8b:: with SMTP id
 qk11mr23720735ejc.238.1635188113269; 
 Mon, 25 Oct 2021 11:55:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hp13sm6151952ejc.66.2021.10.25.11.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 11:55:12 -0700 (PDT)
Message-ID: <6371a28f-1c72-e2a2-d55d-32a9d415f71f@mind.be>
Date: Mon, 25 Oct 2021 20:55:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
References: <20211014153325.56107-1-matthew.weber@collins.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211014153325.56107-1-matthew.weber@collins.com>
Subject: Re: [Buildroot] [PATCH] package/xerces: fix memory leak when
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/10/2021 17:33, Matthew Weber via buildroot wrote:
> Seen with the IconvGNU transcoder when parsing "<aaa.xsdopengis.net/gml\x96".
> The reason is that XMLString::transcode(repText2, manager) throws a TranscodingException
> which causes the tmp1 string to leak.
> 
> Upstream: https://github.com/apache/xerces-c/commit/1bdf6d8ba878c1fe1d779824be70001fc0bebd2c
> 
> Signed-off-by: Matthew Weber <matthew.weber@collins.com>

  Applied to master, thanks.

  Regards,
  Arnout

> 
> ---
> This is applicable to LTS as well.
> ---
>   ...oadMsg-fix-memory-leak-when-transcod.patch | 87 +++++++++++++++++++
>   1 file changed, 87 insertions(+)
>   create mode 100644 package/xerces/0002-InMemMsgLoader-loadMsg-fix-memory-leak-when-transcod.patch
> 
> diff --git a/package/xerces/0002-InMemMsgLoader-loadMsg-fix-memory-leak-when-transcod.patch b/package/xerces/0002-InMemMsgLoader-loadMsg-fix-memory-leak-when-transcod.patch
> new file mode 100644
> index 0000000000..76b37c63d9
> --- /dev/null
> +++ b/package/xerces/0002-InMemMsgLoader-loadMsg-fix-memory-leak-when-transcod.patch
> @@ -0,0 +1,87 @@
> +From 1bdf6d8ba878c1fe1d779824be70001fc0bebd2c Mon Sep 17 00:00:00 2001
> +From: Even Rouault <even.rouault@spatialys.com>
> +Date: Fri, 27 Aug 2021 01:33:27 +0200
> +Subject: [PATCH] InMemMsgLoader::loadMsg(): fix memory leak when transcoding
> + fails.
> +
> +Seen with the IconvGNU transcoder when parsing "<aaa.xsdopengis.net/gml\x96".
> +The reason is that XMLString::transcode(repText2, manager) throws a TranscodingException
> +which causes the tmp1 string to leak.
> +
> +```
> +0 0x8791409 in operator new(unsigned int) /src/llvm-project/compiler-rt/lib/asan/asan_new_delete.cpp:99:3
> +1 0xbd147f7 in xercesc_4_0::MemoryManagerImpl::allocate(unsigned int) gdal/xerces-c/src/xercesc/internal/MemoryManagerImpl.cpp:40:18
> +2 0xbe8c73e in xercesc_4_0::IconvGNULCPTranscoder::transcode(char const*, xercesc_4_0::MemoryManager*) gdal/xerces-c/src/xercesc/util/Transcoders/IconvGNU/IconvGNUTransService.cpp:870:32
> +3 0xbc22ca2 in xercesc_4_0::XMLString::transcode(char const*, xercesc_4_0::MemoryManager*) gdal/xerces-c/src/xercesc/util/XMLString.cpp:621:25
> +4 0xbe8f4ad in xercesc_4_0::InMemMsgLoader::loadMsg(unsigned int, char16_t*, unsigned int, char const*, char const*, char const*, char const*, xercesc_4_0::MemoryManager*) gdal/xerces-c/src/xercesc/util/MsgLoaders/InMemory/InMemMsgLoader.cpp:157:16
> +5 0xbc20175 in xercesc_4_0::XMLException::loadExceptText(xercesc_4_0::XMLExcepts::Codes, char const*, char const*, char const*, char const*) gdal/xerces-c/src/xercesc/util/XMLException.cpp:241:23
> +6 0xbc48bee in xercesc_4_0::UTFDataFormatException::UTFDataFormatException(char const*, unsigned long long, xercesc_4_0::XMLExcepts::Codes, char const*, char const*, char const*, char const*, xercesc_4_0::MemoryManager*) gdal/xerces-c/src/xercesc/util/UTFDataFormatException.hpp:31:1
> +7 0xbc4824e in xercesc_4_0::XMLUTF8Transcoder::transcodeFrom(unsigned char const*, unsigned int, char16_t*, unsigned int, unsigned int&, unsigned char*) gdal/xerces-c/src/xercesc/util/XMLUTF8Transcoder.cpp:182:13
> +8 0xbd27d7e in xercesc_4_0::XMLReader::xcodeMoreChars(char16_t*, unsigned char*, unsigned int) gdal/xerces-c/src/xercesc/internal/XMLReader.cpp:1926:34
> +9 0xbd271dd in xercesc_4_0::XMLReader::refreshCharBuffer() gdal/xerces-c/src/xercesc/internal/XMLReader.cpp:571:19
> +10 0xbd15c63 in xercesc_4_0::XMLReader::peekNextChar(char16_t&) gdal/xerces-c/src/xercesc/internal/XMLReader.hpp:767:14
> +11 0xbd15aaf in xercesc_4_0::ReaderMgr::peekNextChar() gdal/xerces-c/src/xercesc/internal/ReaderMgr.cpp:158:21
> +12 0xbd328da in xercesc_4_0::XMLScanner::scanProlog() gdal/xerces-c/src/xercesc/internal/XMLScanner.cpp:1241:45
> +13 0xbd31ef4 in xercesc_4_0::XMLScanner::scanFirst(xercesc_4_0::InputSource const&, xercesc_4_0::XMLPScanToken&) gdal/xerces-c/src/xercesc/internal/XMLScanner.cpp:549:9
> +14 0xbdadcff in xercesc_4_0::SAX2XMLReaderImpl::parseFirst(xercesc_4_0::InputSource const&, xercesc_4_0::XMLPScanToken&) gdal/xerces-c/src/xercesc/parsers/SAX2XMLReaderImpl.cpp:500:22
> +```
> +Upstream: https://github.com/apache/xerces-c/commit/1bdf6d8ba878c1fe1d779824be70001fc0bebd2c
> +
> +Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> +
> +---
> + .../MsgLoaders/InMemory/InMemMsgLoader.cpp    | 31 ++++++++++++++-----
> + 1 file changed, 23 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/xercesc/util/MsgLoaders/InMemory/InMemMsgLoader.cpp b/src/xercesc/util/MsgLoaders/InMemory/InMemMsgLoader.cpp
> +index cda103226..6971fde96 100644
> +--- a/src/xercesc/util/MsgLoaders/InMemory/InMemMsgLoader.cpp
> ++++ b/src/xercesc/util/MsgLoaders/InMemory/InMemMsgLoader.cpp
> +@@ -25,6 +25,7 @@
> + // ---------------------------------------------------------------------------
> + #include <xercesc/util/BitOps.hpp>
> + #include <xercesc/util/PlatformUtils.hpp>
> ++#include <xercesc/util/TranscodingException.hpp>
> + #include <xercesc/util/XMLMsgLoader.hpp>
> + #include <xercesc/util/XMLString.hpp>
> + #include <xercesc/util/XMLUni.hpp>
> +@@ -153,14 +154,28 @@ bool InMemMsgLoader::loadMsg(const  XMLMsgLoader::XMLMsgId  msgToLoad
> +     XMLCh* tmp4 = 0;
> +
> +     bool bRet = false;
> +-    if (repText1)
> +-        tmp1 = XMLString::transcode(repText1, manager);
> +-    if (repText2)
> +-        tmp2 = XMLString::transcode(repText2, manager);
> +-    if (repText3)
> +-        tmp3 = XMLString::transcode(repText3, manager);
> +-    if (repText4)
> +-        tmp4 = XMLString::transcode(repText4, manager);
> ++    try
> ++    {
> ++        if (repText1)
> ++            tmp1 = XMLString::transcode(repText1, manager);
> ++        if (repText2)
> ++            tmp2 = XMLString::transcode(repText2, manager);
> ++        if (repText3)
> ++            tmp3 = XMLString::transcode(repText3, manager);
> ++        if (repText4)
> ++            tmp4 = XMLString::transcode(repText4, manager);
> ++    }
> ++    catch( const TranscodingException& )
> ++    {
> ++        if (tmp1)
> ++            manager->deallocate(tmp1);
> ++        if (tmp2)
> ++            manager->deallocate(tmp2);
> ++        if (tmp3)
> ++            manager->deallocate(tmp3);
> ++        // Note: tmp4 cannot leak
> ++        throw;
> ++    }
> +
> +     bRet = loadMsg(msgToLoad, toFill, maxChars, tmp1, tmp2, tmp3, tmp4, manager);
> +
> +--
> +2.17.1
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

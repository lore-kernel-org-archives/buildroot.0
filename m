Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B70FD88C3
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD3726081F;
	Tue, 10 Mar 2026 22:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ItRWOjbnE58r; Tue, 10 Mar 2026 22:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B16960E4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773180402;
	bh=B57kVAlzBdKzzMdS3C9YhU7HeAMVt/1jhwjAbEmX8gw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=REIb9QpxyeB96VVD2Fnwsj3vxUc8/rLS4VTIdtrj+4VS2wW3dcNqsBEw20q5jigfe
	 xuFfI3GogImCXE4+7wehUuWAIsZbFJcTthDIvd7i0QNCvfu15ZC4swdn9uk8jc2QEB
	 r285zPIJOfnb8VT8frhO0QwL3YqJ6RscS2uiHgNDagp5x2Wg2ZYlaXyW4K7u4a+mZ1
	 dTulfl7qlRLGQKKvOW6Zq/HLOYBaB5USLVmQYiWqtlQrAjNDHpUuiteSN9lWmbIm3m
	 N5Jk+mk7wPQ00jiGiBPchPDO4f62tK12Ba+J50tiUesBbglBujHgby3/yWo5dTZN9t
	 JeTKvHE+adi9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B16960E4B;
	Tue, 10 Mar 2026 22:06:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D50933A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72EAC60E4B
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8e562Xp0r0-r for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:06:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0B4D60E1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0B4D60E1C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0B4D60E1C
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:06:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4F57113F89A;
 Tue, 10 Mar 2026 23:06:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Mar 2026 23:06:34 +0100
MIME-Version: 1.0
Date: Tue, 10 Mar 2026 23:06:34 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
In-Reply-To: <20260310104354.2488409-2-buildroot@heine.tech>
References: <20260310104354.2488409-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.13
Message-ID: <8132735f81ccc3ddee89d11453ca1325@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773180397;
 bh=dOIOCctmZIdahcJmQkKpZdaVoRqsvgfNaHK/keF8dYs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CWCAP4sT1ojc9NwTAKl63FRXprAyxovIWsGWRgYjAphY9XgYV2mUL4JVdGh9LDp9O
 e0to34G9Rhly2M13W++WOiDgqdYF0QE554eRv26WGSfOy06AdIh0OrQ22bRsSINH9l
 83ye2r9K1W7u1xQr1Qcs3qp55MKQAdtJ3dccnvel9jFKeRqnqWIbyOjrEqjBv/4ZgC
 c3U6qkM+W9FIHM1iNPY9ds5R1hpctgPATymmnccA1ygC99chnDWgfW3vj9K2RqQ7zb
 J+aN2qlvud8SHtJpKIoTAXNaqK+1zcF0Kyesi6lzwsarSiukn04AmlRvBX34BfQToI
 WGEhzQspwc5fg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CWCAP4sT
Subject: Re: [Buildroot] [PATCH v2 1/2] package/{python-}protobuf: bump to
 version 34.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/03/2026 11:43, Michael Nosthoff via buildroot wrote:
> - contains breaking changes, hence python major version is bumped to 7.
> 
> Changelog:
> https://github.com/protocolbuffers/protobuf/releases/tag/v34.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

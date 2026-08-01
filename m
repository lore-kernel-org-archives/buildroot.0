Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B271C55172
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 10:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F274B60B5D;
	Sat,  1 Aug 2026 10:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghjXwd8DGTdR; Sat,  1 Aug 2026 10:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D1A360A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785579411;
	bh=VbavPJirZZzgfOPkSJ287x4upVMa2FeSIJRUfD1KmZg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W8W71i0dxrjNcwQEDeEo3K8PFMeXSxK2NsFCWOY5AlfoPzlRGZILnDeB5CV2YjpXa
	 24+wZgHb5dvTrO5Xytxl/DbNO/Y9NM7TyxBQn6AYkoTqn9pNAgULN55XWi9/jnTpbz
	 gqUg1qtIVpS96KIciV4dp34hoqUNnAWge72vnsxjrt8Bs71ZZ++ilF1DqYFri3mlZc
	 qPnYA47m2uXsiXPqJWcKHIW+8JhTthwML82UVwchXTvQXcHbabHBrIU/daG1rjfYaD
	 vrB5ZMvw1B/Gr0lGBEDO/wZYXLvIW/SoE7iMXeqb+PKuDF/Mbzd86hKxIE5PFBCqKt
	 CvXdWbY5EhQ+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D1A360A4D;
	Sat,  1 Aug 2026 10:16:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7C1D1389
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 10:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE1AD40767
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 10:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5EjOi_Ul5JM for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 10:16:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6F64406FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6F64406FA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6F64406FA
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 10:16:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5743413F8B9;
 Sat,  1 Aug 2026 12:16:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Aug 2026 12:16:45 +0200
MIME-Version: 1.0
Date: Sat, 01 Aug 2026 12:16:45 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260801074656.34834-1-bernd@kuhls.net>
References: <20260801074656.34834-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <f29098ebb47f893fabdc5175abd20f65@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785579406;
 bh=zoLZ5KoBwDf34QsgrrJDLeDDsXR/IdBkEsa05Jz6Mss=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=caFsjD6iSEAhOWNz2QxkuTzFIr9p+RlbLAifoFDTpxHMKmWBkXytq+3UU0JXug/xV
 oPyUyBCXQbkHCwiIEpvlC3Y8sKhsD26DRVGs9PoQeLA4vKna5xIKBvMff1XAK4YRzS
 lY72XMKnZ7nYN7NvHKpIo4U24U4k+aKeRhUCQA6ih+q1PxmJuwE+3/MWgsRZkGwI+L
 Wjz9N27jnZmw303GKfTj6mlKryKSmEx6sUany5QJm/UMUG4UmDKo6j9kpoWBcFS8xi
 M1zWBdhu2ScHOTAciSLxZCmJPIrHFDH1MFAyv8VQSyKoz7Iny6yL9pQy6ueMHwZoHU
 yj9Wmd+LnZBxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=caFsjD6i
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 26.3.1
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

On 01/08/2026 09:46, Bernd Kuhls wrote:
> https://github.com/intel/media-driver/releases/tag/intel-media-26.3.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1430FC28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 22:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C430241177;
	Thu, 20 Mar 2025 22:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CvHv0JyG1kdH; Thu, 20 Mar 2025 22:19:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF9C340D89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF9C340D89;
	Thu, 20 Mar 2025 22:19:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B668212F
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CA7940D02
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKr7m7cZZ3Xo for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 22:19:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EB2F740D89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB2F740D89
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB2F740D89
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:19:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2AED113F8A9;
 Thu, 20 Mar 2025 23:19:24 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 20 Mar 2025 23:19:24 +0100
MIME-Version: 1.0
Date: Thu, 20 Mar 2025 23:19:24 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250317215614.3052928-1-james.hilliard1@gmail.com>
References: <20250317215614.3052928-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <00288eab1e3195275c32380d6f6d9501@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742509165;
 bh=0qp0zWqWHAT+xuGJutWF0166OMfoXjcp8H2PcKEosmI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DWbGv75JJEDzEH/xPy6LSu+NT7ejns4hCOHWtNZncjwkjY7tieDSKPMIuqDucAZk/
 tcLk+y+f993FO1+o4yXFdXr5VhAhBLQHlFollAS4wCfNa9T6RHTAYSWsRsca6tFH4r
 XmU/eYi9IsOf3cvD4/u2GwriEHs9CpZNrEIE4Zj2RoGOLmRbjIS5aKCwAlm58jYdqK
 klm/lxVa4JZqOSTOfUEYwVnvH9w3RI4LcevDQyw7O8l9qSXEwgL/zd7F8szbpQx03l
 eI2yo5jRe9wmKX+Mj5q7tZRdIiFelA5WK/L3c2pgHNo8jSVffHG+DiCuGcg5H8EtyM
 aRyOV7Lj1rr6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DWbGv75J
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flit-core: bump to
 version 3.11.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 17/03/2025 22:56, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

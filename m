Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939CFC02193
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 18:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F61F608E0;
	Mon,  3 Feb 2025 18:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmRNay2K3ifY; Mon,  3 Feb 2025 18:02:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70AF86085E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70AF86085E;
	Mon,  3 Feb 2025 18:02:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BEB5185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BC384025E
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pftVQWxOZ_ns for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 18:02:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4942040260
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4942040260
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4942040260
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:02:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 889C42003E0;
 Mon,  3 Feb 2025 19:02:07 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:47700])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Feb 2025 19:02:07 +0100
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 19:02:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <Z5+uSq3r7fZjUN9x@waldemar-brodkorb.de>
References: <Z5+uSq3r7fZjUN9x@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <b61ad05bb1a58c931c4fbfe490ba298b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738605728;
 bh=a0lDKMb6vWAvU+iDDdirYXXrGX8cHAC8GV7T5Bmp900=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Nal8TcGC66ZbleJYPX5qZjY488Zx+sbozzkNBTY3HHX59y7Lmjp89tCtBjpYGsqby
 hYf/mh/Rjf9cOBGuK66XBSav57cEshXHHH5PwfsWgNBynKog3uLmvhLrcRPmPeP8Nl
 H8r/FhwWfLtC/pNRXMmpURbXp5oyIMMD6SC9gkabHcNX+G36JXiLpdgXU06/+AvDaj
 HpgjknP1MFf4+EwGT7bDEPAgL2LQIcRUv/zfFNcxEsGETy//iSGI23CClP7GcfYgll
 PGTRX3AFyMBqlitJ7BEHjKLEu3JlasgrsXYD0e2TLph+lV4Tbz/Z6iwe9XER1Fb9gD
 cds0x4wUiF3kA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Nal8TcGC
Subject: Re: [Buildroot] [PATCH] package/openldap: update to 2.5.19
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

On 02/02/2025 18:41, Waldemar Brodkorb wrote:
> See here for a changelog:
> https://www.openldap.org/software/release/changes_lts.html
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

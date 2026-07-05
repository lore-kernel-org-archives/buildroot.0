Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F29C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 09:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81B0180E49;
	Sun,  5 Jul 2026 09:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCzjf4hxQrYG; Sun,  5 Jul 2026 09:52:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B612080E41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783245124;
	bh=7owEJOikQiE9WMpAetyq99ESvVIlWBcTyQl6K0j1g6s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rPxAf2UzTOmuE5vG/gDABucJy4W/PklcX/5NSHhm2+dq7Tby0ReT+Ya3EtJf8qBP0
	 t3NqLnIYaOv9r1HCrYWxUAoYfl79saMi9mq2/EAjC6EhAQ8n746gjXBr5qSh7UaWXq
	 e20tMfS204AVyneYcLKUE+ZZyaTdr4CnncWdAWuH1Nwkpl2kwy/BBqWiVJXaQzc9VS
	 lY2oxHeCH2DQReSwUpu7xXusuBGHWf8H/bGjnebIGjMjM9MC5xCT3hBwJJCrFOVLYj
	 ZCLA4nnBvGo4eqS0iz3vmM0ofoJJR0ipWSgEa/BlUW2z9GG5H2icCJOCHTS6fGH7/Z
	 p6ZEO3yWQavKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B612080E41;
	Sun,  5 Jul 2026 09:52:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3895F2
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B53C380E41
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HyUh8eBlDivk for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 09:52:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B495780E3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B495780E3D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B495780E3D
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:52:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DD9792003DA;
 Sun,  5 Jul 2026 11:51:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jul 2026 11:51:59 +0200
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 11:51:59 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260626195937.49027-1-thomas.perale@mind.be>
References: <20260626195937.49027-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.16
Message-ID: <b0a2bdc441d6466ea68ea416da9833d9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783245121;
 bh=56fSiie2do1AlXLCc0i+eiGz5ddBTeDTXm4GRGPqPQY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P5jrtvpXfhb6HqZu+jze5bsjEyNxRqa9Wi2Lp5piz6v8EDgDYY2u1kRpQEBc/inhV
 9BNalLkE18TBEAxrHDpIJk5mITqI9PwCTtyl27on+uskmGBVwTCbZuGLiXXezQBROU
 46wz4BYjdMyjeTV9HNMVEYNimda42Y7S4MzJ/huIM/GoclPnEQ5nl0IIogl7Dfd5dm
 ex6ghSkfcBVKhbyPb/gF+M5didX7zCDa+CmsNm4sF8947GuzdlLXLfIZQ1dzUx5TuO
 /szEUq9gtmfq+NUCbbkVLn/xraL9XUWi/zUEtBtIh28oFZpmI/SgLdXf0E696QX2zA
 3DmgX6VbkQ5Xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P5jrtvpX
Subject: Re: [Buildroot] [PATCH 1/1] package/avahi: upstream patch for
 CVE-2026-34933
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

On 26/06/2026 21:59, Thomas Perale via buildroot wrote:
> This fixes the following vulnerability:
> 
> - CVE-2026-34933:
>     Avahi is a system which facilitates service discovery on a local
>     network via the mDNS/DNS-SD protocol suite. Prior to version 
> 0.9-rc4,
>     any unprivileged local user can crash avahi-daemon by sending a 
> single
>     D-Bus method call with conflicting publish flags. This issue has 
> been
>     patched in version 0.9-rc4.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-34933
>   - 
> https://github.com/avahi/avahi/commit/0be89b6bb5c3983837b5e0febcbbbf452ecf7675
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

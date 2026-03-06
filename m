Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BC6FCC04F
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 17:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C761041DFB;
	Fri,  6 Mar 2026 17:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6onFls4AsCl; Fri,  6 Mar 2026 17:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0465D41DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772819491;
	bh=eMjy7Zr2BbTRjocEtOBagTbz/DDRTCdV7w6rnl0U1ew=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fbzJgOYznMsnXcJvflD6PfbL0zq/YwgcMZS2+1VHUYlBac/F+yHsZdkYPy86pifVr
	 ksVBrG4sSjvegp3b/PcCSS8k/RD3v41xPB/hWItalxHWp0y13nUW86D6F0/nzFc/H6
	 nAfcTZqMhVUD6mJBSS0O+tDZ1In+TtgjUhIFcG/S2K/B809CUpiX8Prt8E1WSOhbsv
	 hWrNoV8ztSwBZiU8xvhdjnrWYw2zi86MKd6CvnEdqNN7cPGKB/Ms5dbWikZ1WP/PdK
	 TuASR6CuI8rzANyL2oyqRjtl6YkmnlhUHAA/XCVYkWwC/78xKvw0NOqH+BTSNwz5zT
	 IEH1VQJGIYwcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0465D41DF0;
	Fri,  6 Mar 2026 17:51:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35300223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 17:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2673D40663
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 17:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aw5EeaPXJBvd for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 17:51:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3CE84065E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3CE84065E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3CE84065E
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 17:51:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 49E6613F86E;
 Fri,  6 Mar 2026 18:51:24 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Mar 2026 18:51:24 +0100
MIME-Version: 1.0
Date: Fri, 06 Mar 2026 18:51:24 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260304190435.3483370-1-bernd@kuhls.net>
References: <20260304190435.3483370-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <81b2f98ad9fcb148f14c349972bacdbe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772819485;
 bh=5DilVOIyAbCMPd/Y3t+h3eUE/H+ctB9jn8Z/CfGmWZw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=s2hD2ky7jsa4jkFBDWI0jfDFS+4F3na0xnEA8k7MRQg57k8Z82WVXKyHiebQRs2vB
 4z+1QBvSm8nCZP5FRzv+3KteZaIoYSeuc8+etQhDIKnoqqj5KgHBI0iqex7hdAVSM2
 b2c7+MLF3W7JdLoz4+maBnxGL4wb/2vTrlPlJZ36zouI5eAt+ArH4rY3/CTXjIB6QX
 GF7ahHGBPxUKiTNYEK+V0Y4FrYynerv+3whb2H/sdNTsGutf/QEp4VsPq0sUraqyfr
 a4IuqjYcVh4+ROisDYLkgoYg1IlTkUbpdl7+Gq5jO6rnEa6wxUkQFesBY/Brlq8KCr
 ZOpvxXVlwClcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=s2hD2ky7
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: bump version
 to 20260227
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

On 04/03/2026 20:04, Bernd Kuhls wrote:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260227
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

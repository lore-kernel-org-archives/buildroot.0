Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74929CD98CE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AB2041822;
	Mon, 15 Jun 2026 20:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKpcvDzDX1cm; Mon, 15 Jun 2026 20:54:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AF77407AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781556872;
	bh=eBjHNj5wGY7MjdvLOniTo3YQpMX3JFc30TRx/5xhv7A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E2xJa7oKw76XsYDjGOYlu06SUVJnvSoX5N/FRQCh5iAh/e0PKzFa3MeNlSN4QD3yT
	 YnBR+Bk0Y7XL0h7K/LP6Q44DOvg2E6TWJopLVfGtbxl4O2Cfp53w2fY6XCIukF0+Su
	 xX0NW0SAQmCWJgXOe6HzXQpFd0N62wMvuTXLu8s1p0JT3Z07Ja+nImMJh1xoMl+ood
	 FnU4rJs95C2mqdrj0jbkpvTBPXVNI+oFblbp1e6jyAGP7N5rIVFHS9vhpvjyW+xwts
	 ugtIGprgrkS25Yg0VjQqp03qMrLV8fGMM1r2jOO9EIc0m+69cgUa/SnffyC1VMM/Jf
	 YuBo2EXCjoecA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AF77407AE;
	Mon, 15 Jun 2026 20:54:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF43F2F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B141382065
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ic4rwzsyFbiy for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:54:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3A5E82056
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3A5E82056
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3A5E82056
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:54:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E275A13F854;
 Mon, 15 Jun 2026 22:54:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 15 Jun 2026 22:54:26 +0200
MIME-Version: 1.0
Date: Mon, 15 Jun 2026 22:54:26 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260615202534.1281579-1-peter@korsgaard.com>
References: <20260615202534.1281579-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <1b28122fd20ea52b5d67f4fa4c353266@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781556868;
 bh=xLqsWmqQQTPLbbtf708JjwAzCFmukrlclgjU5bUhZ7I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cQTYMgscwxlVjiTF4RtPOSD7rmdbU60PEZgqsqwraNGtaZnsdkma8n8b3MmlVYdDc
 rIC16tmvJAR3aif2BWlOIIBu0+F88dXQD/UgPL/53KGOM8E/VG4D+zQAg+fBR6c7tq
 y/bBN2Ct6eHeM3epVJGmLdEq2Saewe54VMIL8Jqo2rnDwGV4sDDqIZZp4Bsk2Kns5k
 9HGlVUwMxS392m4ple4Lj/UPPzVTqGadWPSEmsJQnyBMfTfJQmIECJPzprbkeD5pc3
 LjCgZZqbE3VBIjI7/AfQzw1kT2XYtBNkNe7iYUmLbpCL4wtfj+2xVqL3YE+V/1rJxs
 YhuGB1RgOGvIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cQTYMgsc
Subject: Re: [Buildroot] [PATCH] boot/shim: add patch to fix builds with -O3
 / -Ofast
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

On 15/06/2026 22:25, Peter Korsgaard wrote:
> Fixes:
> https://autobuild.buildroot.net/results/c6ad52a048ba030bb1adc3ee1aeb69ef880cbdad/
> https://autobuild.buildroot.net/results/136d1afc2ecacea6a4e12b915073e3eaf5c8ca01/
> https://autobuild.buildroot.net/results/a3f293371f6bd0125dc7baa5afb64373e4383f4f/
> 
> Shim contains an embedded copy of OpenSSL.  Depending on the 
> optimization
> level, an error is triggered from make_kn():
> 
> In function 'make_kn',
>     inlined from 'make_kn' at crypto/cmac/cmac.c:81:13,
>     inlined from 'CMAC_Init' at crypto/cmac/cmac.c:205:9:
> crypto/cmac/cmac.c:92:20: error: writing 1 byte into a region of size 0 
> [-Werror=stringop-overflow=]
>    92 |         k1[bl - 1] ^= bl == 16 ? 0x87 : 0x1b;
>       |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
> crypto/cmac/cmac.c: In function 'CMAC_Init':
> crypto/cmac/cmac.c:69:19: note: at offset 2147483647 into destination 
> object 'k1' of size 32
>    69 |     unsigned char k1[EVP_MAX_BLOCK_LENGTH];
>       |                   ^~
> 
> Fix it by including a patch submitted upstream which backports an 
> upstream
> OpenSSL change to workaround this.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

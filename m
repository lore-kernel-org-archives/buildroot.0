Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEA3CD1283
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 09:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B100812B8;
	Mon,  1 Apr 2024 09:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftdGH7A-NsVD; Mon,  1 Apr 2024 09:34:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87E0B8132D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87E0B8132D;
	Mon,  1 Apr 2024 09:34:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D6581BF38A
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 09:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4ABE760859
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 09:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFNnJRjc6B24 for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 09:34:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06EAC60856
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06EAC60856
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06EAC60856
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 09:34:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B5F2213F879;
 Mon,  1 Apr 2024 11:34:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 11:34:42 +0200
Date: Mon, 1 Apr 2024 11:34:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <Zgp_stk6lBnJJSUZ@landeda>
References: <20240206225928.2290100-1-thomas.petazzoni@bootlin.com>
 <d486cffd-3faa-465a-a966-08809329c87f@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d486cffd-3faa-465a-a966-08809329c87f@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711964089;
 bh=lG7hkKOso5paL/mxyXmTdpX6FZKUXyeOUdVKy+qEVis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CS8MA73aKXRUpJUqXor3/DanCRll2VNpu/Y8YtKRiThDbHObmYlhzxedd6wgoSjH0
 o/g8EPXejRWuv97MSFWzGmEYBMiw5bQYxNE6NfcJx0VcAsL72dTs0cRovzhTzaj9xd
 zTmP1op7gz1ETtKKUEbM7FkdqEUs65Y3NpH1q/RfTGwrVwWSAk6/XuBskcJWQjkMMO
 FQgeFNn1pJNDEBJDOz+WlkYnUPWmRCAg8i9Co8zs0ypEQM+gCGH5BlKU1T9yGbBX7c
 jK8A7Q99LfdE/ZIeHXo/rDxB4W89iI7TziSGz6oQlUGDQ1ebmVN9gP59XoL3d+2R/P
 anBarfLXtjHMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CS8MA73a
Subject: Re: [Buildroot] [PATCH] package/python3: add option to disable
 ensurepip
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

On 2024-02-07 10:58 +0100, Marcus Hoffmann via buildroot spake thusly:
> On 06.02.24 23:59, Thomas Petazzoni via buildroot wrote:
> > This module takes 2.1 MB and is not needed in most Python
> > installations.
> Thanks a lot for this patch after my suggestion! Patch looks good, but given
> the unfortunate "non-cooperative upstream", I still wonder if this wouldn't
> be easier to maintain if we just remove the installed module after the fact
> with a post install hook? I suppose a similar thing could be done for the
> other optional modules as well with the new py_cv_module_XYZ, which disables
> the native part but still requires patching makefile/configure.ac for not
> installing the python lib part.

I agree: it would be better to remove that as a post-install hook.

Patch markes as changes-requested.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

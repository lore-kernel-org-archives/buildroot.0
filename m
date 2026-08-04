Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828B9C561E6
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 19:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F57D6078B;
	Tue,  4 Aug 2026 19:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmGiEea4hGIu; Tue,  4 Aug 2026 19:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD26960782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785871739;
	bh=7Yq9SdZnTryBg6vFs/5GcopcGEQG2cs2vcdoMCKF6QA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hoBJMKDJBPxzbjkGheZ6b/TZDTvV8L+RS7mVyyZxgEg/4LCbmHRbJFMAXpA0mtvUd
	 ysQcbaqYGl/iHOuN3D3ZuLHg38E7r80JQZ6U8pORUETzp/GlAWngcjHJ9qB1+s1h45
	 BX+3pcyKRCatnyXQu0Xdmvnm/zNIiBpdwp2CMa7K+2HRZYpjW9oO8Zu5ucJgwQNSUn
	 WZg8PDSY+fg4Fm27iIAD/OkE4xQ/fAJuqE9ymL7TD4hCOAGDP6N4DfkxwXhEeNhbGr
	 Xhqyyw/aRr5Amm/NZDs0f9ZNpiXD9mv+ODcFqPEqH7pthN9wH7Lg6jkFvYgVW+7bun
	 riBAsyLBlkcsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD26960782;
	Tue,  4 Aug 2026 19:28:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22DE0296
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 19:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1550A400B8
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 19:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9J5X3ZDWJo9B for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 19:28:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 41F42400AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41F42400AD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41F42400AD
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 19:28:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 42CC46013E;
 Tue,  4 Aug 2026 21:28:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Aug 2026 21:28:53 +0200
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 21:28:53 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260726160724.3628271-1-bernd@kuhls.net>
References: <20260726160724.3628271-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <7b5f1924602e976f50e9628a1997c4b3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785871735;
 bh=AC/QWRUfNi/fVMYAvsgNncwAsp9ZR7O2ToJ8jDJcv/E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fF/DH9V8cHBE178GpEvPuth2+S1s60KkKCCMNvPVmBRAep7LiJpFjvvKQakEXLUtU
 MtPGSfi16/qdyDklae4vVGWgLV+cc5ECA8ArzbG6unTMd5WyFTqDqT4TriRdmzDHNw
 Wjj6GfAuBOCYvS0K7qOLEJxr+GLECgkrTzet6gG4ljzHlEH5PT308NSYoSGiAEKxv9
 O/diEED6Z/tMEOckiXENYuEhwc/97N19HHVvoOpdQiTvf6Dy+oHD7smFLz/Q/eGYLy
 aPHer8QSsPMHARdhm+2Afi1ePFvwsOhohGqwTlvaKlg6xAcH64lLtzv4owY0Q/6qrC
 +tpH5Hxnj+QDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fF/DH9V8
Subject: Re: [Buildroot] [PATCH 1/1] package/gdb: remove version 14.x
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

On 26/07/2026 18:07, Bernd Kuhls wrote:
> Now that gdb 17.x has been added[1], and gdb 16.x made the default[2],
> let's remove support for gdb 14.x.
> 
> Aside from the usual removal, we also simplify things a bit as GDB
> 14.x was the last version not depending on gcc >= 9.x. As it is now a
> mandatory dependency we move it outside the choice.
> 
> [1] 4868e0dd621013ff3d3b6e81a86d0d981ae21646
> [2] 23e70547ca1746c638a4e327548eefeb205faeff
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

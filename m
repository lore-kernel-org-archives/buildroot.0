Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BDFD39013
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 20:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9705B83D51;
	Wed, 14 Jan 2026 20:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htGN9OLW-KOI; Wed, 14 Jan 2026 20:23:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB21A813EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768422227;
	bh=/RbXgvaqa10INqAsbs/uq0HTgcuAvvgDaKYeppbRXns=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NHAPYGXg963kWF+P1i7N7KHcsRRifyWlXyFiPm4lmjefqPUy2xNAH4TrDtTX0r0Ah
	 8q3Kndl9lsHczVVs8IkxzpunEzpqZBi1M+K0SixOWCjiZZnuVwhdzhdu8ZjbkinMTT
	 YXSROaujjLW7NEa9b0iLS0Ou4T6i6e/uEmb9pImgQz/vRbKj44lez6NUiY6+LLQj27
	 T7Hvw9jFDM5Rppg+fRrYRsiqgHku5stah5Eusb5jcrrg3vYU9dE/fgtquCCRS1TSm7
	 JURiWlOpgBZekClmpEsyhfYZqK6B4cu1v/rxYJYet/tPE6LUwSKFKN1e9vg15Ytcoj
	 0WY0uWmbwA3sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB21A813EE;
	Wed, 14 Jan 2026 20:23:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FE58232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 102F9409F7
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wG1P1L2u_ij for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 20:23:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3886A409F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3886A409F5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3886A409F5
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:23:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 91A0AB00572;
 Wed, 14 Jan 2026 21:23:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 14 Jan 2026 21:23:41 +0100
MIME-Version: 1.0
Date: Wed, 14 Jan 2026 21:23:41 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260112212453.4102684-1-bernd@kuhls.net>
References: <20260112212453.4102684-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <2b5dddb5c61895a4fa7f4fa67de140d2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768422222;
 bh=5g0uyia1Es7QJ7FBKQBrvd2sPuG4/T0qh8BPeTg6Ta8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i4d+ADzSMblEp8OXpZYMEhoamO3h3/XVJmjgTaE0HhevzpFCt7u9Gb96l8pv3WGii
 okVAsIl/xNSJZ80MAOelpaZb56tKbLabf0et8UNBm36/QI6eXouKvaaXMEh9T7MOVx
 v7saMiP5fBHxpCHoCRDvv7B5HsgiFXojbVWcLwYf+/7Rx2i7xJ67g3YRdcq2rkubHx
 F8zjXeGJnm+75l7VhAKFeCUdI4vEgjtLouXVjtn+XKYaNBobvYtFOcYRfGxfpXUKLP
 3FfkizNWD2HbtANPcxRnNyzgGU2O1nv8QRVU4mxC5qj3a4/kqzMc3b81N/U+HDeWa6
 XtOhFf6IkvVVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i4d+ADzS
Subject: Re: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 25.4
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

On 12/01/2026 22:24, Bernd Kuhls wrote:
> https://stellarium.org/release/2025/12/29/stellarium-25.4.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

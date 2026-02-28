Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD96FEE4F0
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 20:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75A0060FBC;
	Sat, 28 Feb 2026 20:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNLxQhvi9J2P; Sat, 28 Feb 2026 20:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F39360FC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772311877;
	bh=+0Vocm6yKCNqzp32nA6Fk2IlTWXmqKx129mkBN39UU8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OVewG4mByknUvQP+V+2gj2zMKsR0fw1twWaPyX1lczEyNReHO8/uGQmWGBbfps89X
	 XMOSZkJvNlRvu+1pILgyJ3NU/ZhUpJbVKVjXOGj8vH2BycU9irXewsDcnEimcrKX0I
	 0mvaE3LwcC4UjLzvSC+jkRBP5tDSwGBgzOZhSCsywfS3mQEBUPWzHT3UkZ/UotHtKa
	 Dm9HeA22Y6CURHMbmwyGZMdXevDeIHtRoSfptz+YsJzEQF3uOgWjSntzvOG711o0x5
	 Tnv2Kii+NUvt084orJDlhtiTGXk6nTtkDGSFyoB2zFi6jPdgQcKgW60yeHjG3RXuJL
	 9m8NC5M129/tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F39360FC0;
	Sat, 28 Feb 2026 20:51:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04C791EB
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA65441678
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5CzdUCnUsUj for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 20:51:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EAFBE4166D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAFBE4166D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAFBE4166D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:51:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6E6E0B00535;
 Sat, 28 Feb 2026 21:51:10 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 21:51:10 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 21:51:10 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20260228201547.84699-1-thomas.perale@mind.be>
References: <20260228201547.84699-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <d6e061cbe4b8d14d857bc736abc5e961@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772311872;
 bh=UwLhWSMicD4zyM/oLZdCe7WmKzE6c8/kQsozzAKHLGU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CoWs+HjITk+LguEglgEG7XehL5XXbVpoBV03yqopKhQmTFy3cWHdOGJjwFDoQv9pX
 1K3RgvhiAwesV2G6PvzVNXlUNS/tRnkg2Nl5DUHN5Ebc6F2CV3RXsDnYYGNywyKGzr
 xYZBp408viXimOjyB/TUhZHwfz0Mok0beiRaPmHDA/pNDsVC+78usnadBqibD43lE6
 Lv2ifyCSV4UsvRpKmFAwgybf3HQAI7Qjff/McmRNdPF5Kzdg6pgnqGhCgeZD1+rgQ2
 TTb2Cw2/IVwLoQ5FoJpQMZlNjqCBZ0psb0oXge7p06k5sNCjLn1pay7c1uC/NAuoIe
 qQJSBxUubGQyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CoWs+HjI
Subject: Re: [Buildroot] [PATCH] package/mupdf: add patch for CVE-2026-25556
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

On 28/02/2026 21:15, Thomas Perale via buildroot wrote:
> Fixes the following vulnerability:
> 
> - CVE-2026-25556:
>     MuPDF versions 1.23.0 through 1.27.0 contain a double-free
>     vulnerability in fz_fill_pixmap_from_display_list() when an 
> exception
>     occurs during display list rendering. The function accepts a 
> caller-
>     owned fz_pixmap pointer but incorrectly drops the pixmap in its 
> error
>     handling path before rethrowing the exception. Callers (including 
> the
>     barcode decoding path in fz_decode_barcode_from_display_list) also
>     drop the same pixmap in cleanup, resulting in a double-free that 
> can
>     corrupt the heap and crash the process. This issue affects
>     applications that enable and use MuPDF barcode decoding and can be
>     triggered by processing crafted input that causes a rendering-time
>     error while decoding barcodes.
> 
> For more information, see
>   - https://www.cve.org/CVERecord?id=CVE-2026-25556
>   - 
> https://cgit.ghostscript.com/cgi-bin/cgit.cgi/mupdf.git/commit/?id=d4743b6092d513321c23c6f7fe5cff87cde043c1
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

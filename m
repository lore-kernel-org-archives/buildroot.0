Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF367C25B75
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82A6542C2A;
	Fri, 10 May 2024 21:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbN-xF63SnDk; Fri, 10 May 2024 21:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EAF642C32
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EAF642C32;
	Fri, 10 May 2024 21:33:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9DBF1BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C673781EDD
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7FHtEOlySb3 for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:33:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8965C81EA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8965C81EA8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8965C81EA8
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:33:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AB3E240004;
 Fri, 10 May 2024 21:33:30 +0000 (UTC)
Date: Fri, 10 May 2024 23:33:29 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240510233329.149a2e5e@windsurf>
In-Reply-To: <20240307143227.548555-1-fontaine.fabrice@gmail.com>
References: <20240307143227.548555-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715376810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZbLi8yVdP/7CUo4RIOi7Wnb/uf8bwd0U7nAsvmkqH8=;
 b=Y1KAKBlt7TRPxZsjYGV6RMGqEG8aXeOu0YgjTg4xa+V8VNNLt6N3oLXo0uMyaMN5Mawazl
 auJoUq/KiyLCKxn7HlxlZJW4zi8V/v+jGzFvHlq6oYV3lkxT9kWZ1OsPLZBZTLM+jZTvuM
 X96ZbE3jyO3gCglBkpGcsz+8JrHklAEzR87KnIfFtip16t8CpMgbiv6MKHYWb56fYowf0U
 cNhm912Te1YMTkEaMB7rM3kBXoE47gO3xeBqK4tRW1RwaPX9KluIXI895xqG4fBoo5XAON
 F6sODuWH1mcIbzBIVirOfB4W5YsQF5sx6YH/s8tkf7Gj3M/VArZq7Wz+qI3VaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y1KAKBlt
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8189fs: bump to latest git
 commit
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  7 Mar 2024 15:32:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Bump to latest git commit to fix the following powerpc64 build failure
> raised at least since commit 25956b29e4d63f599b9baf7298f69538ba2f22fa
> thanks to
> https://github.com/jwrdegoede/rtl8189ES_linux/commit/c7bf7590bc0d7252005fd0496898ad420a85e1ae:
> 
> In file included from /home/autobuild/autobuild/instance-7/output-1/build/rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786/./include/drv_types.h:30,
>                  from /home/autobuild/autobuild/instance-7/output-1/build/rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786/./core/rtw_cmd.c:17:
> /home/autobuild/autobuild/instance-7/output-1/build/rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786/./include/wifi.h:459:32: error: conflicting types for 'get_ra'; have 'unsigned char *(unsigned char *)'
>   459 | __inline static unsigned char *get_ra(unsigned char *pframe)
>       |                                ^~~~~~
> 
> Fixes: 25956b29e4d63f599b9baf7298f69538ba2f22fa
>  - http://autobuild.buildroot.org/results/83153ed38a583ce2712df9b142ac3fc55a8413e3
>  - http://autobuild.buildroot.org/results/63186c7adb5ecc8b8a16a6ae641ecfb9c03478bd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rtl8189fs/rtl8189fs.hash | 2 +-
>  package/rtl8189fs/rtl8189fs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

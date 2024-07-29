Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D04C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 21:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E885E80D66;
	Mon, 29 Jul 2024 21:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIm4x98XBqdP; Mon, 29 Jul 2024 21:16:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE32480D7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE32480D7B;
	Mon, 29 Jul 2024 21:16:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7669A1BF426
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 21:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63A1840242
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 21:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsKRsw9FP3cM for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 21:16:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 15D5540147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15D5540147
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15D5540147
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 21:16:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F26B1C0003;
 Mon, 29 Jul 2024 21:16:12 +0000 (UTC)
Date: Mon, 29 Jul 2024 23:16:11 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240729231611.2a139925@windsurf>
In-Reply-To: <20240726082919.892543-1-fontaine.fabrice@gmail.com>
References: <20240726082919.892543-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722287772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TQW3i7wubW7hPIetbvekRdPYu6V3VN9m60+Olg8tkAM=;
 b=elC9jTTYbXzNBA6OwSk8XTHqe05zxnSmbzmyYeHg3RqbA4NZQS/AeGSLaYU7NbOFFLkkLl
 q9Alne2sI16ZX+iFKCd3cxf/8dis89njeUyPJKbCJXzQ6z8pBG+WKLIFXWnIU4yzl+sq4Y
 Ph3GDJUgBGgmWoh2dpwJTNy042GPbbgtsPqZGmRCYNom75P0/+MqPTsTP9kMLZkafpjzbB
 wpBLtfqCxO+vHgXbMVS8F0W2YQm77tUVpxFHJJ0MKh+h30r/ulAQp6Vggns05Ij4mMZvvN
 d9UxD82Sy+YWIdtFqD8xOldMGi20LL9dvn4iwmeKt+kLTjxbR7AvJwQdUg5OAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=elC9jTTY
Subject: Re: [Buildroot] [PATCH 1/1] package/liburing: add -D_GNU_SOURCE in
 liburing.pc.in
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Fri, 26 Jul 2024 10:29:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add -D_GNU_SOURCE to CFLAGS as liburing.h doesn't define it anymore
> since bump of liburing to version 2.6 in commit
> da45ae33040a55d9eaa6a05c75c5e7f24fe73cf4 and
> https://github.com/axboe/liburing/commit/c427ed678f39fd144d784f2e970bd8c52f425e14
> resulting in the following musl build failure since the addition of
> libdex in commit 70319b47f646f74f407ed3355baf5b581a10518a:
> 
> In file included from ../src/dex-uring-aio-backend.c:29:
> /home/autobuild/autobuild/instance-7/output-1/host/mips-buildroot-linux-musl/sysroot/usr/include/liburing.h:224:39: error: unknown type name 'cpu_set_t'
>   224 |                                 const cpu_set_t *mask);
>       |                                       ^~~~~~~~~
> /home/autobuild/autobuild/instance-7/output-1/host/mips-buildroot-linux-musl/sysroot/usr/include/liburing.h:1212:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
>  1212 |                                        int fd, loff_t len)
>       |                                                ^~~~~~
>       |                                                off_t
> 
> Fixes: 70319b47f646f74f407ed3355baf5b581a10518a
>  - http://autobuild.buildroot.org/results/276646bf224d5927cf0311cf978571a7f8774116
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ing.pc.in-add-D_GNU_SOuRCE-to-Cflags.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/liburing/0001-liburing.pc.in-add-D_GNU_SOuRCE-to-Cflags.patch

Your patch has been applied upstream, so I updated the Upstream: tag to
point to the upstream commit, and applied. Thanks a lot for your work
on this topic!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24596C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 16:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6C2041946;
	Thu, 29 Feb 2024 16:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYUwxqcDDYyZ; Thu, 29 Feb 2024 16:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A66A441930
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A66A441930;
	Thu, 29 Feb 2024 16:28:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E578A1BF387
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 16:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2BA582A0B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 16:07:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahNGumIi_7Bk for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 16:07:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E256829B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E256829B1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E256829B1
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 16:07:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 553D4C0011;
 Thu, 29 Feb 2024 16:07:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfiwt-004pey-2D;
 Thu, 29 Feb 2024 17:07:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240228174721.1141838-1-fontaine.fabrice@gmail.com>
Date: Thu, 29 Feb 2024 17:07:55 +0100
In-Reply-To: <20240228174721.1141838-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 28 Feb 2024 18:47:21 +0100")
Message-ID: <878r33dzj8.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: fix libjpeg build
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libheif raises the following build failure with libjpeg since bump to
 > version 1.17.5 in commit 5714126edac88e3adc043a482b262b319a907dd3 and
 > https://github.com/strukturag/libheif/commit/ebd13a20b8b7f1964939642b08b662ef7e483f39

 > /home/buildroot/autobuild/instance-3/output-1/build/libheif-1.17.5/libheif/plugins/encoder_jpeg.cc:
 > In function 'heif_error jpeg_encode_image(void*, const heif_image*,
 > heif_image_input_class)':
 > /home/buildroot/autobuild/instance-3/output-1/build/libheif-1.17.5/libheif/plugins/encoder_jpeg.cc:366:37:
 > error: invalid conversion from 'long unsigned int*' to 'size_t*' {aka
 > 'unsigned int*'} [-fpermissive]
 >   366 |   jpeg_mem_dest(&cinfo, &outbuffer, &outlength);
 >       |                                     ^~~~~~~~~~
 >       |                                     |
 >       |                                     long unsigned int*

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8ca909564c8dabe28ad08c96ebbc04b25592e727

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

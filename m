Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AA1C35FE4
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 09:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0506340391;
	Sun, 15 Sep 2024 09:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9bli51CW94y; Sun, 15 Sep 2024 09:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9171F404DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9171F404DB;
	Sun, 15 Sep 2024 09:32:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD6571BF357
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B852781DE1
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bUWx0xJK_hKD for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 09:32:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 368D080F44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 368D080F44
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 368D080F44
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 09:32:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E6B51C0005;
 Sun, 15 Sep 2024 09:32:53 +0000 (UTC)
Date: Sun, 15 Sep 2024 11:32:51 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240915113251.7bb25ab7@windsurf>
In-Reply-To: <20240915045455.1567220-1-roykollensvendsen@gmail.com>
References: <20240915045455.1567220-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726392773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZaSXvjiI0cFaynX3eRznJyGXNGY1eOR9RTD9jzq1yG4=;
 b=MKuvzn4dYDfEh71sxrMNOJk/TNwpeYywZx4DTNGdO3dWP3MhBXuolOfWi1XUy7SHdhiYsk
 LSwW//cY73cuANuUIZ3XTyOU/bnllXTVvVV1/m0buYpUjYc635n7NpWHHl1++0oJE8UNFP
 ICFoe3BhcuhOuqlm7tGIo9BZ7gr8/XEMGFBHNijhVk/zhrRQAvUIjRH/Mjl8GT+R5nDJBB
 gocD0PwczIgyYwe8TlvBB8CmePHXBa+lXKG6juoHfkLmfJEoF3MphhvqxICzx0dcJeEQN0
 u7R4oVhRpHVHZqxVTb251wTcCF0LtgF78mgwmo5Yyhzmz4w7y5ZRYYPcqXt2Ig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MKuvzn4d
Subject: Re: [Buildroot] [PATCH v5] package/dlib: new package
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

On Sun, 15 Sep 2024 06:54:53 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
> Changes v4 -> v5:
>   - drop all sub-options, and instead rely on automatic dependencies  (suggested by Thomas)
>   - sort the ifeq's
>   - add entry in the DEVELOPERS file as part of the patch adding the package  (suggested by Thomas)
>   - convert 'OR' to lowercase in DLIB_LICENSES
>   - use the most common patterns for comments in hash-files

Thanks for this v5 that we have applied. I just have one comment below.

> +DLIB_LICENSE = \
> +	BSD-3-Clause (kissfft, pybind11) \
> +	BSL-1.0 (dlib, tools) \
> +	CC0-1.0 (examples) \
> +	libpng-2.0 (libpng) \
> +	MIT or CC0-1.0 (JoinPaths.cmake)

Since some of us are grouped in a Buildroot Hackathon this week-end, we
had a discussion about licenses. Two different aspects were discussed:

- Should we list all licenses, or only the licenses of things that
  really go into the target? For example above you list libpng-2.0 in
  fact we never use the bundled libpng code. You list MIT or CC0-1.0
  for JoinPaths.cmake but that never goes to the target. Or the
  pybind11 code under BSD-3-Clause is most likely never built with your
  current packaging of dlib.

  It looks like the consensus was that <pkg>_LICENSE should only list
  the licenses of things that really go into the target. But that
  semantic should be discussed and clarified in our documentation.

  An issue that was raised was about licensing of the SDK, if the SDK
  is distributed, but it looks like the consensus was that this is less
  "relevant" than what goes on the target, and for the SDK, sharing the
  full source code of everything ensures that all license texts are
  provided.

- Should we list all the licenses of "integrated code" or only the
  main, final license. For example here there's some BSD-3-Clause code
  that's integrated, but the final license chosen by the dlib
  maintainers is BSL-1.0.

  It looks like the consensus was that <pkg>_LICENSE should probably
  only list licenses the "main" license, for example BSL-1.0 in this
  case.

I'm not really sure how to move forward with these topics though.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

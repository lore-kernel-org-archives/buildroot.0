Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8392DD10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EB8C6066D;
	Sat, 26 Oct 2024 14:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7o2XGLfrh6Gc; Sat, 26 Oct 2024 14:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61E3260621
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61E3260621;
	Sat, 26 Oct 2024 14:43:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C75B72318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9218605D1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92VUWGhmEhfN for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:43:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 973ED60621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 973ED60621
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 973ED60621
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:43:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61FE4E0002;
 Sat, 26 Oct 2024 14:43:06 +0000 (UTC)
Date: Sat, 26 Oct 2024 16:43:05 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Bart Van Severen <bart.vanseveren@barco.com>
Message-ID: <20241026164305.34881a98@windsurf>
In-Reply-To: <20240920062014.132862-2-thomas@devoogdt.com>
References: <20240920062014.132862-1-thomas@devoogdt.com>
 <20240920062014.132862-2-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729953786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uh0IU9TLeQkpmOyOyeZpUeWX0lXPxlC4dsmXZOmDMl8=;
 b=YSRN1s3Z0zB0uy4L6mGyCQWbXN8AMJjPADdl6HDFaxQB4P02FeXr8t2Ib1y75bjLnZ7Dhe
 5lZULYcweIWOyR/idlLdMxwslvBRf7ZkDhDXFcF2uI2AVH3+m55w5KY1EGYMQzT+ABHvi2
 kRTcZHan4X4orAJohSNMmY3u2WAnVT1T9EhUdPHl2d9Uct1URkhIErHUCJI5ML1NLXBQEd
 PaAjBniJTkybJ5Eq289N4GM/mRYmW3SOLjOv8lHzwqiqJhnMh5qjrOl1EK+VYZPbMiqKK0
 ibGvqbEPdMqnP8qXNtQNISC6+a+VosR2zo4SqWYcR8rXuhLfaM4+k3oVh3g6qA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YSRN1s3Z
Subject: Re: [Buildroot] [PATCH v1 2/2] package/libwebsockets: fix
 LWS_MAX_SMP when BR2_TOOLCHAIN_HAS_THREADS is set
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas/Bart,

On Fri, 20 Sep 2024 08:20:14 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> From: Bart Van Severen <bart.vanseveren@barco.com>
> 
> "If LWS_MAX_SMP=1, then there is no code related to pthreads compiled
>  in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
>  amount of pthread mutex code is built into the library."
> 
> This is a misconception, when unset, LWS_MAX_SMP is actually set to 1,
> so mutexes aren't built in.
> 
> To fix, set it to 32 explicitly when threads are enabled.
> 
> https://libwebsockets.org/lws-api-doc-master/html/md_READMEs_README_8coding.html
> 
> Signed-off-by: Bart Van Severen <bart.vanseveren@barco.com>
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>  package/libwebsockets/libwebsockets.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

The question is then why 32, and not 8, 16, or 64 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641F5D74941
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 21:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2057C60590;
	Tue, 29 Oct 2024 21:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYcjKpUb-WKd; Tue, 29 Oct 2024 21:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38209605DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38209605DD;
	Tue, 29 Oct 2024 21:31:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 353194EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21F4440311
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHalfIJx6xGJ for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 21:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD359401B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD359401B8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD359401B8
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:31:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2291220002;
 Tue, 29 Oct 2024 21:31:09 +0000 (UTC)
Date: Tue, 29 Oct 2024 22:31:09 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20241029223109.414a2a54@windsurf>
In-Reply-To: <20241029204526.904130-2-buildroot@heine.tech>
References: <20241029204526.904130-2-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730237470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CwFyxx+YVaDxZWxkNcglXyezhus8r3jgE+UD+2R+g+U=;
 b=lRt1+SaGO+krXYCRggDI0EstLL1wgKcJwDbuhhKooUrTikQj1X3cmrZmBoT93ZoYbmVWmd
 wdl09fOAYcuHKzq6Qz2l+/vNxGT90JdscbKudDsw05ZYH7SRyxNuePZR3u4bc7/XXDqcq2
 rofNSzDro2SnmJj2Ouxhszg3tf9b+0qBw9IuPNkSBqmO97BA3yCFx5+2zBH7vLlYOo+7zd
 XLn3jsnmxceFKWgxzvCPBNBKHnrWlZpdm9+nm74K6D2039Q0QHVOlJrnk/TXHamt1S2AzD
 Mdq36CJ5FGZj0e/7Q11wbXIXZYjD08R97hXZw68Ba4suOtdVv5GExg8ROXFz7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lRt1+SaG
Subject: Re: [Buildroot] [PATCH] package/boost: update download url
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

Hello Michael,

On Tue, 29 Oct 2024 21:45:25 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> boost moved it's package hosting from jfrog to their own url
> sponsored by the C+++Alliance.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/boost/boost.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for the patch. Is this fixing a build issue (apparently not)? If
not, do you have a link/reference about this change of official
location?

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

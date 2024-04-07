Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A211FCD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 21:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 612C060902;
	Sun,  7 Apr 2024 21:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KcrtBF_FfB-M; Sun,  7 Apr 2024 21:15:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 760E460A4A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 760E460A4A;
	Sun,  7 Apr 2024 21:15:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E914A1BF387
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 21:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D57CA404EE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 21:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-ho6jsH3f_w for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 21:15:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 871EF404E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 871EF404E8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 871EF404E8
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 21:15:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73B5BFF802;
 Sun,  7 Apr 2024 21:15:01 +0000 (UTC)
Date: Sun, 7 Apr 2024 23:15:00 +0200
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <20240407231500.2248bc22@windsurf>
In-Reply-To: <20240404124329.768546-1-thomas.perale@mind.be>
References: <20240404124329.768546-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712524501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C4xMR9Hturdn6fZozaVdcYfWKnNJDEO1oDUwxWLgsNk=;
 b=d3tLcRzvUr70ENb9OOEsPoZHJXhaeLfVQKF1sXXLw0SeJ5J5LZf+j7yyjYoMMHK987SVLM
 RyqAogwRUiQUukfWlxrqn1rOoD1Po58mNEWLrhRCOvCeDkNOU50uDrLKnVm2gj/3FzJloN
 1ijPHD4w/3BkK8+4YqbvpjgqojE0NesTwRSnUtREvpbDuXSiA8ooVfVjYd1Rj8znCXJo4I
 d864qlzhbgsutkQWdmVEURbMUk2QdjjjVecaRva3LfCH5fKiaqI4bxb+CEBvBg7KQwZham
 Km+cKQ+LLNRw93Yjli8LL3RerQlMBLXqJEB4wc0mvKzexv3AZXr0K4X5W2gCWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d3tLcRzv
Subject: Re: [Buildroot] [RFC PATCH 0/5] Support SBOM in CycloneDX format
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
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Thu,  4 Apr 2024 14:43:24 +0200
Thomas Perale <thomas.perale@essensium.com> wrote:

> This RFC patch series propose to add support for the CycloneDX
> SBOM format.
> 
> There is a growing need to generate SBOM from buildroot
> configurations. Right now, there are different solutions available
> for buildroot users `show-info`, `legal-info` and `pkg-stats`.
> They all generate similar information (`show-info` showing more) but
> in a format that is specific to buildroot.

Thanks a lot for your work on this, this is really useful.

My initial reaction is whether it is really the right solution to have
"make" spit out the CycloneDX format, or whether we should use "make
show-info", and then process the JSON output using some Python script
to generate the CycloneDX SBoM. Some of the mangling needed to generate
the CycloneDX stuff is a bit tricky to write in make, and having a
utility Python script doing that work based on a JSON input would I
believe be simpler and easier to extend. Have you explored this idea?

Of course, if "make show-info" doesn't provide enough information in
the generated JSON blurb, we can always extend that with more
information.

> This is a first sketch and I hope to gather comments on functionality
> the community want me to include. I already have a todo list of feature
> I plan to work on:
> 
> - [ ] Find a solution to handle versioning. The "version" property
>       should be incremented every SBOM generation.

Perhaps easier to handle this with the Python script approach proposed
above.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

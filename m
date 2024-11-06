Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC730D59F73
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB0EE81357;
	Wed,  6 Nov 2024 21:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1x2LRd4TYiTE; Wed,  6 Nov 2024 21:22:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5CE481399
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5CE481399;
	Wed,  6 Nov 2024 21:22:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 346C83B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2266160AD6
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSH_CDdhtk2z for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:22:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0CE3260ABD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CE3260ABD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CE3260ABD
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:22:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52D711C0003;
 Wed,  6 Nov 2024 21:22:43 +0000 (UTC)
Date: Wed, 6 Nov 2024 22:22:42 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>, Woodrow Douglass
 <wdouglass@carnegierobotics.com>, Julien Olivain <ju.o@free.fr>, Asaf
 Kahlon <asafka7@gmail.com>, Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>, Robert Rose
 <robertroyrose@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20241106222242.7438dbc1@windsurf>
In-Reply-To: <20241030190020.1444105-4-james.hilliard1@gmail.com>
References: <20241030190020.1444105-1-james.hilliard1@gmail.com>
 <20241030190020.1444105-4-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730928164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bK9WZwuMwlqeCIOYcjqZmxjRP4t4EzkxTS1kpZrLYxY=;
 b=ERmcnGlTnBvv9nqUJcV49SqN0gR0//orty6rhc0rScrYYRBpL2EM/srItAmXsKkBH9y6Wz
 odLdaopwN3vAx1KopqJB5OjXnnp+MuhH3YwAcbtKV5rziOkcA83sle8+bY14tV6eYwhzaL
 eC6r/6hIFyYWfXQ2v1twtpuNSBKSXigvx/aX3GAEJSkMSHdE7tOhnzDVDN4Z/U0lp1z9xj
 4+F5KEeRrSqypV6fKZ+uRbeA4gMcMaYp8eGZURjL/IWkp8hycsvGNDVQQGoVTmFDg+uoY0
 QpdXzxSD1rBvL+ObjflWwlh/QydrO0E8ieiZWXtVR+CFxQ2mKWfn0TUkELPM1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ERmcnGlT
Subject: Re: [Buildroot] [PATCH v4 4/6] package/protobuf-c: fix protobuf >=
 26.0 compatibility
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

On Wed, 30 Oct 2024 13:00:18 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add some patches fixing protobuf >= 26.0 compatibility.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...ct-against-being-invoked-against-edi.patch | 57 +++++++++++++
>  ...dSyntax-to-maximize-compatibility-ac.patch | 84 +++++++++++++++++++
>  ...nerateHeader-Set-min_header_version-.patch | 44 ++++++++++
>  3 files changed, 185 insertions(+)
>  create mode 100644 package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch
>  create mode 100644 package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch
>  create mode 100644 package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch

Applied to master, thanks. This should have appeared *before* the
protobuf bump in your series, as it fixes a fallout from the bump, and
therefore with your proposed order, there is a bisectability breakage
between PATCH 1 and PATCH 4.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

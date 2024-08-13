Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66713C52D7B
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 07:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12D678059B;
	Tue, 13 Aug 2024 07:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrS-c7De_8S4; Tue, 13 Aug 2024 07:19:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FB1580843
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FB1580843;
	Tue, 13 Aug 2024 07:19:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B7D81BF951
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 07:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88AE640248
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 07:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIT6wt_Nt3uL for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 07:19:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0EED440207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EED440207
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EED440207
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 07:19:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39CD420004;
 Tue, 13 Aug 2024 07:19:28 +0000 (UTC)
Date: Tue, 13 Aug 2024 09:19:27 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240813091927.32682ebe@windsurf>
In-Reply-To: <ZrsED1PkoKznI94O@waldemar-brodkorb.de>
References: <ZrhLQMty5kRy7Oo4@waldemar-brodkorb.de>
 <20240812221448.40e4d87a@windsurf>
 <ZrsED1PkoKznI94O@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723533568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36jxHdBOW82Bbc2lI6Ewql0OwOTph2hRJmkTDTtHhb8=;
 b=McvkUzdYokQWVZ1EWLjRQMEZoCpS2g45FDJ6pWwLfN7ENIbDUK4XGm860f7ZMiSgGuBcBU
 M9CVpCaup6K8zl6ErEv/kEOskPa8VS9vvHcSqnhfc4OOFQtI9kc/VJSxnU3LUFT3eUF+Ug
 srEeYi6JdS2bBiEoXbVcK5pOwO/RNKx6HqKiBwJ3/xUxuJu9AnxlR/S8J5QBxJwbEASNE/
 UgpbFGZcsyLXJC33z+MkUbT+gU5fZWTMruFZ0IAPF4t4r7C9IUpYw26Kd4iQnzqsKy6ErC
 fn+DZmDSuV27FJASPGdHjmvJKmseEKGUWgqJMDtDiNKI5enDCZx8kBWXFmk6nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=McvkUzdY
Subject: Re: [Buildroot] [PATCH next] package/hiawatha: update to 11.6
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

On Tue, 13 Aug 2024 08:58:23 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> > Successful before your bump, fails after your bump.  
> 
> I only tested with TLS on, sorry.
> 
> It seems upstream is broken regarding ENABLE_TLS=OFF.
> I tried to patch CMakeFiles.txt to add the missing sha3.c, but then
> other symbols are missing. I added 5 missing files and still no go.
> Uptream is not very active anymore, he mentions on his website that
> he is doing releases, but no active development anymore.
> 
> We could remove TLS off case entirely and still have a small secure
> webserver. What do you think?

Would be OK for me. However, if upstream is not active anymore, should
we drop the package instead?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

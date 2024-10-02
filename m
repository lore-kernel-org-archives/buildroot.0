Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D8FCF8543
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A143F43069;
	Wed,  2 Oct 2024 21:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7o9Zn5geW6AP; Wed,  2 Oct 2024 21:03:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05A7943056
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05A7943056;
	Wed,  2 Oct 2024 21:03:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF4A91BF30E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDE46411B3
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 182ryE6-Mx-8 for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:03:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 55C8A41197
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55C8A41197
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55C8A41197
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:03:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D06CC0003;
 Wed,  2 Oct 2024 21:03:22 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:03:21 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241002230321.4f10d12b@windsurf>
In-Reply-To: <20240926220822.208609-1-james.hilliard1@gmail.com>
References: <20240926220822.208609-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727903002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdakBNS6Amm74CbFOKasUygn6PH4UzE746l6fMblelg=;
 b=Mjl7jr+7OQ0BWGvBmk3dLxUuBUrMxO7OPXIkx4ELcR3lacPDlauKNf8gJQdlnYie9PG7pB
 tKpKNd83Fm4VThy2m7x73nbIzuy0b/9Rqycc4iJjSLdS+4tMYKuqxYmocxPrdC3HtsYg4M
 DKLKDvJwGJ5eg7TefVf8hkWGcEQLjV9IlhrbOJ7LOLVITPQGeTNfVNHqVbVWOUMkxWXjPi
 990triLWbHB7ALMCMrkFxCRZ1GHrDZX6sLh7T+IkpCqarY8Zt9zh43I5twszYGnR5SHBbZ
 olu97mKrbhA92Ki69eWtchBiY/qlAo/pCzcYMcHytusp+HVddgF112aFvYTldQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mjl7jr+7
Subject: Re: [Buildroot] [PATCH 1/1] package/python-spake2: bump to version
 0.9
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 26 Sep 2024 16:08:22 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patch which is no longer needed/applicable.
> 
> Drop no longer required python-hkdf runtime dependency.
> 
> Add new python-cryptography runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../0001-Update-versioneer-to-0.29.patch      | 2194 -----------------
>  package/python-spake2/Config.in               |    3 +-
>  package/python-spake2/python-spake2.hash      |    4 +-
>  package/python-spake2/python-spake2.mk        |    4 +-
>  4 files changed, 6 insertions(+), 2199 deletions(-)
>  delete mode 100644 package/python-spake2/0001-Update-versioneer-to-0.29.patch

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

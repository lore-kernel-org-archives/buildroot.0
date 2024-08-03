Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C46C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 21:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D62C1605C0;
	Sat,  3 Aug 2024 21:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id waAX0Rw5T-aI; Sat,  3 Aug 2024 21:09:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C09B6606AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C09B6606AA;
	Sat,  3 Aug 2024 21:09:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54C701BF3E3
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 21:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41B7140384
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 21:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TE269z5BzJFJ for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 21:09:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0236A40347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0236A40347
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0236A40347
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 21:09:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 839E0240002;
 Sat,  3 Aug 2024 21:09:39 +0000 (UTC)
Date: Sat, 3 Aug 2024 23:09:38 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240803230938.285af0fe@windsurf>
In-Reply-To: <Zq4tBZt24KCzNTcq@waldemar-brodkorb.de>
References: <Zq4tBZt24KCzNTcq@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722719379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nf2HB9AIglVwL06z5qefwekNKmhAuQUe/myt8Gc3Bfk=;
 b=PUuwP4lcHonUZxZNGSp/wfYkG66P5J0LnQ+qScUtA54lxtAXmSgSWIpfISPcz73Rx8muGA
 pHKVEUYCdZpVgOhpxamYwvnvrWGe1l1HRePysMDVQ3WTsBA6+o6MZKIMwFxaI8tWk/TPcs
 vXZlF3rYIDZbOACOFcILfd6SZwWaZbpjdPkjUtCoFCD5TGfHqJMFA2HpmQFW0wGsSMRDkl
 iELhzheLB4QsamRqBhkjfFkeOYqflUzvOsKdWeAsTKdNR6E6vsssTJ9LNO+S3lQPMfVNCv
 DvKmsmq41hhhdmGJXSm3g/lG1xCGOsb0v3RP1YaV644V+ACgWoL3jYBDQY//gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PUuwP4lc
Subject: Re: [Buildroot] [PATCH] package/valgrind: update to 3.23.0
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

On Sat, 3 Aug 2024 15:13:41 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here for Changes:
> https://valgrind.org/docs/manual/dist.news.html
> 
> Enable for S/390X as it is supported. (Only compile time
> tested).
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/valgrind/Config.in     | 1 +
>  package/valgrind/valgrind.hash | 4 ++--
>  package/valgrind/valgrind.mk   | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)

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

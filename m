Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883A1E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 21:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58118811B3;
	Sun, 29 Dec 2024 21:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdnCBPXocXyv; Sun, 29 Dec 2024 21:10:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 810DD81281
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 810DD81281;
	Sun, 29 Dec 2024 21:10:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11F29C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3A2E81282
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30gT0p6H6n9X for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 21:10:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7A8181281
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7A8181281
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7A8181281
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:10:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DA321C0003;
 Sun, 29 Dec 2024 21:10:26 +0000 (UTC)
Date: Sun, 29 Dec 2024 22:10:26 +0100
To: Reza Arbab <arbab@linux.ibm.com>
Cc: buildroot@buildroot.org
Message-ID: <20241229221026.0f184fed@windsurf>
In-Reply-To: <20241211170341.450579-1-arbab@linux.ibm.com>
References: <20241211170341.450579-1-arbab@linux.ibm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735506627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/yUB5uEGQ7xAdAhy0blbMKUFvoHV99kwFkz0JSR6AA=;
 b=ez5Xv0m+vsI++WDRCzn2AlJRgSu4UkqmEtUUajwpKvyGA0CkKHxB71YDAKufz8TfY91eva
 zXxMqfrbd1UgeXW9lnKepTyQFbYWkcqYKbVF8kcqceaLwbDL0pQ77H+Kn/z+J1RfXkDpw7
 K2iompZVSHmZhTT7bAT9Afq0tZy1Dee6DNzC3bsy0YWogB1A6HFtO7wXWV7AK7spKXdJA0
 fgRMSPrSWJ9vDM3jkDd0u5el8ztZzLjhzeE8Z3e/kaJf3q4HUuGfAVn5OppXTZ5ebsY1/L
 c+HL9kAqJYeWUZ6Tvxz4GrxmhbfzReamrsFBbCcgjhVD1KAXzwfXX4Q1TOtiOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ez5Xv0m+
Subject: Re: [Buildroot] [PATCH] package/skeleton: create lib64 symlink on
 s390x
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

On Wed, 11 Dec 2024 11:03:41 -0600
Reza Arbab <arbab@linux.ibm.com> wrote:

> Building on a s390x host, we currently end up with:
> 
>   output/host/lib
>   output/host/lib32 -> lib
>   output/host/lib64
> 
> host-libopenssl installs to lib64, but since the kernel build doesn't
> explicitly search there, it breaks:
> 
>   >>> linux 6.6.32 Building  
>   [...]
>     HOSTCC  scripts/sign-file
>   /usr/bin/ld: cannot find -lcrypto: No such file or directory
>   collect2: error: ld returned 1 exit status
> 
> Fix this by creating a lib64 link instead of lib32, so we get:
> 
>   output/host/lib
>   output/host/lib64 -> lib
> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> ---
>  package/skeleton/skeleton.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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

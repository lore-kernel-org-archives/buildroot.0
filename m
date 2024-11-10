Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A56D12D49
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 17:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C73A7605E1;
	Sun, 10 Nov 2024 17:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CmL9ud6AbFIa; Sun, 10 Nov 2024 17:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE6AA6060E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE6AA6060E;
	Sun, 10 Nov 2024 17:14:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3879ADB1
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 264FF6060E
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ig4eKBQprkg9 for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 17:14:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08168605E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08168605E1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08168605E1
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:14:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0A7DC0007;
 Sun, 10 Nov 2024 17:14:43 +0000 (UTC)
Date: Sun, 10 Nov 2024 18:14:43 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Rodrigo Rebello <rprebello@gmail.com>
Message-ID: <20241110181443.6242a797@windsurf>
In-Reply-To: <20241109233905.1787639-1-ju.o@free.fr>
References: <20241109233905.1787639-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731258884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ja05c7KYAcz0F0v2O7c2zqXMMkcXSDNXwxKi9D9RY0=;
 b=NlPP2F0Ju8nc4lFgPkuvzzqEqDbLP8i+/Kt18LMAgTAnrcpmLRSUy/IWItoqaJYvAqpE7D
 qfThi7NuMBrbBoeniK1jtxJNNMVOJprwSR4Yfh20m/d9ku+dK22IrqwFYfsXkckO+dMU2/
 96VifR9iPvnXvatLaDgtrqOev16XTsvg0/K1I6Zo5KC2+q31FYItPU2AFiY7ZJ1H3+w52A
 CKodc4hy7bPshufo6cuBWhenZl8Dio+/3hAvEsfEEz/26AFrMBAVzVC4n1UBovMWfPJBRY
 zRCdZ+Kxbcrr5aoEh8GwXaic1FjCVmRCxxGyf60DRN+/IAk2qUpJKSVOzpsgSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NlPP2F0J
Subject: Re: [Buildroot] [PATCH 1/1] package/irssi: bump version to 1.4.5
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

On Sun, 10 Nov 2024 00:39:05 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://irssi.org/NEWS/#news-v1-4-5
> 
> This commit also adds the pgp key id used for the signature
> verification.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested (compilation only) in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1534961536
> ---
>  package/irssi/irssi.hash | 5 +++--
>  package/irssi/irssi.mk   | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)

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

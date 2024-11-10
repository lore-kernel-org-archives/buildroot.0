Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE2BD12D49
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 16:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10B7760655;
	Sun, 10 Nov 2024 16:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QsC6soaHVNMe; Sun, 10 Nov 2024 16:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FE7360680
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FE7360680;
	Sun, 10 Nov 2024 16:47:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DB4A6C
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E2D3606E7
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzeSrkkCdfPP for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 16:47:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7C6660655
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7C6660655
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7C6660655
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:47:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EBFAFF802;
 Sun, 10 Nov 2024 16:47:41 +0000 (UTC)
Date: Sun, 10 Nov 2024 17:46:55 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?=
 <raphael.melotte@mind.be>, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241110174655.362c056a@windsurf>
In-Reply-To: <20241109170356.574653-1-james.hilliard1@gmail.com>
References: <20241109170356.574653-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731257261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GUzR8rD3HewEd43P+kLqhTo9urc0G87j2O/komFZUj8=;
 b=jIRUalI8KBqsfjD5LjlAFnhLbsS4GXTOe74fFmOT6iCSBFcE5RPpL1WBJ81pTj9h74Nj0j
 a0Py3aQdMj1NjAXcamHmao2p3t0UpC7uewlVNsiqX7z1RL3EFDFu2VdPl1Z8JWlt2r+Ig0
 UZUWBqTu4FVkXTaBmCpQDXWxMnWurRUOBC/2YJzDwSh89R31K+HYSMWKe/PcS1P1gzvFd4
 Z02S0WUSC5w6FOH1K79SnUnJQKGIQSW0Myq2jqXuo80Axt23n69kSf2WVYlRxA3ioZ3DpN
 tKs/Gq92m2yoM6LqDwV6sc9OC8ss9gmhbAVFtKBaTBqqU76EYWMrrk07IMrGiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jIRUalI8
Subject: Re: [Buildroot] [PATCH 1/1] package/python-botocore: bump to
 version 1.35.57
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

On Sat,  9 Nov 2024 10:03:56 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-botocore/python-botocore.hash | 4 ++--
>  package/python-botocore/python-botocore.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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

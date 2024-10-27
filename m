Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D6FD13572
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DBB680BE6;
	Sun, 27 Oct 2024 18:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JqriD5OBZOQc; Sun, 27 Oct 2024 18:44:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47BDF80BFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47BDF80BFA;
	Sun, 27 Oct 2024 18:44:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 60145971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 407A4606D6
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JF79UyOkaAPy for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 509AE60621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 509AE60621
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 509AE60621
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69E97FF806;
 Sun, 27 Oct 2024 18:44:27 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:44:09 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241027194409.126663c1@windsurf>
In-Reply-To: <20241026225441.3850666-1-james.hilliard1@gmail.com>
References: <20241026225441.3850666-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0YwE8RpozBKCbsFzSF/IklMNU4V4MT5Bq8jiEPY5dXE=;
 b=Op7D49mQRhpAvJT+zPYuh30RH47hBXfKCeLUvFRIa7PmVT8tE6s3hzStp479MNbnJmIuIR
 Anw2KydmCiLsxIDBaV85zazu2oNAeZgGq+Gy4FtKPYCzqXTw/4o2tFFKGNvQoWWeH6Hk79
 ZJeM3ZQbRVLyo3ERDb8WY+xCHf58gNOin8XzfZnmvh7qMt/JzD9PgiZRk+bqTX3WwmiIsS
 OzlzRo4dlwo9j/Ldy9FVzJFdTNo07HPl78kAOvyZSTMko66OPcVMZe2/KXJ4b0XSPbnIp9
 mXlxspvQZJpMBLh1wF40I0n9Bvg8LYS87x6M82/8SQmoIhWHyVRdMYYOxQiadQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Op7D49mQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.25.0
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

On Sat, 26 Oct 2024 16:54:41 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pydantic-core/python-pydantic-core.hash | 2 +-
>  package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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

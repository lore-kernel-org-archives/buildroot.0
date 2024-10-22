Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B711CDD0CB
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 670326087B;
	Tue, 22 Oct 2024 19:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2vqdrxLGGJD; Tue, 22 Oct 2024 19:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BCD56089E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BCD56089E;
	Tue, 22 Oct 2024 19:18:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 240B559F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04D7C80DB9
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gX27goWG5V3S for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:18:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C7CF80E94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C7CF80E94
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C7CF80E94
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:18:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4393F1BF204;
 Tue, 22 Oct 2024 19:18:02 +0000 (UTC)
Date: Tue, 22 Oct 2024 21:18:01 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241022211801.3d695df2@windsurf>
In-Reply-To: <20241013200847.2819030-1-james.hilliard1@gmail.com>
References: <20241013200847.2819030-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729624682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pAgkNSLgoLkFmIYRkhNTnh/1sKcxTJVN6cJCcZX7zU=;
 b=N6fvcXGpghp/UDuz9SZCRtrZx4dFiRA1keYv/r4KSqsRbdDpyH5H9hLND66HLjKsK0y7fw
 liAy3T5D3V2gCYu558YbvmlbG9c6j048lzXgnMKPqJbW4RCWsy9m1i5UVMJ1x7hB/SElb/
 hkz7L2+YNHXuRITRrekXlpzRXGXkYEDTJl8gsVfdOdZJnahkflLH6hQ/b6kV3fFcyjUlF+
 gavxAtrS6pbbJfAhILfwgQJlo/P71J945fxll/yRcymU5MyBYXMDD2QrsznxkrI7V8he7A
 31k26DyuZ/NPZ7jeJ148IaJKLbCtRzf0wPmWKceKKkJmlI73/o4G1MW680DkXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N6fvcXGp
Subject: Re: [Buildroot] [PATCH 1/1] package/python-trove-classifiers: bump
 to version 2024.10.13
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

On Sun, 13 Oct 2024 14:08:47 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-trove-classifiers/python-trove-classifiers.hash    | 4 ++--
>  package/python-trove-classifiers/python-trove-classifiers.mk  | 4 ++--
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

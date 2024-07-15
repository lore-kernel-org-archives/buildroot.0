Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08F5C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 12:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 576154008F;
	Mon, 15 Jul 2024 12:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUxm4AfwYi8C; Mon, 15 Jul 2024 12:28:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C9974009A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C9974009A;
	Mon, 15 Jul 2024 12:28:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9949D1BF3B8
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E774A4039A
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMApIFx3FI4E for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 12:28:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77F7140252
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77F7140252
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77F7140252
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 12:28:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A7B5E0007;
 Mon, 15 Jul 2024 12:28:40 +0000 (UTC)
Date: Mon, 15 Jul 2024 14:28:39 +0200
To: Ben Hutchings via buildroot <buildroot@buildroot.org>
Message-ID: <20240715142839.5e8943a0@windsurf>
In-Reply-To: <5fb8a22c378d48cecac5658a6685d1c007692053.1712957992.git.ben.hutchings@mind.be>
References: <cover.1712957992.git.ben.hutchings@mind.be>
 <5fb8a22c378d48cecac5658a6685d1c007692053.1712957992.git.ben.hutchings@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721046520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=463G4E5M/b8YeZnxrHhE5kDrBAmsVthmdFMz2iLUguM=;
 b=C71dasPh8RXaouWIauAHm5O+aqKmOyB3Uv3C00+TQhZvWVcjzT+woo8VIE8feMSxIegin/
 /6G0Id82vo/RUFeVWblGGlwrqOUrE7T9sT4jtPykmepkHwwWJz9oVMuixWN02wg5pNYIeU
 0fG0TJoe4odb2wK55xz5aYu57MXxyi3tn9rimAiKaqqV2QNu19dMI6LVFtqCSxMAoKCAoa
 /qj9wgNIjX8hTk8sAwcWg2KkPkva8JLMbJDvgQkc3kWyxbH1xUreu/dgrI+VcESrdKE+hH
 tTJp6u8n1/aZslpJzvTATDyf+k7Sv41X26yQpZTsISWlISjTtWOz5TG69eD1lg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C71dasPh
Subject: Re: [Buildroot] [PATCH 2/6] package/libnpth: Add host package
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
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Apr 2024 23:43:06 +0200
Ben Hutchings via buildroot <buildroot@buildroot.org> wrote:

> This is needed to support a host build of gnupg2.  It is not directly
> selectable.
> 
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> ---
>  package/libnpth/libnpth.mk | 1 +
>  1 file changed, 1 insertion(+)

I've added:

+HOST_LIBNPTH_CONF_OPTS = --disable-tests

and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

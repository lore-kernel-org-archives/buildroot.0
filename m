Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48D9C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EB5D60B6A;
	Tue,  6 Feb 2024 13:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EB5D60B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKs_vp_SMWhg; Tue,  6 Feb 2024 13:23:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6CC060B0C;
	Tue,  6 Feb 2024 13:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6CC060B0C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38ABF1BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3385C8232A
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hi4dPnOUvngR for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:23:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E76E382306
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E76E382306
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E76E382306
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:23:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02E83E0004;
 Tue,  6 Feb 2024 13:23:38 +0000 (UTC)
Date: Tue, 6 Feb 2024 14:23:38 +0100
To: Marleen Vos via buildroot <buildroot@buildroot.org>
Message-ID: <20240206142338.59a0a577@windsurf>
In-Reply-To: <20231219121508.1695768-2-marleen.vos@mind.be>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
 <20231219121508.1695768-2-marleen.vos@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707225819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEbyMqTvpIPyUC8nWXEYGlyxkfvY9d6xjg2SW6KzhpU=;
 b=jjI4InDeAM0GHsLHRzCpmmcDzVtB55PhTa4iIE3MbUhsM8SOALjIGDuACd/ouoAX4k5765
 rJfu+U6sqq5DWux1+todY7q7akLgHPEBfL7nuAfeeDu5GSaoSa3au6G25cysJHuZvPfYux
 MWtq5NUAKHfYbZBcr8ysanOO6ptAzfsCGjHasL7QgVQeFKQviJ5rqHNM4VBNyUesi8iKrN
 5ttUgvCgs+q9jfTgoW/WtFRBYQNq7XndgXGTGEJXXsAT2Ffc6sDVAIqpsAtppFZDWeFtQd
 w6IUM/O7Jn8jU+UccEHERYyysHpIMd2KEpQbv54KqFmIayds7Axh+DeRC3JJjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jjI4InDe
Subject: Re: [Buildroot] [PATCH 1/7] DEVELOPERS: added marleen.vos@mind.be
 for boards/configs based on stm32mp15
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
Cc: Marleen Vos <marleen.vos@mind.be>, marleen.vos@essensium.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 19 Dec 2023 13:15:02 +0100
Marleen Vos via buildroot <buildroot@buildroot.org> wrote:

> From: Marleen Vos <marleen.vos@mind.be>
> 
> The buildroot manual says this kind of commit should be done together
> with the actual changes made to a config/board. But since a number of
> changes will follow for some boards and configs, it seemed more
> logical to make a separate commit for this.
> 
> Signed-off-by: Marleen Vos <marleen.vos@mind.be>
> ---
>  DEVELOPERS | 6 ++++++
>  1 file changed, 6 insertions(+)

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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436F1C3DA41
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 09:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07CE9401FF;
	Tue,  9 Jul 2024 09:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZUhQOzih5Dj; Tue,  9 Jul 2024 09:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3FF840216
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3FF840216;
	Tue,  9 Jul 2024 09:43:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C263D1BF29A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE30F404A5
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bO9H05Thzhlh for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 09:43:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5528C40238
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5528C40238
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5528C40238
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 09:43:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 788B1C0007;
 Tue,  9 Jul 2024 09:43:32 +0000 (UTC)
Date: Tue, 9 Jul 2024 11:43:31 +0200
To: zhangdongdong@eswincomputing.com
Message-ID: <20240709114331.58b8279b@windsurf>
In-Reply-To: <20240709014517.4838-2-zhangdongdong@eswincomputing.com>
References: <20240709014517.4838-1-zhangdongdong@eswincomputing.com>
 <20240709014517.4838-2-zhangdongdong@eswincomputing.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720518212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HoKStMmE0vHb98IaXGD4i/8Po5a75fMi4RPYLgZ3Yc4=;
 b=hQw1vsr75j0ja+l4iukbO6gxVrwYEzz6q0ANkiSsys4INyafqGLzXMhh84lG/tcJPa3qF8
 t66jCo1ZOkFY7cDBl17466g9kfbkxqRAkZTcD/m5LMJHJ7txdloC31LplM6qumVJXJLwrr
 C26VvRC4nrFl7r3JLYKQdRl++6dEg30YLvCTKVBhZrzg1ItOO3eA5GS6ZFHxmhOGmELw7P
 24F7lHLE7gpeWzTFoeBXs0C6XoiH+n3JSzfHrkncQGDGL8uW6nRhIds1hGywfId5ivG/83
 pTyaewdj3xPE+gWvDbIh9szqWNnxpW0uF7cxRbCgQtLPlu7Vc0mbhXmcvXTgIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hQw1vsr7
Subject: Re: [Buildroot] [PATCH v3 1/1] .github: add github action to
 automate PR handling
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
Cc: bonet@grenoble.cnrs.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jul 2024 09:45:17 +0800
zhangdongdong@eswincomputing.com wrote:

> From: Dongdong Zhang <zhangdongdong@eswincomputing.com>
> 
> This patch updates the Buildroot repository's GitHub configuration to better
> manage incoming pull requests.
> 
> - Added a new GitHub Actions workflow (`repo-lockdown.yml`) to automatically
>   handle new pull requests.
> 
> The new workflow:
> - Triggers on new pull requests.
> - Uses the `dessant/repo-lockdown` action to:
>   - Comment on the pull request, guiding contributors to use the mailing list
>     for patch submission.
>   - Lock the pull request to prevent further discussion.
>   - Close the pull request.
> 
> This change ensures that contributors are properly directed to the preferred
> method of patch submission via the mailing list, maintaining consistency and
> streamlining the review process.
> 
> Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>
> ---
>  .github/workflows/repo-lockdown.yml | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 .github/workflows/repo-lockdown.yml

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

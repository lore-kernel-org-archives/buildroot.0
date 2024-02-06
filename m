Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C8CC48286
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 09:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 531AE821A3;
	Tue,  6 Feb 2024 09:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FwroFCNfyRtu; Tue,  6 Feb 2024 09:48:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EE2282280
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EE2282280;
	Tue,  6 Feb 2024 09:48:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 579F41BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 09:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FABF821AB
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 09:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S31ksvZTnDeN for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 09:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D9DF82113
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D9DF82113
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D9DF82113
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 09:48:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37250C0002;
 Tue,  6 Feb 2024 09:48:11 +0000 (UTC)
Date: Tue, 6 Feb 2024 10:48:10 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206104810.1e14c852@windsurf>
In-Reply-To: <20240205183308.2120022-1-james.hilliard1@gmail.com>
References: <20240205183308.2120022-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707212891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zmXvF3MZyUb/wQg4WzrRUj0U+sxmC0k9d02+vPLissw=;
 b=o6w+CLXgDJAYGAPgn87QjR6ujhLFSAe5Fsyo60FZazG0NbrMqWJgCX5ykRVRml1cyiAe2M
 V37K5l+5iPQwSLr4haN18pm7ifske2bXhuWbH26mWNTJF9L/S8Agmis3RHu6uRtwrh/dg6
 JIYd2eQ8wJ8I0HNbz1f+BR+9jnqCTMNmI0ERPDreD87g2VgmZcSgZJlR52zPUDQ37p6hV/
 ktbj0NjSermF6zakHvMqhonK5wVWLIeVxDhs3j0qPswqHn02rMrsVUo+apmpeiP0gvTXpe
 ojXOehr+u8oeNg5JhvJWMue5fhumVVV0LyYjNpq2/Qy+lIibuBo1q84afCu3JQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o6w+CLXg
Subject: Re: [Buildroot] [PATCH 1/1] package/ruby: disable unsupported yjit
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

On Mon,  5 Feb 2024 11:33:08 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> The yjit feature requires rust toolchain support, since we don't
> currently handle setting up the rust toolchain for ruby lets disable
> this feature for now.
> 
> This broke when ruby was bumped to version 3.3.0 in buildroot commit
> a01c278df7892c8a6736334aa008b2d7c09e9258.
> 
> Fixes:
> linking static-library libruby-static.a
> LLVM ERROR: Invalid encoding
> make[2]: *** [Makefile:318: libruby-static.a] Aborted
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/ruby/ruby.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

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

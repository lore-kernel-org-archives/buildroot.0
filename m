Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E24C25B74
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 07:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2A84415D0;
	Tue,  7 May 2024 07:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKdU0bmsebYw; Tue,  7 May 2024 07:12:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 388E2415B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 388E2415B2;
	Tue,  7 May 2024 07:12:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DCD81BF32C
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36F20415A3
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYSPjtDnfSCw for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 07:12:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 35301415B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35301415B3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35301415B3
 for <buildroot@buildroot.org>; Tue,  7 May 2024 07:12:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4F661BF206;
 Tue,  7 May 2024 07:12:44 +0000 (UTC)
Date: Tue, 7 May 2024 09:12:44 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240507091244.45d6b5ba@windsurf>
In-Reply-To: <20240506213038.418213-1-romain.naour@smile.fr>
References: <20240506213038.418213-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715065964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JKP2C5Hm7K/hrf25ndc+f/dnqgcnA3jPhVhQkbyy+oI=;
 b=hBu+Yuu6CASQftDo7uMjdjnRj7rEVjDHSU1cvg4dL7JQ1barDb49TK/xDNJkiBGXp1gFd6
 Jcco3Vd8YXIm2A1GGMO9wV2np5xflj2wPwKNPlqxZKMLE4nR1qI+9PePOez8UQySKKLNdr
 lYH2RGLGCWyaSnecRjzsYKGz0G+9t93PhxhPOTQnwQfJ6Pj9SYxtjNFDQYVdheJFqeaO1C
 aaGivrgHoh38ZMzQMpMQmWNJ50/460xHb0s+atR7Tyl5Ut/MyrQCbZ+hYrwW4KgZyGEork
 ZcD6yHyCkzsG0Htd9wbfxRKQoZL9980qChdW3UGfnBFBMVPzotgNkGdYITkYXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hBu+Yuu6
Subject: Re: [Buildroot] [PATCH] package/python-rpds-py: bump to version
 0.18.1
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  6 May 2024 23:30:38 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> As reported by Antoine Coutant on the Buildroot mailing list [1]:
> 
> rpds depends on the crate pyo3. This crate uses
> 
>   "std::sync::atomic::AtomicI64"
> 
> which doesn't exist for 32 bits targets.
> That leads to an error as reported by Buildroot Gitlab-ci.
> 
> An issue have been opened on pyo3's github [2].
> A fix have been accepted by pyo3 [3] and merged in pyo3 0.20.3 release
> [4]. This pyo3 0.20.3 uses crate portable-atomic [5] to provide atomic
> types and compare and swap operations for all targets that can use std.
> 
> python-rpds-py 0.18.1 is the first release that use pyo3 0.20.3.
> 
> Before python-rpds-py 0.18.1 release fixing this issue would require
> that we be able to patch a package during the Cargo vendoring step [6].
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2024-February/684867.html
> [2]: https://github.com/PyO3/pyo3/issues/3614
> [3]: https://github.com/PyO3/pyo3/pull/3619
> [4]: https://github.com/PyO3/pyo3/blob/v0.20.3/CHANGELOG.md
> [5]: https://github.com/taiki-e/portable-atomic
> [6]: http://lists.busybox.net/pipermail/buildroot/2024-February/684886.html
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6783811842 (TestPythonPy3Dtschema)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6783811860 (TestPythonPy3FlaskExpectsJson)
> 
> Reported-by: Antoine Coutant <antoine.coutant@smile.fr>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/python-rpds-py/python-rpds-py.hash | 2 +-
>  package/python-rpds-py/python-rpds-py.mk   | 4 ++--
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

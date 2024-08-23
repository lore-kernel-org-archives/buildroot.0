Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AE9C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94E9784117;
	Fri, 23 Aug 2024 17:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGXCQJKfdE-Z; Fri, 23 Aug 2024 17:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 210D084125
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 210D084125;
	Fri, 23 Aug 2024 17:33:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA7211BF314
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D748F4016F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fv2LNdNbawZS for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:32:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CCB8A4015E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCB8A4015E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCB8A4015E
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:32:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCC6C1BF203;
 Fri, 23 Aug 2024 17:32:55 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:32:55 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240823193255.6130da10@windsurf>
In-Reply-To: <20240822113329.695395-1-buildroot@bubu1.eu>
References: <20240822113329.695395-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724434376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qVJDS1pAACaVZs5BxNIYBKW7MTrsyknQXMtM9V5sm1g=;
 b=cHmcwwBW3D0jwiDnyKmu6xcxn6MUtVxYOiFLXZNl3xzClVFzPSsYrhVQ8f4+LkfmGBI7AS
 L/0h7Uxr1g/eC4oViHYMghEA6U06VWRkDFPsDc4aXgE4jTMF8C8zKzZQwoqZeSvb1nBOO8
 Q56pL8g0yBh1eWn2c33QPyovzTC1bBJ6N9012aNxyuVgRhVZhqVvy4rjZwpYQgdyLT3tQL
 EYtP/e4DR8ghJ40fmkAwGfTZgMEZwyDiNGP6ZDLuDw2q9/ugTKLnrdnKomkejbULZ4Uj0b
 Hhsa580d9SSbI0CXjPzolWwprRFCRoGT1MP8SXT4qQUC9g5UhQps3LlEwb6MfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cHmcwwBW
Subject: Re: [Buildroot] [PATCH] package/python-django: bump to 5.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 22 Aug 2024 13:33:29 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Release notes: https://docs.djangoproject.com/en/5.1/releases/5.1/
> 
> We need to add --skip-dependency-check to build options as django
> currently pins setuptools <69.3 [1] and buildroot uses a newer version.
> 
> The Django pin is likely to not be affected by PEP-625 [2] handling,
> which was added to setuptools 69.3 [3][4]. We don't really care about
> the sdist name changing for django though, so we can use a newer version
> of setuptools as well.
> 
> Django has been confirmed to still install and work correctly by running
> the runtime test.
> 
> [1] https://github.com/django/django/commit/4686541691dbe986f58ac87630c3b7a04db4ff93
> [2] https://peps.python.org/pep-0625/
> [3] https://github.com/pypa/setuptools/issues/3593
> [4] https://github.com/pypa/setuptools/blob/main/NEWS.rst#v6930
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

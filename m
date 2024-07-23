Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071E3C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEB6D80FF8;
	Tue, 23 Jul 2024 09:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXRPejA4YnJp; Tue, 23 Jul 2024 09:34:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9596281069
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9596281069;
	Tue, 23 Jul 2024 09:34:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BABDD1BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8CC2607B1
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sp4WdZwH7sGR for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:33:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 975F5607AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 975F5607AF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 975F5607AF
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:33:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDF1BC0003;
 Tue, 23 Jul 2024 09:33:54 +0000 (UTC)
Date: Tue, 23 Jul 2024 11:33:53 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240723113353.66f64b3b@windsurf>
In-Reply-To: <20240109060128.3974794-6-james.hilliard1@gmail.com>
References: <20240109060128.3974794-1-james.hilliard1@gmail.com>
 <20240109060128.3974794-6-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721727235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gs4Pb7BNeieHk+GgJPNCZIv/WyFf3L2SZ3OFp6qHDPE=;
 b=fgJrPahglRmJLo8k2pFybTUsE2IotvdhjtevGczohEXBQKq4E+p3f9qMO9lbntTy6T3OtU
 NdV0phpE6TJxv3Zo7XzgsEVtMrMSA74R8xoJ6AU+xxrPttYDvfdF07ZqiUtYas/DjJvoin
 S2yDDrGDqVgGPWoBWnWF/2n0GHjvmDKZMsXf27fVX4IMKUdhQpw3f6kS3Dd4pLFpqeIvhQ
 Eidhri3bbMVQzvI7amNlkxGSr9bKvXycHk1Xxvj2Krm1/8fZ3+JG8Bzy2y7MpY2dHu8H7h
 KEZgbmE+LUZpnV+lJxE1fP1JVbOrPxVg9D7/sbx5ufRa7wZvQJKLhiMKEmU2HA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fgJrPahg
Subject: Re: [Buildroot] [PATCH 6/6] package/python-cherrypy: bump to
 version 18.9.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Mon,  8 Jan 2024 23:01:28 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new host-python-setuptools-scm-git-archive build dependency.
> 
> Add new python-jaraco-collections runtime dependency.
> 
> Add new python-more-itertools runtime dependency.
> 
> Add new python-zc-lockfile runtime dependency.
> 
> Drop no longer required python-six and python-jaraco-classes runtime
> dependencies.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-cherrypy/Config.in            | 6 ++++--
>  package/python-cherrypy/python-cherrypy.hash | 4 ++--
>  package/python-cherrypy/python-cherrypy.mk   | 8 +++++---
>  3 files changed, 11 insertions(+), 7 deletions(-)

Applied to master, thanks. However, could you please add some tests in
our infrastructure for some of those Python packages? At least a
cherrypy test would be nice. Something like:

import cherrypy

class HelloWorld(object):
    @cherrypy.expose
    def index(self):
        return "Hello World!"

cherrypy.quickstart(HelloWorld())

and then a wget query to verify that the web server works and returns
the correct stuff?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

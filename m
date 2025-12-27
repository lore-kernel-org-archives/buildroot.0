Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85C5E8FDCD
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B0B540446;
	Sat, 27 Dec 2025 15:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0oxtJX6CDWGI; Sat, 27 Dec 2025 15:49:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60F5B4043A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766850549;
	bh=TtxvkIubwzDMCN884IxjKgttEaCiEqqZNGvP0JF8mQ8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JgapxBWxokc/QQ8LMDzwLp+EGT5/SdhHEpPndZ46ooVcfHiNpRHlVWbvRVmSWOmnt
	 f6EA6tMktppyqZyAIYj6d6N7lRB+F7Cg3vbwyNky6PXaew01DkqzhTmhEPkF0wMUTo
	 y1xqhL4xHJBpGLg/5NOOpb32aVKF8DWeKRUCBRnmdc58xDjJJH5+ab1ZunQLzRf0wz
	 fSCEkKUdFx8vsQlyPqUICTdOWlSlI6/CYgn+w3WlmlTdQKVIvZv6xrWwCgnZnoRMVH
	 aV1AF8NltSDW/iqOxesmsCjvQgZWtBBvvzHTJ5XyUbD5Q+g19LofrmDpZU1zgQcs2x
	 c/PboyE+SjoyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60F5B4043A;
	Sat, 27 Dec 2025 15:49:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 08826119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED86E80C9B
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avsARbQq3VXD for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:49:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D419A80C89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D419A80C89
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D419A80C89
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:49:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 98B2D4E41E17;
 Sat, 27 Dec 2025 15:49:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6888260725;
 Sat, 27 Dec 2025 15:49:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C69091197837A; Sat, 27 Dec 2025 16:49:02 +0100 (CET)
Date: Sat, 27 Dec 2025 16:49:01 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20251227164901.37a2fc84@windsurf>
In-Reply-To: <20251204223445.3426350-1-bernd@kuhls.net>
References: <20251204223445.3426350-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766850543; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tFBkFhoR3L7lBxBNNL9FV9jFIPXkjU/a4fSyyWX3Tn8=;
 b=G4mXIcAId+jz8HXYQRU5egB6iN/M4UHS8QYUX880R66r9IHCcBsEIat2dctS5zpGuxOPN9
 OI9JFS7l3ZmDRjLifAmmhoIRbIoqZVx6y2ZSkhsP0Y3yTpCvatVosHg+KeLkgq0VQ1TooI
 TQnnje8jng+V4Zj76k98+QZLTUcedjYALJVk4+NRNqUPlCASqkWoja6NJKw/yqStCmiPyE
 fvIq/Obfg5W5aunzCVdDz0iBef5U1FcsHgeKps8o0TWHWtkDh1RUx7zpOYtZefASSzZe91
 ps5Aqs2N3s3ebi4wc6GQLnNP3MSBjb97KKaT8Xh2bziKaIpsUSdGEzuAZWHVwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=G4mXIcAI
Subject: Re: [Buildroot] [PATCH v2 1/3] package/libnpupnp: bump version to
 6.2.3
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

On Thu,  4 Dec 2025 23:34:43 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://www.lesbonscomptes.com/upmpdcli/pages/releases.html
> 
> Switched _SITE to https.
> 
> Switched build system to meson after autotools were removed in version
> 6.1.2.
> 
> This bump fixes a gerbera build error introduced to buildroot by the
> gerbera bump to 2.6.1 with buildroot commit
> f8bf78911576672443a8d11eaf99bed4d383acef.
> 
> Fixes:
> https://autobuild.buildroot.net/results/b6b/b6bd96cb9dbcaff9351ef156edaec7d1b5290b9e/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: fixed typo in _SITE

Thanks a lot, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

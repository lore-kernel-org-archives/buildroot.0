Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EABDC44506
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 13:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3A8D410C0;
	Thu,  9 Jul 2026 13:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O45NVB3LRlkW; Thu,  9 Jul 2026 13:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCBF8410C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783605590;
	bh=N8zM6lRwDcJmgz829DmGe3DCxolSzjSLqz44V/1XMcI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d1flwyLzHWQKBHpeQ/Gl01xvADQgNJFmb38dy6UTyl9zOr8HoMf+Ubq6v/B6LW1Af
	 PW0jKoe6dz3zl3WksicU+IAdAMHiVIVyygK8jUUscZA9uF60j3+x6joAhkuBONPF7H
	 11qPXkFydD42wsvA63CehNeW41X49m6HD7RFdpmn92ZRcEz/A5XD25Q66B3SIjOyT/
	 pVPm8VMi0ePzFWpd8t3IhszxoGhoVuyslnWF0qjorKWGvHy26Rk9UEAEju3ctDpNMA
	 kfYI10O7HVJH+x369TBb4v9Y53dbhsEeOzm1xslquOM8C8TXjKiFZhEJZw0XOPGbiK
	 A4eSPRafsmXKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCBF8410C1;
	Thu,  9 Jul 2026 13:59:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id 79AD22E5
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 13:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id 578B9410C1
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 13:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id pdxsuiIJCnvz for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 13:59:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254;
 helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 63893410C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63893410C0
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id 63893410C0
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 13:59:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with UTF8SMTP id BF7796137B;
 Thu,  9 Jul 2026 13:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EA7D91F00A3A;
 Thu,  9 Jul 2026 13:59:45 +0000 (UTC)
Date: Thu, 9 Jul 2026 16:59:42 +0300
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <ak-pThib-E92RBPb@kernel.org>
References: <20260621224313.3061196-1-jarkko@kernel.org>
 <f8acb67726efbb68c6c64e99d87ccfe5@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8acb67726efbb68c6c64e99d87ccfe5@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel.org; s=k20260515; t=1783605586;
 bh=H6H5M96gw9Ez6PSEf5033XGzYSmHUYj2MMw2oq+0GEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=oD1jHWNoqCfRAAstXG516z1wuuJkVzdXp1u27NQ1ynnC1POEQjnEuXTy51g4wyRgB
 AGL8Nc7rvTivjedfWbhat2mDbMupnIMQGLtm2RZjmbBAYi4VMDFZ9AG0TE/4PA5RmD
 CsHqVNRMfBlsMKn+dCRbKBLzG9VuhJzdixtHL39D41GfmPIcdlxZhiRO/7BVZQWRkG
 qRn5KUMd4DTtQeoYvp1To1Yxi3gIPf81flkJpUA6Qfic3bk9ARuvEapQlu4hWiE5Pq
 PbMQEkDH8XXOCun1l5C12pqyijronc8YBpdaeRkfJELZNezm+aPxaLQAfhcENKG8PM
 gP+qiOL3JFK2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20260515 header.b=oD1jHWNo
Subject: Re: [Buildroot] [PATCH] package/systemd: Bump version to 261
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
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jul 05, 2026 at 11:28:26AM +0200, Julien Olivain wrote:
> Hi Jarkko,
> 
> Thanks for the patch.
> 
> On 22/06/2026 00:43, Jarkko Sakkinen via buildroot wrote:
> > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> 
> systemd is not a trivial package to bump, when updating its
> major version.
> 
> Could you add at least a link to the upstream NEWS file in the commit log:
> https://github.com/systemd/systemd/blob/v261/NEWS
> and summarize what are the important changes relevant to Buildroot,
> since the previous v258.7 version?
> 
> See for example the last major bump for example:
> https://gitlab.com/buildroot.org/buildroot/-/commit/c38d7326e093f45252c01e241d0faf6b04023e02

Thanks, sorry for the latency due summer time :-) And yes, of course.

> 
> > ---
> >  package/systemd/systemd.hash | 2 +-
> >  package/systemd/systemd.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> > index e96d3ba7ad..1c82877a4a 100644
> > --- a/package/systemd/systemd.hash
> > +++ b/package/systemd/systemd.hash
> > @@ -1,5 +1,5 @@
> >  # sha256 locally computed
> > -sha256
> > 6bd311c25f00d634ae3b4544d582e27df0d4166e6ba3d403b18b3129d7f44cae
> > systemd-258.7.tar.gz
> > +sha256
> > f1c2e6a0d19ea5cae946386eb288432de12f3c6b7730cdb0d2a06f8ab8e3f8dc
> > systemd-261.tar.gz
> >  sha256
> > ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3
> > LICENSE.GPL2
> >  sha256
> > 6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d
> > LICENSE.LGPL2.1
> >  sha256
> > c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad
> > LICENSES/alg-sha1-public-domain.txt
> 
> Running "make systemd-legal-info" fails. The license files changed
> upstream. Could you update the hashes and summarize what has changed in
> the commit log, please?
> 
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 3223915d40..9a0b5652e8 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -19,7 +19,7 @@
> >  # - Diff sysusers.d with the previous version
> >  # - Diff factory/etc/nsswitch.conf with the previous version
> >  #   (details are often sprinkled around in README and manpages)
> > -SYSTEMD_VERSION = 258.7
> > +SYSTEMD_VERSION = 261
> 
> The systemd package has a comment describing few checks that are needed
> when bumping systemd in Buildroot:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05/package/systemd/systemd.mk?ref_type=tags#L7-L21
> 
> The first point applies: the kernel version requirement was increased
> from 5.4 to 5.10 in:
> https://github.com/systemd/systemd/commit/1aeba33d8ffcc4882566881420e1106c9dff61f3
> 
> This change should be reflected at least in:
> package/systemd/Config.in (BR2_PACKAGE_SYSTEMD depends and comments)
> and
> system/Config.in (BR2_INIT_SYSTEMD)
> 
> You can review changes running the command in the systemd repository:
> git diff v258.7..v261 -- README
> 
> This is also observable by running the Buildroot runtime testsuite for
> systemd:
> https://gitlab.com/jolivain/buildroot/-/pipelines/2652633093
> 
> You can run it locally with the command:
> 
> utils/docker-run support/testing/run-tests \
>     -k -d dl -o output_folder tests.init.test_systemd
> 
> systemd also received new meson build options. You can quickly review
> those running the command in systemd repository:
> git diff v258.7..v261 -- meson_options.txt
> 
> Those should be either included in systemd.mk (conditionally or
> unconditionally), or eventually the commit log should describe
> why no change is needed for a given option.
> 
> >  SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
> >  SYSTEMD_LICENSE = \
> >  	LGPL-2.1+, \
> > --
> > 2.47.3
> 
> Could you rework this patch and send a v2 please?
> 
> Best regards,
> 
> Julien.

BR, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

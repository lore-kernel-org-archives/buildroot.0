Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CA3C19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 22:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C2AB403D0;
	Wed,  3 Aug 2022 22:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C2AB403D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VbQAIUf4yT0R; Wed,  3 Aug 2022 22:19:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DADE24035D;
	Wed,  3 Aug 2022 22:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DADE24035D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45CB31BF40B
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 22:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2150F8149D
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 22:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2150F8149D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BPaFEg3DjSte for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 22:19:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 341168149B
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 341168149B
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 22:19:31 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so3601016pjf.5
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 15:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=kxqgiPigzw4l2/P9OopiIHptDUgAlFRZbPXnr56BD/w=;
 b=ulPpA6/s0quaIFwk9tSfamLu+ajel/MJbd5TtZwU6k45YjsjYw1p9XaQv9zfaw/s3B
 KVpMxK2h3qO2ugr26sVBpop18cSHfB0duqwapVHkLnN+FbpKaVMjrhxPl/gIZspmdDvX
 Z1Z2n2dOGt1meyc4jbUka7h6HPeqLeaFKkwIIAUMSvjoFremMYzB+IN/9nNnjKWfBAuy
 aQ4rt47r+kIMpjj9p/3XUTk/GusiYSeS6CWgJ/B6IMpGTU9URT0asV6RlidkIUxdiKnB
 yiscv/KL2BRbtu3KNPwZfNHWt4ztpzSvQR2INxIQiZULsOpnI41OxVuUc87TNTyL6E4k
 Z2Wg==
X-Gm-Message-State: ACgBeo27ElZJFoS2wA76f/aFSLfEiQjAAYeZqd/rndxISkpJRgl1+9QH
 YzPTNP1f+qWDEtxbaVQS9ILbVO+LUOXUjsjYOpY=
X-Google-Smtp-Source: AA6agR6+BKNNAwK2lbuBZI09TrjyhPbV7sfdY2yjMDsY+KAxurprqSTf1Wnv3fGCWxzwtglB+yg3HUgLJy6xOlFzASs=
X-Received: by 2002:a17:902:6b82:b0:16d:d268:3842 with SMTP id
 p2-20020a1709026b8200b0016dd2683842mr27435693plk.16.1659565171232; Wed, 03
 Aug 2022 15:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220313171355.271345-1-james.hilliard1@gmail.com>
 <20220313171355.271345-2-james.hilliard1@gmail.com>
 <20220803234641.346d9c9c@windsurf>
In-Reply-To: <20220803234641.346d9c9c@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 3 Aug 2022 16:19:17 -0600
Message-ID: <CADvTj4r1KvjSmqaYjTkFzvtiZBxx3zMDG0o5ct8iadtGZ3_hVQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=kxqgiPigzw4l2/P9OopiIHptDUgAlFRZbPXnr56BD/w=;
 b=gV+tRrFgAYRaWyuP53Ptw/X1NyMo3rA3ZBdCnW3tF5JwEssWKwgPQi2wUnbtsNzLk5
 pOA5DxfJoi+aXgeXpD+6TVLXUHi+SIZFDYnJDu6CSj6lqx7edWEQOQlsUN0SrgDJTBv7
 eLmHowuMkBAi9z7E6W8UGKix2344r7XzNI+QscMl5N27mFhjfLTWUfnCd/YfEUyzN0uH
 KijrdjdGLSaHpPXIs1a6KFM+6omLmaH8W0ERQ+r1iGfFmEId46QLHxdvI35cXZcb28HS
 jeH1GcII8w+8LlM88XjQgPjjBPG57bJDx1qvNHpvrU2liwi9vW4aQvu98ZD16KACGImu
 Gbsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gV+tRrFg
Subject: Re: [Buildroot] [PATCH v2 2/2] utils/scanpypi: add flit package
 support
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Aug 3, 2022 at 3:46 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 13 Mar 2022 11:13:55 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > +def toml_load(f):
> > +    with open(f, 'rb') as fh:
> > +        ex = None
> > +
> > +        # Try regular tomli first
> > +        try:
> > +            from tomli import load
> > +            return load(fh)
> > +        except ImportError as e:
> > +            ex = e
> > +
> > +        # Try pip's vendored tomli
> > +        try:
> > +            from pip._vendor.tomli import load
> > +            try:
> > +                return load(fh)
> > +            except TypeError:
> > +                # Fallback to handle older version
> > +                try:
> > +                    fh.seek(0)
> > +                    w = io.TextIOWrapper(fh, encoding="utf8", newline="")
> > +                    return load(w)
> > +                finally:
> > +                    w.detach()
> > +        except ImportError as e:
> > +            pass
> > +
> > +        # Try regular toml last
> > +        try:
> > +            from toml import load
> > +            fh.seek(0)
> > +            w = io.TextIOWrapper(fh, encoding="utf8", newline="")
> > +            try:
> > +                return load(w)
> > +            finally:
> > +                w.detach()
> > +        except ImportError:
> > +            pass
> > +
> > +        print('This package needs tomli')
> > +        raise ex
>
> I'm confused by how "ex" gets used here. It's initially none, and it's
> set to the ImportError exception if the tomli module couldn't be used.
>
> >      def get_requirements(self, pkg_folder):
> >          """
> >          Retrieve dependencies from the metadata found in the setup.py script of
> > @@ -694,9 +767,12 @@ def main():
> >              except ImportError as err:
> >                  if 'buildutils' in str(err):
> >                      print('This package needs buildutils')
> > +                    continue
> >                  else:
> > -                    raise
> > -                continue
> > +                    try:
> > +                        package.load_pyproject()
> > +                    except Exception as e:
> > +                        raise
>
> I really don't like the construction here. We're doing this:
>
>         try:
>                 ... do an attempt with traditional setup.py ...
>         expect ImportError as err:
>                 ...
>                 try:
>                         ... do an attempt with pyproject.toml ...
>                 expect Exception as e:
>                         ...
>
> So, if get a third and then a fourth method of Python module packaging,
> we will end up with:

All new python packaging methods are supposed to contain a pyproject.toml
file per pep517 so I think we can probably defer refactoring this for now.

The only supported packaging method in the absence of a pyproject.toml
will be setuptools(distutils is effectively being moved inside of setuptools
to avoid breaking older packages that are not migrated to setuptools, so
once distutils is removed from python our current distutils packages will
need to be moved to setuptools infrastructure, but that should more or
less just work automatically).

>
>         try:
>                 ... do an attempt with traditional setup.py ...
>         expect ImportError as err:
>                 ...
>                 try:
>                         ... do an attempt with pyproject.toml ...
>                 expect Exception as e:
>                         ...
>                         try:
>                                 ... do an attempt with another method
>                         except:
>                                 try:
>                                         ... do an attempt with another method
>                                 except:
>
> Clearly ugly. Can we have a better construct? I would know how to do
> that in C, but I'm not very good at Python-ic constructs.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

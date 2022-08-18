Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84751C3F6B0
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 08:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5EA741BAE;
	Thu, 18 Aug 2022 08:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5EA741BAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ypUICunfH6uH; Thu, 18 Aug 2022 08:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13A3041B9B;
	Thu, 18 Aug 2022 08:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13A3041B9B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10F4B1BF2AA
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 08:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E703641B9B
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 08:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E703641B9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A9AWxHfoKtZA for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 08:32:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 066EC41B97
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 066EC41B97
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 08:32:46 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 73so755969pgb.9
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 01:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=nHVgg0c4CiMfZt/3yU6sjqRGcU55zq9pTCVAI9zoob8=;
 b=x4VYhKBzRPrctFfE+o7YgeSrVYgNHvyal1QVkc3X5wm20kSqIRaa8hVg5DXek7l5S6
 p8BuNi2QjqU1xnZAF4NAG0WSr6xijMq9fzvJx9L3Epo0I+hNgb+rwKmZxf75LJ9N2oNJ
 h2AHVwSIWYUj+QV0ySvJVd879ytik55GmVqIFhbzOG1WeH2Oe+9auOrhD8iuCdwc7LHj
 JUZGxQLKIAGgcd9hceGkuvF5vZBYb5O4JyDzGnnSYuD5sfOungKmkP3waJlDwd9fTkbQ
 eANjkOCVgU9NqAnKV0WSj1p+4ya3+xwVcZmw/69gUIdEXb0rQ9e9z9KwOAyK44uOjvPm
 qPTA==
X-Gm-Message-State: ACgBeo183edNyLtxQScMXAdlkZfp8UNcO1D8wDG/CCzwsS0ZDCcITTkw
 NG6UIPcnA9VMhQQvpz/drsvTlQTW5XW6UnoSJ7yxbIV7IhA=
X-Google-Smtp-Source: AA6agR4K23XaLcaMFyEXNtI+FqshoSLs23WVcxR1pOxQ0JtuaKeZvlMtjCb/83WWJjfMLDoCQhDaYJPBX0xXpak0YOM=
X-Received: by 2002:a63:fb4a:0:b0:429:8605:6ebf with SMTP id
 w10-20020a63fb4a000000b0042986056ebfmr1661155pgj.225.1660811566269; Thu, 18
 Aug 2022 01:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220313171355.271345-1-james.hilliard1@gmail.com>
 <20220313171355.271345-2-james.hilliard1@gmail.com>
 <d907e04c-19f2-e313-078a-149e122a0011@othermo.de>
 <CADvTj4qpFazoyE1g6nwXT226DTWOca4GQ_AqgrpAYPr8vwebmw@mail.gmail.com>
 <c9212a55-e320-7b0b-4b56-e8998ae9829d@othermo.de>
In-Reply-To: <c9212a55-e320-7b0b-4b56-e8998ae9829d@othermo.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 18 Aug 2022 02:32:33 -0600
Message-ID: <CADvTj4qFYe3GA2x7Nx65bDo+qQqFbN7TF8MYJCHS5xqRVy+h9g@mail.gmail.com>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=nHVgg0c4CiMfZt/3yU6sjqRGcU55zq9pTCVAI9zoob8=;
 b=bllL6nHIlWaVk3u7PQ0cIfvOBqTfX3Wc3o8XUlfbh93sY+o33MNg5+bq3B0WsB/9qk
 OloM0SfeAwMf2QUBayo7Sen9C7cGJMbk7JQST7yzYhJVEsakS0DnAJcJN7m1qFlGztyn
 crkHxDhxfWTgDbsho2l5UwQBgi0Oj8XfbMofK1app5kQdFeMuubh9RTy6L6kWKcoytZY
 KWpZUIcCk696YFkwA16AMHlqwC+NKwzkBdtFxWUETaAw23Vo2sS8pyW1oEd74aE0eKmh
 c9nYj8jitU62BK502FJkm21gsTwBwo9yuzG8ioPbFUoUdhBqHOvUsIfeKoeT2amsOY4L
 E9Kw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bllL6nHI
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Aug 17, 2022 at 8:24 AM Marcus Hoffmann
<marcus.hoffmann@othermo.de> wrote:
>
> Hi,
>
> On 17.08.22 07:56, James Hilliard wrote:
> > On Tue, Aug 16, 2022 at 6:48 PM Marcus Hoffmann
> > <marcus.hoffmann@othermo.de> wrote:
> >>
>
> [...]
>
> >> Couldn't we just try to use tomli or error out with this message and be
> >> done with it? Surely users of this script would know how to get tomli
> >> for their python install?
> >
> > I mean, we could...but this greatly increases the probability of things
> > working without having to install additional libraries(as most users will at
> > least have pip already).
> >
> >>
> >> (For what it's worth python 3.11 will ship with a copy of tomli under
> >> the tomllib module, so we could probably try using that and otherwise
> >> fall back to requiring tomli)
> >
> > We'll want to add that once python 3.11 is released, but this should work
> > reasonably reliably for now.
> >
>
> I'm not a fan of trying to use internal modules of pip, but also not a
> big deal *shrug*.

Yeah, it's literally just pip's vendored tomli so shouldn't cause issues,
pip is pretty always present in system wide python installs while the
unvendored tomli is not.

>
> >>
> >>> +
> >>>
> >>>    def setup_decorator(func, method):
> >>>        """
> >>> @@ -316,6 +358,37 @@ class BuildrootPackage():
> >>>                os.chdir(current_dir)
> >>>                sys.path.remove(self.tmp_extract)
> >>>
> >>> +    def load_pyproject(self):
> >>> +        """
> >>> +        Loads the corresponding pyproject.toml and store its metadata
> >>> +        """
> >>> +        current_dir = os.getcwd()
> >>> +        os.chdir(self.tmp_extract)
> >>> +        sys.path.insert(0, self.tmp_extract)
> >>> +        try:
> >>> +            pyproject_data = toml_load('pyproject.toml')
> >>> +            try:
> >>> +                self.setup_metadata = pyproject_data.get('project', {})
> >>> +                self.metadata_name = self.setup_metadata.get('name', self.real_name)
> >>> +                build_system = pyproject_data.get('build-system', {})
> >>> +                build_backend = build_system.get('build-backend', None)
> >>> +                if build_backend is not None and build_backend == 'flit_core.buildapi':
> >>
> >> This doesn't catch the very common case of having a pyproject.toml which
> >> requests the setuptools build backend via build-backend =
> >> "setuptools.build_meta"
> >
> > Yes, this doesn't touch setuptools at the moment, that does need some
> > cleanup but IMO best to deal with that after this is merged.
> >
> >>
> >> These projects could alternatively be built via the setuptools frontend
> >> iff they ship with a (stub) setup.py file but it seems better to just
> >> build them via pep517 anyway, right?
> >
> > Well there are currently blockers in regards to migrating out setuptools
> > infrastructure to use pep517 builds, see details:
> > https://github.com/buildroot/buildroot/commit/4686fb32a053753f502e24c5cd980db5b71f6a2c
> >
>
> Thanks, that greatly helped me understand the status quo around
> setuptools/pep517 support in builroot :).
>
> >>
>
> [...]
>
> >>
> >>> +                    self.setup_metadata['method'] = 'flit'
> >>> +                elif build_system.get('backend-path', None) is not None:
> >>> +                    self.setup_metadata['method'] = 'pep517' > +                else:
> >>> +                    self.setup_metadata['method'] = 'unknown'
> >>
> >> We are still missing reading out the dependencies for the pyproject.toml
> >> case, right? Dependencies are currently expected to be in the
> >> "install_requires" key in the metadata, but in the new world they are
> >> under 'dependencies'. Easiest would be copying them over right here. The
> >> format of those dependency specifications seems to be the same. (There's
> >> also the old-style flit metadata[1] that i.e. fastapi[2] uses for
> >> dependency specifications, but I don't think that's worth supporting; We
> >> also don't handle requirements.txt or setup.cfg *shrug*)
> >
> > Yeah, I'm aware this isn't handling a number of things like dependencies
> > yet.
>
> That should probably be at least noted in the commit message. Or just
> added to the next revision here.

Added in v3:
https://patchwork.ozlabs.org/project/buildroot/patch/20220818082617.24624-1-james.hilliard1@gmail.com/

>
> Adding the following line just makes it work for now, even if that maybe
> isn't an ideal solution:
>
>  > self.setup_metadata['install_requires'] =
> self.setup_metadata.get('dependencies', [])

I'm thinking it may be possible to hook a pep517 function like:
get_requires_for_build_sdist(config_settings=None)
https://peps.python.org/pep-0517/#get-requires-for-build-sdist

This might also be usable with setuptools dependency resolution as well.

I'll try and look into this in more detail after initial flit support is merged.

>
>
> >
> >>
> >>> +            except KeyError:
> >>> +                # This means setup was not called
> >>
> >> This comment is wrong here, I believe.
> >
> > Yeah, I'll remove that.
> >
> >>
> >>> +                print('ERROR: Could not determine package metadata for {pkg}.\n'
> >>> +                      .format(pkg=self.real_name))
> >>> +                raise
> >>> +        except FileNotFoundError:
> >>> +            raise
> >>> +        finally:
> >>> +            os.chdir(current_dir)
> >>> +            sys.path.remove(self.tmp_extract)
> >>> +
> >>>        def get_requirements(self, pkg_folder):
> >>>            """
> >>>            Retrieve dependencies from the metadata found in the setup.py script of
> >>> @@ -694,9 +767,12 @@ def main():
> >>>                except ImportError as err:
> >>>                    if 'buildutils' in str(err):
> >>>                        print('This package needs buildutils')
> >>> +                    continue
> >>>                    else:
> >>> -                    raise
> >>> -                continue
> >>> +                    try:
> >>> +                        package.load_pyproject()
> >>> +                    except Exception as e:
> >>> +                        raise
> >>>                except (AttributeError, KeyError) as error:
> >>>                    print('Error: Could not install package {pkg}: {error}'.format(
> >>>                        pkg=package.real_name, error=error))
> >>
> >> One other thing we'd need to handle here is packages which now ship with
> >> just a stub setup.py file, i.e. [3]. Those will trigger one
> >> AttributeError, KeyError and we should in that case just continue on
> >> with parsing the pyproject.toml.
> >
> > Yeah, setuptools support def needs some cleanup, was waiting for flit support
> > to be merged before working on that
>
> Right, that can happen later.
>
> [...]
>
> Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

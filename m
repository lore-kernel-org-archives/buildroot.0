Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A285C4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 18:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F016060BFC;
	Mon, 28 Nov 2022 18:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F016060BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ey6dhF68q5C6; Mon, 28 Nov 2022 18:29:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24D5D60B92;
	Mon, 28 Nov 2022 18:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24D5D60B92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39AF11BF377
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 18:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1284F60B92
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 18:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1284F60B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ug9K4W-Nl5iB for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 18:29:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E789605AD
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E789605AD
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 18:29:04 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so14869575pjc.3
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 10:29:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x3o4tYTlCM8c+lLfxYe0tCr7Zmrvz5KdDApQj/5wnDE=;
 b=HKANKWNs16bevk40tZMx/C0uml/mvWAVoVN9e6Il4rxKh/Fv54ywb2J2E2XOmDDImq
 BlD6k+aHIa37uHUzcB88+Jv7lJJSfJYYJ3B4KzdjnM565vGUpb4Wlr+o7CjhLou5V+GZ
 HKpptdHbeKFgAQsUbUeO7h/MeGV22tEnsvIjIKPs1GM48JeHX51vcNB/7FLNJAy0mrB5
 wCb7alH2sGq+yX1yK9kiGA2EBhldzdk4tqlSJ5xJBa6nmiRt/mwNSeJBqjGMhknuMm+f
 0VqpUanVyaPBFGLamlWlVsMVK84HC4UytGOWMRDJqQ2XaPIULddhqAFgsNPXBOIBQytt
 Y1mw==
X-Gm-Message-State: ANoB5pnH+Nk4wkgrWb1S2M9aOIfB/fkt2xdh6lggOU+rGjN44NDEPnAL
 onBxMA55O9FhFiBCVi0zno1xy/IVv2/Op2tNUBH9dsLkOSSm6g==
X-Google-Smtp-Source: AA0mqf5zUiHRyU6QcHw02MDWj6a6brBUs33/GfcinYDVY57XhMBy6gG7f24HKBaywYgwLY2mQMrcKbMnDohxvPMdBmU=
X-Received: by 2002:a17:90a:6308:b0:218:ce1c:4c76 with SMTP id
 e8-20020a17090a630800b00218ce1c4c76mr33321824pjj.97.1669660144283; Mon, 28
 Nov 2022 10:29:04 -0800 (PST)
MIME-Version: 1.0
References: <20220818082617.24624-1-james.hilliard1@gmail.com>
 <CAGm1_ktF6G7qP26_5f5dNWJy7Qs+GD-anbS4x4wiiYCWbhUU6A@mail.gmail.com>
In-Reply-To: <CAGm1_ktF6G7qP26_5f5dNWJy7Qs+GD-anbS4x4wiiYCWbhUU6A@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 28 Nov 2022 14:28:52 -0400
Message-ID: <CADvTj4q3r8BFKUwoycw6YtU4Rvzc3_Lc5DqM-mNMYH7x0MCq_g@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x3o4tYTlCM8c+lLfxYe0tCr7Zmrvz5KdDApQj/5wnDE=;
 b=J0P+g3JdXv+K+dAA5N1wN1RFv82JaYKzebXRaB0l18iceex35MBsTsx3n18d6iMlnS
 xlf5rGsnIVLorPoPyuVdHbeLC5gxhWxti3Ppz8Cj4OkWO7gAp/Qp6lb3z9OpQEBD49x2
 A1c3Hhzqf3mAKsxhO2j3RKlRuQGZQCNvJaWTQ8g/AtL65M5qQToep29elHsvYbm3l+/4
 s+XSHg3IGt1Ez4KPDpK7eyr5wLBnITJvRFgCakjma6ZkEXpL3DHTh0XZy/jgOMF35uV4
 BPXaU29bLMG9UQhiy6s0spNNYY+gXmjTz53plGxNVTvetHkRBH8q9rQpuElBLdnVnpPl
 anwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=J0P+g3Jd
Subject: Re: [Buildroot] [PATCH v3 1/1] utils/scanpypi: add flit package
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

On Mon, Nov 28, 2022 at 2:40 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> Hi James,
>
> On Thu, Aug 18, 2022 at 10:26 AM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > These packages don't have a setup.py so we instead need to parse their
> > pyproject.toml file.
> >
> > Note that this currently doesn't handle flit package dependency
> > resolution.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v2 -> v3:
> >   - minor cleanup
> >   - rebase
> >   - more detailed  commit log
> > Changes v1 -> v2:
> >   - remove homepage format fixes(sent as separate patch)
> >   - remove load_setup fixes
> > ---
> >  utils/scanpypi | 78 ++++++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 76 insertions(+), 2 deletions(-)
> >
> > diff --git a/utils/scanpypi b/utils/scanpypi
> > index 452b4a3fc3..bce7c01494 100755
> > --- a/utils/scanpypi
> > +++ b/utils/scanpypi
> > @@ -42,6 +42,48 @@ except ImportError:
> >            'pip install spdx_lookup')
> >      liclookup = None
> >
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
> > +
> >
> >  def setup_decorator(func, method):
> >      """
> > @@ -316,6 +358,35 @@ class BuildrootPackage():
> >              os.chdir(current_dir)
> >              sys.path.remove(self.tmp_extract)
> >
> > +    def load_pyproject(self):
> > +        """
> > +        Loads the corresponding pyproject.toml and store its metadata
> > +        """
> > +        current_dir = os.getcwd()
> > +        os.chdir(self.tmp_extract)
> > +        sys.path.insert(0, self.tmp_extract)
> > +        try:
> > +            pyproject_data = toml_load('pyproject.toml')
> > +            try:
> > +                self.setup_metadata = pyproject_data.get('project', {})
> > +                self.metadata_name = self.setup_metadata.get('name', self.real_name)
> > +                build_system = pyproject_data.get('build-system', {})
> > +                build_backend = build_system.get('build-backend', None)
> > +                if build_backend is not None and build_backend == 'flit_core.buildapi':
>
> What about using the bool interpretation of None?
>                      if build_backend and build_backend == 'flit_core.buildapi':

Sure, changed to that style in v4:
https://patchwork.ozlabs.org/project/buildroot/patch/20221128182304.1915237-1-james.hilliard1@gmail.com/

>
> > +                    self.setup_metadata['method'] = 'flit'
> > +                elif build_system.get('backend-path', None) is not None:
> > +                    self.setup_metadata['method'] = 'pep517'
>
> What about detecting "setuptools"?
>                     elif 'setuptools.build_meta' in build_backend:
>                          self.setup_metadata['method'] = 'setuptools'
>
> See [1] for the reference.
>
> [1] https://github.com/pythongssapi/python-gssapi/blob/main/pyproject.toml#L6

We already try to use setuptools before pep517/pyproject.toml, there's some
issues there still but I was waiting for this to get merged before looking into
that in more detail, I don't think searching for setuptools from pyproject.toml
is likely to be all that helpful since setuptools is the implicit fallback when
pyproject.toml is not present in a pypi package anyways.

>
> Regards,
> Yegor
>
> > +                else:
> > +                    self.setup_metadata['method'] = 'unknown'
> > +            except KeyError:
> > +                print('ERROR: Could not determine package metadata for {pkg}.\n'
> > +                      .format(pkg=self.real_name))
> > +                raise
> > +        except FileNotFoundError:
> > +            raise
> > +        os.chdir(current_dir)
> > +        sys.path.remove(self.tmp_extract)
> > +
> >      def get_requirements(self, pkg_folder):
> >          """
> >          Retrieve dependencies from the metadata found in the setup.py script of
> > @@ -699,9 +770,12 @@ def main():
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
> >              except (AttributeError, KeyError) as error:
> >                  print('Error: Could not install package {pkg}: {error}'.format(
> >                      pkg=package.real_name, error=error))
> > --
> > 2.34.1
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

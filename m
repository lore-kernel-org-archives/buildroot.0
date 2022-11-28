Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FD3C433FE
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 06:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EBBE60B11;
	Mon, 28 Nov 2022 06:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EBBE60B11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id McVpJOTUadNs; Mon, 28 Nov 2022 06:40:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A028E60ADD;
	Mon, 28 Nov 2022 06:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A028E60ADD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C413D1BF3F9
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 06:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DD0840292
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 06:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DD0840292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIzHH1IJHXEe for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 06:40:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 785144018E
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 785144018E
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 06:40:53 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-381662c78a9so95955177b3.7
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 22:40:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JBtvqhO5mTb/qskNT6QGOHJqi7VjFACSJfLDu2dBhoM=;
 b=pGlRayI6YFzOjkELdua8tJ2DtS/tKAcDd8q3zJht+ddwphqftWO/PvWq1v3Sr+lma1
 48uxaH9fri7ASlGR0dk9bRXzxRD0OBAON++XQk+7CSL0+jKLWns1ezaBfYClYCpK/jgV
 jpKiIM2DsdiccYdOV184M7U1ghEF7lqO/MKTY6hb5sx583Jk60H8+tQ1yQQqAQ20aMUK
 jzY9cgH97iOp+ZD5ZlkZIOinwL8ODmqviorcwJYW9cJwGfFCDDHzwzYXooKvxp1+Z1nt
 pR7UOhbD0+7ma6U3J/FZ3ZUESy47FDCw1sMGdddXuo5LKPDuvnEVK67iM014nxBSofwk
 oFLQ==
X-Gm-Message-State: ANoB5pk2KllAVOO5B7QVFF5ACg1Mdo7mjh1fXLtB1KXMG4sZNPEoyBJc
 G7ciVDf3UpJ4ZxqDntsxUF4Ccg570mkA/x2teVQ=
X-Google-Smtp-Source: AA0mqf75g4Yqj1Cw3uvM7nQeCyLk6Ayc5ml/g04Jp9bYJl931Jkd+fz020JSuJRcnxrCCPGQZl5eh2MelNb1u+teRoc=
X-Received: by 2002:a0d:f1c1:0:b0:35b:c180:d44c with SMTP id
 a184-20020a0df1c1000000b0035bc180d44cmr46654082ywf.153.1669617652150; Sun, 27
 Nov 2022 22:40:52 -0800 (PST)
MIME-Version: 1.0
References: <20220818082617.24624-1-james.hilliard1@gmail.com>
In-Reply-To: <20220818082617.24624-1-james.hilliard1@gmail.com>
Date: Mon, 28 Nov 2022 07:40:40 +0100
Message-ID: <CAGm1_ktF6G7qP26_5f5dNWJy7Qs+GD-anbS4x4wiiYCWbhUU6A@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JBtvqhO5mTb/qskNT6QGOHJqi7VjFACSJfLDu2dBhoM=;
 b=X/7rGcJKWmnaT5zS4wHcvtcuKDfd2QQAf/1YVKy09VrIFkECTc3YX3x78uf8R8pi7O
 R6tQg8E7hvEURG5zIY59aLd8RMT5P+B+OShkJq3SXYKNa/x6f4Q6vSkcZGWHUDvMsB0g
 n61sGkkpn+GMlyIIIZi26WRSFeFq4Tm9mpaLqv0GpMhTYGBFji6UPjDNrUmZDhq0Hw6/
 WaaN55Vdmb8YyzhF418AFH+OHjd9XsKa2k4a7upuJ/UiblYQU41auHpWUa6nNQ4hykyK
 JKws0YgelGWmZJqPyRKivq2GyJtF7EI1m0suJY0nMinNLI24+k87nfzefK6nJbg16iLa
 SYXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=X/7rGcJK
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On Thu, Aug 18, 2022 at 10:26 AM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> These packages don't have a setup.py so we instead need to parse their
> pyproject.toml file.
>
> Note that this currently doesn't handle flit package dependency
> resolution.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v2 -> v3:
>   - minor cleanup
>   - rebase
>   - more detailed  commit log
> Changes v1 -> v2:
>   - remove homepage format fixes(sent as separate patch)
>   - remove load_setup fixes
> ---
>  utils/scanpypi | 78 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 76 insertions(+), 2 deletions(-)
>
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 452b4a3fc3..bce7c01494 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -42,6 +42,48 @@ except ImportError:
>            'pip install spdx_lookup')
>      liclookup = None
>
> +def toml_load(f):
> +    with open(f, 'rb') as fh:
> +        ex = None
> +
> +        # Try regular tomli first
> +        try:
> +            from tomli import load
> +            return load(fh)
> +        except ImportError as e:
> +            ex = e
> +
> +        # Try pip's vendored tomli
> +        try:
> +            from pip._vendor.tomli import load
> +            try:
> +                return load(fh)
> +            except TypeError:
> +                # Fallback to handle older version
> +                try:
> +                    fh.seek(0)
> +                    w = io.TextIOWrapper(fh, encoding="utf8", newline="")
> +                    return load(w)
> +                finally:
> +                    w.detach()
> +        except ImportError as e:
> +            pass
> +
> +        # Try regular toml last
> +        try:
> +            from toml import load
> +            fh.seek(0)
> +            w = io.TextIOWrapper(fh, encoding="utf8", newline="")
> +            try:
> +                return load(w)
> +            finally:
> +                w.detach()
> +        except ImportError:
> +            pass
> +
> +        print('This package needs tomli')
> +        raise ex
> +
>
>  def setup_decorator(func, method):
>      """
> @@ -316,6 +358,35 @@ class BuildrootPackage():
>              os.chdir(current_dir)
>              sys.path.remove(self.tmp_extract)
>
> +    def load_pyproject(self):
> +        """
> +        Loads the corresponding pyproject.toml and store its metadata
> +        """
> +        current_dir = os.getcwd()
> +        os.chdir(self.tmp_extract)
> +        sys.path.insert(0, self.tmp_extract)
> +        try:
> +            pyproject_data = toml_load('pyproject.toml')
> +            try:
> +                self.setup_metadata = pyproject_data.get('project', {})
> +                self.metadata_name = self.setup_metadata.get('name', self.real_name)
> +                build_system = pyproject_data.get('build-system', {})
> +                build_backend = build_system.get('build-backend', None)
> +                if build_backend is not None and build_backend == 'flit_core.buildapi':

What about using the bool interpretation of None?
                     if build_backend and build_backend == 'flit_core.buildapi':

> +                    self.setup_metadata['method'] = 'flit'
> +                elif build_system.get('backend-path', None) is not None:
> +                    self.setup_metadata['method'] = 'pep517'

What about detecting "setuptools"?
                    elif 'setuptools.build_meta' in build_backend:
                         self.setup_metadata['method'] = 'setuptools'

See [1] for the reference.

[1] https://github.com/pythongssapi/python-gssapi/blob/main/pyproject.toml#L6

Regards,
Yegor

> +                else:
> +                    self.setup_metadata['method'] = 'unknown'
> +            except KeyError:
> +                print('ERROR: Could not determine package metadata for {pkg}.\n'
> +                      .format(pkg=self.real_name))
> +                raise
> +        except FileNotFoundError:
> +            raise
> +        os.chdir(current_dir)
> +        sys.path.remove(self.tmp_extract)
> +
>      def get_requirements(self, pkg_folder):
>          """
>          Retrieve dependencies from the metadata found in the setup.py script of
> @@ -699,9 +770,12 @@ def main():
>              except ImportError as err:
>                  if 'buildutils' in str(err):
>                      print('This package needs buildutils')
> +                    continue
>                  else:
> -                    raise
> -                continue
> +                    try:
> +                        package.load_pyproject()
> +                    except Exception as e:
> +                        raise
>              except (AttributeError, KeyError) as error:
>                  print('Error: Could not install package {pkg}: {error}'.format(
>                      pkg=package.real_name, error=error))
> --
> 2.34.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

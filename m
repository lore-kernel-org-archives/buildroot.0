Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3CEC4321E
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 20:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E1B081323;
	Mon, 28 Nov 2022 20:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E1B081323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g0chcHSXiR_l; Mon, 28 Nov 2022 20:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4161080BA4;
	Mon, 28 Nov 2022 20:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4161080BA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C82CA1BF2B8
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 20:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A36C580BA4
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 20:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A36C580BA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mlrjaFdQs8fT for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 20:19:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C824B80BA0
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C824B80BA0
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 20:19:12 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3c21d6e2f3aso57465157b3.10
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 12:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6BknKOzDqwuyu/phjIgHJZzMhdlSIfMXoIY4S5+NkvY=;
 b=dOS5LUQJi1O2PlOHRZPad7hrG2C9sXdErzDOybGbtcUnN7RhDE4OWi020JWtd3Tcr0
 2pUUK9p05nOshFsAOWn7EZJmOD1RRq4mkR0RxW9VKMxJ7yCWwUvMM+D279h55sxA/Nz0
 VIpVtw2eFlEhjOSYdcSXJuEBJ1s11O3KGVE+35mUtdicOaXev394s1kR+ApAIer9c+Mn
 azIQli+uNgOkiZulVmepoz4XMEIy9/hwChXr+GICfUstJoFwaOJlW/cRe1cRKZmPHDml
 n1EogBS8OnM3bHRYOIVGkpwm8KqUZlQDEt4HTNSCjf8UowdzlO0jN53xLYTHVYrCRqN3
 8gcA==
X-Gm-Message-State: ANoB5pk0t+2g1MkrH8sGbPd24mY4ZDg5V0402fcfBG51e0Ju4IT+q4Zq
 xnKC+LjkFgWmbOc+spJnkSysjDyAsoq9523ebJBJXh6yH6E=
X-Google-Smtp-Source: AA0mqf5rRnIPubGHUDCavT7ty1JTCjhu00L+zBlLcQAzg/VC741KUpBn0KM6IkCKNll6j5xPGDD1wUxamISPhODNaxg=
X-Received: by 2002:a0d:ca14:0:b0:3ca:81e2:cf21 with SMTP id
 m20-20020a0dca14000000b003ca81e2cf21mr4307609ywd.13.1669666751460; Mon, 28
 Nov 2022 12:19:11 -0800 (PST)
MIME-Version: 1.0
References: <20221128183230.1915592-1-james.hilliard1@gmail.com>
In-Reply-To: <20221128183230.1915592-1-james.hilliard1@gmail.com>
Date: Mon, 28 Nov 2022 21:19:00 +0100
Message-ID: <CAGm1_kto2Czos5a5o4cMT6Ux0mbptNgU43Doh10C2qDhQnxcAw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6BknKOzDqwuyu/phjIgHJZzMhdlSIfMXoIY4S5+NkvY=;
 b=gv+jmH+J8X9r1/IiR0s5jPwRGzJg9UGTp49hrserrU2eJ2jz9zMxmhvAqylYv3oYXv
 BpNpwWqNk/H8kwVuuO5TqNnnwwwz5ua0LiD9HgOUZa0WNTmON3nq343mc6LQVIp3FT1e
 tCE7oh7khuBUlh9fKIEgYlCtTdxvwcBDozBjocrCv6Vz73sg9nzBVRnECd9xS7ydjAUk
 y+GwFcZ30m5DgM7rqfIe3guCwLICGNa0AO4jhtm+tuJNGntm0raQ1AUbNRtr8eTz7ktr
 cQsTn03Q6z6oNE33DMgq+oqLt4OTkmW4RyP00A26g/Ch/sFRODBrMCrTWj24CE232iGH
 V8BA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gv+jmH+J
Subject: Re: [Buildroot] [PATCH v5 1/1] utils/scanpypi: add flit package
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

On Mon, Nov 28, 2022 at 7:32 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> These packages don't have a setup.py so we instead need to parse their
> pyproject.toml file.
>
> Note that this currently doesn't handle flit package dependency
> resolution.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
> Changes v4 -> v5:
>   - remove unnecessary "as e" from tomlib exception path
> Changes v3 -> v4:
>   - prefer/support python3.11 tomllib
>   - use bool interpretation for None
> Changes v2 -> v3:
>   - minor cleanup
>   - rebase
>   - more detailed  commit log
> Changes v1 -> v2:
>   - remove homepage format fixes(sent as separate patch)
>   - remove load_setup fixes
> ---
>  utils/scanpypi | 85 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 83 insertions(+), 2 deletions(-)
>
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 3c98bb4bcc..79c5db8a5f 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -42,6 +42,55 @@ except ImportError:
>            'pip install spdx_lookup')
>      liclookup = None
>
> +def toml_load(f):
> +    with open(f, 'rb') as fh:
> +        ex = None
> +
> +        # Try standard library tomllib first
> +        try:
> +            from tomllib import load
> +            return load(fh)
> +        except ImportError:
> +            pass
> +
> +        # Try regular tomli next
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
> @@ -316,6 +365,35 @@ class BuildrootPackage():
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
> +                if build_backend and build_backend == 'flit_core.buildapi':
> +                    self.setup_metadata['method'] = 'flit'
> +                elif build_system.get('backend-path', None):
> +                    self.setup_metadata['method'] = 'pep517'
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
> @@ -699,9 +777,12 @@ def main():
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

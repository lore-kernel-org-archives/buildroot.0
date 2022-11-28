Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97735C4321E
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 20:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ABF2813CB;
	Mon, 28 Nov 2022 20:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ABF2813CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CFG0MIcTpr-D; Mon, 28 Nov 2022 20:16:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5541A814B6;
	Mon, 28 Nov 2022 20:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5541A814B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B444B1BF2B8
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 20:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F50D409F3
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 20:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F50D409F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4w9Zau6o-rIc for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 20:16:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BB4F409EC
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BB4F409EC
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 20:16:55 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3b48b139b46so117609847b3.12
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 12:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9kimlsYKScIzeG+C+FidGFy5hHbpK5GmE5MeRr3adSk=;
 b=hlysN2onZe2nyKS8Gc1TjooSyNshRDEIu+359l/2iVghL2KP2Nj3//w62jtVptVHRJ
 VswOLY3WyOwGTTYqRa//oESWIFC8OwQgXha+r1mNYQQ+i9+l4kp7DpggMXr4BmciVmL0
 Frqqj1s8DKhNkRVnxyzLWtCfWiKRS3N7lZo/bBALZ5giIhojIi6seaum+a6pJtJb4JNB
 9o1P3YFKW75jaLzLtUldcpiY+ODxfVOLbtcWKNEaUQ24qw5+WRhSu0X2zO+OfemDk+aa
 VBQrlM/BO7/q9ml6mwPDi0dIxjW2QvquslXueD4DCBH1AZdgKFdOKqWknonaHeYrt2eW
 Co9Q==
X-Gm-Message-State: ANoB5pm9mnq89sanzRP1drir0/0o3iK9PQkM1RhMDOQPU4PmEKDZfqur
 /hm7JlnZmtbr3rlCSLXVIx4+s+8xOyn4ucdhXs/9cO/RwJY=
X-Google-Smtp-Source: AA0mqf7rqi7uD8LniyHeUdjjds0Vk/nS2eQiWMDEBDLCcPic7QIjQ751r5ZsM2dPwf7UYpo9izY0cNISna7gmfkk3vo=
X-Received: by 2002:a81:8a05:0:b0:381:49e8:aad4 with SMTP id
 a5-20020a818a05000000b0038149e8aad4mr50229797ywg.495.1669666613953; Mon, 28
 Nov 2022 12:16:53 -0800 (PST)
MIME-Version: 1.0
References: <20221128182304.1915237-1-james.hilliard1@gmail.com>
In-Reply-To: <20221128182304.1915237-1-james.hilliard1@gmail.com>
Date: Mon, 28 Nov 2022 21:16:42 +0100
Message-ID: <CAGm1_ksVj-sXAEH5ZUC88vEa-BrBOnVx6STcQOJT5EzzcsbUFQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9kimlsYKScIzeG+C+FidGFy5hHbpK5GmE5MeRr3adSk=;
 b=Z+2RmibGrfO4yH9lzHXipA2iFPbwvZv3zkP7CUu6giqIynz7QjuhnrCfYww07mL3yJ
 WD9Vlafsu4fSvqMv0vc2JIq4tTFIo0mymNNsgrNFAH5uzpuXqDxw4m9+K92vITrqcZ9A
 d78RNLa2KjMhsTSIoSfRu08H1MMhgKLoEvL4b1/+cdBv2aEl9w4a45urdDRRxoFUvDVH
 jvnhtgx95OcABQ2v3gX2yhlG8JnUm384SLPAZdKo8F8uXghHlFrTzyqPUuGx9u425knD
 Rhc8muk8xVP5OuE01MiIH2SG+OVpvh5vTd2StOY4kvMGqJ0tKDQhJjeok0JNqbJyPekT
 GJNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Z+2RmibG
Subject: Re: [Buildroot] [PATCH v4 1/1] utils/scanpypi: add flit package
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

On Mon, Nov 28, 2022 at 7:23 PM James Hilliard
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
> index 3c98bb4bcc..38f0cb91e9 100755
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
> +        except ImportError as e:
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211D8C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42BEB61480;
	Wed,  7 Feb 2024 19:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jBHk0qly7BsZ; Wed,  7 Feb 2024 19:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F231A61478
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F231A61478;
	Wed,  7 Feb 2024 19:22:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9576B1BF577
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8293A61478
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OM-pr-EriBmr for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:22:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E6CC261474
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6CC261474
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6CC261474
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:22:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D32960003;
 Wed,  7 Feb 2024 19:22:26 +0000 (UTC)
Date: Wed, 7 Feb 2024 20:22:25 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240207202225.1755a09b@windsurf>
In-Reply-To: <20231130212153.2299051-1-james.hilliard1@gmail.com>
References: <20231130212153.2299051-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707333746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WP9gGphCLdlBuyThqPC6D2Q6kSJOdkRrBQrjGH9nzYg=;
 b=FnwF7maxu6J67cP3n+abpYtq6NBf7y0Wj56rggLzGuqUbOi0vYzhzpuqhsn2dVHs6rOwRz
 n8ln+6J3PIc6k0JVA6DZjtziXAVvOYsOb9j2mhryRPJ62qM184njEQ67B2AgCR8h8Ww64l
 mjjDsd0NQzAsZRVse0RvFQK7iIDbK8KFep43Qt98vfvgEFBqONwZJL1TaZsLimS4bIDv2r
 RbHC3ax74GEVW+nCZ5wlBTUWS0fwmX/q2W5CdI2KJWPA1+m5igJFw7rZQGdbnjQeoTYDk0
 kSWQb39QH5jszSz9xXtQ4VNN7SBM38mzT0AXiSkx4itctxDs1dsPXQpzBNwSug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FnwF7max
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/scanpypi: refactor setuptools
 handling to not use imp
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Thu, 30 Nov 2023 14:21:53 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> The imp module is deprecated as of python verison 3.12.
> 
> Refactor setuptools handling to remove monkeypatching hack and
> instead do pep517 metadata generation and dependency resolution.

How does it work without monkeypatching? Why was monkeypatching needed
before and no longer needed now?

> Invert setuptools/pyproject fallback ordering so that we try
> parsing pyproject.toml files first.

What is the motivation for this particular change (inverting the order
between setuptools and pyproject)?

Also, this patch should be split into several ones, as you're really
doing several independent things, as far as I can see.

> diff --git a/utils/scanpypi b/utils/scanpypi
> index 021c99a172..9de1b5d402 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -18,8 +18,8 @@ import hashlib
>  import re
>  import textwrap
>  import tempfile
> -import imp
> -from functools import wraps
> +import importlib
> +from setuptools.build_meta import prepare_metadata_for_build_wheel

This is part of the "don't use imp / remove monkeypatching" thing if I
understand correctly.

>  import six.moves.urllib.request
>  import six.moves.urllib.error
>  import six.moves.urllib.parse
> @@ -93,32 +93,6 @@ def toml_load(f):
>          raise ex
>  
>  
> -def setup_decorator(func, method):
> -    """
> -    Decorator for distutils.core.setup and setuptools.setup.
> -    Puts the arguments with which setup is called as a dict
> -    Add key 'method' which should be either 'setuptools' or 'distutils'.
> -
> -    Keyword arguments:
> -    func -- either setuptools.setup or distutils.core.setup
> -    method -- either 'setuptools' or 'distutils'
> -    """
> -
> -    @wraps(func)
> -    def closure(*args, **kwargs):
> -        # Any python packages calls its setup function to be installed.
> -        # Argument 'name' of this setup function is the package's name
> -        BuildrootPackage.setup_args[kwargs['name']] = kwargs
> -        BuildrootPackage.setup_args[kwargs['name']]['method'] = method
> -    return closure
> -
> -# monkey patch
> -import setuptools  # noqa E402
> -setuptools.setup = setup_decorator(setuptools.setup, 'setuptools')
> -import distutils   # noqa E402
> -distutils.core.setup = setup_decorator(setuptools.setup, 'distutils')

This is part of the "don't use imp / remove monkeypatching" thing if I
understand correctly.

>  def find_file_upper_case(filenames, path='./'):
>      """
>      List generator:
> @@ -345,26 +319,18 @@ class BuildrootPackage():
>          """
>          current_dir = os.getcwd()
>          os.chdir(self.tmp_extract)
> -        sys.path.insert(0, self.tmp_extract)

Not sure to what this is related? The monkeypatching as well? The use
of imp?

>          try:
> -            s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
> -            imp.load_module('__main__', s_file, s_path, s_desc)
> -            if self.metadata_name in self.setup_args:
> -                pass
> -            elif self.metadata_name.replace('_', '-') in self.setup_args:
> -                self.metadata_name = self.metadata_name.replace('_', '-')
> -            elif self.metadata_name.replace('-', '_') in self.setup_args:
> -                self.metadata_name = self.metadata_name.replace('-', '_')
> +            metadata = prepare_metadata_for_build_wheel(self.tmp_extract)
>              try:
> -                self.setup_metadata = self.setup_args[self.metadata_name]
> -            except KeyError:
> -                # This means setup was not called
> -                print('ERROR: Could not determine package metadata for {pkg}.\n'
> -                      .format(pkg=self.real_name))
> -                raise
> +                dist = importlib.metadata.Distribution.at(metadata)
> +                self.metadata_name = dist.name
> +                self.setup_metadata = {'method': 'setuptools'}
> +                if dist.requires:
> +                    self.setup_metadata['install_requires'] = dist.requires
> +            finally:
> +                shutil.rmtree(metadata)

This is part of the "don't use imp / remove monkeypatching" thing if I
understand correctly.

>          finally:
>              os.chdir(current_dir)
> -            sys.path.remove(self.tmp_extract)
>  
>      def load_pyproject(self):
>          """
> @@ -372,7 +338,6 @@ class BuildrootPackage():
>          """
>          current_dir = os.getcwd()
>          os.chdir(self.tmp_extract)
> -        sys.path.insert(0, self.tmp_extract)
>          try:
>              pyproject_data = toml_load('pyproject.toml')
>              try:
> @@ -380,20 +345,25 @@ class BuildrootPackage():
>                  self.metadata_name = self.setup_metadata.get('name', self.real_name)
>                  build_system = pyproject_data.get('build-system', {})
>                  build_backend = build_system.get('build-backend', None)
> -                if build_backend and build_backend == 'flit_core.buildapi':
> -                    self.setup_metadata['method'] = 'flit'
> +                if build_backend:
> +                    if build_backend == 'flit_core.buildapi':
> +                        self.setup_metadata['method'] = 'flit'
> +                    elif build_backend == 'setuptools.build_meta':
> +                        raise Exception("handle setuptools")
> +                    else:
> +                        self.setup_metadata['method'] = 'unknown'

This seems more related to PEP517 handling improvements?

>                  elif build_system.get('backend-path', None):
>                      self.setup_metadata['method'] = 'pep517'
>                  else:
> -                    self.setup_metadata['method'] = 'unknown'
> +                    raise Exception("handle setuptools")

So we don't support setuptools as a PEP517 backend? I guess it was
already the case before your patch?

>              except KeyError:
>                  print('ERROR: Could not determine package metadata for {pkg}.\n'
>                        .format(pkg=self.real_name))
>                  raise
>          except FileNotFoundError:
>              raise
> -        os.chdir(current_dir)
> -        sys.path.remove(self.tmp_extract)

Related to what?

> +        finally:
> +            os.chdir(current_dir)
>  
>      def get_requirements(self, pkg_folder):
>          """
> @@ -778,15 +748,15 @@ def main():
>  
>              # Loading the package install info from the package
>              try:
> -                package.load_setup()
> -            except ImportError as err:
> -                if 'buildutils' in str(err):
> -                    print('This package needs buildutils')
> -                    continue
> -                else:
> -                    try:
> -                        package.load_pyproject()
> -                    except Exception:
> +                package.load_pyproject()
> +            except Exception:
> +                try:
> +                    package.load_setup()
> +                except ImportError as err:
> +                    if 'buildutils' in str(err):
> +                        print('This package needs buildutils')
> +                        continue
> +                    else:

This is a separate change, about the ordering between .load_setup() and
.load_pyproject().

Could you split this useful patch into smaller chunks, with a better
justification for each chunk?

Believe me, if you do this, patches like this will be merged, much,
much, much faster.

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 03 Jun 2018 01:50:05 -0300
Subject: [Buildroot] [PATCH 4/4] support/docker: use the distro-provided
 flake8
References: <ff32083db8641c38fa6d02f731870583b24c4dab.1527977964.git.yann.morin.1998@free.fr>
Message-ID: <5b13737d81720_208c3fee360b101c5315@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+ Thomas DS, who first mentioned flake8 in the mailing list.

On Sat, Jun 02, 2018 at 07:19 PM, Yann E. MORIN wrote:

> Currently, we install flake8 and its dependencies via pip. We
> tried to be reproducible by pinning the version of those python
> packages, but we did forget quite a few of them, and thus some
> dependencies for flake8 are installed as uncontrolled versions.
> 
> Furthermore, before we install flake8 and its dependencies, we
> forcibly update pip, setuptools, and wheels packages to their
> latest versions. This explicitly breaks reproducibility.

Sorry about this mess, created in:
"14aa15a5a5 support/dockerfile: install flake8"

> 
> While we could enforce a specific version of all those packages
> and still grab them from PyPI, we can simply grab them from the
> distribution-provided packages instead.
> 
> Since we're using a pinned versiomn of stretch, this already

s/versiomn/version/

> guarantees we'll reproducibily get the same versions over and

s/reproducibily/reproducibly/

> over again. Besides, we just need to list flake8 as a package to
> install to automatically get all its dependencies (again, in a
> reproducible way).

IMO it would be good to explicitly state here that this patch actually
downgrades flake8.
http://lists.busybox.net/pipermail/buildroot/2018-May/222376.html

Again, in this trade-off, using this simple approach makes sense to me because:
 - we get reproducible docker images with simple and easily maintainable code
   in the dockerfile;
 - I am not aware of any serious limitation of this old version, the release
   notes for a version in the between mentions 'Dramatically improve the
   performance' but we have a limited number of scripts and running on Gitlab
   for all of them still takes less than 5 minutes;
 - we will eventually upgrade flake8 version again when we bump stretch version
   and it contains a new version of flake8.

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>  support/docker/Dockerfile | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> index 4f08a54f06..57c9ef78fa 100644
> --- a/support/docker/Dockerfile
> +++ b/support/docker/Dockerfile
> @@ -29,6 +29,7 @@ RUN apt-get install -y --no-install-recommends \
>          cpio \
>          cvs \
>          file \
> +        flake8 \

This package installs the Python3 version.
python-flake8 installs the Python2 version.

Using the Python3 version has following consequences:

1) .gitlab-ci.yml* would need to be changed, otherwise the job fails:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/72023274

2) It seems flake8 detects when the Python3 interpreter is in use and enable
more warnings (causing the need of patch 3).

It seems using the Python3 version *is* an improvement as it will reduce the
burden when migrating everything to Python3 becomes unavoidable.
And also it doesn't have a big impact as we can still keep scripts
back-compatible to Python2.6 when we want. We want that for those scripts that
can run during the build and therefore on old distros. AFAIK we only need to
use in those cases:
from __future__ import foo

*But* I think this change (starting to use the Python3 version of flake8)
belongs to a separate patch.

>          g++-multilib \
>          git \
>          libc6:i386 \
> @@ -47,14 +48,6 @@ RUN apt-get install -y --no-install-recommends \
>      apt-get -y autoremove && \
>      apt-get -y clean
>  
> -# For check-flake8
> -RUN python -m pip install --upgrade pip setuptools wheel && \

The removal of python-pip from 'apt-get install' should be done in this patch.

> -    pip install -q \
> -        flake8==3.5.0 \
> -        mccabe==0.6.1 \
> -        pycodestyle==2.3.1 \
> -        pyflakes==1.6.0
> -
>  # To be able to generate a toolchain with locales, enable one UTF-8 locale
>  RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
>      /usr/sbin/locale-gen
> -- 
> 2.14.1

So I propose these patches for a new iteration:

1) support/docker: run apt-get update and apt-get install in two RUNs
   as-is
2) support/docker: sort the list of installed packages
   without removing python-pip
3) support/docker: use the distro-provided flake8
   current patch 4, but using python-flake8 and removing python-pip

Note: you could stop on patch 3 if you want.

4) support/testing: fix python syntax
   current patch 3, fixing one more script
5) support/docker: use flake8 from Python 3
   new patch, changing python-flake8 to flake8 and changing .gitlab-ci.yml*


Regards,
Ricardo

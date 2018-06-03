From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jun 2018 09:36:27 +0200
Subject: [Buildroot] [PATCH 4/4] support/docker: use the distro-provided
 flake8
In-Reply-To: <5b13737d81720_208c3fee360b101c5315@ultri5.mail>
References: <ff32083db8641c38fa6d02f731870583b24c4dab.1527977964.git.yann.morin.1998@free.fr>
 <5b13737d81720_208c3fee360b101c5315@ultri5.mail>
Message-ID: <20180603073627.GC23330@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-06-03 01:50 -0300, Ricardo Martincoski spake thusly:
> Hello,
> 
> + Thomas DS, who first mentioned flake8 in the mailing list.
> 
> On Sat, Jun 02, 2018 at 07:19 PM, Yann E. MORIN wrote:
> 
> > Currently, we install flake8 and its dependencies via pip. We
> > tried to be reproducible by pinning the version of those python
> > packages, but we did forget quite a few of them, and thus some
> > dependencies for flake8 are installed as uncontrolled versions.
> > 
> > Furthermore, before we install flake8 and its dependencies, we
> > forcibly update pip, setuptools, and wheels packages to their
> > latest versions. This explicitly breaks reproducibility.
> 
> Sorry about this mess, created in:
> "14aa15a5a5 support/dockerfile: install flake8"

Meh, no problem, I ACKed it! ;-)

[--SNIP--]
> IMO it would be good to explicitly state here that this patch actually
> downgrades flake8.
> http://lists.busybox.net/pipermail/buildroot/2018-May/222376.html

ACK, will do.

> Again, in this trade-off, using this simple approach makes sense to me because:
>  - we get reproducible docker images with simple and easily maintainable code
>    in the dockerfile;
>  - I am not aware of any serious limitation of this old version, the release
>    notes for a version in the between mentions 'Dramatically improve the
>    performance' but we have a limited number of scripts and running on Gitlab
>    for all of them still takes less than 5 minutes;
>  - we will eventually upgrade flake8 version again when we bump stretch version
>    and it contains a new version of flake8.
> 
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> > ---
> >  support/docker/Dockerfile | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> > 
> > diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> > index 4f08a54f06..57c9ef78fa 100644
> > --- a/support/docker/Dockerfile
> > +++ b/support/docker/Dockerfile
> > @@ -29,6 +29,7 @@ RUN apt-get install -y --no-install-recommends \
> >          cpio \
> >          cvs \
> >          file \
> > +        flake8 \
> 
> This package installs the Python3 version.
> python-flake8 installs the Python2 version.

Yeah, I had noticed that, but when I just installed python-flake8, I
could not call ;flake8' at all (because presumably there was no
/usr/bin/flake8), so I was wondering how we were s'possed to use the
python2 version at all.

So I did the only sane thing I know: make it work, and let the experts
point out my mistakes during the review! Muhahaha, am I not so twisted?
:-)

And now I think I got it, see below...

> Using the Python3 version has following consequences:
> 
> 1) .gitlab-ci.yml* would need to be changed, otherwise the job fails:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/72023274

Why did we invoke flake8 via an explicit call to python, rather than
flake8 directly? Was it because we installed it from PyPI, so that it
did not install /usr/bin/flake8?

But now, I see that is exactly what we must do anyway, if we switch to
installing python-flake8 instead of flake8. Thanks! :-)

> 2) It seems flake8 detects when the Python3 interpreter is in use and enable
> more warnings (causing the need of patch 3).

Meh, as I said in an earlier reply: why does the interpreter of flake8
have an impact on the code that flake8 anlyses? So, if flake8 was
written in python42, it would aply the python42 rules to python2 and
python3 code? That's just insane... :-/

> It seems using the Python3 version *is* an improvement as it will reduce the
> burden when migrating everything to Python3 becomes unavoidable.
> And also it doesn't have a big impact as we can still keep scripts
> back-compatible to Python2.6 when we want. We want that for those scripts that
> can run during the build and therefore on old distros. AFAIK we only need to
> use in those cases:
> from __future__ import foo
> 
> *But* I think this change (starting to use the Python3 version of flake8)
> belongs to a separate patch.

ACK.

> >          g++-multilib \
> >          git \
> >          libc6:i386 \
> > @@ -47,14 +48,6 @@ RUN apt-get install -y --no-install-recommends \
> >      apt-get -y autoremove && \
> >      apt-get -y clean
> >  
> > -# For check-flake8
> > -RUN python -m pip install --upgrade pip setuptools wheel && \
> 
> The removal of python-pip from 'apt-get install' should be done in this patch.

Yup...

> > -    pip install -q \
> > -        flake8==3.5.0 \
> > -        mccabe==0.6.1 \
> > -        pycodestyle==2.3.1 \
> > -        pyflakes==1.6.0
> > -
> >  # To be able to generate a toolchain with locales, enable one UTF-8 locale
> >  RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
> >      /usr/sbin/locale-gen
> > -- 
> > 2.14.1
> 
> So I propose these patches for a new iteration:
> 
> 1) support/docker: run apt-get update and apt-get install in two RUNs
>    as-is
> 2) support/docker: sort the list of installed packages
>    without removing python-pip
> 3) support/docker: use the distro-provided flake8
>    current patch 4, but using python-flake8 and removing python-pip

ACK

> Note: you could stop on patch 3 if you want.
> 
> 4) support/testing: fix python syntax
>    current patch 3, fixing one more script

Well, this one is still interesting, because it makes the code more
future-proof anyway, but expecially makes it more homogeneous with the
rest of our code base.

> 5) support/docker: use flake8 from Python 3
>    new patch, changing python-flake8 to flake8 and changing .gitlab-ci.yml*

In the end, do we really need it? Yes, it is good to catch the legacy
exception trapping as well as the print-is-a-function change, but that
can also be caught during the reviews...

Anyway, I'll do the 5 patches, and we can apply up to whatever makes
sense.

Thanks for the reviews! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

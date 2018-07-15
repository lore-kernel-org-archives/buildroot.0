From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 15 Jul 2018 21:19:34 +0200
Subject: [Buildroot] [RFC v1 2/2] libdrm: change to meson build system
In-Reply-To: <20180714222729.00517695@windsurf>
References: <20180713205801.25976-1-ps.report@gmx.net>
 <20180713205801.25976-2-ps.report@gmx.net>
 <20180714222729.00517695@windsurf>
Message-ID: <20180715211934.0cccdb2b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 14 Jul 2018 22:27:29 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Fri, 13 Jul 2018 22:58:01 +0200, Peter Seiderer wrote:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Notes:
> >   - convertion from "LIBDRM_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'"
> >     is missing (maybe meson gets it right (?) or use LIBDRM_MESON_CFLAGS
> >     to force it)  
> 
> With all those packages migrating to meson, would it be possible to
> look at removing some dependencies from host-ninja/host-meson ? Right
> now, host-ninja forces to build a Python interpreter, either
> host-python or host-python3, and then host-meson forces to build
> host-python3.
> 
> If Ninja is compatible with both Python 2 and Python 3, why can't we
> use the system-provided Python interpreter rather than building our
> own ?
> 
> Does Meson absolutely needs a Python 3 interpreter ?

Yes, the dependency on two different Phython versions is ridiculous
for two tools working togehter...

For ninja the FAQ [1] states:

  Does Ninja support Python 3?

  Using Ninja for your project is language-agnostic. Internally Ninja uses
  Python 2 to build itself. It is my belief that systems where /usr/bin/python
  is not Python 2 are broken (given that we can't go back in time and add a
  /usr/bin/python2 on existing systems; see also this discussion).
  However, I've grudgingly accepted patches to make the code run under
  Python 3 when they're not horrifically ugly.

The other way round for meson to downgrade to Python 2 there is a
mesa patch 'meson: Build with Python 3' stating:

  Now that all the build scripts are compatible with both Python 2 and 3,
  we can flip the switch and tell Meson to use the latter.

  Since Meson already depends on Python 3 anyway, this means we don't need
  two different Python stacks to build Mesa.

> 
> Meson allows faster builds than autoconf/automake, but in practice, for
> a simple build with just a few packages, if one of them uses Meson,
> then the build is actually slower due to the need to build
> host-python3, and maybe even host-python, as that's what host-ninja
> defaults to.

My speedup for libdrm only was from 20 seconds down to 7 seconds...

Regards,
Peter

[1] https://github.com/ninja-build/ninja/wiki/FAQ
[2] https://gitlab.freedesktop.org/bochecha/mesa/commit/f024258066e310757b37c2fc31376300c72a4805

> 
> Best regards,
> 
> Thomas

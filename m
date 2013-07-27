From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 13:18:28 +0200
Subject: [Buildroot] [PATCH v2 0/3] Fix for top-level parallel make part
 1
In-Reply-To: <CAHkwnC8imHc+yWdkUeR6VdehBhpuux_xmKProHu7uFmmR50N8g@mail.gmail.com>
References: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
 <20130718113809.663c6b58@skate>
 <CAHkwnC8imHc+yWdkUeR6VdehBhpuux_xmKProHu7uFmmR50N8g@mail.gmail.com>
Message-ID: <20130727131828.0442e227@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 19 Jul 2013 17:41:42 +0200, Fabio Porcedda wrote:

> > I don't remember if we had this discussion in the past, but before
> > going down the road of supporting top-level parallel make in Buildroot,
> > I'd like to understand what is your plan to solve the most important
> > problem that top-level parallel make creates: the need to create
> > per-package sysroot, instead of the global single sysroot we have
> > today. Have you thought about this problem already? What solution do
> > you have for it?
> 
> I hadn't thought about that, thanks for pointing it out.

You're welcome. I believe that top-level parallel build is a bit like
the creation of binary packages: people initially believe that it's
fairly trivial to implement, but in reality, if you want to implement
it properly it's much more complex and maybe too complex for the KISS
principle of Buildroot.

> So before to add top-level parallel make support we must add
> per-package sysroot...
> That's a bad news for me, i was already wokring on the second part :-(
> 
> I can try to work to add per-package sysroot, but i've some doubts about that:
>  - Is per-package sysroot a desiderable feature regardless the
> top-level parallel makefile support?
>  - Is per-package an appropriate or overkill feature for buildroot?

Beyond top-level parallel support, per-package support is useful as it
ensures only the dependencies that are explicitly expressed in the
package .mk file are actually seen when building a given package. So
from a build correctness point of view, it's certainly a nice feature.

Now, whether it's overkill or not for Buildroot is hard to say. It
clearly would increase a bit the complexity of the package
infrastructure, but it's hard to guess whether this additional
complexity will be reasonable or not before doing some prototypes.

There is, however, another drawback than just complexity: build time.
With per-package sysroot, it means that for each package, you have to
create a completely new sysroot, which takes time.

> Do you know if the other build system use per-package sysroot solution
> to solve the same issue? like bitbake/os, debian, fedora, ...?

I know that Debian builds all its packages inside a chroot, in which
only the explicit Build-depends of that package are installed. So in
effect, it has per-package sysroot.

As per OpenEmbedded/Bitbake, I was told a few years ago that they were
not doing per-package sysroot, even though they are doing top-level
parallel builds, and that this was sometimes causing some spurious
failures or not completely reproducible builds. However, I haven't
verified this myself, and this statement was made some years ago, so it
may or may not longer be true.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

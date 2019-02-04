From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 10:23:49 +0100
Subject: [Buildroot] How can I install tkinter for python3 in Buildroot
 2018.11.x ?
In-Reply-To: <CAD0+TpBEcnP4yOOSqCMgQgZqgXqh+4AhEH0BCfMtvmRZJPeb2w@mail.gmail.com>
References: <CAD0+TpBEcnP4yOOSqCMgQgZqgXqh+4AhEH0BCfMtvmRZJPeb2w@mail.gmail.com>
Message-ID: <20190204102349.6355dc61@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Jan 2019 09:22:12 +0100
Fame Castle <famecastle@gmail.com> wrote:

> I already enabled the tk and tcl packages inside "make menuconfig"
> but had no luck with it. When I was using buildroot 2018.05.x, I used
> this patch:
> https://sourceforge.net/p/armadeus/code/ci/master/tree/patches/buildroot/2017.02/012-armadeus-add-tkinter-support-to-python.patch
> in order to add a configuration option to python 3 which enables me
> to include Tkinter into python3. This patch, however, has no effect
> anymore on buildroot 2018.11.x . (I already tried changing
> PYTHON_DEPENDENCIES to PYTHON3_DEPENDENCIES in the patch).
> 
> I have no idea what I should do now. Can you help me?

I have tried to solve your issue using the below patch. Unfortunately,
it triggers a circular dependency, which I'm not sure how to solve at
this point:

Recursion detected for  : fontconfig
which is a dependency of: xlib_libXft
which is a dependency of: tk
which is a dependency of: python3
which is a dependency of: util-linux
which is a dependency of: fontconfig

We've already been bitten by this sort of circular dependencies in the
past, where the dependency of util-linux on python was a problem.

Here is the patch I have used:

  https://git.bootlin.com/users/thomas-petazzoni/buildroot/commit/?h=python-tkinter&id=7698e98b592bbd724903b8f657b672ee58ef8d11

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

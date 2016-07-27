From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Jul 2016 18:24:08 +0200
Subject: [Buildroot] [PATCH v3 6/6] package/amd-catalyst-driver: Add AMD
 proprietary graphic stack support
In-Reply-To: <57986DBF.5040608@free-electrons.com>
References: <1469521290-20446-1-git-send-email-romain.perier@free-electrons.com>
 <1469521290-20446-7-git-send-email-romain.perier@free-electrons.com>
 <20160726203918.GE5925@free.fr>
 <57986DBF.5040608@free-electrons.com>
Message-ID: <20160727162408.GA5657@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-07-27 10:15 +0200, Romain Perier spake thusly:
> Le 26/07/2016 22:39, Yann E. MORIN a ?crit :
> >>+	help
> >>+	  Installs the OpenCL binary blobs and the ICD profile
> >>+	  for GPGPU computing.
> >>+
> >>+config BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE_LICENSE_GPL
> >>+	bool "fglrx module export GPL license"
> >>+	help
> >>+	  If enabled, you accept that the driver will be patched locally
> >>+	  in order to export itself as a GPL module to the Linux kernel.
> >>+	  This is required as the module uses some GPL-compatible
> >>+	  symbols. Without this fix, the module won't build properly
> >>+	  because the Linux kernel build system does not allow to link a
> >>+	  non GPL module, if this one tries to use GPL-only symbols. It
> >>+	  is worth mentioning that from a legal point of view, you are
> >>+	  most likely not allowed to redistribute such a kernel module,
> >>+	  in a pre-built form. The author and the buildroot project
> >>+	  disclaim any responsibility in case these terms are not
> >>+	  respected.
> >
> >OK, so this one is definitely a NAK from me. This is definitely not
> >acceptable. We can not go like that and just change the licensing
> >information: this is legally questionable that we even provide such an
> >option, even with the legal blurb you wrote, which is by far not
> >explicit enough either, but I won't comment on it because I argue that
> >this option should jsut go away with the code it protects.
> >
> >Instead I suggest the following:
> >
> >     config BR2_PACKAGE_AMD_CATALYST_DRIVER_MODULE
> >         bool "fglrx kernel module"
> >         depends on BR2_KERNEL_LINUX
> >         depends on whatever is needed
> >         help
> >           The kernel driver will build properly, but fail to work at
> >           runtime because it uses Linux kernel symbols exposed only to
> >           GPL-licensed modules.
> 
> 
> The problem is that without this local fix, the module *does not* build.

Whether the failure is at runtime or build-time is irrelevant to me. We
*cannot* change the licensing info. That is just *not* acceptable.

If a user wants to workaround the licensing issue, that is his own
prerogative, but we should *not* provide such a mean. We should not even
hint at the mean.

> Because the link phase does not pass. This is why I proposed something like
> that.

Yes, I do understand your motivation. This is not a technical issue, so
we can not fix it with a technical solution. :-/

> So, either you merge a package containing a module which won't build
> or you ask the user to patch manually his kernel...

And this is exactly what we should not even mention, IMHO.

So, my deepest opinion is that we should *not* have that package at all,
given that it can't build/run.

However, as Thomas said and as you will have experienced, this is not
something that is easy to package, and some people need it. We can at
least provide the recipe to build it; this is obviously not the best
solution, as it won't work out-of-the-box.

Yes, we will provide a package that cannot build and, even if it would,
would not run. No, we can't do anything about it. No, we should *not*
try to do anything about it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

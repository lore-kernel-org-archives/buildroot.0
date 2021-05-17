From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 17 May 2021 17:43:18 +0300
Subject: [Buildroot] BUG: Buildroot build environment is messing up with
 host Python scripts
In-Reply-To: <20210517115242.GT2506@scaer>
References: <YKJMZtZU0kyfknpZ@smile.fi.intel.com> <20210517115242.GT2506@scaer>
Message-ID: <YKKBBlh2jkHKzsKV@smile.fi.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 17, 2021 at 01:52:42PM +0200, Yann E. MORIN wrote:
> On 2021-05-17 13:58 +0300, Andy Shevchenko spake thusly:
> > I have a very long time ago established a script that makes adaptive proxy for
> > Git and SSH. This script is written in Python and has the following shebang:
> > 
> > 	#!/usr/bin/env python3
> > 
> > When Buildroot tries to download sources from a Git repository, the above
> > mentioned script is being called to determine if proxy is needed and what its
> > configuration. Unfortunately it seems that Buildroot build environment somehow
> > messed up with host (!) one and necessary modules for that script to work can't
> > be found. Note, the same script is working nicely with host tools (Git, SSH),
> > hence there is no issues on the host side.
> > 
> > Changing shebang to be
> > 
> > 	#!/usr/bin/python3
> > 
> > works around the problem, but the root cause is somewhere in the Buildroot.
> > We must not require to change everything user have on the host (!) side to
> > build the Buildroot. It's kinds show stopper to me. Any suggestion how to fix
> > this  quite annoying bug?
> 
> This is not really a bug per-se, and this behaviour has existed since at
> least July 2014, with commit 95a572282e (pkg-infra: move the git download
> helper to a script), since then the git download is done with the extra
> environment defined in EXTRA_ENV, and namely:
> 
>     EXTRA_ENV = PATH=$(BR_PATH) [....]
> 
> and where:
> 
>     BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
> 
> So, this is not a new behaviour in 2021.02, but most probably you
> previously did not have host-python3 built as part of your
> configuraiton, and now it is. And then, it takes precendence over the
> system python3.

Thanks for the prompt reply and explanation. Yep, I think you are right that I
just recently hit that, otherwise I simply haven't used the BR's Python host
binaries.

> I don't see a easy way around, though...
> 
> But without the actual error you are seeing, it is impossible to suggest
> further tracks of investigation: is the missing stuff a built-in module
> of python, or is it a external one?

It's external module (in this case `ipaddr`), but you see the issue here, if I
fix my particular case it does not fix the root cause and someone may stumble
over it again and again...

That said, enabling module (even if it doesn't require a package to be created
[disclaimer: I haven't checked if it exists in BR repo]) is not a solution.

-- 
With Best Regards,
Andy Shevchenko

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Aug 2015 21:05:34 +0200
Subject: [Buildroot] [PATCH v1 0/2] Checking whether a certain CONFIG_*
 is set
In-Reply-To: <20150819194643.1fad6062@free-electrons.com>
References: <87lhd98twt.fsf@dell.be.48ers.dk>
 <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
 <20150819194643.1fad6062@free-electrons.com>
Message-ID: <20150819190534.GA13372@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Jan, All,

On 2015-08-19 19:46 +0200, Thomas Petazzoni spake thusly:
> On Wed, 19 Aug 2015 15:14:34 +0200, Jan Viktorin wrote:
> 
> > this short patch series introduces a way how to check whether certain
> > CONFIG_* entries are set to an expected value in a selected .config
> > file. When building a package that requires a certain CONFIG_* to be
> > set (as in the case of xtables-addons), Buildroot can either force
> > to set the config or just error out a message.

Arguably, xtables-addons should be (if possible) converted over to using
the kernel-modules infra, which should (will) take care of that (in the
future). I'll try to see if I can convert it.

> > I could not find any suitable mechanism for this in Buildroot (if there
> > is one, please give me a reference) so I propose a simple extension of
> > KCONFIG_*_OPT util macros. It is then implemented for xtables-addons to
> > check whether CONFIG_MODULES are set in the Linux Kernel .config.
> 
> There is some discussion already going on on this topic, around the
> pkg-kernel-module infrastructure. We recently committed a patch that
> makes the infrastructure verify that the kernel has been built with
> module support, and if not, bail out with a clear error message:
> 
>    http://git.buildroot.net/buildroot/commit/?id=8df95d926e963601c727defeb4ab90ce2368da70
> 
> However, Peter Korsgaard raised the concern that we should instead just
> forcefully enable CONFIG_MODULES=y in the configuration in such a case.
> There has then been some discussion with Yann on how to achieve that
> properly. Please see the thread at
> http://lists.busybox.net/pipermail/buildroot/2015-August/137511.html.

Yes, I'm thinking about it...

I think the plan I'll be goign with is to add a hidden Kconfig knob that
packages that want to build a kernel module will have to select.

Then, if that option is set, we can force-on support for modules in
linux.mk. Note: if the option is not set, we would *not* disable support
for modules, and let it as set in the user-provided (def)config file.

So, all in all, that would solve the xtables-addons issue, because we
would be handling CONFIG_MODULE explicitly.

Now, there are two questions:

  - will we need to _check_ for any arbitrary kernel option to be set,
    and offer packages a simple mean to do so?

  - will we need to _force_ (on or off) any other kernel option, and
    offer packages a simple mean to do so?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Matthew Weber <Matthew.Weber@collins.com>
Date: Tue, 4 Dec 2018 09:23:22 -0600
Subject: [Buildroot] [External] Re: Stack protector choices [was: [PATCH
 v2, 2/2] lxc: fix build without stack protector]
In-Reply-To: <20181204110854.17685bf4@windsurf>
References: <20181203223855.10152-1-fontaine.fabrice@gmail.com>
 <20181203223855.10152-2-fontaine.fabrice@gmail.com>
 <20181204055439.rhfgmyb6w7ijykx6@sapphire.tkos.co.il>
 <20181204091029.01a78c0e@windsurf>
 <42790e46-35a7-299a-cbae-4b83383287a3@mind.be>
 <20181204110854.17685bf4@windsurf>
Message-ID: <CANQCQpaihpM5fYC10YcSDbpeLEQUSsfbZd3ZGTyiZYeBJgw6YA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Dec 4, 2018 at 4:09 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Tue, 4 Dec 2018 10:35:05 +0100, Arnout Vandecappelle wrote:
>
> >  If you look at it from a practical point of view, we can only do option (1), or
> > "we sometimes enforce the system-level configuration options, but not
> > consistently". Indeed, if a package does the stack protector detection
> > correctly, chances are we'll never even notice that it enables stack protector.
>
> I was going to say that the checksec tool could help us detect such
> situations (i.e SSP is disabled at the Buildroot level, but some
> binaries end up being built with SSP). However, it seems like checksec
> is not checking SSP support, but PIE, RELRO and a few other things.
>

It can look for stack canaries (unsure if it would catch all types of
SSP).  However, checksec takes a lot of time to run readelf on each
executable.

> >  So in practice, I think the policy should be (as it is for other policy
> > options, e.g. debug):
> >
> > 1. If there is no configuration option for it, let the package decide.
> >
> > 2. If there is a configuration option that does the same as our option, disable
> > it and let the toolchain wrapper apply the correct option.

Some package level test/cfg logic may have issues with the toolchain
wrapper enforcing it.  I ran into a case with FORTIFY_SOURCE and the
Kernel toolchain feature test cases where a optimization level must be
provided with the FORTIFY option.  Since they were dropping all flags
and we set the FORTIFY_SOURCE, the build failed with a optimization
level required error.  SSP at least doesn't have that sort of a
dependency.

> >
> > 3. If there is a configuration option and it does something more, enable it
> > automatically based on the global Buildroot option.
> >
> > 4. In very exceptional cases where (3) is even more invasive, offer an option to
> > the user (but only if the toolchain supports it, of course).
> >
> >  An example of (3) would be the kernel's stack protector which is a little more
> > than just -fstack-protector so it needs to be enabled explicitly. An example of
> > (4) would be -fsanitize=address vs. KASAN - KASAN is a way more invasive
> > operation than gcc's address sanitizer. Note that specifically for the kernel,
> > we of course always do (4) - kernel config is provided separately. But the
> > kernel is just an easy example that everybody knows.

(Thomas, let me know if this email was rejected when set to gmail users)

Matt

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Dec 2018 11:08:54 +0100
Subject: [Buildroot] Stack protector choices [was: [PATCH v2,
 2/2] lxc: fix build without stack protector]
In-Reply-To: <42790e46-35a7-299a-cbae-4b83383287a3@mind.be>
References: <20181203223855.10152-1-fontaine.fabrice@gmail.com>
 <20181203223855.10152-2-fontaine.fabrice@gmail.com>
 <20181204055439.rhfgmyb6w7ijykx6@sapphire.tkos.co.il>
 <20181204091029.01a78c0e@windsurf>
 <42790e46-35a7-299a-cbae-4b83383287a3@mind.be>
Message-ID: <20181204110854.17685bf4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 4 Dec 2018 10:35:05 +0100, Arnout Vandecappelle wrote:

>  If you look at it from a practical point of view, we can only do option (1), or
> "we sometimes enforce the system-level configuration options, but not
> consistently". Indeed, if a package does the stack protector detection
> correctly, chances are we'll never even notice that it enables stack protector.

I was going to say that the checksec tool could help us detect such
situations (i.e SSP is disabled at the Buildroot level, but some
binaries end up being built with SSP). However, it seems like checksec
is not checking SSP support, but PIE, RELRO and a few other things.

>  So in practice, I think the policy should be (as it is for other policy
> options, e.g. debug):
> 
> 1. If there is no configuration option for it, let the package decide.
> 
> 2. If there is a configuration option that does the same as our option, disable
> it and let the toolchain wrapper apply the correct option.
> 
> 3. If there is a configuration option and it does something more, enable it
> automatically based on the global Buildroot option.
> 
> 4. In very exceptional cases where (3) is even more invasive, offer an option to
> the user (but only if the toolchain supports it, of course).
> 
>  An example of (3) would be the kernel's stack protector which is a little more
> than just -fstack-protector so it needs to be enabled explicitly. An example of
> (4) would be -fsanitize=address vs. KASAN - KASAN is a way more invasive
> operation than gcc's address sanitizer. Note that specifically for the kernel,
> we of course always do (4) - kernel config is provided separately. But the
> kernel is just an easy example that everybody knows.

OK, works for me. Should we write this down somewhere ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

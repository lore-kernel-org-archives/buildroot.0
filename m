From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 10 Jul 2015 11:28:32 +0000
Subject: [Buildroot] [PATCH] quagga: disable PIE on ARC
In-Reply-To: <559F99A1.8060501@mind.be>
References: <1436436011-8126-1-git-send-email-abrodkin@synopsys.com>
 <559EE7E6.401@mind.be> <20150710084455.3462000c@free-electrons.com>
 <1436515926.2800.26.camel@synopsys.com> <559F99A1.8060501@mind.be>
Message-ID: <1436527712.2800.46.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Fri, 2015-07-10 at 12:08 +0200, Arnout Vandecappelle wrote:
> On 07/10/15 10:12, Alexey Brodkin wrote:
> [snip]
> 
>  Thanks for the detailed explanation!
> 
> > In other words if we disable PIE in Buildroot's toolchain there will be
> > no way to build U-Boot for ARC. And that's not what we want.
> 
>  It's probably getting complicated, but we could add either another option or an
> environment variable to enable PIE again. E.g. if it's an envrionment variable,
> then we can do for packages that we know do *not* break with ARC-PIE:
> 
> ifneq ($(BR2_arc),)
> UBOOT_MAKE_ENV += GCC_REALLY_SUPPORT_PIE=1
> endif

We may add that new definition but the question is how it is supposed to work?
My understanding is once we have gcc built with PIE support it [gcc] will happily
accept "-pie" flag in command-line and will generate output accordingly.

And we don't know which software packages use PIE or may use (depending on autoconf
detection).

So the only real solution is to make sure GCC doesn't even accept "-pie" option.
I assume it's possible to do while we're building GCC itself. But if we do this
we'll a toolchain that cannot generate PIE executables and there will be no way to
build U-Boot any longer.

Probably I'm missing something here and you guys may correct me.

>  Question is: is that more complicated that the current per-package workarounds
> or not?

I really don't like that approach with fixing every package that may use PIE
but since I don't see any other solution (until PIE gets fixed in both ARc GCC
and runtime software) I have to go that way.

-Alexey

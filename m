From: Cyril Bur <cyrilbur@gmail.com>
Date: Thu, 17 Dec 2015 12:25:20 +1100
Subject: [Buildroot] [PATCH] linux: Build and install kernel selftests
In-Reply-To: <20151215173117.GA3596@free.fr>
References: <1448409222-4510-1-git-send-email-cyrilbur@gmail.com>
 <1448409222-4510-2-git-send-email-cyrilbur@gmail.com>
 <20151214221846.GD4152@free.fr> <20151215063752.GK2318@tarshish>
 <20151215173117.GA3596@free.fr>
Message-ID: <20151217122520.6ffe6508@camb691>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Dec 2015 18:31:17 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

Hello Everyone,

> Baruch, Cyril, All,
> 
> On 2015-12-15 08:37 +0200, Baruch Siach spake thusly:
> > On Mon, Dec 14, 2015 at 11:18:46PM +0100, Yann E. MORIN wrote:  
> > > On 2015-11-25 10:53 +1100, Cyril Bur spake thusly:  
> > > > +config BR2_LINUX_KERNEL_TOOL_SELFTESTS
> > > > +	bool "selftests"  
> > > 
> > > Since the .mk has:
> > >     SELFTESTS_DEPENDENCIES = bash
> > > 
> > > then you must either depend on bash or select it here. I think a select
> > > is better, so:
> > > 
> > >     depends on BR2_USE_MMU  # bash
> > >     select BR2_PACKAGE_BASH  
> > 
> > But BR2_PACKAGE_BASH depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS.  
> 
> Gah... I missed that... Thanks for spotting! :-)
> 

Ah I would totally have missed that too, thanks Yann and Baruch!

> > Should 
> > BR2_LINUX_KERNEL_TOOL_SELFTESTS also depend on 
> > BR2_PACKAGE_BUSYBOX_SHOW_OTHERS?  
> 
> Yes. With a comment stating so, like:
> 
>     config BR2_LINUX_KERNEL_TOOL_SELFTESTS
>         bool "selftests"
>         depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
>         depends on BR2_USE_MMU  # bash
>         select BR2_PACKAGE_BASH
> 
>     comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
>         depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> 
> (not so nice, but we already have it for openvmtools.)
> 

Doesn't matter, I don't think we'll ever get the selftests looking 'nice'
anyway but that is an improvement.

On the note of dependencies - when I wrote the patch I was in two minds about
dependencies. Either this does the bare minimum to get the tests in and if the
user wants more tests to work/pass then they'll need to add things, or the
selftests depends on as much as possible to give as many tests passing as
possible. Based off this and discussion with a colleague, it might be better
that ticking the option to just select everything, if you're building the
selftests into your image it's because you want to be able to run them.
I haven't gone through and determined what the biggest set is but will do and
post v2.

> Regards,
> Yann E. MORIN.
> 

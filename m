From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Sep 2013 19:30:46 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
 customization
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C639ACDED6@ex-mb1.corp.adtran.com>
References: <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr>
 <F9C551623D2CBB4C9488801D14F864C639ACDED6@ex-mb1.corp.adtran.com>
Message-ID: <20130916173046.GC3293@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andy, All,

On 2013-09-16 15:43 +0000, ANDY KENNEDY spake thusly:
> > From: Yann E. MORIN [mailto:yann.morin.1998 at gmail.com] On Behalf Of Yann E. MORIN
> > Sent: Saturday, September 14, 2013 5:16 PM
> 
> Everything you guys said here was sound, logical reasoning.  This is
> what I believe to be the spirit of what *some* in the free software community
> intended (though there are a few radicals out there which have taken it
> down a different road).
> 
> <snip>
> > > >Yes, but I believe BR2_EXTERNAL *is* a derived work of Buildroot, so as
> > > >such should be licensed under a license compatible with BuildRoot's.
> 
> About this:  There was a BIG case here in the States within the last
> two years.  Google vs. Sun Micro systems.

Yes, that story has crossed the ocean. ;-)

>  The argument was over the header
> files of the language Java (if you already know this, sorry for the recap).
> It was decided that an INTERFACE is not protected by _anything_.

That's where we can argue: is the Buildroot-specific infrastructure an
interface, or is it not an interface.

That's the same argument that applies to kernel modules: if a module is
written explicitly for the Linux kernel, then some kernel developpers
believe that module is a derived work of the Linux kernel. If the module
is pre-existing, and merely ported over to the Linux interfaces, it
might not be a derived work.

Although this is still considered a "gray area", and has not been tried
yet, so we can't use that as anything but a guideline of thought.

>  So,
> from a certain point of view, the *.mk files contain various variables
> and then make a FUNCTION call back into the system.  This would negate there
> being a "derived work" for anyone adding on an IP app to the build system.

I think you are confused by your "IP app" and the "recipes to build your
IP app".

Of course your proprietary application is not covered by the Buildroot
license. So yes, you can bundle it in your rootfs, and not be bound to
provide a means to rebuild it.

> However, you are dead-on about the GPL apps that may be built that way as
> one would ABSOLUTELY have to release the build process with the binary.

Yes, this is section 3 of the GPLv2. Excerpt:

    ---8<---
    For an executable work, complete source
    code means all the source code for all modules it contains, plus any
    associated interface definition files, plus the scripts used to
    control compilation and installation of the executable.
    ---8<---

So, if you distribute a binary of busybox on your device, you have to
provide the recipient of that device with:

  - the source code of busybox itself (ie the .c and .h files)

  - the build instructions to reproduce that busybox binary

To fulfill that second point, you have two options:

  - provide your Buildroot tree
or
  - provide the exact commands to rebuild busybox

Since the former is way easier than the latter, you'd probably opt for
providing the Buildroot tree.

Now, if your Buildroot tree also contains recipes for proprietary
application (what you call "IP app"), you can well expunge your Buildroot
tree from those recipes, and distribute that expunged Buildroot tree to
the recipient of your device, since that expunged Buildroot tree is
sufficient to rebuild the aforementioned busybox binary.

Indeed, that's not the exact Buildroot tree used to build busybox, but
since it is absolutely sufficient, that would not be a problem at all.

But expunging the recipes for the proprietary app would need a proper
process that guarantees it does not "leak" changes to other recipes for
non-proprietary apps.

Enters now BR2_EXTERNAL. If your BR2_EXTERNAL only contains recipes for
proprietary applications, and there are none in your Buildroot tree, you
will *not* have to provide that BR2_EXTERNAL tree@all.

But if your BR2_EXTERNAL tree contains recipes for GPL applications that
end up in your device, you will *have* to provide *those* recipes.

Ditto for the Buildroot tree, you may expunge the recipes for your
proprietary apps from the BR2_EXTERNAL tree you distribute, since they
are not required to rebuild the GPL applications.

> So, whether this would work in courts across the globe, I have no idea.
> Ethically speaking (and I'm big on ethics), I would not want to release IP
> code that could _ONLY_ be built using BuildRoot, however, adding something
> in that doesn't DEPEND on being built by BuildRoot is clearly okay by
> our license and the GPL under which BuildRoot is released.

OK, so you basically said there is no problem. Good! :-)

> Now, as Yann has stated previously: the information above and 1.25USD will
> buy you a Coke!

Indeed, the above would have to be tried in a court of law.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

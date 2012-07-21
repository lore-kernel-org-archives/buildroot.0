From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Jul 2012 14:47:03 +0200
Subject: [Buildroot] [PATCH] Add package linux-pam (resending,
 fixed indentation, mentioned website)
In-Reply-To: <CADiAo4LmN0eWpTfasuD9UdnVwLv36ggNuqDJsMzTcmbL4gBP5A@mail.gmail.com>
References: <1342647267-20745-1-git-send-email-golubovsky@gmail.com>
 <20120720224538.189830cc@skate>
 <CADiAo4LmN0eWpTfasuD9UdnVwLv36ggNuqDJsMzTcmbL4gBP5A@mail.gmail.com>
Message-ID: <20120721144703.1602c705@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 20 Jul 2012 21:19:23 -0400,
Dmitry Golubovsky <golubovsky@gmail.com> a ?crit :

> Apart from the comment regarding config.h patching (this is a separate
> undertaking):

Be careful: you can't patch config.h, it is generated
during ./configure. So the best option is probably to see *why* you
need to do these changes and see if by passing options or environment
variables to the ./configure it isn't possible to achieve the same goal.

> > This Busybox change should be part of a separate patch (so your patch
> > series should have two patches: one adding the linux-pam package, one
> > tweaking Busybox to use linux-pam).
> 
> Well, I thought about splitting the patch into two, but both parts can
> only be applied together then.

Yes, no problem.

> > Also, shouldn't you ensure that CONFIG_PAM is enabled in the Busybox
> > configuration in that case?
> 
> IMHO these things are orthogonal.
> 
> If BR2_PACKAGE_LINUX_PAM is selected, it will be built before busybox
> - what's the difference? If BR2_PACKAGE_LINUX_PAM is not selected,
> busybox.mk extra dependencies are not in effect - correct?

Correct.

> If CONFIG_PAM is not selected in busybox, it is not affected by PAM
> other than the fact that PAM will be built earlier. The only situation
> when bad outcome is possible:  CONFIG_PAM is selected in busybox, and
> BR2_PACKAGE_LINUX_PAM is not selected. But this will be obvious to the
> user, why busybox does not build.
> 
> I don't really want to force PAM support in busybox as a consequence
> of user selection of BR2_PACKAGE_LINUX_PAM alone. The reverse makes
> more sense: I may add a sub-item in busybox config which enables PAM
> in both buildroot an busybox.
> 
> Please let me know if this is acceptable.

Well, the thing is that this generally not really how we handle things
in Buildroot. In general, as soon as some library is available and
provide a feature that can be used by a package, then we automatically
use it. Some examples:

 (1) Having RPC or IPv6 support in the toolchain will automatically
     enable certain Busybox applet or options.

 (2) Many packages use a library if available, without having a
     specific option for it. See for example how bind, ctorrent or
     libecore use openssl when available.

We could have thought of doing the opposite: if CONFIG_PAM is enabled
in the Busybox configuration, then we add linux-pam to the
dependencies. But unfortunately, this is not possible: we cannot add
things to <foo>_DEPENDENCIES depending on the Busybox configuration :-(

So, I'd say I would prefer to follow what we do for all other packages.
Basically, my understanding of our rule is that we do something that
makes sense by default, and if someone really wants linux-pam for
something else, but not for Busybox, that someone can do a very simple
modification to busybox.mk to change this. Just like if someone wants
openssl for something in its system, but not for bind or ctorrent,
(s)he would have to make changes in the bind.mk or ctorrent.mk files.

> > No, see
> > http://buildroot.org/downloads/manual/manual.html#_gettext_integration_and_interaction_with_packages.
> 
> I probably missed this, will fix.
> 
> For the rest of your comment (fixing config.h  post-configure) I need
> a closer look and some more time.

Ok, no problem.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

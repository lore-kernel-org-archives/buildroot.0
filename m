From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 9 Jun 2016 19:59:54 +0200
Subject: [Buildroot] [PATCH 2/2] python-meson: new package
In-Reply-To: <20160608222250.6d493138@free-electrons.com>
References: <1465047243-1169-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1465047243-1169-3-git-send-email-eric.le.bihan.dev@free.fr>
 <20160608222250.6d493138@free-electrons.com>
Message-ID: <20160609195954.52b9a527@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Le Wed, 8 Jun 2016 22:22:50 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> > To cross-compile a Meson-based project for the target, its package
> > should:
> > 
> >  - depend on host-python-meson
> >  - invoke the host variant of Meson with the
> >    *--cross-file=$(HOST_DIR)/etc/meson/cross-compilation.conf*
> > option.
> >  - invoke host variant of Ninja to perform the actual build.  
> 
> It would probably be good to write this somewhere, as it is quite
> important to know for users of this build system. But I'm not sure
> where: you're going to have only a host package, so no Config.in file,
> and therefore no help text. And I'm not sure where this could be added
> in the Buildroot manual.

It is true that all the "docs/manual/adding-packages*.txt" files refer
to a dedicated infrastructure, whereas what is needed here is an
example of Makefile using the generic-package infrastructure. There is
an exception to the rule, though: docs/manual/adding-packages-gettext.txt.

So, IMHO, a new document named "docs/manual/adding-packages-meson.txt" should 
fit.

However, I could provide a real package infrastructure named "meson-package",
but as stated in the discussion about adding support for Cargo [1] (the Rust
package manager), to provide such infrastructure, at least one package using
it should also be provided (it is sensible to have a working example of 
the infrastructure).
 
> >  package/Config.in                              |  1 +
> >  package/python-meson/Config.in                 |  9 +++++  
> 
> As discussed, if it's a build system, please add only a host package.

OK. I'll do the same for Ninja.

> > +
> > +define HOST_PYTHON_MESON_REMOVE_GUI_TOOL
> > +	rm -f $(HOST_DIR)/usr/bin/mesongui.py
> > +endef  
> 
> Not sure removing stuff from the host variant is really useful.

This program needs PyQt5, which may not be installed by default by the
most popular GNU/Linux distributions. The user may be tempted to use
it: the execution will fail and this may result in an unnecessary
Buildroot bug report. To avoid this, I chose to remove it.

> Other than that, looks good!

Thanks for the review.

[1] http://lists.busybox.net/pipermail/buildroot/2016-April/158333.html

Regards,

-- 
ELB

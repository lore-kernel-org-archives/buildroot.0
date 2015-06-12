From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Jun 2015 22:48:12 +0200
Subject: [Buildroot] [PATCH 06/11 v2] package/cryptodev-linux: use the
 kernel-module helper
In-Reply-To: <557A13A1.2000500@mind.be>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
 <329d95315f937a0cbd912b8035fb0ccc0e94a9ed.1433964001.git.yann.morin.1998@free.fr>
 <557A13A1.2000500@mind.be>
Message-ID: <20150612204812.GF3583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-06-12 01:02 +0200, Arnout Vandecappelle spake thusly:
> On 06/10/15 21:22, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > [Doug: add pre-build hook to build version.h]
> 
>  The version.h thing deserves a slightly more explicit commit message, like:
> 
> The cryptodev-linux Makefile defines the following:
> 
> build: version.h
>         make ${KERNEL_MAKE_OPTS} modules
> 
> modules_install:
>         make -C $(KERNEL_DIR) SUBDIRS=`pwd` modules_install
>         @echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..."
>         @install -D crypto/cryptodev.h $(PREFIX)/usr/include/crypto/cryptodev.h

I'm not too fond of quoting that much, so I trimmed it down to what I
believe is the strict minimum for udnerstanding the change, no more.

If you still think that is not enough, you'll have the opportunity to
say so when I respin. OK? ;-)

> So when we use the kernel-module infrastructure, we have to explicitly handle
> version.h and cryptodev.h. cryptodev.h was already handled specifically because
> it goes to STAGING_DIR. For version.h, we add a pre-build hook.
> 
> 
>  That said, SUBDIRS= does not behave exactly the same as M=, but I don't know
> what the difference is. So that part should probably be mentioned explicitly in
> the commit message as well.

From my understanding, the end result is the same, but using SUBDIRS
makes the Linux buildsystem it is building in in-tree module, while M
tells it it is building an out-of-tree module.

> > Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> 
> [snip]
> > -define CRYPTODEV_LINUX_INSTALL_TARGET_CMDS
> > -	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_DIR=$(LINUX_DIR) \
> > -		PREFIX=$(TARGET_DIR) modules_install
> > -endef
> > +CRYPTODEV_LINUX_MODULE_MAKE_OPTS = \
> > +	KERNEL_DIR=$(LINUX_DIR) \
> > +	PREFIX=$(TARGET_DIR)
> 
>  PREFIX is only used for installing cryptodev.h, which is now no longer done. So
> we don't need to define it, right? Same for KERNEL_DIR, it's only used by the
> rules we no longer use.
> 
>  If you remove these, it should of course also be mentioned explicitly in the
> commit message.

Right, I've dropped both and explained in the commit log.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

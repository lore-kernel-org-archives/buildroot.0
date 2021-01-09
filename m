From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2021 14:25:19 +0100
Subject: [Buildroot] [PATCH] package/libclc: switch to using LLVM's
 monorepo
In-Reply-To: <49909594-62d0-5efb-effb-86b96b4fcfe7@gmail.com>
References: <20210109103353.2860299-1-yann.morin.1998@free.fr>
 <49909594-62d0-5efb-effb-86b96b4fcfe7@gmail.com>
Message-ID: <20210109132519.GR1485369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2021-01-09 12:25 +0100, Romain Naour spake thusly:
> Le 09/01/2021 ? 11:33, Yann E. MORIN a ?crit?:
> > The LLVM project has switched to using a monorepo to host all their
> > components. The separate, individual repositories have been closed
> > late 2020 / early 2021. The libclc repository is no longer.
> > 
> > Switch to using the libclc source from the llvm monorepo; switch to
> > using the github helper, to avoid a huge git clone (still 115MiB
> > instead of the previous 172KiB...).
> 
> I didn't noticed that the repository is no longer available because I'm using a
> mirror locally: https://github.com/llvm-mirror/libclc.git

Ah, but then we would be back to square one when we eventually want to
update the libclc version, which is not going to be available in that
legacy mirror, but only in the official llvm-project repo...

> If we really care about thee download size, maybe we can use the mirror before
> updating to llvm 11.0 that's the first release providing an archive for libclc:
> https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/libclc-11.0.0.src.tar.xz

I would say that if people are concerned about the download size, they
would have to go to the llvm project and whine there.

[--SNIP--]
> > @@ -28,19 +27,19 @@ LIBCLC_CONF_OPTS = \
> >  	--with-cxx-compiler=$(HOSTCXX_NOCCACHE)
> >  
> >  define LIBCLC_CONFIGURE_CMDS
> > -	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.py $(LIBCLC_CONF_OPTS))
> > +	cd $(@D)/libclc && $(TARGET_CONFIGURE_OPTS) ./configure.py $(LIBCLC_CONF_OPTS)
> 
> Here you're removing the sub-shell but it's used for most other packages.

The subshell is totally useless; it is an anti-pattern.

That most packages use it is not a reason to keep it; instead, we should
get rid of it.

Note: I know we have similar constructs in the infras; that's not good,
at all...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Aug 2016 09:07:58 +0200
Subject: [Buildroot] [PATCH/next 2/2] gcc: remove BR2_GCC_ENABLE_TLS
 option
In-Reply-To: <68f877ee-c37e-c7b8-d83e-0c2d7c5b8e15@mind.be>
References: <1472507657-9983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1472507657-9983-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <68f877ee-c37e-c7b8-d83e-0c2d7c5b8e15@mind.be>
Message-ID: <20160830090758.04879c3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Aug 2016 00:40:59 +0200, Arnout Vandecappelle wrote:

> > -ifeq ($(BR2_GCC_ENABLE_TLS),y)
> > +# On glibc, musl and uClibc/NPTL, enable TLS support. Otherwise (i.e
> > +# just uClibc/no-thread and uClibc/linux-threads), disable it.
> > +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_GLIBC)$(BR2_TOOLCHAIN_BUILDROOT_MUSL)$(BR2_PTHREADS_NATIVE),y)
> >  HOST_GCC_COMMON_CONF_OPTS += --enable-tls
> >  else
> >  HOST_GCC_COMMON_CONF_OPTS += --disable-tls  
> 
>  I think it's slightly easier to understand if the condition is reverted.
> 
> # TLS support is not available on uClibc/no-thread and uClibc/linux-threads
> ifeq($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)$(BR2_PTHREADS)$(BR2_PTHREADS_NONE),yy)
> HOST_GCC_COMMON_CONF_OPTS += --disable-tls
> else
> HOST_GCC_COMMON_CONF_OPTS += --enable-tls
> endif
> 
> but it doesn't make a big difference either way.

Yes, I hesitated between both solutions, yours has the advantage of
being shorter, and enabling TLS all the time *except* in some cases. I
should probably change to use your proposal. I'll send a v2.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

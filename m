From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 22:20:50 +0200
Subject: [Buildroot] [PATCH] directfb: fix compile for m68k
In-Reply-To: <20160707174908.GA22788@waldemar-brodkorb.de>
References: <20160707174908.GA22788@waldemar-brodkorb.de>
Message-ID: <20160707222050.4033a611@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 7 Jul 2016 19:49:08 +0200, Waldemar Brodkorb wrote:

> ++/* uClibc-ng does not implement pthread_getattr_np for Linuxthreads */
> ++#if !defined(__UCLIBC_HAS_LINUXTHREADS__)
> +      /* Read (back) value. */
> +      pthread_getattr_np( thread->handle.thread, &attr );
> +      pthread_attr_getstacksize( &attr, &thread->stack_size );
> +      pthread_attr_getschedparam( &attr, &param );
> +      thread->priority = param.sched_priority;
> +      pthread_attr_destroy( &attr );
> ++#endif

Are you sure it is correct to remove this code? It means that the
thread->priority and thread->stack_size field will not be initialized
to what they are supposed to.

Also, please add a configure.ac check for pthread_getattr_np() rather
than relying on __UCLIBC_HAS_LINUXTHREADS__.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Erik Andersen <andersen@codepoet.org>
Date: Wed Jul 26 12:02:47 2006
Subject: [Buildroot] Re: toolchains and dependencies to libgcc_s.so.1
In-Reply-To: <20060726190006.GA12305@codepoet.org>
References: <20060726070427.25616.qmail@web26614.mail.ukl.yahoo.com>
	<20060726190006.GA12305@codepoet.org>
Message-ID: <20060726190151.GB12305@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed Jul 26, 2006 at 01:00:06PM -0600, Erik wrote:
> On Wed Jul 26, 2006 at 09:04:27AM +0200, ayoub zaki wrote:
> > Hi List,
> >  
> >  I have built toolchains for i386/arm/armeb with buildroot,and
> >  when trying to compile a simple hello world I'm getting a
> >  dependency to libgcc_s.so.1for i386/armeb :
> [----------snip-------------]
> >  Is that a bug in gcc or something else ? and how can I build
> >  toolchains without this problem ?
> 
> This is on purpose.  If you don't like it, it can easily be
> changed by telling gcc to staticly link all needed libgcc stuff
> into each app (often making your target system larger, but not
> always).  Anyway...
> 
> $ cd toolchain_build_XXX/gcc-Y.Y.Y/gcc/
> $ ./configure --help | grep libgcc
>   --disable-shared        don't provide a shared libgcc
> 
> The change then that you are looking for is:
> 
> --- buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	(revision 15746)
> +++ buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	(working copy)
> @@ -175,7 +175,7 @@
>  		--host=$(GNU_HOST_NAME) \
>  		--target=$(REAL_GNU_TARGET_NAME) \
>  		--enable-languages=$(TARGET_LANGUAGES) \
> -		--enable-shared \
> +		--disable-shared \
>  		--disable-__cxa_atexit \
>  		--enable-target-optspace \
>  		--with-gnu-ld \
> @@ -294,7 +294,7 @@
>  		--host=$(REAL_GNU_TARGET_NAME) \
>  		--target=$(REAL_GNU_TARGET_NAME) \
>  		--enable-languages=$(TARGET_LANGUAGES) \
> -		--enable-shared \
> +		--disable-shared \
>  		--with-gxx-include-dir=/usr/include/c++ \
>  		--disable-__cxa_atexit \
>  		--enable-target-optspace \

Forwarded to the buildroot list where this was appropriate.

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--

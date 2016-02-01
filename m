From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 16:01:23 +0100
Subject: [Buildroot] [RFC] package/gdb: simplify the disable doc hook
In-Reply-To: <1454336547-23655-1-git-send-email-romain.naour@gmail.com>
References: <1454336547-23655-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160201160123.15b3470f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Mon,  1 Feb 2016 15:22:27 +0100, Romain Naour wrote:

> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 3b0f501..65b2e67 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -53,13 +53,8 @@ endif
>  
>  # Prevent gdb to build the documentation
>  define GDB_DISABLE_DOC
> -	$(SED) '/^SUBDIRS =/ s/doc//' $(@D)/gdb/Makefile.in
> -	if test -e $(@D)/bfd/doc/Makefile.in ; then \
> -		$(SED) 's/^INFO_DEPS =.*$$/INFO_DEPS =/' $(@D)/bfd/doc/Makefile.in ; \
> -	fi
> -	if test -e $(@D)/gprof/Makefile.in ; then \
> -		$(SED) 's/^INFO_DEPS =.*$$/INFO_DEPS =/' $(@D)/gprof/Makefile.in ; \
> -	fi
> +	echo "#!/bin/sh" > $(@D)/missing
> +	echo "exit 0" >> $(@D)/missing

Is "missing" only used to check for makeinfo, or also for other things ?

We also have makeinfo related hacks in the gcc and binutils packages,
which basically consists in pointing them to "missing" as being the
makeinfo program.

It is really annoying that we have to do those hacks :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

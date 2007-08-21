From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 21 Aug 2007 22:12:59 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
In-Reply-To: <20070821201424.A0BC1A5D3C@busybox.net>
References: <20070821201424.A0BC1A5D3C@busybox.net>
Message-ID: <1187727179.6145.34.camel@86-115-11-152>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2007-08-21 klockan 13:14 -0700 skrev aldot at uclibc.org:
> Author: aldot
> Date: 2007-08-21 13:14:23 -0700 (Tue, 21 Aug 2007)
> New Revision: 19631
> 
> Log:
> - make sure that sstrip is available early enough
> 
> 
> Modified:
>    trunk/buildroot/toolchain/dependencies/dependencies.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/toolchain/dependencies/dependencies.mk
> ===================================================================
> --- trunk/buildroot/toolchain/dependencies/dependencies.mk	2007-08-21 19:45:17 UTC (rev 19630)
> +++ trunk/buildroot/toolchain/dependencies/dependencies.mk	2007-08-21 20:14:23 UTC (rev 19631)
> @@ -5,7 +5,11 @@
>  #
>  ######################################################################
>  
> -dependencies: host-sed host-lzma
> +ifeq ($(BR2_STRIP_sstrip),y)
> +# XXX: this is a little bit ugly, yep.
> +MAYBE_SSTRIP_HOST:=sstrip_host
> +endif
> +dependencies: host-sed host-lzma $(MAYBE_SSTRIP_HOST)
>  	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
>  		HOST_SED_DIR="$(HOST_SED_DIR)" \
>  		$(TOPDIR)/toolchain/dependencies/dependencies.sh
> 

Why not add host-sed/host-lzma (conditionally) to TARGETS early enough?
I tried this, and this seemed to work, but I never got to commit that.

ifeq ($(BR2_STRIP_sstrip),y)
TARGETS+=sstrip_host
endif

in toolchain/Makefile.in

Should do wonders.

Same for the other stuff we need to have available.

> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Best Regards,
Ulf Samuelsson          mail:   ulf at atmel.com
Atmel Nordic AB
Box 2033, 174 52 Sundbyberg
Kavalleriv?gen 24, 174 58 Sundbyberg
Sweden
Tel:    +46 8 441 54 22 GSM:    +46 706 224457

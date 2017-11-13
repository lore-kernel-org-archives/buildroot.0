From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Nov 2017 21:33:43 +0100
Subject: [Buildroot] Bug in RPATH fixing logic
In-Reply-To: <d632b876-9cbe-bbec-5195-d383b6ebd440@grandegger.com>
References: <20171112174013.25d90333@windsurf.home>
 <20171112174955.18449728@windsurf.home>
 <87y3nbs9jz.fsf@dell.be.48ers.dk>
 <20171112182403.5d5c8fe4@windsurf.home>
 <20171112174250.GD2947@scaer>
 <734d391a-b9b9-d728-9878-4e8c4599b106@grandegger.com>
 <87d14ms2x2.fsf@dell.be.48ers.dk> <20171113173611.GB2861@scaer>
 <d632b876-9cbe-bbec-5195-d383b6ebd440@grandegger.com>
Message-ID: <20171113203343.GC2861@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-11-13 19:04 +0100, Wolfgang Grandegger spake thusly:
> Hello,
> 
> Am 13.11.2017 um 18:36 schrieb Yann E. MORIN:
> > Peter, All,
> > 
> > On 2017-11-13 14:50 +0100, Peter Korsgaard spake thusly:
> >>>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:
> >>   > This means: A symbolic link would work.
> >> Ok, great - Makes sense. I wonder how much effort it wil be to get
> >> binutils to generate symbolic links instead of hard links.
> > 
> > No way.
> 
> Well, the attached patch fixes the issue with the binary utilities (ld,
> ar, objdump, as, ...). I think only the fixes in "binutils/Makefile.in" and
> "gas/Makefile.in" are need, IIRC. And in the fixes did not break the
> build, at least. Will do more checks...

Well, what I meant is that there are no --disable-hardlinks on the
ocnfigure command line.

And don;t forget that we do have 4 versions of binutils to patch.

And as Peter said: if we patch, we should try to get that upstreamable.
Maybe upstream will be receptive to that. Or maybe not. Who knows...

I think providing a post-install hook is better than patching.

> > We'll have to provide post-install hooks to do the de-hardlinking step
> > ourselves.
> 
> > Also, as Wolfgang noticed, gcc is also affected by the hardlink issue.
> 
> No, with the patch above I get:
> 
> ./bin/x86_64-buildroot-linux-gnu-gcc-6.4.0.br_real: Device: 811h/2065d	Inode: 64370910    Links: 3
> ./bin/x86_64-buildroot-linux-gnu-g++.br_real: Device: 811h/2065d	Inode: 64370887    Links: 2
> ./bin/x86_64-buildroot-linux-gnu-gcc.br_real: Device: 811h/2065d	Inode: 64370910    Links: 3
> ./bin/x86_64-buildroot-linux-gnu-c++.br_real: Device: 811h/2065d	Inode: 64370887    Links: 2
> ./bin/x86_64-buildroot-linux-gnu-cc.br_real: Device: 811h/2065d	Inode: 64370910    Links: 3
> ./x86_64-buildroot-linux-gnu/sysroot/usr/libexec/getconf/XBS5_LP64_OFF64: Device: 811h/2065d	Inode: 72747785    Links: 4
> ./x86_64-buildroot-linux-gnu/sysroot/usr/libexec/getconf/POSIX_V6_LP64_OFF64: Device: 811h/2065d	Inode: 72747785    Links: 4
> ./x86_64-buildroot-linux-gnu/sysroot/usr/libexec/getconf/POSIX_V7_LP64_OFF64: Device: 811h/2065d	Inode: 72747785    Links: 4
> ./x86_64-buildroot-linux-gnu/sysroot/usr/bin/getconf: Device: 811h/2065d	Inode: 72747785    Links: 4
> ./x86_64-buildroot-linux-gnu/sysroot/usr/lib/dri/i965_dri.so: Device: 811h/2065d	Inode: 72748076    Links: 2
> ./x86_64-buildroot-linux-gnu/sysroot/usr/lib/dri/i915_dri.so: Device: 811h/2065d	Inode: 72748076    Links: 2
> 
> The gcc hard links are all in the same directory.

Right, that's OK.

> Just "getconf" remains,
> but the RPATH is already empty.

And those are binaries for the target, not the host.

Regards,
Yann E. MORIN.

> Wolfgang.

> Index: host-binutils-2.28.1/ld/Makefile.am
> ===================================================================
> --- host-binutils-2.28.1.orig/ld/Makefile.am
> +++ host-binutils-2.28.1/ld/Makefile.am
> @@ -2226,17 +2226,17 @@ install-exec-local: ld-new$(EXEEXT) inst
>  	n=`echo $(installed_linker) | sed '$(transform)'`; \
>  	if test "$(bindir)" != "$(tooldir)/bin"; then \
>  	  rm -f $(DESTDIR)$(tooldir)/bin/$(installed_linker)$(EXEEXT); \
> -	  ln $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(tooldir)/bin/$(installed_linker)$(EXEEXT) >/dev/null 2>/dev/null \
> +	  ln -s $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(tooldir)/bin/$(installed_linker)$(EXEEXT) >/dev/null 2>/dev/null \
>  	  || $(INSTALL_PROGRAM_ENV) $(LIBTOOL) --mode=install $(INSTALL_PROGRAM) ld-new$(EXEEXT) $(DESTDIR)$(tooldir)/bin/$(installed_linker)$(EXEEXT); \
>  	fi; \
>  	if test "x$(install_as_default)" = "xyes"; then \
>  	  ld=`echo ld | sed '$(transform)'`; \
>  	  rm -f $(DESTDIR)$(bindir)/$$ld$(EXEEXT); \
> -	  ln $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(bindir)/$$ld$(EXEEXT) >/dev/null 2>/dev/null \
> +	  ln -s $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(bindir)/$$ld$(EXEEXT) >/dev/null 2>/dev/null \
>  	  || $(INSTALL_PROGRAM_ENV) $(LIBTOOL) --mode=install $(INSTALL_PROGRAM) ld-new$(EXEEXT) $(DESTDIR)$(bindir)/$$ld$(EXEEXT); \
>  	  if test "$(bindir)" != "$(tooldir)/bin"; then \
>  	    rm -f $(DESTDIR)$(tooldir)/bin/ld$(EXEEXT); \
> -	    ln $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(tooldir)/bin/ld$(EXEEXT) >/dev/null 2>/dev/null \
> +	    ln -s $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(tooldir)/bin/ld$(EXEEXT) >/dev/null 2>/dev/null \
>  	    || $(INSTALL_PROGRAM_ENV) $(LIBTOOL) --mode=install $(INSTALL_PROGRAM) ld-new$(EXEEXT) $(DESTDIR)$(tooldir)/bin/ld$(EXEEXT); \
>  	  fi; \
>  	fi
> Index: host-binutils-2.28.1/ld/Makefile.in
> ===================================================================
> --- host-binutils-2.28.1.orig/ld/Makefile.in
> +++ host-binutils-2.28.1/ld/Makefile.in
> @@ -3738,17 +3738,17 @@ install-exec-local: ld-new$(EXEEXT) inst
>  	n=`echo $(installed_linker) | sed '$(transform)'`; \
>  	if test "$(bindir)" != "$(tooldir)/bin"; then \
>  	  rm -f $(DESTDIR)$(tooldir)/bin/$(installed_linker)$(EXEEXT); \
> -	  ln $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(tooldir)/bin/$(installed_linker)$(EXEEXT) >/dev/null 2>/dev/null \
> +	  ln -s $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(tooldir)/bin/$(installed_linker)$(EXEEXT) >/dev/null 2>/dev/null \
>  	  || $(INSTALL_PROGRAM_ENV) $(LIBTOOL) --mode=install $(INSTALL_PROGRAM) ld-new$(EXEEXT) $(DESTDIR)$(tooldir)/bin/$(installed_linker)$(EXEEXT); \
>  	fi; \
>  	if test "x$(install_as_default)" = "xyes"; then \
>  	  ld=`echo ld | sed '$(transform)'`; \
>  	  rm -f $(DESTDIR)$(bindir)/$$ld$(EXEEXT); \
> -	  ln $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(bindir)/$$ld$(EXEEXT) >/dev/null 2>/dev/null \
> +	  ln -s $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(bindir)/$$ld$(EXEEXT) >/dev/null 2>/dev/null \
>  	  || $(INSTALL_PROGRAM_ENV) $(LIBTOOL) --mode=install $(INSTALL_PROGRAM) ld-new$(EXEEXT) $(DESTDIR)$(bindir)/$$ld$(EXEEXT); \
>  	  if test "$(bindir)" != "$(tooldir)/bin"; then \
>  	    rm -f $(DESTDIR)$(tooldir)/bin/ld$(EXEEXT); \
> -	    ln $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(tooldir)/bin/ld$(EXEEXT) >/dev/null 2>/dev/null \
> +	    ln -s $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(tooldir)/bin/ld$(EXEEXT) >/dev/null 2>/dev/null \
>  	    || $(INSTALL_PROGRAM_ENV) $(LIBTOOL) --mode=install $(INSTALL_PROGRAM) ld-new$(EXEEXT) $(DESTDIR)$(tooldir)/bin/ld$(EXEEXT); \
>  	  fi; \
>  	fi
> Index: host-binutils-2.28.1/binutils/Makefile.in
> ===================================================================
> --- host-binutils-2.28.1.orig/binutils/Makefile.in
> +++ host-binutils-2.28.1/binutils/Makefile.in
> @@ -1512,7 +1512,7 @@ install-exec-local: install-binPROGRAMS
>  	    k=`echo $$j | sed '$(transform)'`; \
>  	    if [ "$(bindir)/$$k" != "$(tooldir)/bin/$$j" ]; then \
>  	      rm -f $(DESTDIR)$(tooldir)/bin/$$j$(EXEEXT); \
> -	      ln $(DESTDIR)$(bindir)/$$k$(EXEEXT) $(DESTDIR)$(tooldir)/bin/$$j$(EXEEXT) >/dev/null 2>/dev/null \
> +	      ln -s $(DESTDIR)$(bindir)/$$k$(EXEEXT) $(DESTDIR)$(tooldir)/bin/$$j$(EXEEXT) >/dev/null 2>/dev/null \
>  		|| $(INSTALL_PROGRAM_ENV) $(LIBTOOL) --mode=install $(INSTALL_PROGRAM) $$i$(EXEEXT) $(DESTDIR)$(tooldir)/bin/$$j$(EXEEXT); \
>  	    fi; \
>  	  else true; \
> Index: host-binutils-2.28.1/gas/Makefile.in
> ===================================================================
> --- host-binutils-2.28.1.orig/gas/Makefile.in
> +++ host-binutils-2.28.1/gas/Makefile.in
> @@ -2698,7 +2698,7 @@ install-exec-tooldir: install-exec-bindi
>  	n=`echo as | sed '$(transform)'`; \
>  	if [ "$(bindir)/$$n$(EXEEXT)" != "$(tooldir)/bin/as$(EXEEXT)" ]; then \
>  	  rm -f $(DESTDIR)$(tooldir)/bin/as$(EXEEXT); \
> -	  ln $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(tooldir)/bin/as$(EXEEXT) >/dev/null 2>/dev/null \
> +	  ln -s $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(tooldir)/bin/as$(EXEEXT) >/dev/null 2>/dev/null \
>  	    || $(INSTALL_PROGRAM_ENV) $(LIBTOOL) --mode=install $(INSTALL_PROGRAM) as-new$(EXEEXT) $(DESTDIR)$(tooldir)/bin/as$(EXEEXT); \
>  	else \
>  	  true ; \
> Index: host-binutils-2.28.1/gas/Makefile.am
> ===================================================================
> --- host-binutils-2.28.1.orig/gas/Makefile.am
> +++ host-binutils-2.28.1/gas/Makefile.am
> @@ -617,7 +617,7 @@ install-exec-tooldir: install-exec-bindi
>  	n=`echo as | sed '$(transform)'`; \
>  	if [ "$(bindir)/$$n$(EXEEXT)" != "$(tooldir)/bin/as$(EXEEXT)" ]; then \
>  	  rm -f $(DESTDIR)$(tooldir)/bin/as$(EXEEXT); \
> -	  ln $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(tooldir)/bin/as$(EXEEXT) >/dev/null 2>/dev/null \
> +	  ln -s $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(tooldir)/bin/as$(EXEEXT) >/dev/null 2>/dev/null \
>  	    || $(INSTALL_PROGRAM_ENV) $(LIBTOOL) --mode=install $(INSTALL_PROGRAM) as-new$(EXEEXT) $(DESTDIR)$(tooldir)/bin/as$(EXEEXT); \
>  	else \
>  	  true ; \
> Index: host-binutils-2.28.1/binutils/Makefile.am
> ===================================================================
> --- host-binutils-2.28.1.orig/binutils/Makefile.am
> +++ host-binutils-2.28.1/binutils/Makefile.am
> @@ -547,7 +547,7 @@ install-exec-local: install-binPROGRAMS
>  	    k=`echo $$j | sed '$(transform)'`; \
>  	    if [ "$(bindir)/$$k" != "$(tooldir)/bin/$$j" ]; then \
>  	      rm -f $(DESTDIR)$(tooldir)/bin/$$j$(EXEEXT); \
> -	      ln $(DESTDIR)$(bindir)/$$k$(EXEEXT) $(DESTDIR)$(tooldir)/bin/$$j$(EXEEXT) >/dev/null 2>/dev/null \
> +	      ln -s $(DESTDIR)$(bindir)/$$k$(EXEEXT) $(DESTDIR)$(tooldir)/bin/$$j$(EXEEXT) >/dev/null 2>/dev/null \
>  		|| $(INSTALL_PROGRAM_ENV) $(LIBTOOL) --mode=install $(INSTALL_PROGRAM) $$i$(EXEEXT) $(DESTDIR)$(tooldir)/bin/$$j$(EXEEXT); \
>  	    fi; \
>  	  else true; \


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

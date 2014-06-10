From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Jun 2014 18:49:29 +0200
Subject: [Buildroot] [RFCv1 1/4] toolchain-external: split target
 installation from staging installation
In-Reply-To: <20140610100446.2adc73c4@free-electrons.com>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1402177567-8021-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140609214928.GJ3512@free.fr>
 <20140610100446.2adc73c4@free-electrons.com>
Message-ID: <20140610164929.GA3561@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-10 10:04 +0200, Thomas Petazzoni spake thusly:
> On Mon, 9 Jun 2014 23:49:28 +0200, Yann E. MORIN wrote:
> > > +define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
> > 
> > Maybe the code from here...
> > 
> > > +	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
> > > +	if test -z "$${SYSROOT_DIR}" ; then \
> > > +		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
> > > +		exit 1 ; \
> > > +	fi ; \
> > > +	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> > > +	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
> > > +	SUPPORT_LIB_DIR="" ; \
> > > +	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
> > > +		LIBSTDCPP_A_LOCATION=$$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
> > > +		if [ -e "$${LIBSTDCPP_A_LOCATION}" ]; then \
> > > +			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
> > > +		fi ; \
> > > +	fi ; \
> > > +	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
> > 
> > ... to here could be moved to a common function, so it can be shared
> > between the staging and target functions?
> 
> How do you suggest this to be done? The problem is that we need those
> variables to be defined within the shell block that follows. I don't
> see any easy way to factorize that. Or maybe I should just take this
> opportunity, and move some of this crap into a helper shell script,
> which will avoid these horrible shell blocks with lots of quoting and
> backslashes.

Hay, I said: "that might not be that easy..." ;-)

Fact is, I was just pointing out the code duplication, code which is not
trivial, and there is an opportunity for those two part to diverge if we
are not careful.

I don't know how we could do that sanely (without too much of double- or
quadruple-dollar signs all over...) I can have  look at it, if you want.

Maybe a big fat comment is all we really need here.

In the end, this is just an RFC, and there's room for improvements. ;-)
But that sure would be a very nice addition to Buildroot! :-)

Regards,
Yann e. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

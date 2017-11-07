From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 7 Nov 2017 06:41:51 +0200
Subject: [Buildroot] How do I pass arguments into autoconfig tools
 ./confgiure
In-Reply-To: <CAB8Uub1EsVQa-xKPqczyRdmL2eWW4UONkC4XZKBemct+BoPpQg@mail.gmail.com>
References: <CAB8Uub1EsVQa-xKPqczyRdmL2eWW4UONkC4XZKBemct+BoPpQg@mail.gmail.com>
Message-ID: <20171107044151.4wetl3obfzyqrpgr@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kyle,

On Mon, Nov 06, 2017 at 09:25:49PM -0600, Kyle Sulek wrote:
> I am trying to add a package to buildroot. The autogen.sh file in the
> source directory is as follows
> 
> ===================================================
> #! /bin/sh
> 
> srcdir=`dirname $0`
> echo "srdir: $srcdir"
> test -z "$srcdir" && srcdir=.
> 
> ORIGDIR=`pwd`
> cd $srcdir
> 
> autoreconf -v --install || exit 1
> cd $ORIGDIR || exit $?
> 
> $srcdir/configure --enable-maintainer-mode "$@"
> 
> ===================================================
> 
> 
> This is what I have for my package .mk file
> ===================================================
> ############################################################
> ####################
> #
> # ti-gbm
> #
> ############################################################
> ####################
> 
> # This correpsonds to SDK 02.00.00.00
> TI_GBM_VERSION = 96f37555c7e82a417b02051661377b10e6b3966e
> TI_GBM_SITE = git://git.ti.com/glsdk/libgbm.git
> TI_GBM_LICENSE = GPL-2.0

The license text in source files heading comments look more like MIT.

> TI_GBM_LICENSE_FILES = GPL-COPYING

I could not find this file in the source tree.

> TI_GBM_INSTALL_STAGING = YES
> TT_GBM_INSTALL_TARGET = YES
> TI_GBM_AUTORECONF = YES
> TI_GBM_AUTORECONF_OPTS = -v --install

Buildroot adds the -i (i.e. --install) parameter already. See 
package/autoconf/autoconf.mk.

> $(eval $(autotools-package))
> ===================================================
> 
> However, I cannot figure out how to pass --enable-maintainer-mode "$@" into
> the configure script.

Since you need AUTORECONF anyway, the --{enable,disable}-maintainer-mode has 
no effect in practice, AFAIU. So I think you can just leave it out.

  https://www.gnu.org/software/automake/manual/automake.html#maintainer_002dmode

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

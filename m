From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Mar 2014 10:48:35 +0100
Subject: [Buildroot] [PATCH] gcc: fix snapshot compile
In-Reply-To: <1395354936-4237-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Thu, 20 Mar 2014 23:35:36 +0100")
References: <1395354936-4237-1-git-send-email-ps.report@gmx.net>
Message-ID: <87pplfvq4s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add gcc snapshot versions dependency on host-flex and host-bison
 > (done as suggested by Thomas Petazzoni [1]).

 > Fixes gcc snapshot version 4.9-20140309 compile failure [2].

 > Tested the following buildroot configs

 > BR2_arm=y
 > BR2_cortex_a9=y
 > BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 > BR2_BINUTILS_VERSION_2_24=y
 > BR2_GCC_VERSION_SNAP=y
 > BR2_GCC_SNAP_DATE="4.9-20140309"

 > and

 > BR2_arcle=y

 > For the ARC case disabled the BINUTILS_FROM_GIT host-flex and host-bison
 > dependency.

 > [1] http://lists.busybox.net/pipermail/buildroot/2014-March/092490.html
 > [2] http://lists.busybox.net/pipermail/buildroot/2014-March/092459.html

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 >  package/gcc/gcc.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
 > index 236297d..bc15932 100644
 > --- a/package/gcc/gcc.mk
 > +++ b/package/gcc/gcc.mk
 > @@ -151,7 +151,7 @@ HOST_GCC_COMMON_DEPENDENCIES += host-mpc
 >  HOST_GCC_COMMON_CONF_OPT += --with-mpc=$(HOST_DIR)/usr
 >  endif
 
 > -ifeq ($(BR2_arc),y)
 > +ifneq ($(or $(BR2_arc),$(BR2_GCC_VERSION_SNAP)),)

'or' is not needed as the symbols expand to nothing or 'y', so you can
just do:

ifneq ($(foo)$(bar)$(blih)$(blah),)
..

Committed with that changed, thanks.

-- 
Bye, Peter Korsgaard

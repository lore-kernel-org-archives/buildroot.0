From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Dec 2016 17:44:52 +0100
Subject: [Buildroot] [PATCH 3/3] [RFC] package/busybox: gneerate
 permissions for enabeld applets
In-Reply-To: <87vaun1mvg.fsf@dell.be.48ers.dk>
References: <cover.1481665059.git.yann.morin.1998@free.fr>
 <6d7c0fcf8647fa6e554e32e0370baec848b9ddef.1481665059.git.yann.morin.1998@free.fr>
 <87vaun1mvg.fsf@dell.be.48ers.dk>
Message-ID: <20161214164452.GC3617@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-12-13 23:32 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > DO NOT COMMIT THIS.
>  > This is jsut an example how to use FOO_PERMISSIONS_FILE.
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > ---
>  >  package/busybox/busybox.mk | 15 +++++++++++++++
>  >  1 file changed, 15 insertions(+)
> 
>  > diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
>  > index f4a241d..9c1f2e8 100644
>  > --- a/package/busybox/busybox.mk
>  > +++ b/package/busybox/busybox.mk
>  > @@ -60,9 +60,24 @@ BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAG
>  >  BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
>  >  BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
>  
>  > +ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
>  > +BUSYBOX_PERMISSIONS_FILE = $(@D)/busybox.permissions
> 
> Careful, what does $(@D) refer to here? When it is used here in the file
> it is output/build/busybox-*, but when it is expanded in fs/common.mk it
> refers to output/images:
> 
> cat    /home/peko/source/buildroot/output-test/images/busybox.permissions   >> /home/peko/source/buildroot/output-test/build/_device_table.txt
> cat: /home/peko/source/buildroot/output-test/images/busybox.permissions: No such file or directory
> 
> 
> > +define BUSYBOX_GEN_PERMISSIONS
>  > +	for app in `grep -r -e "APPLET.*BB_SUID_REQUIRE\|APPLET.*BB_SUID_MAYBE" $(@D)/include/applets.h \
>  > +		| sed -e 's/,.*//' -e 's/.*(//'`; \
>  > +	do \
>  > +		temp=`grep -w $${app} $(@D)/busybox.links`; \
>  > +		if [ -n "$${temp}" ]; then \
>  > +			echo "$${temp} f 4755 0  0 - - - - -"
> 
> You forgot to append ; \ so it doesn't actually work.

No, it does not. Again, as I said in the cover-letter and in this commit
log, it is just a very early smnapshot of the directions we'd have to
follow to allow packages to provide non-constant (i.e. generated)
permissions, and how relatively easy it would be.

If we ever want to do it, of course.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Wed, 30 Jun 2010 19:22:13 +0100
Subject: [Buildroot] [git commit master 1/1] package/config: create
 .depend in object directory
In-Reply-To: <20100621210811.D9437817F1@busybox.osuosl.org>
References: <20100621210811.D9437817F1@busybox.osuosl.org>
Message-ID: <1277922133.2534.45.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I get a (non-fatal) permission denied error when I do "make distclean"
and I've tracked it down to this change, I think.
It appears that $(obj) has an empty value when this is invoked.  I did
not do an out-of-tree build, btw.

        /mnt/LinM/git/lvgit5/buildroot-reatha$ make menuconfig
        ...
        
        /mnt/LinM/git/lvgit5/buildroot-reatha$ make
        ... (this is successful)
        
        /mnt/LinM/git/lvgit5/buildroot-reatha$ make V=1 distclean
        rm -rf     \
        		 /mnt/LinM/git/lvgit5/buildroot-reatha/output/build 
        rm -rf output
        rm -rf /mnt/LinM/git/lvgit5/buildroot-reatha/.config /mnt/LinM/git/lvgit5/buildroot-reatha/.config.old /mnt/LinM/git/lvgit5/buildroot-reatha/.config.cmd /mnt/LinM/git/lvgit5/buildroot-reatha/.auto.deps
        make -C package/config distclean
        make[1]: Entering directory `/mnt/LinM/git/lvgit5/buildroot-reatha/package/config'
        /usr/lib/ccache/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  -I -g -O2 -MM *.c > /.depend 2>/dev/null || :
        /bin/sh: /.depend: Permission denied
        rm -f lkc_defs.h qconf.moc .tmp_qtcheck .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h config.pot linux.pot conf conf.o  zconf.tab.o mconf mconf.o zconf.tab.o lxdialog/checklist.o lxdialog/util.o lxdialog/inputbox.o lxdialog/textbox.o lxdialog/yesno.o lxdialog/menubox.o qconf qconf.o gconf gconf.o kconfig_load.o zconf.tab.o kxgettext.o zconf.tab.o
        rm -f lxdialog/checklist.o lxdialog/util.o lxdialog/inputbox.o lxdialog/textbox.o lxdialog/yesno.o lxdialog/menubox.o conf.o  zconf.tab.o mconf.o zconf.tab.o lxdialog/checklist.o lxdialog/util.o lxdialog/inputbox.o lxdialog/textbox.o lxdialog/yesno.o lxdialog/menubox.o kxgettext.o zconf.tab.o \
        		conf qconf gconf kxgettext    \
        		mconf .depend
        make[1]: Leaving directory `/mnt/LinM/git/lvgit5/buildroot-reatha/package/config'


As you can see it attempts to create a file in the system root
directory.



On Mon, 2010-06-21 at 23:07 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=a4c99e8fb068686e8d81fa0b33bf088651f3805f
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  package/config/Makefile |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/config/Makefile b/package/config/Makefile
> index 34cc4b7..f0a030f 100644
> --- a/package/config/Makefile
> +++ b/package/config/Makefile
> @@ -5,9 +5,9 @@ srctree := .
>  
>  include Makefile.kconfig
>  #HOSTCFLAGS+=-Dinline="" -include foo.h
> --include .depend
> -.depend: $(wildcard *.h *.c)
> -	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) -MM *.c > .depend 2>/dev/null || :
> +-include $(obj)/.depend
> +$(obj)/.depend: $(wildcard *.h *.c)
> +	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) -MM *.c > $@ 2>/dev/null || :
>  
>  __hostprogs := $(sort $(hostprogs-y) $(hostprogs-m))
>  host-csingle := $(foreach m,$(__hostprogs),$(if $($(m)-objs),,$(m)))

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 12:22:26 +0200
Subject: [Buildroot] [PATCHv2] package/ustr: don't run ldconfig
In-Reply-To: <1471184013-29565-1-git-send-email-yann.morin.1998@free.fr>
References: <1471184013-29565-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160819122226.32007e6b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Aug 2016 16:13:33 +0200, Yann E. MORIN wrote:
> The ustr Makefile.in (as introduced by the Debian patch we apply), is
> probably not parallel-safe:
> 
>   402 install: install-opt install-dbg
>   403
>   404 install-opt: install-dirs install-opt-lib install-common
>   405
>   406 install-dbg: install-dirs install-dbg-lib install-common
>   407
>   408 install-opt-lib install-dbg-lib install-common: install-dirs
>   [--SNIP--]
>   424 install-opt-lib: $(OPT_LIB_STATIC) $(OPT_LIB_SHARED) ustr.pc
>   425         @echo Installing files
>   426         install -m 644 -t $(DESTDIR)$(libdir) $(OPT_LIB_STATIC)
>   427         install -m 755 -t $(DESTDIR)$(libdir) $(OPT_LIB_SHARED)
>   428         -rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
>   429         ln -s $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
>   430         -rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
>   431         ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
>   432         -rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
>   433         ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
>   434         $(LDCONFIG) -n $(DESTDIR)$(libdir)
>   435         install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr.pc
>   436
>   437 install-dbg-lib: $(DBG_LIB_STATIC) $(DBG_LIB_SHARED) ustr-debug.pc
>   438         @echo Installing files
>   439         install -m 644 -t $(DESTDIR)$(libdir) $(DBG_LIB_STATIC)
>   440         install -m 755 -t $(DESTDIR)$(libdir) $(DBG_LIB_SHARED)
>   441         -rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
>   442         ln -s $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
>   443         -rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
>   444         ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
>   445         -rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
>   446         ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
>   447         $(LDCONFIG) -n $(DESTDIR)$(libdir)
>   448         install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr-debug.pc
> 
> As Thomas already noticed [0], the two interesting rules above are not
> dependent one on the other, so can be run in parallel. So, while one is
> doing its rm'n'ln dance, the other can be running an ldconfig, which has
> the side effect of creating the missing symlinks. So, we can see this
> sequence:
> 
>     install-opt-lib:                        install-dbg-lib:
>                                                 ldconfig
>         rm -f .../$(OPT_LIB_SHAREDEV)            \
>                                                   `-> symlink(..., .../$(OPT_LIB_SHAREDEV))
>         ln -s .../$(OPT_LIB_SHAREDEV)
> 
> In this case, ldconfig uses the opportunity-window between the rm and
> the ln to create the link; so the ln does not work, as the target
> already exist.
> 
> We fix that by not running ldconfig at all in Buildroot, we just pass
> LDCONFIG=/bin/true .
> 
> Fixes (hopefully, since I was not even able to reproduce the failure):
>     http://autobuild.buildroot.org/?reason=ustr-1.0.4
>     http://autobuild.buildroot.org/results/936/93626f55625ed7900c147bfd79ff7802366639b1/
>     http://autobuild.buildroot.org/results/18b/18b6ec537da9e9055f58a8649c0719dc64df1bcf/
>     [...]
> 
> [0] http://lists.busybox.net/pipermail/buildroot/2016-May/161923.html
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Changes v1 -> v2:
>   - don't patch Makefile.in, it is not strictly needed for Buildroot
>     since we pass LDCONFIG=/bin/true  (Arnout)
> ---
>  package/ustr/ustr.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

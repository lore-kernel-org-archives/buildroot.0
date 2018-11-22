From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Nov 2018 10:45:56 +0100
Subject: [Buildroot] Issues with Freescale defconfigs
Message-ID: <20181122104556.1d89c074@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

We have a similar issue with several Freescale defconfigs in Buildroot.
The U-Boot build fails with:

  CFGS    board/freescale/mx6qsabreauto/mx6dl.cfg.cfgtmp
  CFGS    board/freescale/mx6qsabreauto/mx6dl.cfg.cfgtmp
mv: cannot stat 'board/freescale/mx6qsabreauto/.mx6dl.cfg.cfgtmp.tmp': No such file or directory
arch/arm/imx-common/Makefile:75: recipe for target 'board/freescale/mx6qsabreauto/mx6dl.cfg.cfgtmp' failed
make[2]: *** [board/freescale/mx6qsabreauto/mx6dl.cfg.cfgtmp] Error 1

See:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/123771053
  https://gitlab.com/buildroot.org/buildroot/-/jobs/123771054
  https://gitlab.com/buildroot.org/buildroot/-/jobs/123771055

I started looking into this, but the problem is not really obvious.
Apparently, the if_changed_dep function does a mv:

if_changed_dep = $(if $(strip $(any-prereq) $(arg-check) ),                  \
        @set -e;                                                             \
        $(echo-cmd) $(cmd_$(1));                                             \
        scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).tmp;\
        rm -f $(depfile);                                                    \
        mv -f $(dot-target).tmp $(dot-target).cmd)

And this final mv fails because the file $(dot-target).tmp has not been
created. Indeed, the command creates mx6dl.cfg.cfgtmp, but the mv
expects .mx6dl.cfg.cfgtmp

Are you aware of this issue ? Any solution ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

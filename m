From: Michal Sojka <sojka@merica.cz>
Date: Fri, 02 May 2014 15:07:40 +0200
Subject: [Buildroot] [PATCH] Rebuild busybox when an external config is
	updated
In-Reply-To: <20140501203103.GA3231@free.fr>
References: <1396469147-21713-1-git-send-email-sojka@merica.cz>
 <CAAXf6LVyQfj8Z=RQkfq_tyjN-e305bZSpKaOg5N5FpVSsc1Tbg@mail.gmail.com>
 <20140501203103.GA3231@free.fr>
Message-ID: <87ha58corn.fsf@steelpick.2x.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

thanks for the response.

On Thu, May 01 2014, Yann E. MORIN wrote:
> Thomas, Michal, All,
>
> On 2014-05-01 21:46 +0200, Thomas De Schampheleire spake thusly:

[...]

> We've already talked about it with Thomas P on IRC a while back. Here's
> the transcript of our discussion:
>
> --- Log opened Sun Apr 20 10:52:25 2014
> [--SNIP--]
> 12:02 < kos_tom> opinions about http://patchwork.ozlabs.org/patch/336465/ ?
> 12:04 < y_morin> kos_tom: http://patchwork.ozlabs.org/patch/336465/  <--
>                  we have PKG-clean-for-reconfigure for this, no?
> 12:05 < y_morin> kos_tom: But most importantly: if we do that for
>                  busybox, we need to do that for: linux, uClibc and any
>                  other package for which the user can provide a .config
> 12:06 < y_morin> kos_tom: So, I'd suggest we mark is as "Rejected" and
>                  ask to modify the manual about his situation.
> 12:09 < kos_tom> y_morin: to me, it's part of the "we don't try to be
>                  smart and to detect what needs to be rebuilt"
> 12:11 < kos_tom> clean-for-* are internal targets, they are not really
>                  meant to be used, and they are not documented
> 12:12 < y_morin> kos_tom: Well, we do have rebuild and reconfigure.
>
>
> So, it looks like both Thomas and me thinks this is not really something
> we want. I especially like kos_tom's comment:
>
>     it's part of the "we don't try to be smart and to detect what needs
>     to be rebuilt"
>
> I still stand by this position.

I could definitely live with this conclusion, but on the other hand I
don't think that adding one more dependency is being "too smart". What
are the drawbacks of adding this functionality? If it is just adding the
same to other packages, I'm willing to do that. Quick grep suggests that
only the following packages have custom config files: at91bootstrap3.mk,
barebox.mk, ubi.mk, linux.mk, busybox.mk, freetype.mk, luarocks.mk,
qt.mk, uclibc.mk.

Or, is there other easy way how to achieve the following? I want to have
all files that influence my root filesystem in a separate repository.
Currently my repo contains the following files:

    output/.config          # buildroot config
    output/.gitignore
    output/GNUmakefile      # See below
    output/busybox.config
    output/perm_table.txt
    output/postbuild
    output/ubinize.cfg
    buildroot               # Git submodule with buildroot

Cloning this repo and running make in output/ reproducibly rebuilds the
root filesystem. The GNUmakefile is a modified version of automatically
generated Makefile from 'make menuconfig O=../output'. The modification
include changing the -C parameter of make to relative path, setting
environment variables such as BUSYBOX_CONFIG_FILE and updating "my"
busybox config after buildroot innovation. See the full listing below.
This setup allows me the easily track what has been changed in my project
and I don't have to remember running XXX-update-config after every
busybox-menuconfig.

    export BUSYBOX_CONFIG_FILE=$(CURDIR)/busybox.config
    #export BR2_EXTERNAL=$(CURDIR)/../XXX
     
    lastword = $(word $(words $(1)),$(1))
    makedir := $(dir $(call lastword,$(MAKEFILE_LIST)))
     
    MAKEARGS := -C ../buildroot
    MAKEARGS += O=$(if $(patsubst /%,,$(makedir)),$(CURDIR)/)$(patsubst %/,%,$(makedir))
     
    MAKEFLAGS += --no-print-directory
     
    .PHONY: all $(MAKECMDGOALS)
     
    all     := $(filter-out Makefile,$(MAKECMDGOALS))
     
    _all:
            $(MAKE) $(MAKEARGS) $(all)
            -$(MAKE) $(MAKEARGS) busybox-update-config
     
    Makefile:;
     
    $(all): _all
            @:
     
    %/: _all
            @:

Best regards,
-Michal

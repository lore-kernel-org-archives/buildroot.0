From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Jul 2015 01:07:23 +0200
Subject: [Buildroot] Adding package that builds Kernel Module (*.ko) to
 Buildroot environment
In-Reply-To: <CAGiqocXLc13enqMF9dZhtMVx0Q=3dp4620aGKG3TrvQXvcuK-A@mail.gmail.com>
References: <CAGiqocXLc13enqMF9dZhtMVx0Q=3dp4620aGKG3TrvQXvcuK-A@mail.gmail.com>
Message-ID: <55A0502B.3050001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ron,

 Please use text-only messages on this list, it looks much cleaner.

On 07/10/15 01:05, Ron Schmitt wrote:
> 
>   Hello,
> 
> I am embarking on my first embedded driver development project.
> 
> 
>   Could someone possibly give the explicit commands for how to do this, i..e.
>   how to add a package that builds Kernel Module (*.ko) to Buildroot environment
> 
> 
>   Let's assume the following:
> 
> - I have installed buildroot at   
> 
>     /path/buildroot
> 
> - I have executed "make menuconfig" and set up my build.  
> - I have not yet run the build, i.e. I have not executed "make"
> - I have copied your "/hello world" kernel module /c file to   
> 
>     /path/buildroot/mykmod.c
> 
> - I have copied your patch file to   
> 
>     /path/buildroot/kmod-example.patch

 This example is much too old to still be applicable with current buildroot,
though the changes are not that dramatic.

 With current buildroot, you should create a new directory outside of buildroot,
which contains a Config.in and external.mk file and a directory mykmod that
contains the files Config.in and mykmod.mk. See [1]

 For your convencience, I've created that structure in [2]. You can just clone
it and start from there.


 The next step is to go to the buildroot directory and run:

BR2_EXTERNAL=<path_to_buildroot-mykmod> make menuconfig

You will now see an additional menu entry at the bottom: User-provided options.
In this menu, select the mykmod package. Now run 'make' and it will be built.

 Please consult the buildroot manual to understand what is going on here [3].
For your real kernel module, you'll also want to replace the _SOURCE and _SITE
variables with a reference to your VCS.


 Note that very soon now, a new infrastructure will be merged to simplify the
building of external linux kernel modules. With that infrastructure, mykmod.mk
will become:

###############################################################################
#
# mykmod
#
###############################################################################

MYKMOD_VERSION = 1.0
MYKMOD_SOURCE = mykmod-$(MYKMOD_VERSION).tar.bz2
MYKMOD_SITE = file://$(BR2_EXTERNAL)

$(eval $(kernel-module))
$(eval $(generic-package))



Regards,
Arnout

[1] http://nightly.buildroot.org/manual.html#outside-br-custom
[2] http://gitlab.com/arnout/buildroot-mykmod.git
[3] http://nightly.buildroot.org/manual.html#adding-packages


> 
> 
> Thank you very much for your time and assistance.
> 
> 
>   Ron
[snip]



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

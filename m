From: Philip Prindeville <philipp_subx@redfish-solutions.com>
Date: Thu, 24 Jul 2008 18:39:04 -0700
Subject: [Buildroot] Improving buildroot
Message-ID: <48892EB8.7090909@redfish-solutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

I'm new to the list, but not to linux nor the idea of cross-compiling 
under Unix.

I've been using some of the buildroot work under the Astlinux project, 
which I contribute to.

I've noticed some issues with particular projects, and some recurring 
issues of a more generalized nature.

If any of this has been covered in the past, apologies for backtracking 
on old terrain.

One of the first things I noticed was that there are a lot of braindead 
configure.ac scripts out there that don't handle cross-compilation.  
That won't be of news to anyone I don't think.  The 2nd thing that I 
followed on with was that by using the appropriate --with, --without, 
--enable, --disable, and ac_cv_foo values when invoking ./configure, a 
lot of this stuff could be mitigated.

The 2nd argument to AC_CHECK_SIZEOF() is a travesty, and there's no good 
reason for having it.  It will be wrong as often as it will be right, so 
why bother having it at all?

I also noticed that some of the buildroot makefile's don't properly 
order their targets or rely on their dependencies' ages properly, so 
that doing a "make all" followed by another "make all" doesn't, in fact, 
result in "Nothing to be done for `all'" as the result... but instead a 
lot of rules are run again for no apparent reason.

I try to fix these as I encounter them, but I've not been very diligent 
about noting them.  I'll try to do better, and indeed to post my patches 
to makefiles as I find them.

So... getting back to the first issue... incorrect detection of the 
target environment's characteristics when cross-compiling...  Why don't 
we just capture most of this into a Makefile statically?

In the astlinux project, for instance, we have in one of our Makefiles 
something like:

LINUX_VERSION_MAJOR:=$(shell echo $(LINUX_VERSION) | cut -d. -f1)
LINUX_VERSION_MINOR:=$(shell echo $(LINUX_VERSION) | cut -d. -f2)
LINUX_VERSION_TRIPLE:=$(shell echo $(LINUX_VERSION) | cut -d. -f1-3)
TARGET_CONFIGURE_OPTS+=\
                ac_cv_linux_vers=$(LINUX_VERSION_MAJOR)



(yeah, it could be better written and more standardized... but it works 
for now.) and in target/device/geni586/Makefile.in:

ifeq ($(ARCH),i586)
TARGET_CONFIGURE_OPTS+=\
                ac_cv_sizeof_char=1 \
                ac_cv_sizeof_unsigned_char=1 \
                ac_cv_sizeof_short=2 \
                ac_cv_sizeof_short_int=2 \
                ac_cv_sizeof_unsigned_short=2 \
                ac_cv_sizeof_unsigned_short_int=2 \
                ac_cv_sizeof_int=4 \
                ac_cv_sizeof_long=4 \
                ac_cv_sizeof_long_int=4 \
                ac_cv_sizeof_unsigned=4 \
                ac_cv_sizeof_unsigned_int=4 \
                ac_cv_sizeof_unsigned_long=4 \
                ac_cv_sizeof_unsigned_long_int=4 \
                ac_cv_sizeof_off_t=4 \
                ac_cv_sizeof_size_t=4 \
                ac_cv_sizeof_char_p=4 \
                ac_cv_sizeof_unsigned_char_p=4 \
                ac_cv_sizeof_voidp=4 \
                ac_cv_sizeof_long_long=8 \
                ac_cv_sizeof_long_long_int=8 \
                ac_cv_sizeof_unsigned_long_long=8 \
                ac_cv_sizeof_unsigned_long_long_int=8 \
                ac_cv_sizeof_off64_t=8 \
                ac_cv_sizeof_loff_t=8
endif


Since there are a lot of broken "configure" scripts out there, and 
there's no point in having 50 or more packages try to figure out the 
native size of a "long", then why not predefine a lot of this?

What am I missing?

I'll try to go over my mods to the makefiles, and if I see anything 
useful, I'll post the diffs.

Thanks,

-Philip

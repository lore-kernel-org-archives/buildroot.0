From: Ralph Siemsen <ralphs@netwinder.org>
Date: Mon, 16 Sep 2013 15:45:47 -0400
Subject: [Buildroot] [PATCH v3] apply-patches.sh: detect missing patches
In-Reply-To: <20130916172444.2573614e@skate>
References: <CAAXf6LWWnb5xQUtZA8p3kgoU2et-kD6x9TzyzXykgNbxdsuv+Q@mail.gmail.com>
 <20130911120630.GA14745@harvey.netwinder.org>
 <CAAXf6LX7o9P1tXv3Egk8By-VbzarRYe5JRyTh5+3wYNBz9Z6aQ@mail.gmail.com>
 <20130913181527.GA11933@harvey.netwinder.org>
 <20130913182702.GB3301@free.fr>
 <20130915133709.GA16826@harvey.netwinder.org>
 <20130915141314.GA18166@harvey.netwinder.org>
 <8738p5lud2.fsf@dell.be.48ers.dk> <8738p5i6kq.fsf@dell.be.48ers.dk>
 <20130916172444.2573614e@skate>
Message-ID: <20130916194547.GA1223@harvey.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 16, 2013 at 05:24:44PM +0200, Thomas Petazzoni wrote:
> Dear Peter Korsgaard,
> 
> On Mon, 16 Sep 2013 09:11:49 +0200, Peter Korsgaard wrote:
> 
> > So a bunch of non-patch files. I guess our best option is to degrade the
> > "Unsupported format" check to a warning again?
> 
> Another way of seeing that is that using:
> 
> <pkg>_PATCH = some-debian-tarball
> 
> is not a good idea, and we should have a better way of handling this,
> no?

It looks like only a small number of packages might be affected:

$ grep -ri _PATCH.*DEBIAN .
./package/cvs/cvs.mk:CVS_POST_PATCH_HOOKS += CVS_DEBIAN_PATCHES
./package/thttpd/thttpd.mk:THTTPD_POST_PATCH_HOOKS = THTTPD_DEBIAN_PATCHES
./package/input-tools/input-tools.mk:INPUT_TOOLS_POST_PATCH_HOOKS = INPUT_TOOLS_DEBIAN_PATCHES
./package/sysvinit/sysvinit.mk:SYSVINIT_POST_PATCH_HOOKS = SYSVINIT_DEBIAN_PATCHES
./package/sysklogd/sysklogd.mk:SYSKLOGD_POST_PATCH_HOOKS = SYSKLOGD_DEBIAN_PATCHES
./package/mii-diag/mii-diag.mk:MII_DIAG_POST_PATCH_HOOKS = MII_DIAG_DEBIAN_PATCHES
./package/argus/argus.mk:ARGUS_POST_PATCH_HOOKS += ARGUS_DEBIAN_PATCH_APPLY
./package/liblockfile/liblockfile.mk:LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-4.debian.tar.bz2
./package/setserial/setserial.mk:SETSERIAL_POST_PATCH_HOOKS += SETSERIAL_APPLY_DEBIAN_PATCHES
./boot/grub/grub.mk:GRUB_POST_PATCH_HOOKS += GRUB_DEBIAN_PATCHES
$

Many of those packages actually build fine, because they explicitly apply only
the contents of the debian/patches directory. For example from thttpd.mk:

define THTTPD_DEBIAN_PATCHES
        if [ -d $(@D)/debian/patches ]; then \
                support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
        fi
endef

The only broken packages are: cvs sysvinit liblockfile setserial

So we have a couple of options:
 1) revert the original change back to a warning, or
 2) fixup the four broken packges using the same method.
 3) something else.

I'm not sure which way to go, please give me your thoughts.

-Ralph

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jan 2013 14:24:42 +0100
Subject: [Buildroot] [PATCH 2/7] package/pmake: add host pmake
In-Reply-To: <201301301413.13408.yann.morin.1998@free.fr>
References: <cover.1359498504.git.yann.morin.1998@free.fr>
 <b0d70289993ab5426e1c411b1fc102c7a8022b5d.1359498504.git.yann.morin.1998@free.fr>
 <5108D155.3060208@mind.be>
 <201301301413.13408.yann.morin.1998@free.fr>
Message-ID: <20130130142442.3803d2bc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 30 Jan 2013 14:13:13 +0100, Yann E. MORIN wrote:

> And the generic infrastructure does not allow to extract an archive to
> get patches from.
> 
> Alternatively, we could use the post-patches hook to get the patches
> from the archive, and apply them; but then, we'd need to be able to
> download this archive, and AFAIK, the package infrastructure does not
> allow downloading more than one archive for a package, although it
> might be possible to extend PKG_SOURCE to include more than one file
> to download (but then, which should be extracted?).

We have several packages on which we apply the Debian patches. At least
argus and cvs comes to mind.

Basically, what we do is:

ARGUS_PATCH = argus_$(ARGUS_VERSION)-1.diff.gz

This ensures that the Debian patch is applied, which means that the
files debian/patches/<blabla>.patch are created (but not applied). And
then we do:

define ARGUS_DEBIAN_PATCH_APPLY
        if [ -d $(@D)/debian/patches ]; then \
                support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
        fi
endef

ARGUS_POST_PATCH_HOOKS += ARGUS_DEBIAN_PATCH_APPLY

To actually apply those patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

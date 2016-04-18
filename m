From: Patrick Williams <patrick@stwcx.xyz>
Date: Mon, 18 Apr 2016 16:44:42 -0500
Subject: [Buildroot] [PATCH] Adding in support for custom configurations
In-Reply-To: <20160418211558.12db7fdf@free-electrons.com>
References: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
 <20160417223143.0b54cce6@free-electrons.com>
 <20160418162528.GA5827@asimov.austin.ibm.com>
 <20160418211558.12db7fdf@free-electrons.com>
Message-ID: <20160418214442.GB19968@asimov.austin.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 18, 2016 at 09:15:58PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 18 Apr 2016 11:25:28 -0500, Patrick Williams wrote:
> 
> > 1. Have support for a defconfig location other than
> > $(BR2_EXTERNAL)/configs/.
> > 
> >     We have the proposed patchset, which is too specific due to the use
> >     of 'custom', and we have a local hack where we put the same recipe
> >     into $(BR2_EXTERNAL)/docs/custom/custom.mk.  Other than docs/*/*.mk,
> >     there is no include in buildroot/Makefile into the BR2_EXTERNAL tree
> >     when invoked without an existing .config.
> > 
> >     Would there be opposition to a new -include in buildroot/Makefile
> >     outside of the large $(if BR2_HAVE_DOT_CONFIG... block into the
> >     BR2_EXTERNAL tree?  This would give us a hook point to add the
> >     %_defconfig recipe found in this patchset.
> > 
> >     Alternatively, or additionally, we could create a
> >     BR2_EXTERNAL_CONFIGS variable as a set of additional directories to
> >     search as defconfig locations.
> > 
> > 2. (Bonus) Enhance list-defconfigs to also display the defconfigs found
> > at this extra location.
> > 
> >     Would there be opposition to something like a
> >     $(BR2_LIST_DEFCONFIGS_CMDS) variable to extend the list-defconfigs
> >     in the custom tree?
> 
> I think the only reasonable solution to this is to really allow
> multiple BR2_EXTERNAL directories. A patch series doing this was
> proposed by Yann E. Morin a while ago, but due to the fairly
> significant additional complexity, it hasn't been merged so far.

Has there been any previous discussion about allowing sub-directories
under 'configs'?  The Linux kernel tree allows both
$(ARCH)/configs/*_defconfig and $(ARCH)/configs/*/*_defconfig .  Coupled
with Steve's proposal for us to use symlinks, we could create
$(BR2_EXTERNAL)/configs/custom as a symlink to
$(BR2_EXTERNAL)/custom/configs and have a solution as well.

> One question that immediately comes to mind is: why do you maintain a
> BR2_EXTERNAL tree on your side? If all you do is related to publicly
> available machines/packages, why don't you upstream all what you have
> in Buildroot, and let only your downstream users that need to create
> private/confidential things use the BR2_EXTERNAL feature?

We have been upstreaming packages that seemed globally applicable, but
many of the packages have a very limited set of users.  The burden vs
benefit on the Buildroot team to maintain the recipes for these packages
did not seem justifiable to us.  If we are wrong in that decision we are
certainly open to larger contributions upstream.

For those unfamiliar with the Power architecture, this BR2_EXTERNAL repository
(http://github.com/open-power/op-build) is roughly the equivalent of a BIOS +
grub for Power.  There packages here fall into the following categories:

    1. Early system initialization firmware (CPU, Memory, SMP
    interconnect):
        - Hostboot
    2. Late system initialization firmware (PCIe) and "OPAL" runtime
    abstraction:
        - Skiboot
    3. Board specific data files for #1:
        - <board>-xml
    4. Power bootloader:
        - Petitboot
    5. On-chip power management microcode:
        - OCC
    6. Processor specific binary microcode blobs.

The only one of these that is even remotely useful outside of building
the firmware for a Power8 system is Petitboot because it was also used
in PS3.

The main benefit we get from keeping these in a BR2_EXTERNAL tree is
that we de-couple from Buildroot's patch integration.  Due to product
release cycles it is sometimes useful to keep on a "stable" Buildroot
but add fixes to the Power specific packages.  This could obviously be
done as a separately maintained tree / branch instead.  We have also had
a few cases where the package teams were "slow" at getting in fixes for
a compiler version bump and I suspect if these were directly upstream in
Buildroot there would be an expectation of faster focus on those types
of issues.

CC'ing a few others involved in the project.
-- 
Patrick Williams
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160418/74806c07/attachment.asc>

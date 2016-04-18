From: Patrick Williams <patrick@stwcx.xyz>
Date: Mon, 18 Apr 2016 11:25:28 -0500
Subject: [Buildroot] [PATCH] Adding in support for custom configurations
In-Reply-To: <20160417223143.0b54cce6@free-electrons.com>
References: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
 <20160417223143.0b54cce6@free-electrons.com>
Message-ID: <20160418162528.GA5827@asimov.austin.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 17, 2016 at 10:31:43PM +0200, Thomas Petazzoni wrote:
> Like Steve replied, I don't see the usefulness for this patch. We
> already allow custom configurations to be stored in
> $(BR2_EXTERNAL)/configs/.
> 
Thomas / Steve,

Thank you for the reply.  We agree this is probably not the best
approach for this in the broader sense of buildroot.  Let me explain
what we are trying to accomplish and what we have tried to do thus far.

This patchset originated from work we are doing on the OpenPower
firmware.  We have an existing BR2_EXTERNAL tree,
(https://github.com/open-power/op-build), which has a collection of
packages specific to OpenPower.  You will find a openpower/configs tree
there that contains the defconfigs for the publicly supported systems.

Since machines are often developed under confidentiality we are
attempting to create a "second level" BR2_EXTERNAL.  This is the
openpower/custom tree and where the 'custom' came from in this patchset.
Our intention with that is to give developers a location to place
machines, packages, and patches currently under NDAs while they are
being developed.  By having them in a separate tree, the developers can
continuously rebase against our master branch and have less of a issue
with merge conflicts, since we promise not to place anything in the
custom tree ourselves.

We already utilize BR2_GLOBAL_PATCH_DIR and include custom/*.mk to allow
patches and additional packages to be placed under the custom tree.  The
only piece that is missing is the defconfigs; hence this first attempt
at a patch.  We would like to be able to do the following:

1. Have support for a defconfig location other than
$(BR2_EXTERNAL)/configs/.

    We have the proposed patchset, which is too specific due to the use
    of 'custom', and we have a local hack where we put the same recipe
    into $(BR2_EXTERNAL)/docs/custom/custom.mk.  Other than docs/*/*.mk,
    there is no include in buildroot/Makefile into the BR2_EXTERNAL tree
    when invoked without an existing .config.

    Would there be opposition to a new -include in buildroot/Makefile
    outside of the large $(if BR2_HAVE_DOT_CONFIG... block into the
    BR2_EXTERNAL tree?  This would give us a hook point to add the
    %_defconfig recipe found in this patchset.

    Alternatively, or additionally, we could create a
    BR2_EXTERNAL_CONFIGS variable as a set of additional directories to
    search as defconfig locations.

2. (Bonus) Enhance list-defconfigs to also display the defconfigs found
at this extra location.

    Would there be opposition to something like a
    $(BR2_LIST_DEFCONFIGS_CMDS) variable to extend the list-defconfigs
    in the custom tree?

-- 
Patrick Williams
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160418/a0278e4a/attachment.asc>

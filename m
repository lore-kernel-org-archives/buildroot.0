From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 28 Jan 2019 15:43:20 -0600
Subject: [Buildroot] Linux extension from a BR2_EXTERNAL tree
In-Reply-To: <20190128171247.GH7130@scaer>
References: <20190128172511.754500e4@windsurf> <20190128171247.GH7130@scaer>
Message-ID: <CAMQcK5LZf72Zkk-t2p6ueGVD5JV4VeKpr_18FDM5fc3doVVRZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann and Thomas,

On Mon, Jan 28, 2019 at 11:12 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Thomas, All,
>
> On 2019-01-28 17:25 +0100, Thomas Petazzoni spake thusly:
> > I am trying to implement a Linux extension, which applies a bunch of
> > patches to the Linux kernel tree, as a package in a BR2_EXTERNAL tree.
> [--SNIP--]
> > When I build the kernel, it does run the MUSDK_MARVELL_PREPARE_KERNEL
> > command, but the musdk-marvell dependency was not prepared up to its
> > patching step (it was not even extracted at all), causing the
> > MUSDK_MARVELL_PREPARE_KERNEL hook to fail.
> >
> > So it seems like adding an entry to the LINUX_EXTENSIONS variable
> > *after* linux/linux.mk has been processed works fine for the hook
> > registration, but not for the dependency addition. This looks odd to
> > me. The generic-package infrastructure does seem to have all the
> > necessary double-dollars to make sure the evaluation is delayed to the
> > time of use, but it seems to not be sufficient.
> >
> > I am missing something obvious here ? I am not sure if I'm seeing
> > something that's easily fixable, or something that is just plain
> > impossible due to how make works.
>
> It is imposible to do, indeed, because the dependency registration is
> expanded by the generic-package infra, see:
>
>     package/pkg-generic.mk at 744:
>
>     $$($(2)_TARGET_CONFIGURE):? | $$($(2)_FINAL_DEPENDENCIES)
>
> So, opnce you have registered the linux package, the line above has
> already been evaluated, but your br2-exte5rnal tree has not yet been
> parsed, so LINUX_FINAL_DEPENDENCIES does not (yeT) contain the name of
> your package.
>
> So, there is no easy way to solve this issue.
>
> Either we scan br2-external before our own packages, or we implement a
> mechanism for post-poning the evaluation of packages to after the
> br2-external trees have been parsed.

We've created a "linux-package" type that ties into the linux.mk and
package handling framework. All of the packages that utilize the this
framework are contained with a BR2_EXTERNAL tree. In order to
accomplish this, we had to move the include of linux.mk to after the
BR2_EXTERNAL_MKS. The patch that we carry on our tree is:

diff --git a/Makefile b/Makefile
index a382a5defb..cf6b494a83 100644
--- a/Makefile
+++ b/Makefile
@@ -532,7 +532,6 @@ endif
 include $(sort $(wildcard package/*/*.mk))

 include boot/common.mk
-include linux/linux.mk
 include fs/common.mk

 # If using a br2-external tree, the BR2_EXTERNAL_$(NAME)_PATH variables
@@ -545,6 +544,10 @@ include $(BR2_EXTERNAL_FILE)
 # Nothing to include if no BR2_EXTERNAL tree in use
 include $(BR2_EXTERNAL_MKS)

+# Include after BR2_EXTERNAL tree to allow BR2_EXTERNAL makefile variables
+# to be evalutated in the linux.mk
+include linux/linux.mk
+
 # Now we are sure we have all the packages scanned and defined. We now
 # check for each package in the list of enabled packages, that all its
 # dependencies are indeed enabled.

However, this does have the drawbacks that Yann explained. I haven't
explicitly tested the LINUX_EXTENSIONS framework yet with this but I
believe this modification would work. I'm in the middle of trying to
move our custom "linux-package" (for custom kernel drivers) type to
use the LINUX_EXTENSION framework so I will try to confirm this works
when I get a chance.

[...]

Thanks,
-Ryan

 ---
Ryan Barnett | Sr Systems Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Rd NE, Cedar Rapids, IA 52498 USA
ryan.barnett at collins.com | collinsaerospace.com

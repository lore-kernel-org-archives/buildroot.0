From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Oct 2013 23:09:16 +0200
Subject: [Buildroot] [PATCH v8 RESEND 0/8] Add support for top-level
 parallel make
In-Reply-To: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <52683AFC.1030408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/13 11:34, Fabio Porcedda wrote:
> Hi all,
> this is a patch set for adding support for top-level parallel make in
> buildroot, the common problem scattered in buildroot's top-level
> makefiles is that in the rules it relies on the order of evaluation of
> the prerequisites, to be able to use top-level parallel make instead
> of reling on the left to right ordering of evaluation of the
> prerequisites we must add an explicit rule to describe the
> dependencies.
>
> With this patch set the top-level parallel make seems to work fine,
> example:
> 	make clean
> 	make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN` + 1))
>
> On my quad core system the building time for qemu_x86_defconfig
> is 13m versus 11m.
>
> I've tested the qemu_x86_defconfig uclibc/eglibc/glibc.
>
> Best regards
> Fabio Porcedda

  Hi Fabio,

  I've tested this patch series now. I'll give acks and comments for the 
individual patches later. But first some overall observations.

  When ccache is enabled, make complains about a circular dependency 
$(BUILD_DIR)/host-ccache-3.1.8/.stamp_downloaded <- dependencies
You'll find something similar for sstrip, and when the host doesn't have 
a suitable tar or xz. It's not critical because make will break the 
dependency cycle and still build these packages before the rest, but it's 
not nice. Unfortunately, I don't see a simple way to avoid it.

  In system/system.mk, there are still a few different targets 
manipulating inittab; these have to be serialized.

  The initramfs rootfs will rebuild the kernel in parallel with building 
the cpio archive. This should be fixed, which is probably a bit invasive.

  legal-info doesn't work in parallel. Not a critical concern, but 
ideally that should be fixed as well.



  Regards,
  Arnout

>
> v8:
>   - rebased over master
>   - added patche for for base dependency
>   - added patche for for glibc package
>   - added patche for for uclibc package
>   - removed patch already merged
>   - changed some descriptions
>   - modified the patch for toolchain dependency to prevent circular dependency
> v7:
>   - add the latest patch
>   - add to the first patch the <pkgname>_TOOLCHAIN variable
>   - improve the fifth patch
> v6:
>   - added the fifth patch
>   - updated the fourth patch adding the install targets
>   - updated the second patch to remove TARGETS_ALL
> v5:
>   - added the fourth patch
>   - fixed some typos
>   - rewrited the second patch to use only $$($(2)_TARGET_*) in the rules
>   - add support for top-level parallel make for the glibc package
> v4:
>   - rebased over master
>   - add Acked-by: Thomas Petazzoni on the third patch
>   - changed the orderd of the patches
> v3:
>   - add back the patch "package: add toolchain dependency to
>      inner-generic-package" because now is working fine.
>   - add Acked-by: Arnout Vandecappelle to the third patch.
>   - reworked the second patch following Arnout suggestions.
> v2:
>   - remove patch "package: add toolchain dependency to inner-generic-package"
>     because was not working fine against recent toolchain changes.
>
> Fabio Porcedda (8):
>    package: add base dependency to every package
>    package: add toolchain dependency to every target package
>    package: add support for top-level parallel make
>    Makefile: add support for top-level parallel make
>    glibc: add support for top-level parallel make
>    uclibc: add support for top-level parallel make
>    package: enable jobserver for recursive make
>    Makefile: enable top-level parallel make
>
>   Makefile                                           | 22 +++-----
>   fs/common.mk                                       |  4 +-
>   package/glibc/glibc.mk                             |  7 ++-
>   package/linux-headers/linux-headers.mk             |  3 ++
>   package/pkg-autotools.mk                           |  3 +-
>   package/pkg-generic.mk                             | 60 +++++++++++++---------
>   package/uclibc/uclibc.mk                           |  7 ++-
>   .../toolchain-buildroot/toolchain-buildroot.mk     |  2 +
>   toolchain/toolchain-external/toolchain-external.mk |  2 +
>   toolchain/toolchain/toolchain.mk                   |  5 +-
>   10 files changed, 69 insertions(+), 46 deletions(-)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

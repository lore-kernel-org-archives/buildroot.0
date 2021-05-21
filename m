From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 May 2021 10:46:18 +0200
Subject: [Buildroot] [PATCH 0/9] Fix binutils bug 21464 and remove it
In-Reply-To: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
References: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
Message-ID: <8db63dbe-1abb-3fbf-59c6-6cb14fde577c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Giulio,

 Thanks for these!

On 03/05/2021 13:13, Giulio Benetti wrote:
> This patchset fixes binutils bug 21464 and fixes libgeos build failure
> by introducing the gcc option flag -mcmodel. This is done by adding
> upstreamed binutils and gcc patches. Note tha this way buildroot
> toolchains can be considered bug binutils 21464 free and the only other
> OpenRisc toolchain supported is the external Bootlin one. So this
> patchset has to be considered valid once Bootlin updates its OpenRisc
> by adding binutils and gcc patches that are added with patches in this
> patchset.
> 
> Giulio Benetti (9):
>   package/binutils: update or1k patches for plt link version with
>     upstream
>   package/binutils: add upstream backported patches to support
>     -mcmodel=large gcc option
>   package/gcc: add upstream patches that introduce -mcmodel=large option
>     for or1k

 Patches 1-3 applied to master. Note that I had to fix all of them up because
they failed check-package. The [PATCH N/M] things are not allowed. Ideally, when
you add patches, you shouldn't just pluck them from the mailing list. Instead,
you should apply them in a git clone - preferably by cherry-picking with `git
cherry-pick -x <sha1>` if they have been applied upstream. Then you should
regenerate *all* patches `git format-patch -N <base>..`. Then verify that only
the patches that you intended to change have actually changed.


>   package/libgeos: fix build failure due to missing -mcmodel=large
>   package/protobuf: fix build failure due to missing -mcmodel=large

 As mentioned, these can only be applied after Thomas updates the bootlin
toolchains *and* the patch to update them in Buildroot has been merged. That's
not going to happen on master :-)

>   toolchain: remove binutils bug 21464
>   package/libgeos: remove binutils bug 21464 dependency
>   package/postgis: remove libgeos binutils bug 21464 inheritance
>   package/protobuf: remove binutils bug 21464 dependency

 These four should be squashed into a single patch.


 Regards,
 Arnout

> 
>  .../0010-bfd-elf32-or1k-fix-ld-assert.patch   |  35 --
>  ...ith-plt-link-failure-for-local-calls.patch |  59 +++
>  ...elocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++
>  ...K_GOT16-overflow-failures-in-presenc.patch |  61 +++
>  ...ge-plt_relocs-when-generating-plt-en.patch | 500 ++++++++++++++++++
>  .../0003-bfd-elf32-or1k-fix-ld-assert.patch   |  35 --
>  ...ith-plt-link-failure-for-local-calls.patch |  59 +++
>  ...elocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++
>  ...K_GOT16-overflow-failures-in-presenc.patch |  61 +++
>  ...ge-plt_relocs-when-generating-plt-en.patch | 500 ++++++++++++++++++
>  .../0003-bfd-elf32-or1k-fix-ld-assert.patch   |  35 --
>  ...ith-plt-link-failure-for-local-calls.patch |  59 +++
>  ...elocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++
>  ...K_GOT16-overflow-failures-in-presenc.patch |  61 +++
>  ...ge-plt_relocs-when-generating-plt-en.patch | 500 ++++++++++++++++++
>  .../0003-bfd-elf32-or1k-fix-ld-assert.patch   |  35 --
>  ...ith-plt-link-failure-for-local-calls.patch |  59 +++
>  ...elocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++
>  ...K_GOT16-overflow-failures-in-presenc.patch |  61 +++
>  ...ge-plt_relocs-when-generating-plt-en.patch | 500 ++++++++++++++++++
>  ...-mcmodel-option-to-handle-large-GOTs.patch | 200 +++++++
>  ...-cmodel-large-when-building-crtstuff.patch |  60 +++
>  ...-mcmodel-option-to-handle-large-GOTs.patch | 201 +++++++
>  ...-cmodel-large-when-building-crtstuff.patch |  60 +++
>  package/libgeos/Config.in                     |   4 +-
>  package/libgeos/libgeos.mk                    |   4 +
>  package/postgis/Config.in                     |   4 +-
>  package/protobuf/Config.in                    |   1 -
>  package/protobuf/protobuf.mk                  |   4 +
>  toolchain/Config.in                           |   6 -
>  30 files changed, 4035 insertions(+), 153 deletions(-)
>  delete mode 100644 package/binutils/2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch
>  create mode 100644 package/binutils/2.32/0010-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
>  create mode 100644 package/binutils/2.32/0011-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
>  create mode 100644 package/binutils/2.32/0012-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
>  create mode 100644 package/binutils/2.32/0013-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
>  delete mode 100644 package/binutils/2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch
>  create mode 100644 package/binutils/2.34/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
>  create mode 100644 package/binutils/2.34/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
>  create mode 100644 package/binutils/2.34/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
>  create mode 100644 package/binutils/2.34/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
>  delete mode 100644 package/binutils/2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch
>  create mode 100644 package/binutils/2.35.2/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
>  create mode 100644 package/binutils/2.35.2/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
>  create mode 100644 package/binutils/2.35.2/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
>  create mode 100644 package/binutils/2.35.2/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
>  delete mode 100644 package/binutils/2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch
>  create mode 100644 package/binutils/2.36.1/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
>  create mode 100644 package/binutils/2.36.1/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
>  create mode 100644 package/binutils/2.36.1/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
>  create mode 100644 package/binutils/2.36.1/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
>  create mode 100644 package/gcc/10.3.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
>  create mode 100644 package/gcc/10.3.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch
>  create mode 100644 package/gcc/9.3.0/0006-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
>  create mode 100644 package/gcc/9.3.0/0007-or1k-Use-cmodel-large-when-building-crtstuff.patch
> 

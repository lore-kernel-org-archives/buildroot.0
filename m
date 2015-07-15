From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 15 Jul 2015 10:40:10 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: create symlink to 'lib' from
 ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <1436949545-12487-1-git-send-email-patrickdepinguin@gmail.com>
References: <1436949545-12487-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LV=RT98wu-9LhspGuf5Y1Nc0ajLno3BkL=WvPAB3FwPMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 15, 2015 at 10:39 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Currently, following symbolic links are created in both target and
> staging directories:
> - lib(32|64) --> lib
> - usr/lib(32|64) --> lib
>
> The decision for lib32 or lib64 is based on the target architecture
> configuration in buildroot (BR2_ARCH_IS_64).
>
> In at least one case this is not correct: when building for a Cavium Octeon
> III processor using the toolchain from the Cavium Networks SDK, and
> specifying -march=octeon3 in BR2_TARGET_OPTIMIZATION, libraries are expected
> in directory 'lib32-fp' rather than 'lib32' (likewise for lib64-fp).
>
> More generally, for external toolchains, the correct symbolic link is
> from (usr/)${ARCH_LIB_DIR} to lib. For internal toolchains, current
> toolchains always use either lib32 or lib64.
>
> Fix the problem as follows:
> - create a symlink creation helper in toolchain/helpers.mk
> - for external toolchains, call these helpers based on ARCH_LIB_DIR
> - for internal toolchains, call these helpers based on the existing
>   fixed lib32/lib64 logic, moved from Makefile
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  Makefile                                             | 10 ----------
>  package/skeleton/skeleton.mk                         |  3 ---
>  toolchain/helpers.mk                                 | 13 +++++++++++++
>  toolchain/toolchain-buildroot/toolchain-buildroot.mk | 18 ++++++++++++++++++
>  toolchain/toolchain-external/toolchain-external.mk   | 12 ++++++++++++
>  5 files changed, 43 insertions(+), 13 deletions(-)
>
> Note: in output/staging/usr/ there would still be more directories than I
> think are really necessary. This behavior is not changed by this patch, it
> was already present before.
> For example, with the mentioned Octeon III toolchain, output/staging/usr/
> contains:
>     bin      bin32      bin32-fp      bin64-fp,
>     lib                 lib32-fp      lib64-fp
>     libexec  libexec32  libexec32-fp  libexec64-fp
>     sbin     sbin32     sbin32-fp     sbin64-fp
>
> where bin/lib/libexec/sbin seem to be the 64-bit equivalents of
> bin32/lib32/libexec32/sbin32.
> This is related to the behavior of copy_toolchain_sysroot in
> toolchain/helpers.mk. It already attempts to filter out lib32 and lib64, but
> does not care about any bin/sbin/libexec directories, nor about such names
> as lib32-fp.
> As the behavior is not changed by this patch, and as I'm not fully aware
> about which directories are really needed in all cases, I am not touching
> this area.

Sorry, forgot to add the subject flag v4.

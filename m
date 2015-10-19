From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 19 Oct 2015 11:10:25 +0200
Subject: [Buildroot] [PATCH] toolchain: create symlink to 'lib' from
 ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <1445245676-21017-1-git-send-email-patrickdepinguin@gmail.com>
References: <1445245676-21017-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LWqHebb_JfCONXtG7=qt8HxQ+3u=hBBuBp-UyiSraf2hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 19, 2015 at 11:07 AM, Thomas De Schampheleire
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
>   fixed lib32/lib64 logic, moved from Makefile into gcc-initial.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
> v6: rebase only
>     No feedback on v5, last discussion was on v4, see
>     http://lists.busybox.net/pipermail/buildroot/2015-July/132978.html

Sorry that I forgot to add 'v6' in the subject-prefix.

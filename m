From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 4 Nov 2020 12:33:36 -0600
Subject: [Buildroot] [PATCH 09/10] support/scripts/{pkg-stats, cve.py,
 cve-checker}: support CPE ID based matching
In-Reply-To: <20201104145145.1316167-10-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-10-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpbd3KhH9MLAFMXMzw6u=2wKX0o+jH2-VuoQDjiOnNt+aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas / Greg,

On Wed, Nov 4, 2020 at 8:52 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This commit modifies cve.py, as well as its users cve-checker and
> pkg-stats to support CPE ID based matching, for packages that have CPE
> ID information.
>
> One of the non-trivial thing is that we can't simply iterate over all
> CVEs, and then iterate over all our packages to see which packages
> have CPE ID information that match the CPEs affected by the
> CVE. Indeed, this is an O(n^2) operation.
>
> So instead, we do a pre-filtering of packages potentially affected. In
> check_package_cves(), we build a cpe_product_pkgs dict that associates
> a CPE product name to the packages that have this CPE product
> name. The CPE product name is either derived from the CPE information
> provided by the package if available, and otherwise we use the package
> name, which is what was used prior to this patch.
>
> And then, when we look at CVEs, we only consider the packages that
> have a CPE product name matching the CPE products affected by the
> CVEs. This is done in check_package_cve_affects().
>
> Note that there is a bit of duplication of logic between cve-checker
> and pkg-stats, but we intend in a follow-up series to re-unify those
> two scripts.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/cve-checker | 24 +++++++++++++++++-----
>  support/scripts/cve.py      | 41 +++++++++++++++++++++++++++++--------
>  support/scripts/pkg-stats   | 25 +++++++++++++++-------
>  3 files changed, 70 insertions(+), 20 deletions(-)
>
> diff --git a/support/scripts/cve-checker b/support/scripts/cve-checker
> index 421202d049..e1dfab3805 100755
> --- a/support/scripts/cve-checker
> +++ b/support/scripts/cve-checker

I noticed this tool isn't described in the manual with at least an
example invocation noting why the nvd folder is being cached and the
piping of show-info output, etc.

Basic test config:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_LIBSODIUM=y
BR2_PACKAGE_LIBSSH=y
BR2_PACKAGE_LIBSSH2=y
BR2_PACKAGE_MBEDTLS=y
BR2_PACKAGE_OPENSSL=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set

make show-info | support/scripts/cve-checker --html cve.html
--nvd-path ~/nvd_dl/

Result:  https://pastebin.ubuntu.com/p/H4hZzxgsCZ/

[snip]

> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 0a48cf9581..f357cbe1b6 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats

support/scripts/pkg-stats --html cve.html -p linux --nvd-path ~/nvd_dl --cpeid

Results:  https://pastebin.ubuntu.com/p/RKF3F4bCcG/

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

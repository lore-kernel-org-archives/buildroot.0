From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 13 May 2015 17:01:48 -0500
Subject: [Buildroot] [PATCH v5 07/24] refpolicy: new package
In-Reply-To: <1431553177-7280-8-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-8-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <CAMQcK5L3_97WWbsZ-J0w0EyXrMedaeyWajBZwK-WJ6X5gJsTxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clayton,

A few minor notes below.

On Wed, May 13, 2015 at 4:39 PM, Clayton Shotwell
<clayton.shotwell@rockwellcollins.com> wrote:
> From: Clayton Shotwell <clshotwe@rockwellcollins.com>
>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
> ---
> Changes v4 -> v5:
>   - Removed TODO and dependency on glibc (Matt W.)
>   - Added lib depends to meet policycoreutils limitation on std lib
>     (Matt W.)
>   - Added comment for when an option is not defined (Matt W.)
>   - Removed largefile, locale, and wchar dependencies (Clayton S.)
>   - Remove dependancy on host-python-pyxml (Ryan B.)
>   - Forced package to use $(HOST_DIR)/usr/bin/python2 for python
>     executable (Ryan B.)
>   - Added host-python dependency (Clayton S.)
>   - Removed config menu (suggested by Thomas P.)
>   - Added patch to fix awk issue (Clayton S.)
>
> Changes v3 -> v4:
>   - Added a dependency on host-gawk and correct the awk calls
>     in the makefile to use $(AWK)
>   - Changed the default policy name to br_policy to differentiate
>     the policy generated from refpolicy
>   - Added a install step to create a /.autorelabel file to cause
>     the file system to be relabeled by S12SELinux init script
>   - Adding a default modules.conf file with an option to specify
>     a different one. This will decrease the build time for
>     refpolicy by removing unused policies. (implemented by
>     Thomas P.)
>   - Cleaned up the configure comments (implemented by Thomas).
>   - Added a check to only install the documentation if the
>     Buildroot option is enabled
>   - Removed the build because the install step completes the
>     same process. Also removed the clean step because it is
>     being removed globally from buildroot (implemented by
>     Thomas P.)
>   - Added more error handling to the startup script to print
>     a warning if SELinux fails to install the policy if it
>     exists. This can be caused by the kernel not being configured
>     with SELinux enabled
>
> Changes v2 -> v3:
>   - Changes patch naming convention (suggested by Thomas P.)
>   - Added dependencies on BR2_TOOLCHAIN_HAS_THREADS and
>     BR2_LARGEFILE (suggested by Thomas P.)
>   - Removed configure option for a specific patch folder
>     (suggested by Thomas P.)
>   - Removed distribution configuration option (suggested by Thomas)
>   - Changed the monolithic configuration option to a modular
>     configuration option (suggested by Thomas P.)
>   - Removed the refpolicy name option (suggested by Thomas P.)
>   - Corrected gramatical and comment errors (suggested by Thomas P.)
>   - Multiple style corrections to the mk file (suggested by Thomas P.)
>   - Added a comment to clairfy the usage of the the host build
>     options for a target build
>
> Changes v1 -> v2:
>   - General cleanup to the mk file to conform to the standard format
>   - Fixed the patch naming to match the standard 4 digit numbering
>   - Changed package dependencies into selects in the config
> ---
>  package/Config.in                                  |   2 +
>  package/refpolicy-contrib/Config.in                |  20 +
>  package/refpolicy-contrib/refpolicy-contrib.mk     |  18 +
>  .../0001-Fix-awk-references-to-use-variable.patch  |  42 +++
>  package/refpolicy/Config.in                        |  91 +++++
>  package/refpolicy/S00selinux                       | 136 +++++++
>  package/refpolicy/config                           |   8 +
>  package/refpolicy/modules.conf                     | 406 +++++++++++++++++++++
>  package/refpolicy/refpolicy.hash                   |   2 +
>  package/refpolicy/refpolicy.mk                     | 118 ++++++
>  10 files changed, 843 insertions(+)
>  create mode 100644 package/refpolicy-contrib/Config.in
>  create mode 100644 package/refpolicy-contrib/refpolicy-contrib.mk
>  create mode 100644 package/refpolicy/0001-Fix-awk-references-to-use-variable.patch
>  create mode 100755 package/refpolicy/Config.in

Should remove the execute permissions on Config.in and refpolicy.mk.

>  create mode 100644 package/refpolicy/S00selinux
>  create mode 100644 package/refpolicy/config
>  create mode 100644 package/refpolicy/modules.conf
>  create mode 100644 package/refpolicy/refpolicy.hash
>  create mode 100755 package/refpolicy/refpolicy.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index b99a7e0..dcb03d5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1339,6 +1339,8 @@ endmenu
>
>  menu "Security"
>         source "package/policycoreutils/Config.in"
> +       source "package/refpolicy/Config.in"
> +       source "package/refpolicy-contrib/Config.in"
>         source "package/setools/Config.in"
>  endmenu
>
> diff --git a/package/refpolicy-contrib/Config.in b/package/refpolicy-contrib/Config.in
> new file mode 100644
> index 0000000..af493fd
> --- /dev/null
> +++ b/package/refpolicy-contrib/Config.in
> @@ -0,0 +1,20 @@
> +if BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
> +
> +comment "A refpolicy contrib repository is required if using a refpolicy repo. (Contrib is a GIT submodule of refpolicy)"

GIT should be spell as Git for consistency

> +
> +config BR2_PACKAGE_REFPOLICY_CONTRIB
> +       bool "refpolicy-contrib"
> +       help
> +         A GIT submodule of the refpolicy package.
> +
> +

Remove the extra new line.

> +config BR2_PACKAGE_REFPOLICY_CONTRIB_CUSTOM_REPO_URL
> +       string "URL of custom contrib submodule repository"
> +
> +config BR2_PACKAGE_REFPOLICY_CONTRIB_CUSTOM_REPO_VERSION
> +       string "Custom contrib submodule repository version"
> +       help
> +         Revision to use in the typical format used by Git
> +         e.g. a SHA id, a tag, branch, ..
> +
> +endif

[...]

Thanks,
-Ryan


-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com

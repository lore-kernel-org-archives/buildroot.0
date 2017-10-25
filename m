From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 25 Oct 2017 08:19:48 -0500
Subject: [Buildroot] [PATCH] python-config.sh: don't reassign ${prefix}
In-Reply-To: <20171018165523.13145-1-matthew.weber@rockwellcollins.com>
References: <20171018165523.13145-1-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpZz7emu-ZnQyo0v1KQgmo7Md+zfhDBjhvzqj_yQ9Tu6AQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Oct 18, 2017 at 11:55 AM, Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
> When prefix is set to a path like /usr during crossbuild
> the sed operations end up executing twice, once for the prefix
> reassignment and another for includedir if it is set as a string
> including the ${prefix} variable.  This results in an issue
> when building on a machine that mounts local storage under /usr.
>
> This patch updates the remaining location which uses the prefix
> variable to also sed and update to use the real path.
>
> Upstream bug report:
> https://bugs.python.org/issue31713
>
> Buildroot bug:
> https://bugs.busybox.net/show_bug.cgi?id=10361
>
> Fixes failures like the following:
> python-gobject-2.28.6 | NOK |
> http://autobuild.buildroot.net/results/ac6cf59125ba57402f926e6c65ffe19e065001b5
> dbus-python-1.2.4 | NOK |
> http://autobuild.buildroot.net/results/0d1459155ab6ad2e126e0845ecf6ba2f9381ec8b
>

Ping (no urgency on this one, figured I'd bring it back to the top of
the stack.  Would resolve half a dozen autobr failures a day)

> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  ...29-python-config.sh-don-t-reassign-prefix.patch | 54 ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
>
> diff --git a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
> new file mode 100644
> index 0000000..6a9df14
> --- /dev/null
> +++ b/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
> @@ -0,0 +1,54 @@
> +From 21f787cb9bf0c1440981262f03bc881c5b77c0d8 Mon Sep 17 00:00:00 2001
> +From: Matt Weber <matthew.weber@rockwellcollins.com>
> +Date: Fri, 6 Oct 2017 09:54:15 -0500
> +Subject: [PATCH] python-config.sh: don't reassign ${prefix}
> +
> +When prefix is set to a path like /usr during crossbuild
> +the sed operations end up executing twice, once for the prefix
> +reassignment and another for includedir if it is set as a string
> +including the ${prefix} variable.  This results in an issue
> +when building on a machine that mounts local storage under /usr.
> +
> +This patch updates the remaining location which uses the prefix
> +variable to also sed and update to use the real path.
> +
> +Upstream bug report:
> +https://bugs.python.org/issue31713
> +
> +Buildroot bug:
> +https://bugs.busybox.net/show_bug.cgi?id=10361
> +
> +Fixes failures like the following:
> +python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/ac6cf59125ba57402f926e6c65ffe19e065001b5
> +dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/0d1459155ab6ad2e126e0845ecf6ba2f9381ec8b
> +
> +Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> +---
> + Misc/python-config.sh.in | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
> +index f905a71..e06be0f 100644
> +--- a/Misc/python-config.sh.in
> ++++ b/Misc/python-config.sh.in
> +@@ -29,7 +29,7 @@ prefix_real=$(installed_prefix "$0")
> +
> + # Use sed to fix paths from their built-to locations to their installed-to
> + # locations.
> +-prefix=$(echo "$prefix_build" | sed "s#^$prefix_build#$prefix_real#")
> ++prefix=$prefix_build
> + exec_prefix_build="@exec_prefix@"
> + exec_prefix=$(echo "$exec_prefix_build" | sed "s#^$exec_prefix_build#$prefix_real#")
> + includedir=$(echo "@includedir@" | sed "s#^$prefix_build#$prefix_real#")
> +@@ -47,7 +46,7 @@ LINKFORSHARED="@LINKFORSHARED@"
> + OPT="@OPT@"
> + PY_ENABLE_SHARED="@PY_ENABLE_SHARED@"
> + LDVERSION="@LDVERSION@"
> +-LIBDEST=${prefix}/lib/python${VERSION}
> ++LIBDEST=$( echo "${prefix}/lib/python${VERSION}" | sed "s#^$prefix_build#$prefix_real#")
> + LIBPL=$(echo "@LIBPL@" | sed "s#^$prefix_build#$prefix_real#")
> + SO="@EXT_SUFFIX@"
> + PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
> +--
> +1.8.3.1
> +
> --
> 1.8.3.1
>



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.

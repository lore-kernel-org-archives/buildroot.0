From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 08:34:06 +0200
Subject: [Buildroot] [PATCH] package/mono: fixing multiple definition of
 vasprintf
In-Reply-To: <1438775932-24858-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1438775932-24858-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150806083406.4c3fe36a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Wed,  5 Aug 2015 13:58:52 +0200, Angelo Compagnucci wrote:
> This patch fixes the detection of an available
> vasprintf function, this way the internal vasprintf
> function is not compiled.
> 
> Fixes http://autobuild.buildroot.net/results/3ab2b8667e5657bf07f55dd04dd857167ab4c62a/
>       http://autobuild.buildroot.net/results/3ab2b8667e5657bf07f55dd04dd857167ab4c62a/ 
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

I've applied, but...

> ---
> 
> This patch was submitted upstream and merged here:
> https://github.com/mono/mono/commit/40c171799b671718969ee28a02f92884d7fd181e

... this should have been mentioned in the patch itself.

And your SoB was missing in the patch itself.

> +diff --git a/eglib/configure.ac b/eglib/configure.ac
> +index 5281419..4bf91e5 100644
> +--- a/eglib/configure.ac
> ++++ b/eglib/configure.ac
> +@@ -135,6 +135,7 @@ AC_CHECK_SIZEOF(void *)
> + AC_CHECK_SIZEOF(long)
> + AC_CHECK_SIZEOF(long long)
> + AC_CHECK_FUNCS(strlcpy stpcpy strtok_r rewinddir vasprintf)
> ++AC_CHECK_FUNC(vasprintf, have_vasprintf=yes)

And this is clearly not a very clean solution. The AC_CHECK_FUNCS()
macro already checks for vasprintf availability, so with this new line,
you're checking two times for the same function.

And AC_CHECK_FUNCS already defines ac_cv_func_<function>=yes when the
function is available. So a better change would be to rely on
ac_cv_func_vasprintf=yes rather than defining this additional
have_vasprintf=yes variable.

That being said, since the patch has been accepted upstream, I've
applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 11:12:47 +0200
Subject: [Buildroot] [PATCH] package/dbus-cpp: new patch to fix dbus c++
 threading issue
In-Reply-To: <20200706153355.429941-1-kamel.bouhara@bootlin.com>
References: <20200706153355.429941-1-kamel.bouhara@bootlin.com>
Message-ID: <20200712111247.118e8aae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kamel,

On Mon,  6 Jul 2020 17:33:55 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> From: https://sourceforge.net/p/dbus-cplusplus/patches/18/
> 
> dispatcher.h has invalid template code. When DBUS_HAS_RECURSIVE_MUTEX is
> MutexFreeFn and MutexLockFn become of type void and the code is valid.
> See lines 232-235.
> However, when a user #includes dispatcher.h directly or indirectly the
> macro DBUS_HAS_RECURSIVE_MUTEX is undefined. This makes the above
> function pointers defined of type bool and but then _init_threading
> function call in line 259 becomes invalid, as it passes function
> pointers to mutex_free and mutex_lock which or of type void.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
>  .../dbus-cpp/0004-dbus-c++-threading.patch    | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/dbus-cpp/0004-dbus-c++-threading.patch
> 
> diff --git a/package/dbus-cpp/0004-dbus-c++-threading.patch b/package/dbus-cpp/0004-dbus-c++-threading.patch
> new file mode 100644
> index 0000000000..502320ad09
> --- /dev/null
> +++ b/package/dbus-cpp/0004-dbus-c++-threading.patch
> @@ -0,0 +1,45 @@

Thanks for your patch, but the patch itself needs a proper commit
title, commit description and Signed-off-by. See
https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

Also, under what conditions does this build failure occurs ? We don't
have any build failures for the dbus-cpp package in our autobuilders.

Finally, it looks like Ubuntu or Debian have a 5.0.x version of
dbus-cpp, and we're at 0.9.0. It's really unclear what site really is
the official upstream for this project.

The SourceForge project points to a Gitorious Git repository, but
Gitorious has been shut down a few years ago. Then there is
https://github.com/lib-cpp/dbus-cpp, but is that the same project ?

Hm according to
https://www.freedesktop.org/wiki/Software/DBusBindings/, dbus-c++
(which we call dbus-cpp in Buildroot) is different from dbus-cpp. They
also say that dbus-c++ has been inactive since 2011, and shouldn't be
used.

Perhaps we should instead remove this package entirely ? Do you have
the possibility of moving to a properly maintained D-Bus C++ binding ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

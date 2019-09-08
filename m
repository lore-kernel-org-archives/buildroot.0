From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 08 Sep 2019 15:45:56 +0000
Subject: [Buildroot] [Bug 12191] cmake BUILDDIR
In-Reply-To: <bug-12191-163@https.bugs.busybox.net/>
References: <bug-12191-163@https.bugs.busybox.net/>
Message-ID: <bug-12191-163-PkEju4eWhR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12191

--- Comment #4 from Arnout Vandecappelle <arnout@mind.be> ---
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -66,9 +66,9 @@
>  
>  
>  ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
> -$(2)_BUILDDIR			= $$($(2)_SRCDIR)
> -else
> -$(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
> +$(2)_BUILDDIR			?= $$($(2)_SRCDIR)
> +else
> +$(2)_BUILDDIR			?= $$($(2)_SRCDIR)/buildroot-build
>  endif

I am not at all happy with this approach.

First of all, it becomes unnecessary if/when the separate-source-and-build-dir
series finally gets merged.

Second, the approach taken by pkg-cmake is already kind of awkward IMO;
allowing individual packages to override BUILDDIR makes it worse.

Third, it breaks a couple of things, e.g. <pkg>-dirclean.

Finally, the problem is really with the package itself, there should be no
reason at all to reject output/build/$(PKG_NAME)-$(PKG_VERSION)/buildroot-build
as the build directory. So just patch the package and whatever check it does,
replace it with a check that CMAKE_SOURCE_DIR != CMAKE_BINARY_DIR.

Failing that, I would be more in favour in advancing the
separate-source-and-build-dir approach.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

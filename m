From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 16:24:57 +0100
Subject: [Buildroot] [PATCH 03/13] docs/manual: rephrase and expand part
 on when a full rebuild is necessary
In-Reply-To: <1393167879-16637-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1393167879-16637-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140223152457.GE3342@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-23 16:04 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/rebuilding-packages.txt | 93 ++++++++++++++++++++++++++++---------
>  1 file changed, 71 insertions(+), 22 deletions(-)
> 
> diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
> index 4872e88..26e244c 100644
> --- a/docs/manual/rebuilding-packages.txt
> +++ b/docs/manual/rebuilding-packages.txt
> @@ -5,33 +5,82 @@
>  Understanding when a full rebuild is necessary
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> -A full rebuild is achieved by running:
> +Buildroot does not attempt to detect what parts of the system should
> +be rebuilt when the system configuration is changed through +make
> +menuconfig+, +make xconfig+ or one of the other configuration
> +tools. In some cases, Buildroot should rebuild the entire system, in
> +some cases, only a specific subset of packages. But detecting this in
> +a completely reliable manner is very difficult, and therefore the
> +Buildroot developers have decided to simply not attempt to do this.
> +
> +Instead, it is the responsibility of the user to know when a full
> +rebuild is necessary. As a hint, here are a few rules of thumb that
> +can help you understand how to work with Buildroot:
> +
> + * When the target architecture configuration is changed, a complete
> +   rebuild is needed. Changing the architecture variant, the binary
> +   format or the floating point strategy for example has an impact on
> +   the entire system.
> +
> + * When the toolchain configuration is changed, a complete rebuild
> +   generally is needed. Changing the toolchain configuration often
> +   involves changing the compiler version, the type of C library or
> +   its configuration, or some other fundamental configuration item,
> +   and these changes have an impact on the entire system.
> +
> + * When an additional package is added to the configuration, a full
> +   rebuild is not necessarily needed. Buildroot will detect that this
> +   package has never been built, and will build it. However, if this
> +   package is a library that can optionally be used by packages that
> +   have already been built, Buildroot will not automatically rebuild
> +   those. Either you know which packages should be rebuilt, and you
> +   can rebuild them manually, or you should do a full rebuild. For
> +   example, let's suppose you have built a system with the +ctorrent+
> +   package, but without +openssl+. Your system works, but you realize
> +   you would like to have SSL support in +ctorrent+, so you enable the
> +   +openssl+ package in Buildroot configuration and restart the
> +   build. Buildroot will detect that +openssl+ should be built and
> +   will be build it, but it will not detect that +ctorrent+ should be
> +   rebuilt to benefit from +openssl+ to add OpenSSL support. You will
> +   either have to do a full rebuild, or rebuild +ctorrent+ itself.
> +
> + * When a package is removed from the configuration, Buildroot does
> +   not do anything special. It does not remove the files installed by
> +   this package from the target root filesystem or from the toolchain
> +   _sysroot_. A full rebuild is needed to get rid of this
> +   package. However, generally you don't necessarily need this package
> +   to be removed right now: you can wait for the next lunch break to
> +   restart the build from scratch.
> +
> + * When the sub-options of a package are changed, the package is not
> +   automatically rebuilt. After making such changes, rebuilding only
> +   this package is often sufficient, unless enabling the package
> +   sub-option adds some features to the package that are useful for
> +   another package which has already been built. Again, Buildroot does
> +   not track when a package should be rebuilt: once a package has been
> +   built, it is never rebuilt unless explicitly told to do so.
> +
> + * When a change to the root filesystem skeleton is made, a full
> +   rebuild is needed. However, when changes to the root filesystem
> +   overlay, to a post-build script or a post-image script are made,
> +   there is no need for a full rebuild: a simple +make+ invocation
> +   will take the changes into account.
> +
> +Generally speaking, when you're facing a build error and you're unsure
> +of the potential consequences of the configuration changes you've
> +made, do a full rebuild. If you get the same build error, then you are
> +sure that the error is not related to partial rebuilds of packages,
> +and if this error occurs with packages from the official Buildroot, do
> +not hesitate to report the problem! As your experience with Buildroot
> +progresses, you will progressively learn when a full rebuild is really
> +necessary, and you will save more and more time.
> +
> +For reference, a full rebuild is achieved by running:
>  
>  ---------------
>  $ make clean all
>  ---------------
>  
> -In some cases, a full rebuild is mandatory:
> -
> -* each time the toolchain properties are changed, this includes:
> -
> -** after changing any toolchain option under the _Toolchain_ menu (if
> -   the internal Buildroot backend is used);
> -** after running +make uclibc-menuconfig+.
> -
> -* after removing some libraries from the package selection.
> -
> -In some cases, a full rebuild is recommended:
> -
> -* after adding some libraries to the package selection (otherwise,
> -  packages that can be optionally linked against those libraries
> -  won't be rebuilt, so they won't support those new available
> -  features).
> -
> -In other cases, it is up to you to decide if you should run a
> -full rebuild, but you should know what is impacted and understand what
> -you are doing anyway.
> -
>  [[rebuild-pkg]]
>  Understanding how to rebuild packages
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -- 
> 1.8.3.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

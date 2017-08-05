From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 5 Aug 2017 09:55:20 +0200
Subject: [Buildroot] host cmake packages pick up wrong path for
 library/include discovery
In-Reply-To: <DB6PR07MB3141CF640804B6C49A5917D794B00@DB6PR07MB3141.eurprd07.prod.outlook.com>
References: <DB6PR07MB3141CF640804B6C49A5917D794B00@DB6PR07MB3141.eurprd07.prod.outlook.com>
Message-ID: <CAHXCMM+nCwt0s3eF2gaOn4aDNBgDPigKQLDvfbxExcNyw1QjXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank, all,

On Thu, Aug 3, 2017 at 3:08 AM, Sigalas, Antonios (Nokia - GR/Athens)
<antonios.sigalas@nokia.com> wrote:
> Hello,
>
>
> When a host package is configured with cmake (e.g. mariadb), the libraries
> and includes that are picked up by cmake are not the correct ones. The
> reason for this is that in the pkg-cmake.mk file the CMAKE_FIND_ROOT_PATH
> variables for host packages is set to HOST_DIR. While this is a reasonable
> choice, it happens than in buildroot the toolchain's sysroot is under the
> HOST_DIR path. This could cause cmake to discover the "wrong"
> libraries/includes during configuration time.
>
>
> In order to reproduce, just run a "make libxml2 host-mariadb-configure" (so
> that libxml2 exists in the toolchain's sysroot when host-mariadb is
> configured) and look for the output concerning the discovery of the libxml2
> package during host-mariadb package configuration. Although this does not
> cause a failure, I believe that this is an error and one that is generic to
> host packages that are built with cmake.
>

Confirmed (using the cmake binary from the host system).

>
> Unfortunately I have not yet been able to come up with a proposed fix as I
> am not aware of a cmake parameter that would cause some paths to be excluded
> when cmake searches for libraries/includes under the configured
> CMAKE_FIND_ROOT_PATH.

It comes from the libxml2-config.cmake file, which internally calls pkg-config.
Since the PATH is set to find program from the BR host bindir, the BR
pkg-config wrapper will be called with no specific env. vars set.
However, by default, the BR pkg-config wrapper checks for the target stuff,
So, because we forgot to tell the pkg-config wrapper to look for host
stuff, it wrongly find the target stuff for libxml.

This bug may also affects others packages and others host dependencies.
Fix incoming.


Note: I also wonder whether the host-libxml2 dependency should be
added to host-mariadb. Is libxml2 a requirement for mariadb?

Regards,

-- 
Samuel

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 21:49:04 +0200
Subject: [Buildroot] [PATCH v4 for-next 1/2] package/exim: remove libnsl
 linking
In-Reply-To: <20180519185827.23898-1-romain.naour@gmail.com>
References: <20180519185827.23898-1-romain.naour@gmail.com>
Message-ID: <20180519214904.0383d9e1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 May 2018 20:58:26 +0200, Romain Naour wrote:
> glibc now considers its built-in libnsl as being obsolete, and requires
> passing --enable-obsolete-libnsl to have it built and installed. libnsl
> is now provided as a separate project [1], but it isn't packaged yet in
> Buildroot.
> 
> In preparation for dropping --enable-obsolete-libnsl from the glibc
> package, this commit ensures that exim doesn't use libnsl. It was
> already the case for uclibc and musl toolchains, so this commit simply
> extends that to make sure libnsl is also not used with glibc toolchains.
> 
> Only Exim's nis.so and nisplus.so lookup modules require libnsl,
> but they are not build by default. So we can safely remove -lnsl
> from the Makefile-Linux. If someone want these modules, a new libnsl
> package must be added first to provide nsl library.
> 
> Since we remove -lnsl unconditionally, use a patch instead of a sed command.
> 
> [1] https://github.com/thkukuk/libnsl.git
> [2] https://fedoraproject.org/wiki/Changes/NISIPv6
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
> v4: remove -lnsl by a patch instread of a sed (Baruch).
> v3: Also comment the buildconfig build issue on the host with Fedora 28 (Luca)
>     Add a comment about this issue in exim.mk
> ---
>  package/exim/0006-remove-libnsl.patch | 37 +++++++++++++++++++++++++++++++++++
>  package/exim/exim.mk                  |  9 ---------
>  2 files changed, 37 insertions(+), 9 deletions(-)
>  create mode 100644 package/exim/0006-remove-libnsl.patch

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

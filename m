From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 22:25:10 +0200
Subject: [Buildroot] [PATCH v2 1/2] pkgconf: Add a host-pkg-config
 wrapper script.
In-Reply-To: <20200210155548.31928-1-nicolas.cavallari@green-communications.fr>
References: <20200210155548.31928-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20200412222510.3f51d985@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nicolas,

On Mon, 10 Feb 2020 16:55:47 +0100
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> The host-pkg-config wrapper script replicate the configuration
> present in HOST_MAKE_ENV, with the exception of PKG_CONFIG_LIBDIR
> whose default is already equal to what we want.
> 
> This wrapper script can be used with build systems that recognise the
> difference between a host dependency and a target dependency.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> 
> --
> 
> HOST_MAKE_ENV could be modified to use host-pkg-config, but since we
> cannot guarantee that every host package will use the PKG_CONFIG
> environment variable (instead of e.g. finding pkg-config in $PATH), the
> other PKG_CONFIG_* variables probably need to be kept as well, so it
> wouldn't be useful to use it there.
> ---
>  package/pkgconf/host-pkg-config | 8 ++++++++
>  package/pkgconf/pkgconf.mk      | 3 +++
>  2 files changed, 11 insertions(+)
>  create mode 100644 package/pkgconf/host-pkg-config

I believe this series is no longer needed, since
4e0bc29993376613d200e892d491e31ea5a49622 was merged.

In addition, your series was not completely fixing the problem. Indeed
with your series, target packages built with meson would use the cross
pkg-config, while host packages built with meson would use the "native"
pkg-config.

But there is one case that your series doesn't handle: some target
packages do internally build a host tool, which requires some external
libraries that are detected by pkg-config. Meson has the correct logic
to handle that, and pass the right pkg-config arguments. But your
solution would not allow to support such situations, while the solution
implemented in 4e0bc29993376613d200e892d491e31ea5a49622 does.

Of course, if you still an issue in the meson pkg-config handling,
please let us know.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

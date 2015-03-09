From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 9 Mar 2015 10:07:32 +0100
Subject: [Buildroot] [PATCH 1/1] docs/manual: add host package
	documentation
In-Reply-To: <1425620595-4032-1-git-send-email-heyleke@gmail.com>
References: <1425620595-4032-1-git-send-email-heyleke@gmail.com>
Message-ID: <CAAXf6LX0aJnVoyqvu9_qW+rCk0mXBCiuQZLSr3eAqNwSGhndXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

On Fri, Mar 6, 2015 at 6:43 AM, Jan Heylen <heyleke@gmail.com> wrote:
> Signed-off-by: Jan Heylen <heyleke@gmail.com>
> ---
>  docs/manual/adding-packages-directory.txt | 33 +++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 8a88282..9abef23 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -49,6 +49,39 @@ supposed to contain anything but the 'bare' name of the package.
>  source "package/libfoo/Config.in"
>  --------------------------
>
> +
> +=== Target packages with a host part

I think this description is not correct for all cases: there are
several cases where it only is a host package, for example genimage.

What about naming the section 'Config.in.host file' in symmetry with
the previous section 'Config.in file'?

> +
> +For packages having a host part, there are two options:
> +Either the host packages is only required for one or more target packages
> +to be build. In that case, add a host-<foo> to each of the packages +depends+
> +or +select+.
> +
> +Or if it is feasible that the user wants to be able to select or deselect the
> +host package, you can use the +Config.in.host+ file. This file will contain the
> +option descriptions related to our +host-<foo>+ software that will be used
> +and displayed in the configuration tool. It should basically contain:

I would rephrase it as follows:

Some packages also need to be built for the host system. There are two
options here:

a. the host package is only required to satisfy build-time
dependencies of one or more target packages. In this case, add
+host-foo+ to the target package's +BAR_DEPENDENCIES+ variable. No
+Config.in.host+ file should be created.

b. the host package should be explicitly selectable by the user from
the configuration menu. In this case, create a +Config.in.host+ file
for that host package:

> +
> +---------------------------
> +config BR2_PACKAGE_HOST_FOO
> +       bool "host foo"
> +       help
> +         This is a comment that explains what foo for the host is.
> +
> +         http://foosoftware.org/foo/
> +---------------------------
> +
> +The same coding style and options as for the +Config.in+ file are valid.
> +
> +Finally you have to add your new +libfoo/Config.in.host+ to
> ++package/Config.in.host+. The files included there are 'sorted alphabetically'
> +and are 'NOT' supposed to contain anything but the 'bare' name of the package.
> +
> +--------------------------
> +source "package/foo/Config.in.host"
> +--------------------------
> +

The host package will then be available from the +Host utilities+ menu.


Best regards,
Thomas

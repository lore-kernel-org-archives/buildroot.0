From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 3 Apr 2021 15:16:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-cffi: needs threads
In-Reply-To: <20210403125536.2219244-1-fontaine.fabrice@gmail.com>
References: <20210403125536.2219244-1-fontaine.fabrice@gmail.com>
Message-ID: <CAPi7W80BNq2Rfeu=ix7N8fHL-DbqFYGhw__gX+YmSzwV_p8HRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm setting this patch as "Rejected" as this build failure is due to
commit b5dede7d1a03ab2b8caa0a8e79b09c8df6c62fe4 which wrongly select
python3 if python is not selected resulting in python being selected
even without threads support

Le sam. 3 avr. 2021 ? 14:55, Fabrice Fontaine
<fontaine.fabrice@gmail.com> a ?crit :
>
> libffi needs threads since commit
> 77cf5b5a71aa54039f4dbc509a1c7cb40aa04934 (more than 6 years ago)
>
> Strangely enough this is the first time there is a build failure on the
> autobuilders
>
> Fixes:
>  - http://autobuild.buildroot.org/results/acdbf7c58ec8ae648f8048bc75650dcdcdca6285
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-cffi/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/python-cffi/Config.in b/package/python-cffi/Config.in
> index bc9f6a296d..3f332c0504 100644
> --- a/package/python-cffi/Config.in
> +++ b/package/python-cffi/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_CFFI
>         bool "python-cffi"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
>         select BR2_PACKAGE_LIBFFI
>         select BR2_PACKAGE_PYTHON_PYCPARSER # runtime
>         help
> @@ -8,3 +9,6 @@ config BR2_PACKAGE_PYTHON_CFFI
>           and reliable way of calling C code from Python.
>
>           https://pypi.python.org/pypi/cffi
> +
> +comment "python-cffi needs a toolchain w/ threads"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
> --
> 2.30.2
>
Best Regards

Fabrice

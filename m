From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 8 Jan 2019 16:13:57 +0100
Subject: [Buildroot] [PATCH 12/19] infra/pkg-generic: store md5 of
 just-installed files
In-Reply-To: <4ccf7565614332a1435f3729936dea4a73d5c4e9.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <4ccf7565614332a1435f3729936dea4a73d5c4e9.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LV8aKmuieFi2eUo5Zv5ucOCVAjCJwnVftnpXiPrTUo2tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El lun., 7 ene. 2019 a las 23:06, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Now that we can accurately list files touched during a package
> installation, we can restore the md5sum to those files with a minor
> impact on the build time, generally in the order of a few tens of
> milliseconds per package at worst, but that his regained later by

that is

> providing even more accurate accountability of files to packages, and
> will even also allows ignoring packages that install the same file with
> the same content.
>
> Update parser accordingly.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> Cc: John Keeping <john@metanate.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-generic.mk       | 10 +++++++---
>  support/scripts/brpkgutil.py |  2 ++
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index d261b5bf76..dd6650db7f 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -63,14 +63,18 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
>  # field separator. A record is made of these fields:
>  #  - file path
>  #  - package name
> +#  - md5sum of file content, as installed by this package
>  # $(1): package name
>  # $(2): base directory to search in
>  # $(3): suffix of file  (optional)
>  define step_pkg_size_inner
>         cd $(2); \
> -       find . \( -type f -o -type l \) \
> -               -newer $@_before \
> -       |sed -r -e 's/$$/\x00$(1)\x00/' \
> +       { \
> +               find . -type d -newer $@_before -printf 'directory  %p\n'; \
> +               find . -xtype f -newer $@_before -print0 \

Note that the original implementation also used '-xtype' on the
directory case, I think it's important.


/Thomas

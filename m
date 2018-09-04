From: Cam Hutchison <cam@camh.ch>
Date: Tue, 4 Sep 2018 10:10:03 +1000
Subject: [Buildroot] [PATCH v2 2/3] dependencies: host-make version check
In-Reply-To: <20180903191933.26080-2-romain.naour@gmail.com>
References: <20180903191933.26080-1-romain.naour@gmail.com>
 <20180903191933.26080-2-romain.naour@gmail.com>
Message-ID: <CABa6e=pwvwN3oob6q8y7-6KxCXbjcByPWWAztEOWPfOBWNbwqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4 September 2018 at 05:19, Romain Naour <romain.naour@gmail.com> wrote:

[snip]

> diff --git a/support/dependencies/check-host-make.sh b/support/dependencies/check-host-make.sh
> new file mode 100755
> index 0000000000..9c31f4a415
> --- /dev/null
> +++ b/support/dependencies/check-host-make.sh
> @@ -0,0 +1,42 @@
> +#!/bin/sh
> +
> +# prevent shift error
> +[ $# -lt 2 ] && exit 1
> +
> +major_min="${1%.*}"
> +minor_min="${1#*.}"
> +
> +shift
> +
> +# The host make program is already checked by dependencies.sh but we
> +# want to check the version number even if Buildroot is able to use
> +# GNU make >= 3.81 but some packages may require a more recent version.
> +make="$1"
> +
> +# Output of 'make --version' examples:
> +# GNU Make 4.2.1
> +# GNU Make 4.0
> +# GNU Make 3.81
> +version=`$make --version 2>&1 | sed -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-\
> +].*//g' -e '1q'`
> +
> +major=`echo "$version" | cut -d. -f1`
> +minor=`echo "$version" | cut -d. -f2`
> +bugfix=`echo "$version" | cut -d. -f3`
> +
> +if [ -z "${bugfix}" ] ; then
> +       bugfix=0
> +fi
> +
> +if [ $major -lt $major_min ]; then
> +       # echo nothing: no suitable make found
> +       exit 1
> +fi
> +
> +if [ $major -eq $major_min -a $minor -lt $minor_min ]; then
> +       # echo nothing: no suitable make found
> +       exit 1
> +fi

Rather than parsing version strings, I've had good success with using sort -V:

if [ "$(printf '%s\n' "${minver}" "${makever}" | sort -V | head -n 1)"
!= "${minver}" ]; then
  exit 1
fi

sort -V was added to GNU sort in coreutils 7.0 released 2008-10-05

> +
> +# valid
> +echo $make
> --
> 2.14.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

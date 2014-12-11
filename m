From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 21:42:09 +0100
Subject: [Buildroot] [PATCH 3/4 v4] pkg-download: verify the hashes from
 the download wrapper
In-Reply-To: <d0dd46117de298b684c5fc90f5e4efe0d160d3b7.1418322200.git.yann.morin.1998@free.fr>
References: <cover.1418322200.git.yann.morin.1998@free.fr>
 <d0dd46117de298b684c5fc90f5e4efe0d160d3b7.1418322200.git.yann.morin.1998@free.fr>
Message-ID: <20141211214209.6df5e210@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 11 Dec 2014 19:24:47 +0100, Yann E. MORIN wrote:

> diff --git a/support/download/check-hash b/support/download/check-hash
> index 13e361a..b41a87e 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -5,9 +5,11 @@ set -e
>  # Call it with:
>  #   $1: the path of the file containing all the the expected hashes
>  #   $2: the full path to the file to check
> +#   $3: the basename of the file to check
>  
>  h_file="${1}"
>  file="${2}"
> +base="${3}"

I was very confused here by $2 and $3. If you have "the full path to
the file to check", why would you need "the basename of the file to
check" as argument. I believe this should be clarified:

 $2: the full path to the temporary file that was downloaded, and that
     should be checked

 $3: the name of the real file we are downloading. Used only for
     messages, as we are in fact checking a temporary file, and waiting
     for this temporary file to be fully downloaded and checked before
     renaming it to the real file name.

Of course, feel free to reword this in a better way.

> -            if [ "${f}" = "${file##*/}" ]; then
> +            if [ "${f}" = "${base}" ]; then

Hum, so it is not only used for display. So you need to reword the
above.

>      # tmp_output is in the same directory as the final output, so we can
>      # later move it atomically.
>      tmp_output="$( mktemp "${output}.XXXXXX" )"
> @@ -147,7 +159,7 @@ DESCRIPTION
>              bzr     Bazaar
>              cp      local files via simple copy
>              cvs     Concurrent Versions System
> -            git     git
> +            git     Git

Should be part of a previous patch.

>              hg      Mercurial
>              scp     remote files via Secure copy

Maybe you want to capitalize "Local files..." and "Remote files..." as
well, for consistency.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

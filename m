From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 11:39:54 +0200
Subject: [Buildroot] [PATCH] relocate-sdk: Allow relocating to any
 location
In-Reply-To: <20200328234945.12552-1-glex.spb@gmail.com>
References: <20200328234945.12552-1-glex.spb@gmail.com>
Message-ID: <20210717093954.GJ12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Gleb, All,

On 2020-03-28 23:49 +0000, Gleb Mazovetskiy spake thusly:
> Previously, the script could only relocate to the current location.

I am not sure to understand what you mean...

The SDK can already be relocated to any location:

    $ cd /path/to/anywhere
    $ tar xf /path/to/sdk.tar
    $ ./relocate-sdk

> This caused issues for SDK maintainers, as the default target location
> (e.g. /opt/my-sdk) would need to be created and the content copied
> to it during the build process, which is error-prone.
> 
> With this change you can now pass a target location argument to
> ./relocate-sdk.sh (this does not move the directory).

I fail to see the purpose for that... If the SDK is not there, what is
the point of relocating to a location where the SDK is not?

Eventually, the user will have to either extract the SDK in the proper
location, or move it there, so whether they are able to run the script
prior to the move does not seem very interesting...

So, I am far from convinced by this change... :-(

Additionally, last time I had to touch on the SDK topic, I got seriously
burnt, so I'd like that people that have a better grasp, the history, and
some beliefs, in the SDK, look at that patch, please...

Regards,
Yann E. MORIN.

> ---
>  support/misc/relocate-sdk.sh | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/support/misc/relocate-sdk.sh b/support/misc/relocate-sdk.sh
> index caabeaa6f6..981d272425 100755
> --- a/support/misc/relocate-sdk.sh
> +++ b/support/misc/relocate-sdk.sh
> @@ -1,15 +1,20 @@
>  #!/bin/sh
> -#
> -if [ "$#" -ne 0 ]; then
> -    echo "Run this script to relocate the buildroot SDK at that location"
> +
> +if [ "$#" -gt 1 ]; then
> +    echo "Usage: $0 [path]"
> +    echo "Run this script to relocate the buildroot SDK to the current location"
> +    echo "If [path] is given, sets the location to [path] (without moving it)"
>      exit 1
>  fi
>  
> -LOCFILE="share/buildroot/sdk-location"
> -FILEPATH="$(readlink -f "$0")"
> -NEWPATH="$(dirname "${FILEPATH}")"
> +cd "$(dirname "$(readlink -f "$0")")"
> +if [ "$#" -eq 1 ]; then
> +    NEWPATH="$1"
> +else
> +    NEWPATH="${PWD}"
> +fi
>  
> -cd "${NEWPATH}"
> +LOCFILE="share/buildroot/sdk-location"
>  if [ ! -r "${LOCFILE}" ]; then
>      echo "Previous location of the buildroot SDK not found!"
>      exit 1
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 24 Sep 2019 12:50:26 +0200
Subject: [Buildroot] [PATCH] check-kernel-headers.sh: use a trap to
 remove the temporary file
In-Reply-To: <20190924024940.17631-1-unixmania@gmail.com>
References: <20190924024940.17631-1-unixmania@gmail.com>
Message-ID: <30114_1569322228_5D89F4F4_30114_250_3_20190924105026.GC3517@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2019-09-23 23:49 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> The POSIX specification defines a 'trap <action> EXIT' mechanism that is
> useful to perform clean-up actions in shell scripts. A trap has two main
> advantages over hand-crafted clean-up mechanisms:
> 
> - It runs even if the process is terminated by a SIGTERM.
> - It runs even if the script stops due to a pipeline failure (set -e).
> 
> Now we can make the script to stop immediately if a compilation error
> occurs, instead of letting it try to run an unexisting program.
> 
> This change may appear to be overkill but Buildroot is an open source
> project and each piece of code is a potential learning tool for other
> developments. We must strive to provide good examples.

This last paragraph is not useful in this commit log.

> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  support/scripts/check-kernel-headers.sh | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
> index a8b94f6a02..970e5abf9e 100755
> --- a/support/scripts/check-kernel-headers.sh
> +++ b/support/scripts/check-kernel-headers.sh
> @@ -9,6 +9,14 @@ HDR_M="${HDR_VER%%.*}"
>  HDR_V="${HDR_VER#*.}"
>  HDR_m="${HDR_V%%.*}"
>  
> +# Exit on any error, so we don't try to run an unexisting program if the
> +# compilation fails.
> +set -e
> +
> +# Set the clean-up trap in advance to prevent a race condition in which we
> +# create the file but get a SIGTERM before setting it.
> +trap '[ -n "${EXEC}" ] && rm -f "${EXEC}"' EXIT

I usually do not like this construct too much, because it fails
(shell-wise) when the condition is not met, although we actually do not
care about the failure of the command list.

But in this case, it is not a problem that EXEC is empty:

    $ rm -f '' ; echo $?
    0

so we can simplify the trap:

    trap 'rm -f "${EXEC}"' EXIT

>  EXEC="$(mktemp -p "${BUILDDIR}" -t .check-headers.XXXXXX)"
>  
>  # We do not want to account for the patch-level, since headers are
> @@ -33,10 +41,8 @@ int main(int argc __attribute__((unused)),
>          return 1;
>      }
>      return 0;
> +    etaporra

I guess this is a leftover to test the trap? ;-)

Otherwise, with the simplified trap:

    Acked-by: Yann E. MORIN <yann.morin@orange.com>

Regards,
Yann E. MORIN.

>  }
>  _EOF_
>  
>  "${EXEC}"
> -ret=${?}
> -rm -f "${EXEC}"
> -exit ${ret}
> -- 
> 2.18.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

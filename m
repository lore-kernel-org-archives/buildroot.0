From: yann.morin at orange.com <yann.morin@orange.com>
Date: Thu, 10 Oct 2019 10:58:13 +0200
Subject: [Buildroot] [PATCH 1/1] utils/test-pkg: set the return code for
 fail
In-Reply-To: <20191010085120.32730-1-heiko.thiery@gmail.com>
References: <20191010085120.32730-1-heiko.thiery@gmail.com>
Message-ID: <13086_1570697895_5D9EF2A7_13086_200_3_20191010085813.GD3532@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2019-10-10 10:51 +0200, heiko.thiery at gmail.com spake thusly:
> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> Add an option (-e) to exit the script with an error if a build
> or the legal-info check fails.

This commit log should be updated now that the option has been removed.

> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
> ---
>  utils/test-pkg | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/test-pkg b/utils/test-pkg
> index f3b34d5d0d..5e440b12f6 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -138,6 +138,10 @@ main() {
>  
>      printf "%d builds, %d skipped, %d build failed, %d legal-info failed\n" \
>          ${nb} ${nb_skip} ${nb_fail} ${nb_legal}
> +
> +    if [ ${nb_fail} -ne 0 -o ${nb_legal} -ne 0 ]; then
> +        return 1
> +    fi

It might be simpler to just return the number of failures:

    return $((nb_fail+nb_legal))

>  }
>  
>  build_one() {
> @@ -264,4 +268,7 @@ _EOF_
>  }
>  
>  my_name="${0##*/}"
> -main "${@}"
> +main "${@}" && ret=0 || ret=${?}
> +if [ ${ret} -ne 0 ]; then
> +    exit 1
> +fi

No need for this gymnastics: the script will return with the same return
code as the last command in the script, which in this case happen to be
the return code of main(), which will be 1 in case of error.
So, you really only need to change the return code of main().

Regards,
Yann E. MORIN.

> -- 
> 2.20.1
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

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2015 20:38:51 +0200
Subject: [Buildroot] [PATCH v6 5/8] support/download: add possibility to
 not fail on missing hash
In-Reply-To: <1429466158-28878-5-git-send-email-arnout@mind.be>
References: <cover.1429447148.git.yann.morin.1998@free.fr>
 <1429466158-28878-1-git-send-email-arnout@mind.be>
 <1429466158-28878-5-git-send-email-arnout@mind.be>
Message-ID: <20150419183851.GM4313@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-19 19:55 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> In very constrained cases, it might be needed to not fail if a hash is
> missing. This is notably the case for custom external toolchains to be
> downloaded, because we do have a .hash file for external toolchains,
> but we obviously can not have hashes for all existing custom toolchains
> (he, "custom"!).
> 
> So, add a way to avoid failing in that case.
> 
> >From the Makefile, we export the list of files for which not to check

Stray leading '>' probably for a copy-paste from your mailer.

> the hash. Then, from the check-hash script, if no check was done, and
> the file we were trying to match in in this exclusion list, we just exit
> without error.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> [Arnout: fix the pattern in the case statement]
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changed v5 -> v6:
>   - fix the pattern in the case clause

Yeah, thanks. Obviously, I did not test that case (although the other
tests I ran were OK, I missed testing the custom toolchain to be
downloaded, which is a shame since that's exactly what I was trying to
fix with this series, to begin with...).

[--SNIP--]
> diff --git a/support/download/check-hash b/support/download/check-hash
> index 678a7ef..d378701 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -99,6 +99,12 @@ while read t h f; do
>  done <"${h_file}"
>  
>  if [ ${nb_checks} -eq 0 ]; then
> +    case " ${BR_NO_CHECK_HASH_FOR} " in
> +    *\ ${base}\ *)

I don't like much the escaping when it can be avoided. We can still use
quotes (even if not very much better), like so:

    *" ${base} "*

Regards,
Yann E. MORIN.

> +        # File explicitly has no hash
> +        exit 0
> +        ;;
> +    esac
>      printf "ERROR: No hash found for %s\n" "${base}" >&2
>      exit 0
>  fi
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Feb 2021 23:06:01 +0100
Subject: [Buildroot] [PATCH] support/download/svn: fix date format for
 archive creation
In-Reply-To: <20210219212154.27107-1-vfazio@xes-inc.com>
References: <20210219212154.27107-1-vfazio@xes-inc.com>
Message-ID: <20210222220601.GH2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, All,

On 2021-02-19 15:21 -0600, Vincent Fazio spake thusly:
> Previously we would use the date provided by:
> `svn info --show-item last-changed-date ...`
> 
> The date returned from this command could include sub-second precision
> which is not compatible with the PAX options we specify to GNU tar.
> 
> Now the returned date is massaged to drop the sub-seconds.
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

In the end, I did move it to the helper, because:

  - this really is an internal detail on a limitation of the PAX format,

  - we do not really mind what exact timestamp goes in the archive, as
    long as it is reproducible.

Also, as suggested by Arnout, I switched to usig an explicit date-time
POSIX-compliant format string, rather than rely on -Iseconds, which is
a GNU extension.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/download/svn | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/support/download/svn b/support/download/svn
> index 839dccaf62..ea1032267f 100755
> --- a/support/download/svn
> +++ b/support/download/svn
> @@ -52,6 +52,9 @@ _svn export ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
>  # last line (svn outputs everything on stdout)
>  date="$( _svn info --show-item last-changed-date "'${uri}@${rev}'" |tail -n 1 )"
>  
> +# Drop sub-second precision to play nice with GNU tar's valid_timespec check
> +date="$( date -d "${date}" -uIseconds )"
> +
>  # Generate the archive.
>  # We did a 'svn export' above, so it's not a working copy (there is no .svn
>  # directory or file to ignore).
> -- 
> 2.30.0
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

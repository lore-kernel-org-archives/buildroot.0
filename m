From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 10:58:32 +0100
Subject: [Buildroot] [PATCH] support/download/svn: generate reproducible
 svn archives
In-Reply-To: <20191222213148.13762-1-heiko.thiery@gmail.com>
References: <20191222213148.13762-1-heiko.thiery@gmail.com>
Message-ID: <20191230095832.GI26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2019-12-22 22:31 +0100, Heiko Thiery spake thusly:
> To generate a reproducible archive from a svn repository mainly the same
> aproach is done like for the archives from a git repository.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  support/download/svn | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/support/download/svn b/support/download/svn
> index 542b25c0a2..505cdd58b1 100755
> --- a/support/download/svn
> +++ b/support/download/svn
> @@ -38,4 +38,19 @@ _svn() {
>  
>  _svn export ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
>  
> -tar czf "${output}" "${basename}"
> +# Generate the archive, sort with the C locale so that it is reproducible.
> +# We do not want the .svn dir; we keep other .svn files, in case they are the
> +# only files in their directory.
> +find "${basename}" -not -type d \
> +       -and -not -path "./.svn/*" >"${output}.list"
> +LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
> +
> +# Create GNU-format tarballs, since that's the format of the tarballs on
> +# sources.buildroot.org and used in the *.hash files
> +tar cf - --transform="s#^\./#${basename}/#" \
> +         --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \

Where does "${date}" comes from? Nothing is setting it...

So I've added some code to that effect, and pushed to master, thanks.

Regards,
Yann E. MORIN.

> +         -T "${output}.list.sorted" >"${output}.tar"
> +gzip -6 -n <"${output}.tar" >"${output}"
> +
> +rm -f "${output}.list"
> +rm -f "${output}.list.sorted"
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

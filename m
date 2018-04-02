From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Apr 2018 14:35:45 +0200
Subject: [Buildroot] [PATCH] check-host-tar.sh: bump minimum tar version
 to 1.27 for reproducible tar files with long paths
In-Reply-To: <20180402094808.6973-1-peter@korsgaard.com>
References: <20180402094808.6973-1-peter@korsgaard.com>
Message-ID: <20180402123545.GL3625@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-04-02 11:48 +0200, Peter Korsgaard spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/b18/b187e64a61918f17f69588e2355a03286bc5808e
> 
> tar 1.27 subtly changed the tar format when a GNU long link entry is added
> (which is done for path elements > 100 characters).  The code used to set
> the permission mode of the link entry to 0:
> 
>   header = start_private_header ("././@LongLink", size, time (NULL));
>   FILL (header->header.mtime, '0');
>   FILL (header->header.mode, '0');
>   FILL (header->header.uid, '0');
>   FILL (header->header.gid, '0');
>   FILL (header->header.devmajor, 0);
>   FILL (header->header.devminor, 0);
> 
> This got dropped in 1.27 by commit df7b55a8f6354e3 (Fix some problems with
> negative and out-of-range integers), so the settings from
> start_private_header() are used directly - Which are:
> 
>   TIME_TO_CHARS (t < 0 ? 0 : min (t, MAX_OCTAL_VAL (header->header.mtime)),
> 		 header->header.mtime);
>   MODE_TO_CHARS (S_IFREG|S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH, header->header.mode);
>   UID_TO_CHARS (0, header->header.uid);
>   GID_TO_CHARS (0, header->header.gid);
> 
> The end result is that tar >= 1.27 sets mode to 644.
> 
> The consequence of this is that we create different tar files when long path
> names are encountered (which often happens when a package downloads a
> specific sha1 from a git repo) depending on the host tar version used,
> causing hash mismatches.
> 
> As a workaround, bump our minimum tar version to 1.27.  It would be nicer to
> only do this if we have packages from bzr/git/hg enabled, but that is an
> exercise for later.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/dependencies/check-host-tar.sh | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
> index 2143877524..0857307396 100755
> --- a/support/dependencies/check-host-tar.sh
> +++ b/support/dependencies/check-host-tar.sh
> @@ -26,10 +26,11 @@ if [ ! -z "${version_bsd}" ] ; then
>    minor=0
>  fi
>  
> -# Minimal version = 1.17 (previous versions do not correctly unpack archives
> -# containing hard-links if the --strip-components option is used).
> +# Minimal version = 1.27 (previous versions do not correctly unpack archives
> +# containing hard-links if the --strip-components option is used or create
> +# different gnu long link headers for path elements > 100 characters).
>  major_min=1
> -minor_min=17
> +minor_min=27
>  
>  # Maximal version = 1.29 (1.30 changed --numeric-owner output for
>  # filenames > 100 characters). This is really a fix for a bug in
> -- 
> 2.11.0
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

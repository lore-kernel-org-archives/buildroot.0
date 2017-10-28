From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Oct 2017 11:55:38 +0200
Subject: [Buildroot] [PATCH v2] package/glibc: switch to using the
	maintenance branch
In-Reply-To: <20171024143033.15102-1-romain.naour@gmail.com>
References: <20171024143033.15102-1-romain.naour@gmail.com>
Message-ID: <20171028095538.GA3280@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Riomain, All,

On 2017-10-24 16:30 +0200, Romain Naour spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> glibc upstream has sued against doing regular point-releases, but they

s/sued/ruled/  (my typo)

> do have a lot of interesting and important fixes for regressions and
> security.
> 
> Backporting each patch, or cherry-picking individual patches is off
> limits for us, so we just switch to using the currently-latest HEAD of
> the maintenance branch instead.
> 
> The version number is obtained with:
>     $ git describe --match 'glibc-*' --abbrev=40 origin/release/2.26/master
> 
> The alternative options were:
>   - download the tarball from the git tree
>     --> does nto work; not an option
>   - download the 2.26 tarball, and bundle the individual patches in
>     Buildroot
>     --> maintenance of patches is a burden; not an option
>   - download the 2.26 tarball, maintain the list of patches to download from
>     the git tree
>     --> not an option for the same reason
> 
> So we end up just doing a git clone. The git tree is today about ten
> times the size of the tarball, so a rough estimate makes it at about ten
> times the download time from the upstream repo.
> 
> Also upstream doesn't provide officially an https download location [1].

*doesn't officially provide

> There is one but it's not reliable, sometimes the connection time out and
> end-up with a corrupted git repo:
> 
> fatal: unable to access 'https://sourceware.org/git/glibc.git/': Failed to connect to sourceware.org port 443: Connection timed out
> 
> So switch to using a git mirror from github which is updated once a day [2].
> This allow to clone the git repository faster.
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=summary
> [2] https://github.com/bminor/glibc.git
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> [Romain: bump 77eea8950ce5495ff033bca3465ccfd2db072ae6 and clone from github]
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 0b8b440..d82eb07 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -9,9 +9,14 @@ GLIBC_VERSION =  arc-2017.09-eng010
>  GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
>  GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.gz
>  else
> -GLIBC_VERSION = 2.26
> -GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
> -GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
> +# Generate version string using:
> +#   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
> +GLIBC_VERSION = glibc-2.26-72-g77eea8950ce5495ff033bca3465ccfd2db072ae6
> +# Upstream doesn't officially provide an https download link.
> +# There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
> +# sometimes the connection time out. So use a git mirror using https.

I would also add something like:

    Before bumping the version, first verify that the sha1 really
    exists on the official git tree.

Regards,
Yann E. MORIN.

> +GLIBC_SITE = https://github.com/bminor/glibc.git
> +GLIBC_SITE_METHOD = git
>  endif
>  
>  GLIBC_SRC_SUBDIR = .
> -- 
> 2.9.5
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

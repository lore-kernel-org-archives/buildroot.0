From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Mar 2014 20:11:09 +0100
Subject: [Buildroot] [PATCH] pkg-download: update the github helper
In-Reply-To: <1394391275-27735-1-git-send-email-s.martin49@gmail.com>
References: <1394391275-27735-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140309191109.GA3194@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-09 19:54 +0100, Samuel Martin spake thusly:
> Once again, github updates the source download url.
> Even if only the zip archive link is advertised on the repositories'
> page, the *.tar.gz is still available.
> 
> It is worthy to note that the tarball's content differs depending if
> it has been fetched from the former and the new url (the root directory
> name changes).

It might be a bit confusing to state that the content is not the same.

Indeed the archives differ, but the extracted files do not. Where the
legacy archive would extract into:
    <username>-<package>-<short-sha1>/

the new official will extract into:
    <package>-<full-sha1>/

Other than that, the content of the archives are exactly the same.

Note however that the archives are generated on-the-fly the first time
they are downloaded, and cached for some undefined duration. This can
easily be observed by downloading the same archive twice in a row: the
first download ahs an unknown length (as reported by wget), while for
the second download, the length is known (still reported by wget). As I
do not have a caching proxy in-between me and github, it means githiub
does the caching.

But probably the archive will not stay in the cache indefinitely, and
will be regenerated again when the cache has expired. If then the date
of the creation of the archive is tored in the archive, we won;t have
reproducible archives from github. Which means we won't be able to store
hashes in Buildroot about such archives.

> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Yep! :-)

Regards,
Yann E. MORIN.

> ---
>  package/pkg-download.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 85842de..192b9e0 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -56,7 +56,7 @@ notdomain=$(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$(c
>  domainseparator=$(if $(1),$(1),/)
>  
>  # github(user,package,version): returns site of github repository
> -github = https://github.com/$(1)/$(2)/tarball/$(3)
> +github = https://github.com/$(1)/$(2)/archive/$(3)
>  
>  ################################################################################
>  # The DOWNLOAD_* helpers are in charge of getting a working copy
> -- 
> 1.9.0
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

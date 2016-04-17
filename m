From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Apr 2016 00:41:38 +0200
Subject: [Buildroot] [PATCH RFC] core/pkg-download: ignore hashes from
 mirror for VCS downloads
In-Reply-To: <1460931432-13459-1-git-send-email-yann.morin.1998@free.fr>
References: <1460931432-13459-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <57141122.7050805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/18/16 00:17, Yann E. MORIN wrote:
> When a download via a VCS method fails, Buildroot attempts the download
> from the backup mirror (if any is set). Such a download is done with the
> wget helper.
>
> Given a package that has a .hash file for relase tarballs, which also
> allows the user to use a random revision from a VCS, the normal download
> wrapper will not check for hashes, on the assumption that maybe they are
> not reproducible [*].
>
> However, when the download fails (for any reason: network error,
> upstream removed the revision, old machine with incomplete set of CA
> certificates...), the backup download now proceeds over with http (or
> https) with the wget wrapper. The wget wrapper *always* checks for
> hashes, and when a .hash file is present but no hash is found for the
> download, this is considered an error.
>
> However, when we download from the backup mirror for a main download
> that should have been done with git, we in this situation have no hash
> for the download. Thus, we should not fail on a missing hash for that
> download.
>
> Add a test for the site-method in the backup mirror download; if it was
> either one of the VCS method, pass a one-off BR_NO_CHECK_HASH_FOR
> variable set to contain the tarball to download.

  Even though this looks like a bit of a hack, I see no better way of handling 
the situation.

  However, the same should also be done for PRIMARY_SITE IMHO.

  Regards,
  Arnout

>
> Fixes issues like those reported by the Travis build bots:
>      https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/123624879
>
> Reported-by: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> ---
> Note: untested.
> ---
>   package/pkg-download.mk | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 1332e66..d68b7bc 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -235,6 +235,7 @@ define DOWNLOAD_INNER
>   		esac ; \
>   	fi ; \
>   	if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
> +		$(if $(filter bzr cvs git hg svn,$($(PKG)_SITE_METHOD)),BR_NO_CHECK_HASH_FOR=$(2)) \
>   		$(call $(3)_WGET,$(BR2_BACKUP_SITE)/$(2),$(2)) && exit ; \
>   	fi ; \
>   	exit 1
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jan 2014 22:37:21 +0100
Subject: [Buildroot] [PATCH 5/6] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <dc5d6ba62805a74ef57fc2c779e97a00056cbfa6.1389569992.git.yann.morin.1998@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <dc5d6ba62805a74ef57fc2c779e97a00056cbfa6.1389569992.git.yann.morin.1998@free.fr>
Message-ID: <52D5AE11.60804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/01/14 00:44, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Some of the packages that Buildroot might build are sensitive pacakges,
> related to security: openssl, dropbear, ca-certificates...
>
> Some of those packages are download over plain http, because there is
> no way to get them over a secure channel, such as https.
>
> In these dark times of pervasive surveillance, the potential for harm
> that a tampered package could generate, we may want to check the integrity
> of those sensitive packages.
>
> So, each package may now provide a list of hashes for all files that
> needs to be downloaded, and Buildroot will just fail if any download file
> does not match its known hash.
>
> The choosen hash function is SHA1 since it is widely available, though
> theoretical attacks have been devised (but no known practical attack is
> known).
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> Note: this is not a bullet-proof solution, since Buildroot may itself be
> compromised. But if we eventually sign our releases, then we secure the
> list of hashes at the same time. Only random snapshots from the repository
> may be at risk of tampering, although this is highly doubtfull, given how
> git stores its data.
>
> Also, before we commit a list of hashes to the tree, we may want to
> setup a chain-of-trust to validate that thos hashes are correct.
> We may want to discuss this during our next developpers' day in
> Brussels in February.

  I think the risk is small, because the package will be downloaded by 
multiple users and autobuilders, so an incorrect hash in the buildroot 
sources will lead to download failure reports.

>
> Note-2: The laternative to sha1 would be sha2 (256- or 512-bit), but
> oldish "enterprise-class" distributions  may be missing them entirely.
> sha256sum and sha512sum were added to coreutils in 2005-10-23, and RHEL5
> seems to have them. But better be safe than sorry. If sha2 should be
> considered instead of sha1, then it is very easy to switch now. Switching
> later would require that we revalidate all packages that have hashes,
> which could prove to be quite time-demanding if we have lots of
> packages using hashes.

  We can be more future-safe by storing the hash that is used in the 
.hash file itself.

[snip]
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index f3354d1..5627850 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -58,6 +58,14 @@ domainseparator=$(if $(1),$(1),/)
>   # github(user,package,version): returns site of github repository
>   github = https://github.com/$(1)/$(2)/tarball/$(3)
>
> +# Helper for checking a tarball's checksum
> +# $(1): the basename of the tarball to check
> +# $(2): the full path to the file to check
> +define VERIFY_SHA256

  VERIFY_HASH would be better.

  Regards,
  Arnout

> +	support/download/check-hash $(1) $(2) \
> +		$($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$($(PKG)_NAME).hash
> +endef
> +
>   ################################################################################
>   # The DOWNLOAD_* helpers are in charge of getting a working copy
>   # of the source repository for their corresponding SCM,

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

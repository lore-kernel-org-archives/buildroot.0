From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Oct 2016 22:52:30 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-download: use raw basename for repo
 archiving to remove host- prefix
In-Reply-To: <1476709687-21484-1-git-send-email-patrickdepinguin@gmail.com>
References: <1476709687-21484-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <c436b9ba-8144-3015-347c-1c5e89115272@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,

 Excellent commit message!

On 17-10-16 15:08, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> For packages that use a version control repository rather than a pre-made
> tarball, the directory prefix used inside the tarball is currently
> FOO_BASE_NAME, which can be 'foo' or 'host-foo'.
> 
> This means that the hash of such tarball will be different for target and
> host packages, even though the contents are exactly the same. Hence, if the
> hash file is created based on 'foo', and later a fresh build is made where
> 'host-foo' happens to be built before 'foo' (with a different config, for
> example), the hash will be detected as incorrect and a new download is
> started.
> 
> This problem does not affect many packages/users, due to the number of
> conditions to be met:
> - the package should be available for target _and_ host
> - the package needs to use a VCS download method, e.g. git, hg, svn, ...
>   This does not include standard github downloads, which download a pre-made
>   archive.
> - there should be a hash file containing the hash of the downloaded archive.
>   Since normally there is no hash file for packages with sources coming from
>   a version control system, this restricts even further. Some examples of
>   packages in this category that do have a hash file (but not necessarily
>   match the earlier conditions): expedite, vexpress-firmware, squashfs, ...
> - the archive needs to be stored in a 'primary site' after initial archiving
>   and thus be downloaded later using a non-version-controlled method, like
>   wget or scp. This is because the version control download methods do not
>   receive a '-H' parameter pointing to the hash file and thus no hashes are
>   checked at all even if the file is present.

 This is wrong (i.e., a bug), in two ways:
- for reproducible download methods (git at least; is hg archive reproducible?),
the hash *should* be checked;
- for non-reproducible download methods, the hash *should not* be checked when
downloading from primary or secondary - if it is a non-reproducible download
method, then the hash in primary or secondary may also be wrong.

 The second case, however, i.e. the one you are hitting, should already be
covered... In DOWNLOAD_INNER, we set BR_NO_CHECK_HASH_FOR=$(2) for the
non-hash-checked download methods. Ah, of course, it's not the hash check that
fails, it's the fact that a hash file is present but the tarball isn't mentioned
in it.

 Actually, we could make all download methods reproducible using the method that
we use for git to make a reproducible tarball. Well, maybe CVS is an exception.

> 
> While packages matching the third condition could be considered to be 'wrong'
> and need to be fixed, it does actually makes sense to have a hash file for
> packages from version control, in particular if they are stored in a
> primary site as mentioned in the last condition.
> 
> Regardless of any different opinions on the previous paragraph, it is also
> not conceptually correct that a tarball of a package source can contain a
> Buildroot-specific directory prefix 'host-'.  

 Even worse, it is incorrect that the tarball name depends on the order in which
things are executed...

> Therefore, use
> FOO_RAW_BASE_NAME instead of FOO_BASE_NAME when calling the dl-wrapper.
> 
> Example test scenario that exhibits the problem:
> $ rm -rf /tmp/dl dl/squashfs-9c1db6d13a51a2e009f0027ef336ce03624eac0d.tar.gz
> $ make qemu_x86_64_defconfig
> $ make host-squashfs-dirclean host-squashfs-source
> $ mkdir /tmp/dl
> $ mv dl/squashfs-9c1db6d13a51a2e009f0027ef336ce03624eac0d.tar.gz /tmp/dl/
> $ sed -i -e 's,BR2_PRIMARY_SITE=.*,BR2_PRIMARY_SITE="file:///tmp/dl",' \
>          -e '/BR2_PRIMARY_SITE/aBR2_PRIMARY_SITE_ONLY=y'  .config
> $ make host-squashfs-dirclean host-squashfs-source

 All right! As soon as the test infra is merged we can add a test for this!

> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/pkg-download.mk | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 3b6561b..0f542e6 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -81,7 +81,7 @@ define DOWNLOAD_GIT
>  		-- \
>  		$($(PKG)_SITE) \
>  		$($(PKG)_DL_VERSION) \
> -		$($(PKG)_BASE_NAME) \
> +		$($(PKG)_RAW_BASE_NAME) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> @@ -98,7 +98,7 @@ define DOWNLOAD_BZR
>  		-- \
>  		$($(PKG)_SITE) \
>  		$($(PKG)_DL_VERSION) \
> -		$($(PKG)_BASE_NAME) \
> +		$($(PKG)_RAW_BASE_NAME) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> @@ -114,7 +114,7 @@ define DOWNLOAD_CVS
>  		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
>  		$($(PKG)_DL_VERSION) \
>  		$($(PKG)_RAWNAME) \
> -		$($(PKG)_BASE_NAME) \
> +		$($(PKG)_RAW_BASE_NAME) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> @@ -130,7 +130,7 @@ define DOWNLOAD_SVN
>  		-- \
>  		$($(PKG)_SITE) \
>  		$($(PKG)_DL_VERSION) \
> -		$($(PKG)_BASE_NAME) \
> +		$($(PKG)_RAW_BASE_NAME) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> @@ -162,7 +162,7 @@ define DOWNLOAD_HG
>  		-- \
>  		$($(PKG)_SITE) \
>  		$($(PKG)_DL_VERSION) \
> -		$($(PKG)_BASE_NAME) \
> +		$($(PKG)_RAW_BASE_NAME) \
>  		$($(PKG)_DL_OPTS)
>  endef
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

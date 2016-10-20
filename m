From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 21:56:47 +0200
Subject: [Buildroot] [git commit] pkg-download: use raw basename for
 repo archiving to remove host- prefix
In-Reply-To: <20161020195440.B127A81801@busybox.osuosl.org>
References: <20161020195440.B127A81801@busybox.osuosl.org>
Message-ID: <20161020215647.7dcbab0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Oct 2016 21:46:10 +0200, Thomas Petazzoni wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=448d1d1e69e5f0e04a4553571bcebeedd2ad135c
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
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
> 
> While packages matching the third condition could be considered to be 'wrong'
> and need to be fixed, it does actually makes sense to have a hash file for
> packages from version control, in particular if they are stored in a
> primary site as mentioned in the last condition.
> 
> Regardless of any different opinions on the previous paragraph, it is also
> not conceptually correct that a tarball of a package source can contain a
> Buildroot-specific directory prefix 'host-'.  Therefore, use
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
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-download.mk | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks a lot for the great commit log!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

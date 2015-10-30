From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Oct 2015 17:42:43 +0100
Subject: [Buildroot] [PATCH 1/1] openssl: remove patch's git-hash to
 support fat/ntfs systems
In-Reply-To: <1446218867-6128-1-git-send-email-james.knight@rockwellcollins.com>
References: <1446218867-6128-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <56339E03.4050303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-10-15 16:27, James Knight wrote:
> Altering the OpenSSL parallel build patch's source location; the change
> removes the Git hash reference from the URL. This is to support storing
> cache data on file systems which have a more restrictive character set.
> For this case, the downloaded patch will have the complete filename in
> the 'dl' directory:
> 
>  openssl-1.0.2d-parallel-build.patch?id=56bd759df1d0c750a065b8c845e93d5dfa6b549d
> 
> For FAT/NTFS systems, it cannot handle the '?' character. By only using
> the patch's filename, the file can be safely stored on FAT/NTFS systems
> with the name:
> 
>  openssl-1.0.2d-parallel-build.patch

 The same issue exists for fan-ctrl and spidev_test, but it's more difficult to
solve for these because the version is really needed.

 So perhaps the solution is to sanitize the local filename by converting ?, :
and maybe others to _.

> 
> Removing the Git reference should not be a major issue since this
> repository (which we are pulling the patch from), appears to be maintain
> a series of patches for multiple versions of OpenSSL. The patch we are
> fetching explicitly defines the OpenSSL version we are trying to patch.
> In the worst case, if the patch is changed on or removed off its head,
> Buildroot's hash-check will catch this.

 The thing is, it _will_ probably be removed from the head revision at some
point. For instance, the equivalent patch for 1.0.2 was removed in d93bba52f8.
And even worse: we will probably not notice in the autobuilders, because by the
time this happens we will probably already have bumped openssl and the patch
version. But if you use a buildroot release, you'll suddenly get a download
error and start scratching your head about how to solve that one...

 I think that one trumps supporting FAT or NTFS as your DL_DIR filesystem, so
that's a NACK from me. Sorry.

 Regards,
 Arnout


> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  package/openssl/openssl.hash | 2 +-
>  package/openssl/openssl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
> index 9eaa363..118f532 100644
> --- a/package/openssl/openssl.hash
> +++ b/package/openssl/openssl.hash
> @@ -1,4 +1,4 @@
>  # From https://www.openssl.org/source/openssl-1.0.2d.tar.gz.sha256
>  sha256	671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8	openssl-1.0.2d.tar.gz
>  # Locally computed
> -sha256	deaf6f3af41874ecc6d63841ea14b8e6c71cea81d4a511a754bc90c9a993147f	openssl-1.0.2d-parallel-build.patch?id=56bd759df1d0c750a065b8c845e93d5dfa6b549d
> +sha256	deaf6f3af41874ecc6d63841ea14b8e6c71cea81d4a511a754bc90c9a993147f	openssl-1.0.2d-parallel-build.patch
> diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
> index cad8d0c..f2f181b 100644
> --- a/package/openssl/openssl.mk
> +++ b/package/openssl/openssl.mk
> @@ -14,7 +14,7 @@ HOST_OPENSSL_DEPENDENCIES = host-zlib
>  OPENSSL_TARGET_ARCH = generic32
>  OPENSSL_CFLAGS = $(TARGET_CFLAGS)
>  OPENSSL_PATCH = \
> -	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?id=56bd759df1d0c750a065b8c845e93d5dfa6b549d
> +	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch
>  
>  ifeq ($(BR2_USE_MMU),)
>  OPENSSL_CFLAGS += -DHAVE_FORK=0
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

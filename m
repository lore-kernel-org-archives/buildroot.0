From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 17:05:57 +0100
Subject: [Buildroot] [PATCH 3/7 v3] support/download: add explicit
	no-hash support
In-Reply-To: <93d0033f46edcbeeb4de1e7bfad36e7970fb24b4.1427037564.git.yann.morin.1998@free.fr>
References: <cover.1427037564.git.yann.morin.1998@free.fr>
 <93d0033f46edcbeeb4de1e7bfad36e7970fb24b4.1427037564.git.yann.morin.1998@free.fr>
Message-ID: <550EE865.6040302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/03/15 16:21, Yann E. MORIN wrote:
> Add support to explicitly state that an archive has no hash.
> 
> This can be used for archives downloaded from a repository, like a
> git-clone or a subversion checkout, or using the github helper.
> 
> This will come in handy when we'll eventually make hashes mandatory as
> soon as a .hash file exists: for some packages, like gcc, some versions
> are downloaded as archives from upstream, while other versions may come
> from a GitHub repository (via the github herlper).
> 
> In this case, a .hash file would exist, that contains hashes for the
> downloaded tarballs, but archives downloaded from the repository would
> not have a hash (since it is currently not possible to have reproducible
> such archives). So, we'd need a way to explicitly state there is no
> hash, on purpose, for those archives.
> 
> So, add 'none' as a new type of hash.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

with a small nit:

[snip]
> diff --git a/support/download/check-hash b/support/download/check-hash
> index cee64ef..d0a4ab9 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -38,7 +38,9 @@ check_one_hash() {
>      # Note: md5 is supported, but undocumented on purpose.
>      # Note: sha3 is not supported, since there is currently no implementation
>      #       (the NIST has yet to publish the parameters).
> +    # Note: 'none' means there is explicitly no hash for that file.
>      case "${_h}" in
> +        none) return 0;;

 I'd put the return 0 on a separate line.

 Perhaps we should also consider combining none with another hash an error.
Although the complexity of checking for that is probably not worth it.

 Regards,
 Arnout

>          md5|sha1)                       ;;
>          sha224|sha256|sha384|sha512)    ;;
>          *) # Unknown hash, exit with error
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

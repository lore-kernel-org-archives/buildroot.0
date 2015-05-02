From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 03 May 2015 00:02:40 +0200
Subject: [Buildroot] [PATCH 1/2] docs/manual: also document md5 hash
In-Reply-To: <aa89728d8f72c55ed916ba3142e123ba96161f73.1430601733.git.yann.morin.1998@free.fr>
References: <cover.1430601733.git.yann.morin.1998@free.fr>
 <aa89728d8f72c55ed916ba3142e123ba96161f73.1430601733.git.yann.morin.1998@free.fr>
Message-ID: <55454980.9070109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/15 23:22, Yann E. MORIN wrote:
> We accept an md5 hash, but only if comming from upstream, and id
                                     coming                     if

> also accompanied with a stronger hash.
> 
> Thanks to Maxime for the interactive review! ;-)
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/adding-packages-directory.txt | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 639003f..1487891 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -415,9 +415,10 @@ The format of this file is one line for each file for which to check the
>  hash, each line being space-separated, with these three fields:
>  
>  * the type of hash, one of:
> -** +sha1+, +sha224+, +sha256+, +sha384+, +sha512+, +none+
> +** +md5+, +sha1+, +sha224+, +sha256+, +sha384+, +sha512+, +none+
>  * the hash of the file:
>  ** for +none+, one or more non-space chars, usually just the string +xxx+
> +** for +md5+, 32 hexadecimal characters
>  ** for +sha1+, 40 hexadecimal characters
>  ** for +sha224+, 56 hexadecimal characters
>  ** for +sha256+, 64 hexadecimal characters
> @@ -431,33 +432,40 @@ lines are ignored.
>  There can be more than one hash for a single file, each on its own line. In
>  this case, all hashes must match.
>  
> +.Note
>  Ideally, the hashes stored in this file should match the hashes published by
>  upstream, e.g. on their website, in the e-mail announcement... If upstream
> -provides more than one type of hash (say, +sha1+ and +sha512+), then it is
> +provides more than one type of hash (e.g. +sha1+ and +sha512+), then it is
>  best to add all those hashes in the +.hash+ file. If upstream does not
> -provide any hash, then compute at least one yourself, and mention this in a
> -comment line above the hashes.
> +provide any hash, or only provides an +md5+ hash, then compute at least one
> +strong hash yourself (like +sha1+ or +sha256+, but not +md5+), and mention

 Since we always say to use sha256, I'd put '(preferably +sha256+)' here.

> +this in a comment line above the hashes.
>  
> -*Note:* the number of spaces does not matter, so one can use spaces to
> +.Note
> +The number of spaces does not matter, so one can use spaces to

 or tabs (which is done in a couple of places)

>  properly align the different fields.
>  
> +<<<<<<< HEAD

 Hm, merge gone bad?

>  The +none+ hash type is reserved to those archives downloaded from a
>  repository, like a 'git clone', a 'subversion checkout'... or archives
>  downloaded with the xref:github-download-url[github helper].
>  
>  The example below defines a +sha1+ and a +sha256+ published by upstream for
> -the main +libfoo-1.2.3.tar.bz2+ tarball, plus two locally-computed hashes,
> -a +sha256+ for a downloaded patch, a +sha1+ for a downloaded binary blob,
> -and an archive with no hash:
> +the main +libfoo-1.2.3.tar.bz2+ tarball, an +md5+ from upstream and a
> +locally-computed +sha256+ hashes for a binary blob, a +sha256+ for a
> +downloaded patch, and an archive with no hash:
>  
>  ----
>  # Hashes from: http://www.foosoftware.org/download/libfoo-1.2.3.tar.bz2.{sha1,sha256}:
>  sha1   486fb55c3efa71148fe07895fd713ea3a5ae343a                         libfoo-1.2.3.tar.bz2
>  sha256 efc8103cc3bcb06bda6a781532d12701eb081ad83e8f90004b39ab81b65d4369 libfoo-1.2.3.tar.bz2
>  
> -# No upstream hashes for the following:
> +# md5 from: http://www.foosoftware.org/download/libfoo-1.2.3.tar.bz2.md5, sha256 locally computed:
> +md5    2d608f3c318c6b7557d551a5a09314f03452f1a1                         libfoo-data.bin
> +sha256 01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b libfoo-data.bin
> +
> +# Upstream has no hash, so locally computed:

 In reality we usually put

# Locally computed:

>  sha256 ff52101fb90bbfc3fe9475e425688c660f46216d7e751c4bbdb1dc85cdccacb9 libfoo-fix-blabla.patch
> -sha1   2d608f3c318c6b7557d551a5a09314f03452f1a1                         libfoo-data.bin
>  
>  # Explicitly no hash for that file, comes from a git-clone:

 Perhaps a better example is:

# No hash for 1234, comes from the github-helper:

(cfr. ARC exceptions in binutils, gcc, gdb)


 Regards,
 Arnout

>  none   xxx                                                              libfoo-1234.tar.gz
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

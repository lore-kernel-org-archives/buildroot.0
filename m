From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 6 Mar 2014 11:56:26 +0100
Subject: [Buildroot] [PATCH 11/12] manual: add documentation about
	packages' hashes
In-Reply-To: <9cab6ed51fae5b7d5baa2a514aea4c7c5205fb30.1394055621.git.yann.morin.1998@free.fr>
References: <cover.1394055621.git.yann.morin.1998@free.fr>
 <9cab6ed51fae5b7d5baa2a514aea4c7c5205fb30.1394055621.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMKohY_kE5BEOL9iqs30b9=yS1o_MKpzA9n47kuEGN-=Rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Wed, Mar 5, 2014 at 10:47 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Although md5 is, for legacy resaons, a supported hash type,
> it is not documented on purpose, since it is now known to
> be weak.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  docs/manual/adding-packages-directory.txt | 65 +++++++++++++++++++++++++++++++
>  support/download/check-hash               |  1 +
>  2 files changed, 66 insertions(+)
>
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index e56e59a..4609a7e 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -346,3 +346,68 @@ different way, using different infrastructures:
>
>  Further formatting details: see xref:writing-rules-mk[the writing
>  rules].
> +
> +The +.hash+ file
> +~~~~~~~~~~~~~~~~
> +[[adding-packages-hash]]
> +
> +Optionally, you can add a third file, named +libfoo.hash+, that contains
> +the hashes of the downloaded files for the +libfoo+ package.
> +
> +The hashes stored in that file are used to validate the integrity of the
> +downloaded files.
> +
> +The format for this file is one line for each file for which to check the
> +hash, each line being space-separated, with these three fields:
> +
> +* the type of hash, one of:
> +** +sha1+, +sha224+, +sha256+, +sha384+, +sha512+
> +* the hash of the file:
> +** for +sha1+, 40 hexa-decimal characters
> +** for +sha224+, 56 hexa-decimal characters
> +** for +sha256+, 64 hexa-decimal characters
> +** for +sha384+, 96 hexa-decimal characters
> +** for +sha512+, 128 hexa-decimal characters
> +* the name of the file, without any directory component
> +
> +Lines starting with a +#+ sign are considered comments, and ignored. Empty
> +lines are ignored.
> +
> +There can be more than one hash for a single file, each of its own line. In
> +this case, all hashes must match.

Maybe a note explaining why it's better to provide more than 1 hash
for a file could be added.

> +
> +Ideally, the hashes stored in this file should match the hashes published by
> +upstream, eg, on their website, in the email announcement... If no such info
> +is available, then compute them yourself, and state so in a comment line
> +above the hashes.
> +
> +*Note:* the number of spaces does not matter, so one can use spaces to
> +properly align the different fields.
> +
> +The example below defines a +sha1+ and a +sha256+ published by upstream for
> +the main +libfoo-1.2.3.tar.bz2+ tarball, plus two locally-computed hashes,
> +a +sha256+ for a downloaded patch, and a +sha1+ for a downloaded binary blob:
> +
> +----
> +# Hashes from: http://www.foosoftware.org/download/libfoo-1.2.3.tar.bz2.{sha1,sha256}:
> +sha1   486fb55c3efa71148fe07895fd713ea3a5ae343a                         libfoo-1.2.3.tar.bz2
> +sha256 efc8103cc3bcb06bda6a781532d12701eb081ad83e8f90004b39ab81b65d4369 libfoo-1.2.3.tar.bz2
> +
> +# No upstream hashes for the following:
> +sha256 ff52101fb90bbfc3fe9475e425688c660f46216d7e751c4bbdb1dc85cdccacb9 libfoo-fix-blabla.patch
> +sha1   2d608f3c318c6b7557d551a5a09314f03452f1a1                         libfoo-data.bin
> +----
> +
> +If the +.hash+ file is present, and there is one or more hashes for a
> +downloaded file, the hash(es) of the downloaded file must match the
> +hash(es) stored in the +.hash+ file. If one or more hashes do not match,
> +Buildroot considers this as an error, deletes the downloaded file, and
> +aborts.
> +
> +If the +.hash+ file is present, but there is no hash for a downloaded
> +file, no check is done for that downloaded file. If you set the
> +environment variable +BR2_ENFORCE_CHECK_HASH+ to a non-empty value, and
> +there is no hash for a downloaded file, Buildroot considers this as an
> +error, deletes the downloaded file, and aborts.
> +
> +If the +.hash+ file is missing, then no check is done at all.
> diff --git a/support/download/check-hash b/support/download/check-hash
> index 1db8b8c..61678d4 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -22,6 +22,7 @@ check_one_hash() {
>      _known="${2}"
>      _file="${3}"
>
> +    # Note: md5 is supported, but un-documented on-purpose.
>      # Note: sha3 is not supported, since there is currently no implemetation
>      #       (the NIST has yet to publish the parameters).
>      case "${_h}" in
> --
> 1.8.3.2
>

Regards,

-- 
Samuel

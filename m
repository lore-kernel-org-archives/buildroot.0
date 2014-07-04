From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jul 2014 23:49:40 +0200
Subject: [Buildroot] [PATCH 2/4] pkg-infra: add possiblity to check
	downloaded files against known hashes
In-Reply-To: <3ab303bd4f1ee78900e7fafc90947e30319635b7.1404416102.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 3 Jul 2014 21:36:21 +0200")
References: <cover.1404416102.git.yann.morin.1998@free.fr>
 <3ab303bd4f1ee78900e7fafc90947e30319635b7.1404416102.git.yann.morin.1998@free.fr>
Message-ID: <87egy04wwb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Some of the packages that Buildroot might build are sensitive packages,
 > related to security: openssl, dropbear, ca-certificates...

 > Some of those packages are downloaded over plain http, because there is
 > no way to get them over a secure channel, such as https.

 > In these dark times of pervasive surveillance, the potential for harm that
 > a tampered-with package could generate, we may want to check the integrity
 > of those sensitive packages.

 > So, each package may now provide a list of hashes for all files that needs
 > to be downloaded, and Buildroot will just fail if any downloaded file does
 > not match its known hash, in which case it is removed.

 > Hashes can be any of the md5, sha1 or sha2 variants, and will be checked
 > even if the file was pre-downloaded.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Baruch Siach <baruch@tkos.co.il>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > Reviewed-by: Samuel Martin <s.martin49@gmail.com>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

 > ---
 > Changes v9 -> v10:
 >   - use bash as shell  (Peter)

 > Changes v7 -> v8
 >   - expand MITM to its full-length meaning  (Thomas DS)
 >   - typo  (Thomas DS)

 > Changes v4 -> v5:
 >   - fix detection of comments and empty lines

 > ---
 > Note: this is not a bullet-proof solution, since Buildroot may itself be
 > compromised. But since we do sign our releases, then we secure the list of
 > hashes at the same time. Only random snapshots from the repository may be
 > at risk of tampering, although this is highly doubtfull, given how git
 > stores its data.
 > ---
 >  package/pkg-download.mk     | 20 ++++++++++--
 >  support/download/check-hash | 76 +++++++++++++++++++++++++++++++++++++++++++++
 >  2 files changed, 93 insertions(+), 3 deletions(-)
 >  create mode 100755 support/download/check-hash

 > diff --git a/package/pkg-download.mk b/package/pkg-download.mk
 > index d3cd0c1..7f208d5 100644
 > --- a/package/pkg-download.mk
 > +++ b/package/pkg-download.mk
 > @@ -58,6 +58,17 @@ domainseparator=$(if $(1),$(1),/)
 >  # github(user,package,version): returns site of GitHub repository
 >  github = https://github.com/$(1)/$(2)/archive/$(3)
 
 > +# Helper for checking a tarball's checksum
 > +# If the hash does not match, remove the incorrect file
 > +# $(1): the path to the file with the hashes
 > +# $(2): the full path to the file to check
 > +define VERIFY_HASH
 > +	if ! support/download/check-hash $(1) $(2); then \
 > +		rm -f $(2); \
 > +		exit 1; \
 > +	fi

I wonder if it would be a worthwhile optimization to do the -f
<whatever>.hash file check here, so we don't need to run the script at
all for packages without hashes, but perhaps that's not measurable.


 > +++ b/support/download/check-hash
 > @@ -0,0 +1,76 @@
 > +#!/bin/bash
 > +set -e
 > +
 > +# Helper to check a file matches its known hash
 > +# Call it with:
 > +#   $1: the full path to the file to check
 > +#   $2: the path of the file containing all the the expected hashes
 > +
 > +h_file="${1}"
 > +file="${2}"
 > +
 > +# Does the hash-file exist?
 > +if [ ! -f "${h_file}" ]; then
 > +    exit 0
 > +fi
 > +
 > +# Check one hash for a file
 > +# $1: known hash
 > +# $2: file (full path)
 > +check_one_hash() {
 > +    _h="${1}"
 > +    _known="${2}"
 > +    _file="${3}"
 > +
 > +    # Note: sha3 is not supported, since there is currently no implementation
 > +    #       (the NIST has yet to publish the parameters).
 > +    case "${_h}" in
 > +        md5|sha1)                       ;;
 > +        sha224|sha256|sha384|sha512)    ;;

All of these come from coreutils and have been available for ages so
they are basically guaranteed to be available on the build machine,
right?

If not, we should probably warn with a sensible error message instead of
what we get now:

sudo mv /usr/bin/sha1sum{,-dontuse}
make ca-certificates-source
support/download/check-hash: line 39: sha1sum: command not found
ERROR: ca-certificates_20140223.tar.xz has wrong sha1 hash:
ERROR: expected: ad57a45f0422fafd78a2e8191e5204f2306cc91b
ERROR: got     : 
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
package/pkg-generic.mk:73: recipe for target '/home/peko/source/buildroot/output/build/ca-certificates-20140223/.stamp_downloaded' failed


But we can fix that up later if needed - Committed, thanks.


-- 
Bye, Peter Korsgaard

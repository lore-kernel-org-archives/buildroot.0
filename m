From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Jan 2014 00:34:38 +0100
Subject: [Buildroot] [PATCH 5/6] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <52D5AE11.60804@mind.be>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <dc5d6ba62805a74ef57fc2c779e97a00056cbfa6.1389569992.git.yann.morin.1998@free.fr>
 <52D5AE11.60804@mind.be>
Message-ID: <20140114233438.GL3328@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-01-14 22:37 +0100, Arnout Vandecappelle spake thusly:
> On 13/01/14 00:44, Yann E. MORIN wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >Some of the packages that Buildroot might build are sensitive pacakges,
> >related to security: openssl, dropbear, ca-certificates...
[--SNIP--]
> >So, each package may now provide a list of hashes for all files that
> >needs to be downloaded, and Buildroot will just fail if any download file
> >does not match its known hash.
[--SNIP--]
> >Also, before we commit a list of hashes to the tree, we may want to
> >setup a chain-of-trust to validate that thos hashes are correct.
> >We may want to discuss this during our next developpers' day in
> >Brussels in February.
> 
>  I think the risk is small, because the package will be downloaded by
> multiple users and autobuilders, so an incorrect hash in the buildroot
> sources will lead to download failure reports.

Yes, anyone may run "make allyespackageconfig source" (although that
will leave out a few packages).

> >Note-2: The laternative to sha1 would be sha2 (256- or 512-bit), but
> >oldish "enterprise-class" distributions  may be missing them entirely.
> >sha256sum and sha512sum were added to coreutils in 2005-10-23, and RHEL5
> >seems to have them. But better be safe than sorry. If sha2 should be
> >considered instead of sha1, then it is very easy to switch now. Switching
> >later would require that we revalidate all packages that have hashes,
> >which could prove to be quite time-demanding if we have lots of
> >packages using hashes.
> 
>  We can be more future-safe by storing the hash that is used in the .hash
> file itself.

Hu?

> >diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> >index f3354d1..5627850 100644
> >--- a/package/pkg-download.mk
> >+++ b/package/pkg-download.mk
> >@@ -58,6 +58,14 @@ domainseparator=$(if $(1),$(1),/)
> >  # github(user,package,version): returns site of github repository
> >  github = https://github.com/$(1)/$(2)/tarball/$(3)
> >
> >+# Helper for checking a tarball's checksum
> >+# $(1): the basename of the tarball to check
> >+# $(2): the full path to the file to check
> >+define VERIFY_SHA256
> 
>  VERIFY_HASH would be better.

Doh. Right.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 12 Feb 2016 14:00:17 +0100
Subject: [Buildroot] [PATCH 06/16 v4] core/legal-info: ensure legal-info
 works in off-line mode
In-Reply-To: <b64d74dcfda277aa72757454fc79a388540bd8a8.1454536753.git.yann.morin.1998@free.fr>
References: <cover.1454536753.git.yann.morin.1998@free.fr>
 <b64d74dcfda277aa72757454fc79a388540bd8a8.1454536753.git.yann.morin.1998@free.fr>
Message-ID: <56BDD761.2040008@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 03/02/2016 23:21, Yann E. MORIN wrote:
> TBC: explain the part about the stamp file
> 
> Almost all packages which are saved for legal-info have their source
> archives downloaded as part of 'make source', which makes an off-line
> build completely possible [0].
> 
> However, for the pre-configured external toolchains, the source tarball
> is different, as the main tarball is a binary package. And that source
> tarball is only downloaded during the legal-info phase, which makes it
> inconvenient for full off-line builds.
> 
> We fix that by adding a new rule, $(1)-legal-source which only
> $(1)-all-source depends on, so that we only download it for a top-level
> 'make source', not as part of the standard download mechanism (i.e. only
> what is really needed to build).
> 
> This way, we can do a complete [0] off-line build and are still able to
> generate legal-info, while at the same time we do not incur any download
> overhead during a simple build.
> 
> Also, we previously downloaded the _ACTUAL_SOURCE_TARBALL when it was
> not empty. However, since _ACTUAL_SOURCE_TARBALL defaults to the value
> of _SOURCE, it can not be empty when _SOURCE is not. Thus, we'd get a
> spurious report of a missing hash for the tarball, since it was not in
> a standard package rule (configure, build, install..) and thus would
> miss the PKG and PKGDIR variables to find the .hash file.
> 
> We fix that in this commit as well, by:
> 
>   - setting PKG and PKGDIR just for the -legal-source rule;
> 
>   - only downloading _ACTUAL_SOURCE_TARBALL if it is not empty *and* not
>     the same as _SOURCE (to avoid a second report about the hash).
> 
> [0] Save for nodejs which invarriably wants to download stuff at build
> time. Sigh... :-( Fixing that is work for another time...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> 
> ---
> Changes v3 -> v4:
>   - handle it with a stamp file  (Luca)

With the stamp file the patch is a lot cleaner and coherent with the
rest of the infra. Thanks.

I'll add my Reviewed-by tag as soon as you fix the commit message. But
in the meantime:

Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca

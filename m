From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Jul 2019 23:13:55 +0200
Subject: [Buildroot] [PATCH] package/openpgm: remove 'release-' prefix
 in order to sanitize version.
In-Reply-To: <20190710160030.27668-1-victor.huesca@bootlin.com>
References: <20190710160030.27668-1-victor.huesca@bootlin.com>
Message-ID: <3ba20ce3-efab-e61c-4096-50521f4111bd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Adding a few involved parties in Cc]

On 10/07/2019 18:00, Victor Huesca wrote:
> While we would want to use the standard dot notation, his package is
> already present on release-monitoring with dash separator so we have to
> keep it with dashes in buildroot too -- at least until its release-
> monitoring entry is updated (which we could do but it is used by other
> distros and may break their compatibility).
> 
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>

 Unfortunately, I can't apply this because the current hash is broken.
Apparently, steve-o at some point regenerated the release tags under his own
name instead of the original tagger, so it got a different commit hash, and the
commit hash is stored as a comment in the tarball... Here is the diffoscope output:

--- dl/openpgm/openpgm-release-5-2-122.orig.tar.gz
+++ dl/openpgm/openpgm-release-5-2-122.tar.gz
?   --- openpgm-release-5-2-122.orig.tar
??? +++ openpgm-release-5-2-122.tar
?? Format-specific differences are supported for this file format but none were
detected (POSIX tar archive)
? @@ -26,18 +26,18 @@
?  00000190: 0000 0000 0000 0000 0000 0000 0000 0000  ................
?  000001a0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
?  000001b0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
?  000001c0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
?  000001d0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
?  000001e0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
?  000001f0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
? -00000200: 3532 2063 6f6d 6d65 6e74 3d65 6662 3735  52 comment=efb75
? -00000210: 6339 3665 6263 3035 3234 6137 6462 3663  c96ebc0524a7db6c
? -00000220: 3133 3537 6631 3537 3035 6134 6334 6662  1357f15705a4c4fb
? -00000230: 3930 620a 0000 0000 0000 0000 0000 0000  90b.............
? +00000200: 3532 2063 6f6d 6d65 6e74 3d35 3836 6437  52 comment=586d7
? +00000210: 3038 3966 6231 3764 6261 3033 6564 6135  089fb17dba03eda5
? +00000220: 3532 6539 3430 3737 3731 3837 6661 3262  52e940777187fa2b
? +00000230: 3465 310a 0000 0000 0000 0000 0000 0000  4e1.............
?  00000240: 0000 0000 0000 0000 0000 0000 0000 0000  ................
?  00000250: 0000 0000 0000 0000 0000 0000 0000 0000  ................
?  00000260: 0000 0000 0000 0000 0000 0000 0000 0000  ................
?  00000270: 0000 0000 0000 0000 0000 0000 0000 0000  ................
?  00000280: 0000 0000 0000 0000 0000 0000 0000 0000  ................
?  00000290: 0000 0000 0000 0000 0000 0000 0000 0000  ................
?  000002a0: 0000 0000 0000 0000 0000 0000 0000 0000  ................

 This is the new tag:
https://github.com/steve-o/openpgm/commit/586d7089fb17dba03eda552e940777187fa2b4e1

and this is the old one:
https://github.com/steve-o/openpgm/commit/efb75c96ebc0524a7db6c1357f15705a4c4fb90b



 So, we have a few options now:

- Bump to a more recent version. The current version is 6 years old. Upstream
has been merging pull requests, but hasn't really maintained the code, and is no
longer able to test it. So there is no more recent release, and Fabrice has sent
a patch to bump to a random git commit. In parallel, he asked to make a
release[1] - but this hasn't happened in the four months since.

- Fix the hash as a preparatory commit. However, this breaks
sources.buildroot.org for users of older Buildroot versions, or it breaks it for
current master (depending on whether we update the tarball there or not).

- Fix the hash as part of this commit. Since this commit changes the tarball
name, changing the hash at the same time allows sources.buildroot.org to carry
both the old and the new tarball.


 I think the third option is the best. It requires a good explanation in the
commit message though.

 Regards,
 Arnout

[1] https://github.com/steve-o/openpgm/issues/62

> ---
>  package/openpgm/openpgm.hash | 2 +-
>  package/openpgm/openpgm.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/openpgm/openpgm.hash b/package/openpgm/openpgm.hash
> index f20e02a7fb..eee021a348 100644
> --- a/package/openpgm/openpgm.hash
> +++ b/package/openpgm/openpgm.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 ecd48fd0bcfd8351ce6dcf31b063dd8fe83d3dab41bca62a6ebd6880a88c4a69  openpgm-release-5-2-122.tar.gz
> +sha256 ecd48fd0bcfd8351ce6dcf31b063dd8fe83d3dab41bca62a6ebd6880a88c4a69  openpgm-5-2-122.tar.gz
> diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
> index 8c85344b68..8163982d37 100644
> --- a/package/openpgm/openpgm.mk
> +++ b/package/openpgm/openpgm.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -OPENPGM_VERSION = release-5-2-122
> -OPENPGM_SITE = $(call github,steve-o,openpgm,$(OPENPGM_VERSION))
> +OPENPGM_VERSION = 5-2-122
> +OPENPGM_SITE = $(call github,steve-o,openpgm,release-$(OPENPGM_VERSION))
>  OPENPGM_LICENSE = LGPL-2.1+
>  OPENPGM_LICENSE_FILES = openpgm/pgm/LICENSE
>  OPENPGM_INSTALL_STAGING = YES
> 

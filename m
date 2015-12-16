From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Dec 2015 23:16:32 +0100
Subject: [Buildroot] [PATCH 2/2] package/gnupg2: really do not run tests
 in cross-compilation
In-Reply-To: <c7dd2e8bb5db5e326a7a4e7cb3611b8a0eea0e68.1450302183.git.yann.morin.1998@free.fr>
References: <cover.1450302183.git.yann.morin.1998@free.fr>
 <c7dd2e8bb5db5e326a7a4e7cb3611b8a0eea0e68.1450302183.git.yann.morin.1998@free.fr>
Message-ID: <5671E2C0.6030006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-12-15 22:44, Yann E. MORIN wrote:
> gnupg2 still tries to run test even if it tries to avoid it in
> cross-compilation.
> 
> Really disable running the tests.
> 
> Since that requires a complete autoreconf, the existing patch against
> configure is turned into a patch against the m4 macro.
> 
> since we autoreconf, we slightly patch configure.ac to not emit git
> errors on stderr because it is not in a git tree.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 but minor nits.

> ---
>  .../0000-silence-git-when-not-in-git-tree.patch    | 26 +++++++++++++++

 I would have prefered to renumber the patches rather than adding a 0000. And
anyway it's not necessary to add it as the first patch, you can add it as a 0004
as well.

>  package/gnupg2/0001-fix-pth-config-usage.patch     | 29 ++++++++--------
>  package/gnupg2/0003-dont-run-tests.patch           | 39 ++++++++++++++++++++++
>  package/gnupg2/gnupg2.mk                           |  4 +++
>  4 files changed, 82 insertions(+), 16 deletions(-)
>  create mode 100644 package/gnupg2/0000-silence-git-when-not-in-git-tree.patch
>  create mode 100644 package/gnupg2/0003-dont-run-tests.patch
> 
> diff --git a/package/gnupg2/0000-silence-git-when-not-in-git-tree.patch b/package/gnupg2/0000-silence-git-when-not-in-git-tree.patch
> new file mode 100644
> index 0000000..5eaefe4
> --- /dev/null
> +++ b/package/gnupg2/0000-silence-git-when-not-in-git-tree.patch
> @@ -0,0 +1,26 @@
> +configure: silence autoreconf when not in a git tree
> +
> +When autoreconfiguring ourside of a git tree, the output is verbose
> +with git errors.
> +
> +Silence that by consigning stderr to oblivion.
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Is this upstreamable?


 Regards,
 Arnout


> +
> +diff -durN gnupg2-2.0.29.orig/configure.ac gnupg2-2.0.29/configure.ac
> +--- gnupg2-2.0.29.orig/configure.ac	2015-09-08 14:39:24.000000000 +0200
> ++++ gnupg2-2.0.29/configure.ac	2015-12-16 18:34:47.099493863 +0100
> +@@ -33,11 +33,11 @@
> + # flag indicating a development version (mym4_isgit).  Note that the
> + # m4 processing is done by autoconf and not during the configure run.
> + m4_define([mym4_revision],
> +-          m4_esyscmd([git rev-parse --short HEAD | tr -d '\n\r']))
> ++          m4_esyscmd([git rev-parse --short HEAD 2>/dev/null | tr -d '\n\r']))
> + m4_define([mym4_revision_dec],
> +           m4_esyscmd_s([echo $((0x$(echo ]mym4_revision[|head -c 4)))]))
> + m4_define([mym4_betastring],
> +-          m4_esyscmd_s([git describe --match 'gnupg-2.[0-9].*[0-9]' --long|\
> ++          m4_esyscmd_s([git describe --match 'gnupg-2.[0-9].*[0-9]' --long 2>/dev/null |\
> +                         awk -F- '$3!=0{print"-beta"$3}']))
> + m4_define([mym4_isgit],m4_if(mym4_betastring,[],[no],[yes]))
> + m4_define([mym4_full_version],[mym4_version[]mym4_betastring])
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Aug 2016 01:02:59 +0200
Subject: [Buildroot] [PATCH 2/2] support/apply-patches: don't bail-out
 on libtool patch while using <package>-reconfigure
In-Reply-To: <1471209606-17689-2-git-send-email-romain.naour@gmail.com>
References: <1471209606-17689-1-git-send-email-romain.naour@gmail.com>
 <1471209606-17689-2-git-send-email-romain.naour@gmail.com>
Message-ID: <8ef7916d-17b5-a7a0-03e2-a8f324996570@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14-08-16 23:20, Romain Naour wrote:
> Since 19241598147e7555dce40b6dd44b28ef22b67ed9 <package>-reconfigure target is
> broken.
> 
> $ make elementary-reconfigure
> Applying buildroot-libtool-v2.4.4.patch using patch:
> Error: duplicate filename 'buildroot-libtool-v2.4.4.patch'
> Conflicting files are:
>   already applied: buildroot/support/libtool/buildroot-libtool-v2.4.4.patch
>   to be applied  : buildroot/support/libtool/buildroot-libtool-v2.4.4.patch
> 
> When a package use AUTORECONF, the libtool patch can be applied many
> times as the <package>-reconfigure target is called. This is not a
> problem since autoreconf will overwrite the previously patched files.
> 
> Add a new option to apply-paches script to not bail-out on libtool patch if
> already present in .applied_patches_list.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 However, I wonder if it really makes sense at all to use apply_patches.sh for
the libtool patches... apply_patches.sh does the following:

* It handles directories -> not needed here.
* It handles compressed patches and tarballs -> not needed.
* It handles series files -> not needed.
* It handles errors in case of multiple patches -> not needed since it's only
one patch.
* It detects errors based on *.rej files -> not needed since it's only a single
patch so patch exit code is OK.
* It writes the patch list -> for libtool, this is quite silly because it will
be written in the directory where ltmain.sh is found, not in the top-level
directory, so you have these patch lists spread over the source tree.

 So I would actually use patch directly rather than apply-patches:

patch -i support/libtool/buildroot-libtool-vxxx.patch $${i}

 Use of apply-patches was introduced in f11fa22d0e88c5a3b04429a3110a3cbbf0c30c49
in 2008, I don't know why John Voltz chose to use apply-patches back then...


 Regards,
 Arnout

> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-autotools.mk         |  8 ++++----
>  support/scripts/apply-patches.sh | 27 ++++++++++++++++++++-------
>  2 files changed, 24 insertions(+), 11 deletions(-)
> 
[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

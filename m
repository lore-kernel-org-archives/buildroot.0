From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Aug 2016 00:35:23 +0200
Subject: [Buildroot] [PATCH 1/2] support/apply-patches: use options
 rather than positional arguments
In-Reply-To: <1471209606-17689-1-git-send-email-romain.naour@gmail.com>
References: <1471209606-17689-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1933cc9d-7a02-eebc-6f7d-3f9f61770e45@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14-08-16 23:20, Romain Naour wrote:
> In order to improve the apply-patches script in a follow up patch and
> ease it maintenance, use options provided by bash getopts rather than
> positional arguments.
> 
> Update Buildroot infra and packages but this will break existing
> packages from BR2_EXTERNAL using APPLY_PATCHES.
> 
> While at it, rename builddir to sourcedir since it is really the
> package source directory.
> 
> Ref:
> http://lists.busybox.net/pipermail/buildroot/2016-August/169760.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 However, I think the -d -D is a bit confusing. How about -S (sourcedir) and -P
(patchdir) instead?

 We could also do a little bit of refactoring, and define a global
APPLY_DEBIAN_PATCHES that can be used for all the debian-patched packages (it
can be used directly as a POST_PATCH_HOOK). If you do that first, this commit
becomes a lot smaller.

 Also (but for a separate patch of course), the current defaults are totally
stupid. It would make more sense to default to *.patch for the pattern, because
those are the most common ones. The default sourcedir and patchdir are probably
best defined empty, so that it errors out in case those are forgotten.

 And another nice addition would be an option for a single patch file, we have
quite a few of those.


 But all of this is optional :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

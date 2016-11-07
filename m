From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 00:10:15 +0100
Subject: [Buildroot] [PATCH 5/6] package/pseudo: fix fakeroot wrapper to
 correctly use pseudo
In-Reply-To: <be88ddb9a18f43beaece4e29c5fe62ad91071ce3.1478553802.git.yann.morin.1998@free.fr>
References: <cover.1478553802.git.yann.morin.1998@free.fr>
 <be88ddb9a18f43beaece4e29c5fe62ad91071ce3.1478553802.git.yann.morin.1998@free.fr>
Message-ID: <2b6c8c6a-3ded-7a72-324a-7e9d7b755a15@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-11-16 22:23, Yann E. MORIN wrote:
> So far, we expected pseudo to behave like fakeroot would. This is not
> correct: we need to export a few variables to make pseudo look like it
> is behaving like fakeroot.
> 
> Provide a wrapper to impersonate fakeroot, instead of doing a symlink.

 Not nice, because it introduces absolute paths in host dir which is not good
for relocation.

 I'm thinking we shouldn't have introduced this symlink to begin with. I did
suggest it on IRC, but I wasn't thinking. fakeroot could never be called by
post-image scripts anyway, because the fakeroot database isn't saved, whatever
you do under fakeroot is lost.

 Hence I'm more inclined to revert 7158403805f. If someone does need it, they
can get patches from the mailing list :-)

 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
> ---
>  package/pseudo/pseudo.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
> index 2a3e31f..cc1bcdd 100644
> --- a/package/pseudo/pseudo.mk
> +++ b/package/pseudo/pseudo.mk
> @@ -31,7 +31,8 @@ HOST_PSEUDO = \
>  	$(HOST_DIR)/usr/bin/pseudo
>  
>  define HOST_PSEUDO_FAKEROOT_SYMLINK
> -	ln -sf pseudo $(HOST_DIR)/usr/bin/fakeroot
> +	printf '#!/bin/sh\n%s "$${@}"\n' '$(HOST_PSEUDO)' >$(HOST_DIR)/usr/bin/fakeroot
> +	chmod 755 $(HOST_DIR)/usr/bin/fakeroot
>  endef
>  HOST_PSEUDO_POST_INSTALL_HOOKS += HOST_PSEUDO_FAKEROOT_SYMLINK
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

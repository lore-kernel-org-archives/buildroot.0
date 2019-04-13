From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Apr 2019 00:06:47 +0200
Subject: [Buildroot] [PATCH] package/most: new package
In-Reply-To: <alpine.DEB.2.20.1904132238530.19094@defender.svolli.xa>
References: <alpine.DEB.2.20.1904132238530.19094@defender.svolli.xa>
Message-ID: <33746782-8645-1a42-0159-fe0ef55c2d07@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Sven,

 Thanks for this quick feedback loop.

 When submitting a second version of a patch, you should use 'PATCH v2' in the
subject line. Git does that for you if you add the -v2 option.

On 13/04/2019 22:40, Sven Oliver Moll wrote:
> Signed-off-by: Sven Oliver Moll <svolli@svolli.de>

 Also, you should add a changelog of what changed since the previous revision,
here, after the Sob, separate with
---


> ---
> ?DEVELOPERS???????????? |? 3 +++
> ?package/Config.in????? |? 1 +
> ?package/most/Config.in | 12 ++++++++++++
> ?package/most/most.hash |? 7 +++++++
> ?package/most/most.mk?? | 22 ++++++++++++++++++++++
> ?5 files changed, 45 insertions(+)
> ?create mode 100644 package/most/Config.in
> ?create mode 100644 package/most/most.hash
> ?create mode 100644 package/most/most.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e2ee7cbf69..121acedf99 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2112,6 +2112,9 @@ F:??? package/libmms/
> ?F:??? package/orc/
> ?F:??? package/wampcc/

 This did not apply, because there are spaces here while in the actual file it's
tabs. I guess you didn't use git send-email to send your patch? Then your mailer
will often create that kind of mess.

> 
> +N:??? Sven Oliver Moll <svolli@svolli.de>
> +F:??? package/most/
> +

[snip]
> +################################################################################
> +#
> +# most
> +#
> +################################################################################
> +
> +MOST_SITE = http://www.jedsoft.org/releases/most
> +MOST_VERSION = 5.1.0
> +MOST_LICENSE = GPL-2.0+
> +MOST_LICENSE_FILES = COPYING COPYRIGHT
> +MOST_DEPENDENCIES = slang
> +
> +define MOST_REMOVE_LOCAL_SLANG_CHECK
> +??? $(SED) 's/ slangversion / /g' $(@D)/src/Makefile.in
> +endef
> +MOST_POST_PATCH_HOOKS += MOST_REMOVE_LOCAL_SLANG_CHECK
> +
> +define MOST_INSTALL_TARGET_CMDS
> +??? $(INSTALL) -D -m 0755 $(@D)/src/objs/most $(TARGET_DIR)/usr/bin/most
> +endef
> +
> +$(eval $(autotools-package))

 The build didn't succeed for me, because the configure script looks for slang.h
in the system's include directories instead of the staging directory. I've added
--with-slang=$(STAGING_DIR)/usr to work around that.

 I've made all the required changes and applied to master, thanks.

 Regards,
 Arnout

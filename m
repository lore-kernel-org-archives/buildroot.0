From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 00:09:15 +0200
Subject: [Buildroot] [PATCH 1/1] Fix npm module cross compilation,
 use up-to-date npm and install modules globally
In-Reply-To: <1416775178-13738-2-git-send-email-mwei@cs.ucsd.edu>
References: <1416775178-13738-1-git-send-email-mwei@cs.ucsd.edu>
 <1416775178-13738-2-git-send-email-mwei@cs.ucsd.edu>
Message-ID: <20150713000915.3df608e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, J?rg, Martin,

We are currently to clean up the Buildroot patch tracking system and
found this patch that hasn't been applied so far. It doesn't apply
anymore, and other NodeJS changes have been done since then.

Could you have a look at whether this patch is still needed or not, and
if it is still needed, resend an updated version with a more detailed
commit log?

In the mean time, we'll mark the patch as Changes Requested in
patchwork, which means that we will no longer see it in our list of
pending patches: if you forget to resend a new version, we will no
longer remember about it. We are not NodeJS experts/users so your help
is really needed to improve/maintain this package in Buildroot.

Thanks a lot for your help!

Thomas

On Sun, 23 Nov 2014 12:39:38 -0800, Michael Wei wrote:
> Signed-off-by: Michael Wei <mwei@cs.ucsd.edu>
> ---
>  package/nodejs/nodejs.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 312aaa9..fbcb730 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -110,11 +110,13 @@ define NODEJS_INSTALL_MODULES
>  	# npm install call below and setting npm_config_rollback=false can both
>  	# help in diagnosing the problem.
>  	(cd $(TARGET_DIR)/usr/lib && mkdir -p node_modules && \
> +		$(HOST_DIR)/usr/bin/npm install -g npm --prefix=$(HOST_DIR) && \
>  		$(TARGET_CONFIGURE_OPTS) \
>  		LD="$(TARGET_CXX)" \
>  		npm_config_arch=$(NODEJS_CPU) \
>  		npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
> -		$(HOST_DIR)/usr/bin/npm install \
> +		$(HOST_DIR)/usr/bin/npm install -g --target_arch=$(NODEJS_CPU) \
> +		--prefix=$(TARGET_DIR) \
>  		$(NODEJS_MODULES_LIST) \
>  	)
>  endef



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

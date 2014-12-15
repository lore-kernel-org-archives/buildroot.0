From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Mon, 15 Dec 2014 23:53:27 +0100
Subject: [Buildroot] [1/1] Fix npm module cross compilation,
 use up-to-date npm and install modules globally
Message-ID: <1418684007.5268.32.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Michael Wei,
Dear Thomas Petazzoni,

I found this old thread in the mail archive. I added the message ID to
the reply-to field, so I hope the mail makes it into the thread.

I've using native modules for cross-compilation, too. I revied this
patch, you'll find my comments below.

> 
> ______________________________________________________________________
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

This installs a newer npm in the modules directory $(HOST_DIR)/lib/node_modules/, but this version is not used for the modules installation, as you can see here:

I've this by simply printing version info:
	define NODEJS_INSTALL_MODULES
		(cd $(TARGET_DIR)/usr/lib && mkdir -p node_modules && \
			$(HOST_DIR)/usr/bin/npm --version && \
			$(HOST_DIR)/usr/bin/npm install -g npm --prefix=$(HOST_DIR) && \
			$(HOST_DIR)/usr/bin/npm --version && \

Prints:
	1.4.28
	/home/joerg/Work/buildroot/output/host/bin/npm -> /home/joerg/Work/buildroot/output/host/lib/node_modules/npm/bin/npm-cli.js
npm at 2.1.12 /home/joerg/Work/buildroot/output/host/lib/node_modules/npm
	1.4.28

If we want to use a new version of npm we have to replace the bundled npm dependency in the nodejs source tree. In the Arch Linux PKGBUILD of nodejs is a way howto do it:
https://projects.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/nodejs.



>  		$(TARGET_CONFIGURE_OPTS) \
>  		LD="$(TARGET_CXX)" \
>  		npm_config_arch=$(NODEJS_CPU) \
>  		npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
> -		$(HOST_DIR)/usr/bin/npm install \
> +		$(HOST_DIR)/usr/bin/npm install -g --target_arch=$(NODEJS_CPU) \
> +		--prefix=$(TARGET_DIR) \

I'm not sure about the 'target-arch' and 'prefix' flags for npm install. Doing:

# https://github.com/npm/npm.git
# find npm -type f | xargs grep "target-arch"

gives my no results. Also having a quick look at the git repo (especially https://github.com/npm/npm/blob/master/lib/install.js) I do not find any hints for those flags.

Where did you get them from?

Fo me cross-compilation for modules and native addons (compiled by gyp) work fine. What native modules are you building?

Btw: Maybe soon version 0.11.15 of nodejs will be released. This is an unstable version, but very close to the next major release 0.12. Is it okay if nodejs is bumped to an unstable version or is the stable branch preferred?

Best regards
J?rg Krause

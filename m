From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Jul 2015 23:54:02 +0200
Subject: [Buildroot] [v4 3/4] package/nodejs: Fixes for node-pre-gyp
In-Reply-To: <1435830207-16664-3-git-send-email-martin@barkynet.com>
References: <1435830207-16664-1-git-send-email-martin@barkynet.com>
 <1435830207-16664-3-git-send-email-martin@barkynet.com>
Message-ID: <20150702215402.GJ3838@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2015-07-02 10:43 +0100, Martin Bark spake thusly:
> Many packages use node-pre-gyp as a way of deploying precompiled binary
> dependencies with fall back to compilation for other targets.  Currently
> installing node modules that use node-pre-gyp can fail to use the correct
> binary for the target.  This patch fixes this issue by correctly
> configuring node-pre-gyp.
> 
> Firstly, node-gyp uses the option --arch to determine its target
> architecture (which is already set correctly), however, node-pre-gyp uses
> --target-arch.  Without this set node.js packages that uses node-pre-gyp
> will pick the wrong target architecture.
> 
> Secondly, the use of precompiled binary packages is not desirable due to
> potential security and licensing issues.  To solve this we use the
> --build-from-source option to force node-pre-gyp to always build the C++
> code.
> 
> This patch passes npm_config_target_arch and npm_config_build_from_source
> to npm which causes --target-arch and --build-from-source to be passed to
> node-pre-gyp.
> 
> I have tested this using the node.js package serialport which now
> successfully builds and runs.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

I'm not much of a nodejs guy, so I'd like some feedback from other
nodejs users. J?rg, maybe?

Otherwise, the build-form-source chunk looks way better, thanks! :-)

[really only a code review]
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v3 -> v4
>  - Force always building from source (Suggested by Yann E. MORIN)
>  - Improved commit message
> 
> Changes v2 -> v3
>  - Adjusted patch order so this is before the new definition of $(NPM)
> 
> Changes v1 -> v2
>  - No changes, new in v2
> ---
>  package/nodejs/nodejs.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 0b3f8a5..156b151 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -107,6 +107,8 @@ define NODEJS_INSTALL_MODULES
>  		$(TARGET_CONFIGURE_OPTS) \
>  		LD="$(TARGET_CXX)" \
>  		npm_config_arch=$(NODEJS_CPU) \
> +		npm_config_target_arch=$(NODEJS_CPU) \
> +		npm_config_build_from_source=true \
>  		npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
>  		$(HOST_DIR)/usr/bin/npm install \
>  		$(NODEJS_MODULES_LIST) \
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

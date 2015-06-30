From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jun 2015 20:01:06 +0200
Subject: [Buildroot] [v3 3/4] package/nodejs: Add npm_config_target_arch
 to npm command
In-Reply-To: <1435660966-11347-3-git-send-email-martin@barkynet.com>
References: <1435660966-11347-1-git-send-email-martin@barkynet.com>
 <1435660966-11347-3-git-send-email-martin@barkynet.com>
Message-ID: <20150630180106.GD3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2015-06-30 11:42 +0100, Martin Bark spake thusly:
> Many packages use node-pre-gpy as a way of deploying precompiled binary

node-pre-gpy or node-pre-gyp ? ;-)

> dependencies with fall back to compilation for other targets.  node-gyp
> uses the option --arch to determine its target architecture (which is
> already set correctly), however, node-pre-gyp uses --target-arch.  Without
> this set node.js packages that uses node-pre-gyp will pick the wrong target
> architecture.

So if I understand correctly, we can fall in a case where the package
claims to already have a pre-compiled binary for this target-arch, and
install that instead of building it from source, right?

I don't think this is good, for three reasons;

  1) there's no way we can ensure it matches the bundled sources;
     think malware sneaking into there... :-(

  2) it makes complying with the licenses almost impossible (e.g a
     module is GPLv2, we install the pre-built binary, we're not sure
     the sources we have are the actual sources used to build the binary
     we ship)

  3) the architecture is not enough: what about optimisation (speed,
     size...), the ABI (hardfloat vs. softfloat...) and a lot of other
     compilation-related specifities?...

Can we disable this check, and *always* and *unconditionnally* build
from source, even if the module believes it has a pre-compiled binary
for the current target architecture?

Otherwise, I won't review nor ack this patch, I'm not too versed in
NodeJS to fully appreciate the problem and the proposed solution...
Sorry...

Regards,
Yann E. MORIN.

> This patch sets npm_config_target_arch to solve this issue.  I have tested
> this using the node.js package serialport.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> 
> ---
> Changes v2 -> v3
>  - Adjusted patch order so this is before the new definition of $(NPM)
> 
> Changes v1 -> v2
>  - No changes, new in v2
> ---
>  package/nodejs/nodejs.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 0b3f8a5..78db49d 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -107,6 +107,7 @@ define NODEJS_INSTALL_MODULES
>  		$(TARGET_CONFIGURE_OPTS) \
>  		LD="$(TARGET_CXX)" \
>  		npm_config_arch=$(NODEJS_CPU) \
> +		npm_config_target_arch=$(NODEJS_CPU) \
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

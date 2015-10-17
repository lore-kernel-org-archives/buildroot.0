From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 13:00:07 +0200
Subject: [Buildroot] how can i customize existing package when using the
 BR2_EXTERNAL mechanism
In-Reply-To: <1445026679.208938590@f90.i.mail.ru>
References: <1445026679.208938590@f90.i.mail.ru>
Message-ID: <20151017130007.63ace36a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear ?????? ????????,

On Fri, 16 Oct 2015 23:17:59 +0300, ?????? ???????? wrote:
>  for example, i need add rtmp module to the nginx package
> 
> nginx.mk
> 
> ifeq ($(BR2_PACKAGE_NGINX_HTTP_RTMP),y)
> NGINX_POST_PATCH_CMDS += git clone  https://github.com/arut/nginx-rtmp-module.git $(@D)/rtmp
> NGINX_CONF_OPT += --add-module=$(@D)/rtmp
> endif
> 
> nginx/Config.in
> 
> config BR2_PACKAGE_NGINX_HTTP_RTMP
> ?? ?bool "Enable RTMP module"
> ?? ?depends on BR2_PACKAGE_NGINX
> ?? ?help
> ?? ?? Enable NGINX-based Media Streaming Server.

The BR2_EXTERNAL mechanism does not allow to customize existing
packages in the main Buildroot. It only allows to *add* other packages.

My suggestion here would be to simply patch the official Buildroot, and
send the patch upstream to us so that it gets merged.

However, note that your approach is not correct: doing a "git clone" in
the middle of a package patch commands is not good as it completely
circumvents the Buildroot download logic and legal-info collection
logic.

You should instead add a separate package for the nginx-rtmp-module,
and then if there is no other way than building it during the nginx
build, what you can do is in the nginx package, depend on the
nginx-rtmp-module, and create the appropriate symlink between $(@D) and
the build directory of nginx-rtmp-module.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

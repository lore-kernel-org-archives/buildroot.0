From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Mar 2012 23:37:59 +0200
Subject: [Buildroot] xbmc package
In-Reply-To: <CAAfyv35s2iDxa8iWXqvfCMQDoF4kk-+_4zDFY=A6sE59i=sHXQ@mail.gmail.com>
References: <CAAfyv35s2iDxa8iWXqvfCMQDoF4kk-+_4zDFY=A6sE59i=sHXQ@mail.gmail.com>
Message-ID: <201203282338.00156.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 28 March 2012 10:47:52 Belisko Marek wrote:
> Hi,
> 
> I'm trying to add xbmc package to buildroot and have problem how to
> fix one dependency problem.
> Problem is with mysql_config which is requested by xmbc during config phase.
> I add mysql_client dependency (mysql_config is installed in staging)
> but xbmc config
> still complain. I've check that qt use similar with configure option
> but xbmc don't have such an option.
> 
> Any ideas how to fix that?

 You'll have to tell the configure script to look for mysql_config in
the staging directory.  See for instance how fontconfig.mk tells its
configure to use the freetype-config from the staging directory.

 ... except that the xbmc people don't seem to know how to write
a configure.ac.  You can't properly override the MYSQL_CONFIG
variable.  You'll have to fix configure.ac :-(

 The alternative would be to let mysql_client.mk install mysql_config
in some new target-config-bin directory that is prepended to the path
for target builds.  But that's also a lot of work.


[snip]
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> new file mode 100644
> index 0000000..6379ab8
> --- /dev/null
> +++ b/package/xbmc/xbmc.mk
> @@ -0,0 +1,13 @@
> +#############################################################
> +#
> +# xbmc
> +#
> +#############################################################
> +XBMC_VERSION = 11.0
> +XBMC_SITE = http://mirrors.xbmc.org/releases/source/
> +
> +XBMC_DEPENDENCIES = host-pkg-config boost sdl_gfx mysql_client
> +XBMC_CONF_OPT = --disable-debug --disable-gl

 The --disable-debug should probably be:

$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)

 And gl is provided by the mesa3d package - it probably
should be a configure option, though.  Or you can do
something like

ifeq ($(BR2_PACKAGE_MESA3D),y)
XBMC_DEPENDENCIES += mesa3d
XBMC_CONF_OPT += --enable-gl
else
XBMC_CONF_OPT += --disable-gl
endif


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

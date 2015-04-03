From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Apr 2015 00:21:57 +0200
Subject: [Buildroot] [PATCH 1/3] package/tvheadend: Fix inclusion of
 dtv-scan-tables files
In-Reply-To: <1426936276-23649-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426936276-23649-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150403222157.GB4428@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-03-21 12:11 +0100, Bernd Kuhls spake thusly:
> --enable-dvbscan forces downloading the tables from upstream which is
> not needed because we provide these files through TVHEADEND_BUILD_CMDS.
> So --disable-dvbscan fixes the autobuild errors. But doing so prevents
> the inclusion of the dtv-scan-tables files in the bundled binary
> usr/bin/tvheadend. Therefore we force .config.mk to enable the dvbscan
> support again after the configure script finished.

Well, I think I'd prefer we patch away the download from the configure
script altogether.

This would allow us to avoid tinkering with the generated files.

And get it wrong: you're missign the define in the generated header, and
the source code has a check for ENABLE_DVBSCAN.

So, I still think a better solution would be to just patch-out the
download from the configure script.

Regards,
Yann E. MORIN.

> Fixes
> http://autobuild.buildroot.net/results/25f/25fc657dbc37228483eeefb3618be9df2ee13832/
> http://autobuild.buildroot.net/results/37a/37abb5d2ec62ac59897d019e6ca85c8eb0e69786/
> http://autobuild.buildroot.net/results/e86/e860e501f904d94bbab6a765aad4d19947135513/
> http://autobuild.buildroot.net/results/a55/a55ab4fc34bebda14236d6a0efe893aa75374ed2/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tvheadend/tvheadend.mk |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index d6b77da..96c040d 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -50,15 +50,16 @@ define TVHEADEND_CONFIGURE_CMDS
>  			--arch="$(ARCH)"			\
>  			--cpu="$(BR2_GCC_TARGET_CPU)"		\
>  			--python="$(HOST_DIR)/usr/bin/python"	\
> -			--enable-dvbscan			\
> +			--disable-dvbscan			\
>  			--enable-bundle				\
>  			--disable-libffmpeg_static		\
>  			$(TVHEADEND_CONF_OPTS)			\
> +		&& $(SED) 's%^CONFIG_DVBSCAN =.*%CONFIG_DVBSCAN = yes%' .config.mk \
>  	)
>  endef
>  
>  # The tvheadend build system expects the transponder data to be present inside
> -# its source tree. To prevent a downloaded initiated by the build system just
> +# its source tree. To prevent a download initiated by the build system just
>  # copy the data files in the right place and add the corresponding stamp file.
>  define TVHEADEND_BUILD_CMDS
>  	$(INSTALL) -d $(@D)/data/dvb-scan
> -- 
> 1.7.10.4
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

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Jul 2014 23:30:12 +0200
Subject: [Buildroot] [PATCH 2/3] lm-sensors: don't use host ldconfig
In-Reply-To: <1404939033-32578-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404939033-32578-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404939033-32578-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140709213012.GC3652@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-09 22:50 +0200, Thomas Petazzoni spake thusly:
> To know whether the libiconv library is available, lm-sensors is using
> the host ldconfig, which is obviously wrong in cross-compilation.
> 
> Moreover, the lm-sensors program making use of the iconv_*() API
> already does it when __UCLIBC__ is *not* defined. In this case, the
> iconv_*() functions are already part of the C library, so there is no
> need to link against a separate library. Therefore, this patch simply
> removes the libiconv handling.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  .../lm-sensors-0002-no-host-ldconfig.patch         | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/lm-sensors/lm-sensors-0002-no-host-ldconfig.patch
> 
> diff --git a/package/lm-sensors/lm-sensors-0002-no-host-ldconfig.patch b/package/lm-sensors/lm-sensors-0002-no-host-ldconfig.patch
> new file mode 100644
> index 0000000..ed4b550
> --- /dev/null
> +++ b/package/lm-sensors/lm-sensors-0002-no-host-ldconfig.patch
> @@ -0,0 +1,29 @@
> +Remove usage of host ldconfig
> +
> +To know whether the libiconv library is available, lm-sensors is using
> +the host ldconfig, which is obviously wrong in cross-compilation.
> +
> +Moreover, the lm-sensors program making use of the iconv_*() API
> +already does it when __UCLIBC__ is *not* defined. In this case, the
> +iconv_*() functions are already part of the C library, so there is no
> +need to link against a separate library. Therefore, this patch simply
> +removes the libiconv handling.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +
> +Index: b/prog/sensors/Module.mk
> +===================================================================
> +--- a/prog/sensors/Module.mk
> ++++ b/prog/sensors/Module.mk
> +@@ -37,10 +37,8 @@
> + REMOVESENSORSBIN := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(BINDIR)/%,$(PROGSENSORSTARGETS))
> + REMOVESENSORSMAN := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(PROGSENSORSMAN1DIR)/%,$(PROGSENSORSMAN1FILES))
> + 
> +-LIBICONV := $(shell if /sbin/ldconfig -p | grep -q '/libiconv\.so$$' ; then echo \-liconv; else echo; fi)
> +-
> + $(PROGSENSORSTARGETS): $(PROGSENSORSSOURCES:.c=.ro) lib/$(LIBDEP)
> +-	$(CC) $(EXLDFLAGS) -o $@ $(PROGSENSORSSOURCES:.c=.ro) $(LIBICONV) -Llib -lsensors -lm
> ++	$(CC) $(EXLDFLAGS) -o $@ $(PROGSENSORSSOURCES:.c=.ro) -Llib -lsensors -lm
> + 
> + all-prog-sensors: $(PROGSENSORSTARGETS)
> + user :: all-prog-sensors
> -- 
> 2.0.0
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

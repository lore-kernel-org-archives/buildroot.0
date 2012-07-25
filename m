From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 25 Jul 2012 08:53:54 +0100
Subject: [Buildroot] [PATCH 1/3] gpsd: proper usage of prefix and DESTDIR
In-Reply-To: <1343167832-14198-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1343167832-14198-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHt8ZCM=ZcbkOSpGzOJg-1sRK8tbrcZe8z5q5vbsy2-vG0p4wg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24 July 2012 23:10, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> prefix should always be /usr, and destdir must be passed as DESTDIR,
> and in the environment, not as a scons argument. Finally, we pass the
> sysroot= argument to scons so that it doesn't add -L/usr/lib
> parameters when compiling.

Hi Thomas. The build is now falling over for me:

/opt/tfx/arch/arm/usr/bin/ccache /usr/lib/ccache/gcc -pthread -o
strl-py_2_7_2_final_0.so -c -fno-strict-aliasing -O2 -fPIC -DNDEBUG -g
-O3 -Wall -Wstrict-prototypes
-I/opt/tfx/arch/arm/usr/include/python2.7 strl.c
/opt/tfx/arch/arm/usr/bin/ccache /usr/lib/ccache/gcc -pthread -shared
-L/opt/tfx/arch/arm/lib -L/opt/tfx/arch/arm/usr/lib
-Wl,-rpath,/opt/tfx/arch/arm/usr/lib -o gps/clienthelpers.so
gpsclient-py_2_7_2_final_0.so geoid-py_2_7_2_final_0.so
gpsdclient-py_2_7_2_final_0.so strl-py_2_7_2_final_0.so -L.
-L/opt/tfx/arch/arm/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib
-lrt
/usr/bin/ld: skipping incompatible
/opt/tfx/arch/arm/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/librt.so
when searching for -lrt
/usr/bin/ld: skipping incompatible
/opt/tfx/arch/arm/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/librt.a
when searching for -lrt
/usr/bin/ld: cannot find /lib/libpthread.so.0 inside
/usr/bin/ld: cannot find /usr/lib/libpthread_nonshared.a inside
collect2: ld returned 1 exit status
scons: *** [gps/clienthelpers.so] Error 1
scons: building terminated because of errors.

> @@ -223,10 +224,9 @@ endef
>  define GPSD_INSTALL_STAGING_CMDS
>         (cd $(@D); \
>                 $(GPSD_SCONS_ENV) \
> +               DESTDIR=$(TARGET_DIR) \
>                 $(SCONS) \
>                 $(GPSD_SCONS_OPTS) \
> -               destdir=$(STAGING_DIR) \
> -               includedir="$(STAGING_DIR)/usr/include" \
>                 install)
>  endef

Should DESTDIR be set to $(STAGING_DIR), rather than $(TARGET_DIR), here?

Simon.

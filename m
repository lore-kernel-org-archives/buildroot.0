From: Kantanu Kumar Mohapatra <kantanukumar@gmail.com>
Date: Tue, 30 Sep 2014 18:46:32 +0530
Subject: [Buildroot] Using u-boot tools
In-Reply-To: <CAAXf6LU1rr_Z5-xTChP_KzN9gotXFiKtAgD4UHoCuocR5GamMA@mail.gmail.com>
References: <CAJO1S91Kw0tsM-Azy7s9aVBaFORpB2Gp0-qrST2rDavorQUGjA@mail.gmail.com>
 <20140929111853.6881f323@free-electrons.com>
 <CAAXf6LXTaWD=4KrL3oF3Sy4dP+cFbX5fBK3LD7WACtRvuhxmqw@mail.gmail.com>
 <20140929152136.4d7cee9c@free-electrons.com>
 <CAJO1S935TBt+HHGQ43WH9fzG0s9oOEk0hfsi-OXrr83Td_umQg@mail.gmail.com>
 <20140929183824.5b7bc3e5@free-electrons.com>
 <CAJO1S92HBmxKivtoqZDEjGYt5e6xiQkrHnCPLi1H0O4E9xtixg@mail.gmail.com>
 <CAAXf6LVco1ikU6rfBSyNf_WZZfv4nBP1fhwcajfzoAN07wLZ7A@mail.gmail.com>
 <CAJO1S93CyRMH62V4+OU+403h0_p=9G247fT2foT5t1G36ZndsQ@mail.gmail.com>
 <CAAXf6LXKSX11OfGkaNeO=vRDCcCQVTAd00P-_g2qs_aqe2_R-Q@mail.gmail.com>
 <CAJO1S93YXn=r9egsr-9V49Xq7+MsGUd4eLxDcX_fvcN_gXoCwg@mail.gmail.com>
 <CAAXf6LU1rr_Z5-xTChP_KzN9gotXFiKtAgD4UHoCuocR5GamMA@mail.gmail.com>
Message-ID: <CAJO1S90KxEASjZdWeByO5kuf-VxY2ZWME4mZyDO8f1-fbm4oWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas,

On Tue, Sep 30, 2014 at 3:28 PM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Hi Kantanu,
>
> On Tue, Sep 30, 2014 at 11:33 AM, Kantanu Kumar Mohapatra
> <kantanukumar@gmail.com> wrote:
>
> >
> > Thanks a lot Thomas for your reply. Sorry for the typo, please consider
> the
> > new version as buildroot-2014.02.
> >
> > Let me explain all in detail.
> >
> > old br2:
> > ========
> > version: 2010.05
> > uboot: 2010.03(customized)
> > uboot-tools: 2010.03 (used from uboot src)
> >
> >
> > New br2 (which I am upgrading to):
> > ===========================
> > version: 2014.02
> > uboot: 2010.03(customized, same should be across tools too)
> > uboot-tools: 2014.01 ( should be same as uboot-2010.03)
>
> While I can understand that you do not want to update u-boot itself,
> what is the problem to use the most recent version of u-boot-tools ?
> In the cases I have seen, there was no conflict when using the most
> recent u-boot-tools with images of an older u-boot.
>
> ?The problem here is the files inside tools/env/, (fw_env.c, fw_env.h,
fw_env_main.c) where custom changes are placed.?

?I want to retain the old files?, I can't take the change and apply that to
tools-14, as I am not authorized to change those files.

> >
> > In br2-14, I am getting the uboot image(.bin) properly, which I
> customized
> > to get a .rom with my headers added to it, done in boot/uboot/uboot.mk
> >
> > Here the problem which I faced is "fw_printenv" executable, which is
> built
> > in tools, for br2-2014.02. fw_printenv is created, when getting the uboot
> > image in br2-2010.03 (target/uboot/Makefile.in).
> >
> > In br2-2014.02,
> > Tools should be taken from the source, which went into
> > output/build/uboot-2010.03, But instead it creates another
> > uboot-tools-2014.01 inside output/build/ and places source there.
> >
> > How to build that fw_printenv, in old way like br2-10, seen as below?
> >
> > $(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/$(U_BOOT_BIN)
> >     mkdir -p $(@D)
> >     $(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(LINUX_HEADERS_DIR)/include \
> >         -D_custom_flag \
> >         -DUSE_HOSTCC -o $@ \
> >         $(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/lib_generic/crc32.c
>
> This is no longer used. In buildroot 2010.05, the rules to build
> fw_printenv were indeed part of buildroot explicitly, as shown above.
> In buildroot 2014.02, we are using the u-boot makefiles to define how
> to build these tools. So you cannot simply use the same way as you did
> for buildroot-2010.05.
>
> >
> > I want to use another "-D_custom_flag" to build "fw_printenv", in br2-14.
> > Please suggest me the changes to be done. If I change
>  UBOOT_TOOLS_VERSION
> > = 2010.03, in  uboot-tools.mk, getting compilation error, as it has
> > dependency on host-tools.
>
> I think you have two options:
>
> 1. add a patch for u-boot itself, adding your custom -D flag in the
> appropriate u-boot makefile (probably in tools/env/Makefile, but I
> don't know if this was already the case in u-boot-2010.03, I haven't
> checked).
>
> 2. In package/uboot-tools/uboot-tools.mk, there is this code:
>
> define UBOOT_TOOLS_BUILD_CMDS
>     $(MAKE) -C $(@D)             \
>         CROSS_COMPILE="$(TARGET_CROSS)"    \
>         CFLAGS="$(TARGET_CFLAGS)"    \
>         LDFLAGS="$(TARGET_LDFLAGS)"    \
>         CROSS_BUILD_TOOLS=y        \
>         tools-only
>     $(MAKE) -C $(@D)             \
>         CROSS_COMPILE="$(TARGET_CROSS)"    \
>         CFLAGS="$(TARGET_CFLAGS)"    \
>         LDFLAGS="$(TARGET_LDFLAGS)"    \
>         env no-dot-config-targets=env
> endef
>
> The second make command is (as far as I can see) responsible for
> building the fw_printenv tool. If your custom flag can safely be
> passed to other tools inside the tools/env directory of u-boot, then
> you could consider adding your custom flag here too, something like:
>     $(MAKE) -C $(@D)             \
>         CROSS_COMPILE="$(TARGET_CROSS)"    \
>         CFLAGS="$(TARGET_CFLAGS) -Dcustom_flag"    \
>         LDFLAGS="$(TARGET_LDFLAGS)"    \
>         env no-dot-config-targets=env
>
> Note that I have not tested this explicitly.
>
> ?I have tried to add the flag only for env, ?

?that gets compiled. I can see a fw_printenv executable inside tools/env/,
the size shows 30K in tools/env/, but it is not same in target/sbin/(22k).
I need the old files to compile with this flag?.

Hope this helps,
> Thomas
>


?Many thanks for your help,
Kantanu?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140930/2dc6c6a7/attachment.html>

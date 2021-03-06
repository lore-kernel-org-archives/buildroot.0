From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Sun, 7 Mar 2021 00:11:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/optee-client: disable -Werror
In-Reply-To: <20210306225353.GX2275@scaer>
References: <20201101204349.2553267-1-fontaine.fabrice@gmail.com>
 <20210306225353.GX2275@scaer>
Message-ID: <CAN5uoS-dtNp2CJS-XF3oE5mgokK3joJRMuq=BJNMwjJ4o5fmjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sat, 6 Mar 2021 at 23:53, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Fabrice, All,
>
> On 2020-11-01 21:43 +0100, Fabrice Fontaine spake thusly:
> > Disable -Werror thanks to CFG_WERROR which is available since version
> > 3.3.0 and
> > https://github.com/OP-TEE/optee_client/commit/5355fdb841bce4f7cce3dd37fc31fa91bd625c98
> > to fix the following build failure with optee-client 3.11.0:
> >
> > /home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.11.0/libckteec/src/pkcs11_processing.c: In function 'ck_create_object':
> > /home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.11.0/libckteec/src/pkcs11_processing.c:22:9: error: missing initializer for field 'buffer' of 'struct serializer' [-Werror=missing-field-initializers]
> >   struct serializer obj = { };
> >          ^
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/a3d663adb943aee814180f01d6e153b3309be962
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> After reading the thread, I decided to apply this (oldish) patch to
> next.
>
> Indeed, as you mentionned in the thread, we do try to remove -Werror
> when we hit issues with it.
>
> -Werror is very important for the developpers of a package, because they
> indeed can find and fix their code as early as possible.
>
> But for downstreams, that does not help at all, especially since there
> are a myriad of possible combination of binutils versions, compiler
> versins, C libraries flavours and versions, optimisations flags and
> architectures, that it is virtually impossible to guarantee a no-warning
> build on all those combinations, especially when a new version of any of
> those gets out.
>
> So, applied to next, thanks.
>
> (Yes, I know we just bumped the version of optee-client, and that we do
> not yet have any -Werror issue with it, but should we have any, the
> answer would be to apply that patch anyway. So no need to wait for the
> first issue to popup...)

I understand your concern. Your change is fine, using CFG_WERROR is
the best way.
It can remain in next and master.
Reviewed-by: Etienne Carriere <etienne.carriere@linaro.org>
(if that helps)

Regards,
Etienne

>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/optee-client/optee-client.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
> > index 8108fc2130..7f613f724d 100644
> > --- a/package/optee-client/optee-client.mk
> > +++ b/package/optee-client/optee-client.mk
> > @@ -11,7 +11,8 @@ OPTEE_CLIENT_LICENSE_FILES = LICENSE
> >  OPTEE_CLIENT_INSTALL_STAGING = YES
> >
> >  OPTEE_CLIENT_CONF_OPTS = \
> > -     -DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH)
> > +     -DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH) \
> > +     -DCFG_WERROR=OFF
> >
> >  define OPTEE_CLIENT_INSTALL_INIT_SYSV
> >       $(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30optee \
> > --
> > 2.28.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

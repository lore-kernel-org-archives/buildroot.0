From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 3 Nov 2020 18:32:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/optee-client: disable -Werror
In-Reply-To: <CAN5uoS-Yor+bwUe=pvTuP3f9HgtQ_FqshSaN9d5V3qccJPr_bQ@mail.gmail.com>
References: <20201101204349.2553267-1-fontaine.fabrice@gmail.com>
 <CAN5uoS_RNnhzbCxKNaHOzc5UbrftQNKZWn8CKSkaj2QxgitWGQ@mail.gmail.com>
 <CAPi7W819iJQ87yYC+weRj8WzX6G_4DLA0fJQZcrquiLfeT20QQ@mail.gmail.com>
 <CAN5uoS_qoKeY_yi-px5iNo+8W4-s0-GxyN187Xm3vyE6BY1vrA@mail.gmail.com>
 <CAN5uoS-68kgeuhtbfT3ks40wv_d4RSEYDoJC5a1qtrFieHksyw@mail.gmail.com>
 <CAN5uoS-Yor+bwUe=pvTuP3f9HgtQ_FqshSaN9d5V3qccJPr_bQ@mail.gmail.com>
Message-ID: <CAPi7W82Ejx-_AK_9s71ZuhXoH+O=cjbGaAEWaH0=nwVBgEf5Ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 3 nov. 2020 ? 14:48, Etienne Carriere
<etienne.carriere@linaro.org> a ?crit :
>
> Hi again Fabrice,
>
> On Tue, 3 Nov 2020 at 10:57, Etienne Carriere
> <etienne.carriere@linaro.org> wrote:
> >
> > Hi Fabrice,
> >
> > On Mon, 2 Nov 2020 at 09:16, Etienne Carriere
> > <etienne.carriere@linaro.org> wrote:
> > >
> > > On Mon, 2 Nov 2020 at 08:10, Fabrice Fontaine
> > > <fontaine.fabrice@gmail.com> wrote:
> > > >
> > > > Hello Etienne,
> > > >
> > > > Le lun. 2 nov. 2020 ? 07:07, Etienne Carriere
> > > > <etienne.carriere@linaro.org> a ?crit :
> > > > >
> > > > > Hello Fabrice,
> > > > >
> > > > > On Sun, 1 Nov 2020 at 21:44, Fabrice Fontaine
> > > > > <fontaine.fabrice@gmail.com> wrote:
> > > > > >
> > > > > > Disable -Werror thanks to CFG_WERROR which is available since version
> > > > > > 3.3.0 and
> > > > > > https://github.com/OP-TEE/optee_client/commit/5355fdb841bce4f7cce3dd37fc31fa91bd625c98
> > > > > > to fix the following build failure with optee-client 3.11.0:
> > > > > >
> > > > > > /home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.11.0/libckteec/src/pkcs11_processing.c: In function 'ck_create_object':
> > > > > > /home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.11.0/libckteec/src/pkcs11_processing.c:22:9: error: missing initializer for field 'buffer' of 'struct serializer' [-Werror=missing-field-initializers]
> > > > > >   struct serializer obj = { };
> > > > > >          ^
> > > > > >
> > > > >
> > > > > This seems strange as { } is expected to be a valid universal initializer.
> > > > > In OP-TEE packages, we use it to initialize struct instances, so I
> > > > > guess the issue would rise at many places.
> > > > > Toolchain seems gcc 4.8.3, is it this toolchain that does not support { }?
> > > > > > -- The C compiler identification is GNU 4.8.3
> > > > The correct universal initializer is { 0 }, not { }. I sent a PR:
> > > > https://github.com/OP-TEE/optee_client/pull/230
> > >
> > > { 0 } does not fit well. When the 1st field in a struct is a pointer,
> > > as here, we experienced toolchains complaining about pointers being
> > > initialized to integer values.
> > >
> > > OP-TEE coding style documentation highlights that, see last bullet in
> > > https://optee.readthedocs.io/en/latest/general/coding_standards.html.
> > > Thanks for the P-R in OP-TEE project. I guess we'll get OP-TEE
> > > community feedback from there.
> > >
> > > Regards,
> > > Etienne
> >
> > Looking back on this, I think disabling error on warning is not
> > a good solution. It could lead to madanted initialization not being
> > handled and hidden at build time.
> >
> > For this very optee_client client, I would suggest either to
> > depend on a more recent toolchain or we fix the source code
> > to use strictly appropriate initiliazers.
> > My preference would go to the 1st proposal, to not deviate from
> > optee_client mainline more than necessary. We'll face similar issues
> > with next OP-TEE releases. Note we do already face the same
> > issues with other OP-TEE packages (boot/optee-os and
> > package/optee-*) currently supported in BR.
> >
>
> Are you ok using the patch you made for
> https://github.com/OP-TEE/optee_client/pull/230 instead of the change
> proposed here?
Sure, I sent a new patch however I also know that a common practice in
buildroot (and in other distros as well) is to disable -Werror.
The goal is not to hide "issues" but to avoid errors with old or newer
compilers.
So I think that we should apply both. I'll let Thomas or Yann decide
if they do agree or not.
>
> >
> > Regards,
> > Etienne
> >
> >
> > >
> > >
> > > > >
> > > > >
> > > > > > Fixes:
> > > > > >  - http://autobuild.buildroot.org/results/a3d663adb943aee814180f01d6e153b3309be962
> > > > > >
> > > > > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > > > > ---
> > > > > >  package/optee-client/optee-client.mk | 3 ++-
> > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
> > > > > > index 8108fc2130..7f613f724d 100644
> > > > > > --- a/package/optee-client/optee-client.mk
> > > > > > +++ b/package/optee-client/optee-client.mk
> > > > > > @@ -11,7 +11,8 @@ OPTEE_CLIENT_LICENSE_FILES = LICENSE
> > > > > >  OPTEE_CLIENT_INSTALL_STAGING = YES
> > > > > >
> > > > > >  OPTEE_CLIENT_CONF_OPTS = \
> > > > > > -       -DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH)
> > > > > > +       -DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH) \
> > > > > > +       -DCFG_WERROR=OFF
> > > > > >
> > > > > >  define OPTEE_CLIENT_INSTALL_INIT_SYSV
> > > > > >         $(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30optee \
> > > > > > --
> > > > > > 2.28.0
> > > > > >
> > > > Best Regards,
> > > >
> > > > Fabrice
Best Regards,

Fabrice

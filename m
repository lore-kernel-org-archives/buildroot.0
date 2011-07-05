From: Matias Garcia <mgarcia@rossvideo.com>
Date: Tue, 05 Jul 2011 10:39:42 -0400
Subject: [Buildroot] [PATCH 1/2] hostapd: fix build
In-Reply-To: <20110705140841.GE16796@sapphire.tkos.co.il>
References: <52492b5cb97af2b80f86cf2dee27c8a931d14856.1309759154.git.baruch@tkos.co.il>
 <20110704085628.29549092@skate> <1309788859.1984.8.camel@matias-lnx-host>
 <20110705140841.GE16796@sapphire.tkos.co.il>
Message-ID: <1309876782.1984.18.camel@matias-lnx-host>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2011-07-05 at 17:08 +0300, Baruch Siach wrote:

> Hi Matias,
> 
> On Mon, Jul 04, 2011 at 10:14:19AM -0400, Matias Garcia wrote:
> > On Mon, 2011-07-04 at 08:56 +0200, Thomas Petazzoni wrote:
> > > Hello,
> > > 
> > > Le Mon,  4 Jul 2011 09:00:29 +0300,
> > > Baruch Siach <baruch@tkos.co.il> a ?crit :
> > > 
> > > > The --sysroot option is required in CFLAGS and LDFLAGS to avoid
> > > > compile time and link time failures.
> > > 
> > > This should no longer be needed, as Buildroot 2011.05 has added a
> > > wrapper for external toolchains which avoids the need to pass an
> > > explicit --sysroot option.
> > > 
> > > Can you point to a specific Buildroot configuration that exhibits the
> > > problem ?
> > 
> > The CodeSourcery PowerPC toolchains require a special flag which selects
> > the sysroot. in our case, the flag is "-e500v2" which takes the place of
> > "-mcpu=8540 -mspe -mabi=spe -mhard-float -mfloat-gprs=double" in a
> > regular BR toolchain. In either case, if these optimizations are not
> > passed to the compiler(s) AND the linker, the code generated can be
> > wrong because (as far as I understand it) the e500 has no generic float
> > instruction support and breaks the generic PowerPC ABI spec.
> 
> I've noticed that the pre-processor also needs this flag, which is "-te500v2", 
> by the way.


That's interesting. When I use the wrapper, I don't need to supply the
flag to anything else, as the wrapper adds it when
powerpc-linux-gnu-[cpp|...] is called. Thanks for pointing out my typo.



> > There is currently no way to pass this to the wrapper at compile time. I
> > submitted a couple of patches to allow this, though I'm not sure I did
> > it properly as I simply submitted my diffs.
> 
> For reference, here is the ugly hack that I'm currently using. I'll try to 
> make a proper patch that allows the user to add an arbitrary option to all of 
> CFLAGS/LDFLAGS/CPPFLAGS.


My patch v1 added a new option to supply a sysroot argument to the
wrapper, and v2 simply passed BR2_TARGET_OPTIMIZATIONS instead.

You are not actually passing TOOLCHAIN_EXTERNAL_CFLAGS to the wrapper
which is why you need to add -te500v2 to your flags.
TOOLCHAIN_EXTERNAL_CFLAGS helps buildroot determine which sysroot to use
(i.e. which directory to specify in --sysroot), but it doesn't actually
pass the flag to the wrapper. If the flag is not found in this array in
ext-toolchain-wrapper.c, it is not getting compiled in:

static char *predef_args[] = {
	path,
	"--sysroot", BR_SYSROOT,
#ifdef BR_ARCH
	"-march=" BR_ARCH,
#endif /* BR_ARCH */
#ifdef BR_TUNE
	"-mtune=" BR_TUNE,
#endif /* BR_TUNE */
#ifdef BR_ABI
	"-mabi=" BR_ABI,
#endif
#ifdef BR_SOFTFLOAT
	"-msoft-float",
#endif /* BR_SOFTFLOAT */
#ifdef BR_VFPFLOAT
	"-mfpu=vfp",
#endif /* BR_VFPFLOAT */
};

Add the following code after "--sysroot",... and it will work without
adding -te500v2 to CFLAGS/CPPFLAGS/LDFLAGS:

	"-te500v2",

Matias


> baruch
> 
> commit cbf2807a52408903033e960cd76d9644154980de
> Author: Baruch Siach <baruch@tkos.co.il>
> Date:   Tue Jul 5 12:06:22 2011 +0300
> 
>     Crude patch for fixing CodeSourcery e500v2 builds
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 31a9639..45c3fce 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -76,6 +76,7 @@ ifeq ($(BR2_LARGEFILE),y)
>  TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
>  endif
>  
> +TARGET_LDFLAGS+=-te500v2
>  TARGET_CXXFLAGS=$(TARGET_CFLAGS)
>  
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
> @@ -173,6 +174,7 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
>  		DEFAULT_ASSEMBLER="$(TARGET_AS)" \
>  		DEFAULT_LINKER="$(TARGET_LD)" \
>  		CFLAGS="$(TARGET_CFLAGS)" \
> +		CPPFLAGS="-te500v2" \
>  		CXXFLAGS="$(TARGET_CXXFLAGS)" \
>  		LDFLAGS="$(TARGET_LDFLAGS)" \
>  		FCFLAGS="$(TARGET_FCFLAGS)" \
> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> index 9171e85..ffb8e22 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -151,6 +151,8 @@ TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
>  TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
>  endif
>  
> +TOOLCHAIN_EXTERNAL_CFLAGS += -te500v2
> +
>  ifeq ($(BR2_VFP_FLOAT),y)
>  TOOLCHAIN_EXTERNAL_CFLAGS += -mfpu=vfp
>  TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_VFPFLOAT=1
> 
> baruch
> 


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110705/4a629cfc/attachment-0001.html>

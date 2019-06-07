From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 7 Jun 2019 08:40:27 +0200
Subject: [Buildroot] [git commit] package/brotli: work around gcc bug
 68485
In-Reply-To: <87y32ehh34.fsf@dell.be.48ers.dk>
References: <20190527220327.636798E6D4@busybox.osuosl.org>
 <87y32ehh34.fsf@dell.be.48ers.dk>
Message-ID: <b01b61c5-4105-efb8-37db-bb5f0479b568@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Il 06/06/2019 17:24, Peter Korsgaard ha scritto:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> 
>   > commit: https://git.buildroot.net/buildroot/commit/?id=39dde1ffb6a7111c2fa2b340c940e4d3e685aa29
>   > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
>   > With Microblaze Gcc version <= 9.x the build fails due to gcc bug 68485:
>   > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
>   > building brotli with optimization but not when building with -O0. To
>   > work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using
>   > -O0.
> 
>   > Fixes:
> 
>   >   http://autobuild.buildroot.net/results/d86/d86251974a0a348a64d9a1d1fd7d02dd4aff0792/
> 
>   > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>   > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>   > ---
>   >  package/brotli/brotli.mk | 4 ++++
>   >  1 file changed, 4 insertions(+)
> 
>   > diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
>   > index 2c1ad48753..248bfb9daf 100644
>   > --- a/package/brotli/brotli.mk
>   > +++ b/package/brotli/brotli.mk
>   > @@ -14,4 +14,8 @@ BROTLI_CONF_OPTS = \
>   >  	-DBROTLI_DISABLE_TESTS=ON \
>   >  	-DBROTLI_BUNDLED_MODE=OFF
>   
>   > +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
>   > +BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="-O0"
> 
> Hmm, why is this not "$(TARGET_C_FLAGS) -O0" like for the other
> packages?

Because CFLAGS were needed only once in that package.
Anyway, if you say, I can modify it and use a BROTLI_CFLAGS intermediate 
variable.

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

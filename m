From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 1 Mar 2016 10:36:08 +0000
Subject: [Buildroot] [PATCH] sox: disable SSP when using MIPS Codescape
	toolchains
In-Reply-To: <87bn6ymqsv.fsf@dell.be.48ers.dk>
References: <1456763982-36511-1-git-send-email-Vincent.Riera@imgtec.com>
 <87bn6ymqsv.fsf@dell.be.48ers.dk>
Message-ID: <56D57098.3020307@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 01/03/16 10:32, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
>  > MIPS Codescape toolchains don't support stack-smashing protection
>  > despite of using glibc, therefore we see failures like this one:
> 
>  > mips-img-linux-gnu/bin/ld: cannot find -lssp
> 
>  > Fixes:
>  >   http://autobuild.buildroot.net/results/957/95721f7b88c46a20202fb02e408817097df965c3/
> 
>  > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>  > ---
>  >  package/sox/sox.mk | 6 ++++++
>  >  1 file changed, 6 insertions(+)
> 
>  > diff --git a/package/sox/sox.mk b/package/sox/sox.mk
>  > index f4d1608..61f5220 100644
>  > --- a/package/sox/sox.mk
>  > +++ b/package/sox/sox.mk
>  > @@ -13,6 +13,12 @@ SOX_CONF_OPTS = --with-distro="Buildroot" --without-ffmpeg --disable-gomp \
>  >  SOX_LICENSE = GPLv2+ (sox binary), LGPLv2.1+ (libraries)
>  >  SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
>  
>  > +# MIPS Codescape toolchains don't support stack-smashing protection
>  > +# despite of using glibc.
>  > +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS)$(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
>  > +SOX_CONF_OPTS += --disable-stack-protector
>  > +endif
> 
> Committed, thanks (for 2016.02). Please consider generalizing it like
> Thomas suggested for the 2016.05 cycle.
> 

Sure, I will do it.

Thanks,

Vincent.

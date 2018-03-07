From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Mar 2018 13:58:53 +0100
Subject: [Buildroot] toolchain-external: ld.so* vs ld.so.*
In-Reply-To: <20180307122647.GI8100@australia>
References: <20180307122647.GI8100@australia>
Message-ID: <20180307135853.37ad2cf2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 7 Mar 2018 13:26:47 +0100, Thomas De Schampheleire wrote:

> I have a question on following commit:

You like the difficult questions, pointing out a tiny detail (just a
dot!) in an old patch :-)

> The question is: did you intentionally remove the . before the final asterisk?
> I.e. why is it not:
> 
> TOOLCHAIN_EXTERNAL_LIBS += ld*.so.*
> 
> as was the case before, even for the glibc+eabihf case?
> I could not find a reference to why that specific change was made.
> 
> Background is that I now notice (after upgrading to 2018.02 coming from
> 2017.02.x) that an extra file is copied on my target system: the system used to
> have just '/lib/ld.so.1' which is also what is encoded in the ELF files as
> dynamic loader, but now there is also '/lib/ld-2.20.so' which is not actually
> used and is non-stripped (due to an exception in target-finalize).
> This adds about 150K on the root filesystem, which is quite a lot for an unused
> file.
> 
> So I wonder what would be wrong with following patch:
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -108,7 +108,7 @@ endif
>  # Definitions of the list of libraries that should be copied to the target.
>  #
>  
> -TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.* libatomic.so.*
> +TOOLCHAIN_EXTERNAL_LIBS += ld*.so.* libgcc_s.so.* libatomic.so.*
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
>  TOOLCHAIN_EXTERNAL_LIBS += libc.so.* libcrypt.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*

I looked at the commit and its commit message, and I can't remember why
ld*.so.* was changed to ld*.so*, so I'd say that your patch is probably
correct.

Is there a way to improve our runtime tests to catch problems like
this ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Apr 2017 14:30:20 +0200
Subject: [Buildroot] [PATCH v4 1/2] arch: add BR2_READELF_ARCH_NAME
 hidden config option
In-Reply-To: <0u07rdxu5j.ln2@ID-313208.user.individual.net>
References: <1489928872-3965-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170320222656.38163a70@free-electrons.com>
 <0u07rdxu5j.ln2@ID-313208.user.individual.net>
Message-ID: <20170402143020.06ef773c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 02 Apr 2017 12:38:24 +0200, Bernd Kuhls wrote:

> http://autobuild.buildroot.net/results/de7/
> de7079b89fda1dd47e52619a644f23c4f4986b2c//
> 
> ERROR: architecture for "/usr/lib/libmpeg2convert.so.0.0.0" is "Sparc v8
> +", should be "Sparc"
> ERROR: architecture for "/usr/lib/libmpeg2.so.0.1.0" is "Sparc v8+", 
> should be "Sparc"
> 
> http://autobuild.buildroot.net/results/f96/
> f96c30c5c398db1ba561740ae64e922cd4f8a524//
> 
> ERROR: architecture for "/usr/lib/libopenblas_sparcp-r0.2.19.dev.so" is 
> "Sparc v8+", should be "Sparc"
> 
> Patching arch/Config.in.sparc like this
> 
> @@ -30,5 +30,6 @@ config BR2_GCC_TARGET_CPU
>         default "ultrasparc"    if BR2_sparc_v9
>  
>  config BR2_READELF_ARCH_NAME
> +       default "Sparc v8+"     if BR2_sparc_v8
>         default "Sparc"         if BR2_sparc
>         default "Sparc v9"      if BR2_sparc64

No, that's not the proper fix.

I had a look at the libmpeg2 problem yesterday. The issue is that the
configure.ac script forces -mcpu=ultrasparc -mvis, which generates
Sparcv8+ code. However, simply removing those flags doesn't work, as it
then tries to build some code that really needs the Sparc VIS
instructions.

Apparently, the libmpeg2 code is smart enough to decide at runtime if
the VIS instructions are supported or not, so even though the code is
for Sparc v8+, it's safe to run it on older Sparc machines. That's
clearly a case where the check we make on the file architecture is a
bit annoying.

I don't yet have a good solution for this case. Suggestions welcome.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

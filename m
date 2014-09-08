From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Sep 2014 21:40:16 +0200
Subject: [Buildroot] Question about openssh.mk
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C68C8AD7B2@ex-mb3.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C68C8AD7B2@ex-mb3.corp.adtran.com>
Message-ID: <20140908214016.51926cb9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 8 Sep 2014 18:49:09 +0000, ANDY KENNEDY wrote:

> We already pass the LD variable to openssl in order to use gcc as the
> driver for the link process, instead of directly using the ld
> linker. However, we were not passing LDFLAGS so that the compiler
> flags are passed, which means that with multilib toolchains, the
> incorrect library variant could be used at link time, leading to
> invalid binaries (partly ARMv4, partly ARMv5) or broken compilation
> (when the build took place in soft-float, but the link stage takes
> place against hard-float libraries).
> 
> This fixes a problem reported on IRC by amo-ej1 when compiling ssh on
> PowerPC e500v2 with a CodeSourcery toolchain ("crtbegin.o uses hard
> float, sshd uses soft float").
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk> 
> 
> The code in question:
> 
> OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
> 
> Taken from package/openssh/openssh.mk
> 
> Here we are setting LDFLAGS to TARGET_CFLAGS.  Is that really what
> you meant to do?  I mean, it "works", but not in every case.

Yes, that's what we want to do: openssh uses $(LD) and
$(TARGET_LDFLAGS) as if they were the compiler. In which case have you
identified this to not work?

> Also, this appears to be overriding the TARGET_CONFIGURE_OPTS in
> Makefile.in.  Is this legacy crap left over from the centralization
> project years ago?

No, it's not "legacy crap". TARGET_CONFIGURE_OPTS does LD=$(TARGET_LD)
and LDFLAGS=$(TARGET_LDFLAGS), assuming that the packages are really
using $(LD) as the linker and $(LDFLAGS) as the flags for the linker.
This is not what OpenSSH is doing, which is the reason why we override
those variables specifically for OpenSSH.

> Still working on it, may have an update to this later on today.

It would be easier if you let us know about the real problem :-)

Thanks for your report!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

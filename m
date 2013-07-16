From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jul 2013 14:12:31 +0200
Subject: [Buildroot] [PATCHv3 02/14] arch: Refactor BR2_SOFT_FLOAT into
 per-architecture options
In-Reply-To: <874nbu3elx.fsf@dell.be.48ers.dk>
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <874nbu3elx.fsf@dell.be.48ers.dk>
Message-ID: <20130716141231.57cada44@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 16 Jul 2013 13:53:46 +0200, Peter Korsgaard wrote:

>  Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Thomas> ---
>  Thomas>  arch/Config.in                |  3 +++
>  Thomas>  arch/Config.in.arm            | 10 ++++++++++
>  Thomas>  arch/Config.in.mips           | 10 ++++++++++
>  Thomas>  arch/Config.in.powerpc        |  9 +++++++++
> 
> What about arc/avr32/bfin/microblaze/sh/sparc/xtensa? Some of them
> apparently were broken in this regard already, and some of them are not
> supported by the internal toolchain, but with this change atleast
> Buildroot will always think they use hardfloat.

avr32 already selects BR2_SOFT_FLOAT in the current git master.

config BR2_avr32
        bool "AVR32"
        select BR2_SOFT_FLOAT

On the other platforms you mentioned, BR2_SOFT_FLOAT was always false:

config BR2_SOFT_FLOAT
        bool "Use software floating point by default"
        depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel || BR2_powerpc

which explains why I didn't take care of any of them. I honestly have
no idea for those platforms which ones do soft-float, which ones do
hard-float. It already took me a while to get a minimal understanding
of how things work in the ARM world in terms of floating point
support :)

From the perspective of those architectures, the BR2_SOFT_FLOAT value
was always false, and continues to be false after my patches. If this
is not correct, it should certainly be fixed, but I don't think this is
something that gets broken by my patches: it would have already been
wrong, and the Buildroot code already believes those architectures are
all hard float.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

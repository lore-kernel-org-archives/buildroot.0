From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Nov 2013 18:39:47 +0100
Subject: [Buildroot] [PATCH v2 1/1] openpgm: disable on AVR32
In-Reply-To: <CAAHaz6HvxQR0g9CpfvRTJN2FAoGmgR_z6uWVar93AXjENH-vbQ@mail.gmail.com>
References: <1383329548-8528-1-git-send-email-alexander.lukichev@gmail.com>
 <20131101192027.1ea4c1bc@skate>
 <CAAHaz6GXiQAMuoK2eo0=EjmE509P98zuuAuN7f_T5TYeK6W1QA@mail.gmail.com>
 <CAHt8ZCO2OEtWe8NrDYSTkmu7uqQGpQbWjAEJg+jHVGzsWsF9Mg@mail.gmail.com>
 <20131102122618.18eb2f00@skate>
 <CAHt8ZCOVSKMynxFe9WQuei-FKuB8BAJE2+dtEQreqwZokkTWdw@mail.gmail.com>
 <CAAHaz6HvxQR0g9CpfvRTJN2FAoGmgR_z6uWVar93AXjENH-vbQ@mail.gmail.com>
Message-ID: <20131106183947.0b078df7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, Simon,

On Wed, 6 Nov 2013 19:27:46 +0200, Alexander Lukichev wrote:
> Hi Simon, Thomas,

> In addition, the document http://www.atmel.com/Images/doc32074.pdf on page 8
> indeed claims to support 4-byte (int) versions of those functions, saying
> nothing
> about other data types.
> 
> I apologize both for the delay and for making other people wasting time on
> this.

Well, I believe your original patch remains almost good then: openpgm
cannot be built on avr32 because the AVR32 compiler doesn't provide the
required compiler intrinsics.

I think I would just turn the dependency from a !BR2_avr32 into
a !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5, with a comment that explains that
it lacks some required intrinsics.

However, as Simon said, maybe it would anyway be useful to pass
-march=ap when building things, since that's the only AVR32 processor
variant that ever had Linux support. So something like the following
change would maybe be good to have. Simon, if you're interested in
picking this up, giving it a test and submitting it, it would be great!

diff --git a/arch/Config.in.avr32 b/arch/Config.in.avr32
index 199c150..8429589 100644
--- a/arch/Config.in.avr32
+++ b/arch/Config.in.avr32
@@ -3,3 +3,6 @@ config BR2_ARCH
 
 config BR2_ENDIAN
        default "BIG"
+
+config BR2_GCC_TARGET_ARCH
+       default "ap"


Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Mar 2018 10:53:51 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain-external-custom: allow
 specifying relative path to binaries
In-Reply-To: <CAN4QVaCcFDorhAYPRQbfgVOeqzChtdSfxLfv=099hgQZO1PqKw@mail.gmail.com>
References: <20180323214030.8003-1-ccrisan@gmail.com>
 <20180325083535.GG2620@scaer>
 <CAN4QVaCcFDorhAYPRQbfgVOeqzChtdSfxLfv=099hgQZO1PqKw@mail.gmail.com>
Message-ID: <20180325085351.GI2620@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Calin, All,

On 2018-03-25 08:46 +0000, Calin Crisan spake thusly:
> Yann, I have posted a v2 that fixes this and another issue with supported external toolchains. Please let me know if there's
> anything else that needs to be addressed.

Ah, I had missed your v2. Sorry. Lemme review that now, then.

Regards,
Yann E. MORIN.

> Thanks,
> Calin.
> On Sun, Mar 25, 2018, 11:35 Yann E. MORIN < [1]yann.morin.1998@free.fr> wrote:
> 
>   Calin, All,
> 
>   On 2018-03-23 23:40 +0200, Calin Crisan spake thusly:
>   > There are cases where a downloaded toolchain doesn't have its binaries
>   > placed directly in a "bin" subfolder (where BuildRoot currently looks
>   > for them).
>   >
>   > A common example is the official Raspberry Pi Toolchain
>   > ( [2]https://github.com/raspberrypi/tools), which has its binaries in
>   > "arm-bcm2708/arm-linux-gnueabihf/bin".
>   >
>   > This commit introduces BR2_TOOLCHAIN_EXTERNAL_BIN_PATH that defaults
>   > to "bin" and can be changed as needed.
>   >
>   > Signed-off-by: Calin Crisan < [3]ccrisan@gmail.com>
>   > ---
>   >? toolchain/toolchain-external/ [4]pkg-toolchain-external.mk? ? ? ? ? ? | 2 +-
>   >? .../toolchain-external-custom/Config.in.options? ? ? ? ? ? ? ? ? ?| 8
>   ++++++++
>   >? 2 files changed, 9 insertions(+), 1 deletion(-)
>   >
>   > diff --git a/toolchain/toolchain-external/ [5]pkg-toolchain-external.mk b/toolchain/toolchain-external/
>   [6]pkg-toolchain-external.mk
>   > index 3bf9fac412..4dfe3815ae 100644
>   > --- a/toolchain/toolchain-external/ [7]pkg-toolchain-external.mk
>   > +++ b/toolchain/toolchain-external/ [8]pkg-toolchain-external.mk
>   > @@ -77,7 +77,7 @@ ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
>   >? TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
>   >? endif
>   >? else
>   > -TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
>   > +TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_BIN_PATH))
>   >? endif
>   >
>   >? # If this is a buildroot toolchain, it already has a wrapper which we want to
>   > diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
>   b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
>   > index 70c7d8e3c3..bb199aab85 100644
>   > --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
>   > +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
>   > @@ -12,6 +12,14 @@ config BR2_TOOLCHAIN_EXTERNAL_URL
>   >? ? ? ?help
>   >? ? ? ? ?URL of the custom toolchain tarball to download and install.
>   >
>   > +config BR2_TOOLCHAIN_EXTERNAL_BIN_PATH
>   > +? ? string "Toolchain bin path"
>   > +? ? default "bin"
>   > +? ? depends on BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
>   > +? ? help
>   > +? ? ? Path to where the binaries (e.g. the compiler) can be found,
>   > +? ? ? relative to the downloaded toolchain root directory.
> 
>   Indentation is incorrect: it should be a leading TAB for option, and a
>   leading TAB and two spaces for the help text.
> 
>   See:
>   ? ? [9]https://buildroot.org/downloads/manual/manual.html#writing-rules-config-in
> 
>   Otherwise, looks sensible to me...
> 
>   Regards,
>   Yann E. MORIN.
> 
>   >? config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
>   >? ? ? ?string "Toolchain prefix"
>   >? ? ? ?default "$(ARCH)-linux"
>   > --
>   > 2.16.2
>   >
>   > _______________________________________________
>   > buildroot mailing list
>   > [10]buildroot at busybox.net
>   > [11]http://lists.busybox.net/mailman/listinfo/buildroot
> 
>   --
>   .-----------------.--------------------.------------------.--------------------.
>   |? Yann E. MORIN? | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>   | +33 662 376 056 | Software? Designer | \ / CAMPAIGN? ? ?|? ___? ? ? ? ? ?
>   ? ?|
>   | +33 223 225 172 `------------.-------:? X? AGAINST? ? ? |? \e/? There is no? |
>   | [12]http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL? ? |? ?v? ?conspiracy.? |
>   '------------------------------^-------^------------------^--------------------'
> 
> Links:
> 1. mailto:yann.morin.1998 at free.fr
> 2. https://github.com/raspberrypi/tools
> 3. mailto:ccrisan at gmail.com
> 4. http://pkg-toolchain-external.mk
> 5. http://pkg-toolchain-external.mk
> 6. http://pkg-toolchain-external.mk
> 7. http://pkg-toolchain-external.mk
> 8. http://pkg-toolchain-external.mk
> 9. https://buildroot.org/downloads/manual/manual.html#writing-rules-config-in
> 10. mailto:buildroot at busybox.net
> 11. http://lists.busybox.net/mailman/listinfo/buildroot
> 12. http://ymorin.is-a-geek.org/

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Steve Kenton <skenton@ou.edu>
Date: Wed, 18 Feb 2015 12:15:04 -0600
Subject: [Buildroot] Fwd: Re:  Grub2 and Splash
In-Reply-To: <54E4CF63.20504@ou.edu>
References: <54E4CF63.20504@ou.edu>
Message-ID: <54E4D6A8.7020200@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forgot to copy the list


-------- Forwarded Message --------
Subject: Re: [Buildroot] Grub2 and Splash
Date: Wed, 18 Feb 2015 11:44:03 -0600
From: Steve Kenton <skenton@ou.edu>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

On 02/18/2015 10:38 AM, Thomas Petazzoni wrote:
> Dear Steve Kenton,
> 
> On Wed, 18 Feb 2015 10:30:10 -0600, Steve Kenton wrote:
> 
>> Looking into adding a splash screen to my grub2 menu.
>> Cobbled together the one below using font from my build host and it works.
>> Trying to build unicode.pf2 with buildroot immediately ran into snag with freetype.
> 
> Could you please be more specific than "ran into snag" ? Which error
> messages and issues, when trying what exactly ?
Changed ~/buildroot-2015.02-rc2/boot/grub2/grub2.mk to enable grub-mkfont and added dependency
on freetype after first failure for missing freetype include

GRUB2_CONF_OPTS = \
	--target=$(GRUB2_TARGET) \
	--with-platform=$(GRUB2_PLATFORM) \
	--enable-grub-mkfont \
	--enable-efiemu=no \
	--enable-liblzma=no \
	--enable-device-mapper=no \
	--enable-libzfs=no \
	--disable-werror

GRUB2_DEPENDENCIES += freetype

Re-ran make grub2-reconfigure
...
./config.status --file=00_header:util/grub.d/00_header.in
util/grub-mkfont.c:42:30: fatal error: freetype/ftsynth.h: No such file or directory
 #include <freetype/ftsynth.h>
                              ^
compilation terminated.

> 
>>
>> Finally RTFM and realized how special the grub2 build is.
>> Is there a reason that grub2 is not just built as a regular host package?
> 
> Because grub2 is kind of special: it needs to build both some things
> for the target, and some things for the host. And there are some
> explanations about it in grub2.mk:
Yes, looked at that and ./configure --help for grub2, saw that it clearly defined
System types:
  --build=BUILD     configure for building on BUILD [guessed]
  --host=HOST       cross-compile to build programs to run on HOST [BUILD]
  --target=TARGET   configure for building compilers for TARGET [HOST]

> 
> ===
> 
> # Grub2 is kind of special: it considers CC, LD and so on to be the
> # tools to build the native tools (i.e to be executed on the build
> # machine), and uses TARGET_CC, TARGET_CFLAGS, TARGET_CPPFLAGS to
> # build the bootloader itself.
Understand, two tool chains required. Still trying to understand  their use in buildroot scripts
> 
> GRUB2_CONF_ENV = \
>         $(HOST_CONFIGURE_OPTS) \
>         CPP="$(HOSTCC) -E" \
>         TARGET_CC="$(TARGET_CC)" \
>         TARGET_CFLAGS="$(TARGET_CFLAGS)" \
>         TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)"
> 
> ===
> 
> And it is actually more logical for grub2 to be a target package: the
> main purpose of grub2 is to have a bootloader on the target, much like
> U-Boot or Barebox. The fact that in addition Grub2 provides a bunch of
> host utilities is kind of a "detail".
Hmm, not sure I agree about the "detail". As currently built some of the grub scripts
such as grub-mkconfig would try to run other scripts residing in the
build hosts /usr directory not the version in buildroot $HOST_DIR or $TARGET_DIR
I am of the opinion that if we build it it should work :-) Currently the instructions
to install grub2 are more complicated then "install-grub ..."

Steve

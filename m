From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Feb 2015 17:38:57 +0100
Subject: [Buildroot] Grub2 and Splash
In-Reply-To: <54E4BE12.1090608@ou.edu>
References: <54E4BE12.1090608@ou.edu>
Message-ID: <20150218173857.786789d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Wed, 18 Feb 2015 10:30:10 -0600, Steve Kenton wrote:

> Looking into adding a splash screen to my grub2 menu.
> Cobbled together the one below using font from my build host and it works.
> Trying to build unicode.pf2 with buildroot immediately ran into snag with freetype.

Could you please be more specific than "ran into snag" ? Which error
messages and issues, when trying what exactly ?

> 
> Finally RTFM and realized how special the grub2 build is.
> Is there a reason that grub2 is not just built as a regular host package?

Because grub2 is kind of special: it needs to build both some things
for the target, and some things for the host. And there are some
explanations about it in grub2.mk:

===

# Grub2 is kind of special: it considers CC, LD and so on to be the
# tools to build the native tools (i.e to be executed on the build
# machine), and uses TARGET_CC, TARGET_CFLAGS, TARGET_CPPFLAGS to
# build the bootloader itself.

GRUB2_CONF_ENV = \
        $(HOST_CONFIGURE_OPTS) \
        CPP="$(HOSTCC) -E" \
        TARGET_CC="$(TARGET_CC)" \
        TARGET_CFLAGS="$(TARGET_CFLAGS)" \
        TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)"

===

And it is actually more logical for grub2 to be a target package: the
main purpose of grub2 is to have a bootloader on the target, much like
U-Boot or Barebox. The fact that in addition Grub2 provides a bunch of
host utilities is kind of a "detail".

Again, please be more specific about the issues you encounter. At least
please give the detailed steps to reproduce them.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

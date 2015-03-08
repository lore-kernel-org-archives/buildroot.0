From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 8 Mar 2015 10:13:02 +0100
Subject: [Buildroot] [PATCH 1/3] uclibc: adapt thread implementation
 selection to uClibc-ng
In-Reply-To: <20150308084516.GA4184@free.fr>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150307173928.GH4186@free.fr>
 <20150308084044.4a135752@free-electrons.com>
 <20150308084516.GA4184@free.fr>
Message-ID: <20150308091302.GL3937@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Yann E. MORIN wrote,
> 
> OK. One more thing: since uClibc-ng supports microblaze and nios2, we
> could enable uClibc (as in "uClibc in Buildroot") to build Buildroot
> toolchains for those two archs, no?

No.

Unfortunately this is another can of worms in the uClibc world :(

Microblaze GNU libc and musl support is fine. uClibc does not
support NPTL/TLS for this architecture. As one of the Microblaze 
maintainers told me, the no-MMU microblaze stuff is seldom used
nowadays. Gcc needs patching to find shared library loader with
uClibc. So there is a lot of stuff todo, before Microblaze and
uClibc can be used. At least there is good support for Qemu, so
you can directly start to hack without buying expensive FPGA
hardware :)

NIOS2 GNU libc support was added recently and you can compile a
toolchain with upstream gcc and binutils.
NIOS2 in uClibc is really bad maintained. There is no TLS/NPTL
support and you are getting some compile errors when trying to
build with LT.old or no threads. I haven't found any usable external
GIT repository with newer support. So if anyone know a working 
version of uClibc/uClinux for NIOS2 I am happy to merge the needed
changes. There is a patch set for Qemu here:
https://lists.gnu.org/archive/html/qemu-devel/2012-09/msg01229.html
But it is not in latest Qemu-Git.

I did not removed both architectures as I am planning to get them in
a better shape.

best regards
 Waldemar

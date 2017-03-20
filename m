From: =?UTF-8?Q?Pawe=C5=82_Sikora?= <sikor6@gmail.com>
Date: Tue, 21 Mar 2017 00:17:50 +0100
Subject: [Buildroot] [PATCH 1/3] xenomai: bump version to 3.0.3
In-Reply-To: <20170320234014.6ad3182f@free-electrons.com>
References: <20170320233349.14057-1-sikor6@gmail.com>
 <20170320234014.6ad3182f@free-electrons.com>
Message-ID: <CAKfV1CZg=EyE+-HNZD_1sj0L8MtDW8+_5fRo_QvA_Gz_Yz3=BA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas!

Thanks for prompt response ;-)

I was testing building Xenomai against kernel 4.4.43 (for latest I-Pipe
patch) for Armv7

Btw. Regarding your concerns I think it would be ok to support both
versions, as
version 2.6.x supports only kernels 2.4, 2.6.x and 3.x as it can be found
in script for
preparing the kernel in Xenomai (2.6.4) package:

*~/P/s/z/g/buildroot ??? cat
output/build/xenomai-2.6.4/scripts/prepare-kernel.sh | grep -A 8 "Linux
v2.6"*
    #  Linux v2.6 and 3.x section
    #
    2.6|3.*)
    config_file=Kconfig
    patch_architecture_specific="y"

(Please correct me if I am wrong or if I missed something)

So when building a Xenomai 2.6.4 and preparing Linux for 4.4.43 I've got an
error
saying that it's unsupported kernel. That's why I decided to bump version
package
for me, and I thought that it is a good idea for all either. But know I
think it would
be good to support both versions to not leave users with 2.6 and 3.x...

Btw. JFYI I tested it in runtime on Zybo Zynq-7000. Logs:

# uname -a
Linux buildroot 4.4.43-ipipe #1 SMP Sun Mar 19 12:47:52 CET 2017 armv7l
GNU/Linux
# xeno-test
Started child 96: /bin/sh /usr/bin/xeno-test-run-wrapper /usr/bin/xeno-test
+ echo 0
+ testdir=/usr/bin
+ /usr/bin/smokey --run
arith OK
bufp skipped (no kernel support)
cpu_affinity skipped (no kernel support)
iddp skipped (no kernel support)
leaks OK
net_packet_dgram skipped (no kernel support)
net_packet_raw skipped (no kernel support)
net_udp skipped (no kernel support)
...
# dmesg | grep Xenomai
[    0.226384] [Xenomai] scheduling class idle registered.
[    0.226415] [Xenomai] scheduling class rt registered.
[    0.226542] I-pipe: head domain Xenomai registered.
[    0.228182] [Xenomai] Cobalt v3.0.3 (Groovy Cosmic Halo)


Toolchain used in Buildroot configurations:
glibc 2.24
gcc 5.x

I-Pipe patch:
ipipe-core-4.4.43-arm-7.patch

Linux:
4.4.43

Tested in runtime on HW Platform:
Xilinx Zybo Zynq-7000

I thought it would be nice to add it.

So... what do you propose now? I am quiet new in case of introducing
my changes to buildroot code and I think I would need a little of guidance
here
if we want to do a support for both versions.

Kind Regards,
Pawel

---


*Pozdrawiam,*
*Pawe? Sikora*



*Pozdrawiam,*
*Pawe? Sikora*

2017-03-20 23:40 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Tue, 21 Mar 2017 00:33:47 +0100, sikor6 at gmail.com wrote:
> > From: Pawel Sikora <sikor6@gmail.com>
> >
> > Signed-off-by: Pawel Sikora <sikor6@gmail.com>
>
> Thanks a lot for looking at the Xenomai package. It hasn't been updated
> in a while.
>
> > ---
> >  package/xenomai/xenomai.hash | 2 +-
> >  package/xenomai/xenomai.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
> > index 4d74472ee..e41859343 100644
> > --- a/package/xenomai/xenomai.hash
> > +++ b/package/xenomai/xenomai.hash
> > @@ -1,2 +1,2 @@
> >  # Locally computed;
> > -sha256  b6ff723cb0f3b1c2c4e15bccfd114b248dea1b4164a0ac0e612815379ce7caf8
> xenomai-2.6.4.tar.bz2
> > +sha256  4c396b4d447efd414c4d7c0894f97ef52b4ec45c87f512c14adee981a45f0e3b
> xenomai-3.0.3.tar.bz2
> > diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
> > index 6e0e44163..28875b944 100644
> > --- a/package/xenomai/xenomai.mk
> > +++ b/package/xenomai/xenomai.mk
> > @@ -6,7 +6,7 @@
> >
> >  XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
> >  ifeq ($(XENOMAI_VERSION),)
> > -XENOMAI_VERSION = 2.6.4
> > +XENOMAI_VERSION = 3.0.3
>
> My understanding was that Xenomai 3.x was significantly different from
> Xenomai 2.x. Should we support both versions? Is Xenomai 3.x now old
> enough that Xenomai 2.x is considered legacy? What problems will people
> currently using Xenomai 2.x face if we ask them to move to Xenomai 3.x?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170321/33b205ba/attachment.html>

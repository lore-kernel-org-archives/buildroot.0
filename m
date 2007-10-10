From: Robert P. J. Day <rpjday@mindspring.com>
Date: Wed, 10 Oct 2007 04:14:06 -0400 (EDT)
Subject: [Buildroot] build error for nios2,
 based on kernel headers selection
In-Reply-To: <20071009213425.GV20951@aon.at>
References: <Pine.LNX.4.64.0710091632500.6683@localhost.localdomain>
	<20071009213425.GV20951@aon.at>
Message-ID: <Pine.LNX.4.64.0710100409590.5869@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 9 Oct 2007, Bernhard Fischer wrote:

> On Tue, Oct 09, 2007 at 04:38:53PM -0400, Robert P. J. Day wrote:
> >
> >  first time taking a crack at buildroot, selected "nios2", at which
>
> Select BR2_DEPRECATED.
> nios2 looks like not too well supported in various upstream packages.

i took a closer look at this and this has nothing to do with nios2
support.  recall the snippet i posted from
toolchain/kernel-headers/Config.in:

...
config BR2_DEFAULT_KERNEL_HEADERS
        string
        default "2.4.25"    if BR2_KERNEL_HEADERS_2_4_25
        default "2.4.27"    if BR2_KERNEL_HEADERS_2_4_27
        default "2.4.29"    if BR2_KERNEL_HEADERS_2_4_29
        default "2.4.31"    if BR2_KERNEL_HEADERS_2_4_31
        default "2.6.9"     if BR2_KERNEL_HEADERS_2_6_9
        default "2.6.11"    if BR2_KERNEL_HEADERS_2_6_11
        default "2.6.12"    if BR2_KERNEL_HEADERS_2_6_12
        default "2.6.20.4"  if BR2_KERNEL_HEADERS_2_6_20_4
        default "2.6.20.20" if BR2_KERNEL_HEADERS_2_6_20
        default "2.6.21.5"  if BR2_KERNEL_HEADERS_2_6_21_5
        default "2.6.21.7"  if BR2_KERNEL_HEADERS_2_6_21
        default "2.6.22.1"  if BR2_KERNEL_HEADERS_2_6_22_1
        default "2.6.22.9"  if BR2_KERNEL_HEADERS_2_6_22
        default "2.6"       if BR2_KERNEL_HEADERS_SNAP
...

  note how, if you choose nios2, you're *forced" to take the default
kernel headers version of "2.6", which has no sublevel value.  this
causes immediate problems later on in .../kernel-headers-new.makefile,
here:

...
ifeq ($(LINUX_HEADERS_VERSION),)
# parse linux version string
LNXVER:=$(subst ., , $(strip $(DEFAULT_KERNEL_HEADERS)))
VERSION:=$(word 1, $(LNXVER))
PATCHLEVEL:=$(word 2, $(LNXVER))
SUBLEVEL:=$(word 3, $(LNXVER))        <---- whoops
EXTRAVERSION:=$(word 4, $(LNXVER))
LOCALVERSION:=
...

  that snippet of makefile *clearly* assumes that there is a SUBLEVEL
value, which in this case isn't true.  just as clearly, something has
to be adjusted.  i'm surprised no one has stumbled over this before.

rday
--
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
========================================================================

From: Steve Kenton <skenton@ou.edu>
Date: Mon, 02 Feb 2015 23:11:42 -0600
Subject: [Buildroot] Grub2 and Memtest86+
In-Reply-To: <20150129165054.5b72b7fe@free-electrons.com>
References: <54CA4C59.3010107@ou.edu>
 <20150129165054.5b72b7fe@free-electrons.com>
Message-ID: <54D0588E.2070301@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/29/2015 09:50 AM, Thomas Petazzoni wrote:
> Dear Steve Kenton,
> 
> On Thu, 29 Jan 2015 09:06:01 -0600, Steve Kenton wrote:
>> I've been tinkering with adding memtest86+ V4.20 to the
>> grub2 menu for my x86 target. It's straight forward.
>>
>> The questions, is there interest in this and how to
>> do this only for x86 targets. I've not dug into how
>> the boot loaders are handled, yet, but it's apparently
>> different from regular packages. Is there anyone
>> who keeps track on the grub2 boot loader in buildroot?
> 
> I'm not sure I can say I "keep track of grub2", but I did add the
> package last year.
> 
In my experimenting with grub2 it looks like it is leaking in host information.
Here is a fragment from grub-install which is installed in ~host/usr/sbin.

When it tries to run other scripts like grub-mkimage it looks in /usr
because of the prefix. At least when the host versions were not reachble
I got an error about command not found. Does grub2 need to be configured with
a prefix other than /usr since it's run on the host and not the target?

Steve Kenton


prefix="/usr"
exec_prefix="/usr"
datarootdir="${prefix}/share"
sbindir="${exec_prefix}/sbin"
bindir="${exec_prefix}/bin"
libdir="${exec_prefix}/lib"
sysconfdir="/etc"
PACKAGE_NAME=GRUB
PACKAGE_TARNAME=grub
PACKAGE_VERSION=2.00

export TEXTDOMAIN=grub
export TEXTDOMAINDIR="${datarootdir}/locale"

host_os=linux-gnu
source_dir=
target=
datadir="${datarootdir}"
if [ "x$pkgdatadir" = x ]; then
    pkgdatadir="${datadir}/grub"
fi
localedir="${datarootdir}/locale"

self="`basename $0`"

grub_mkimage="${bindir}/`echo grub-mkimage | sed ${transform}`"
grub_probe="${sbindir}/`echo grub-probe | sed ${transform}`"
grub_editenv="${bindir}/`echo grub-editenv | sed ${transform}`"
grub_mkrelpath="${bindir}/`echo grub-mkrelpath | sed ${transform}`"

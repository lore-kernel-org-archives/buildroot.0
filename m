From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Jun 2020 23:59:41 +0200
Subject: [Buildroot] [PATCH] package/linux-tools: introduce spi linux
 tools
In-Reply-To: <87v9k66dyi.fsf@tarshish>
References: <20200513150324.330435-1-eugen.hristev@microchip.com>
 <87tv0j6etz.fsf@tarshish>
 <c577cbdf-b84a-4af8-8d55-f2759e13c137@microchip.com>
 <87r1vn6840.fsf@tarshish> <20200513195840.GZ12536@scaer>
 <a974d76c-ae7f-e0fc-4946-67dc66531383@microchip.com>
 <87v9k66dyi.fsf@tarshish>
Message-ID: <20200604215941.GL13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eugen, Baruch, All,

On 2020-06-04 18:35 +0300, Baruch Siach spake thusly:
> On Thu, Jun 04 2020, Eugen.Hristev at microchip.com wrote:
[--SNIP--]
> > Coming back to this, I noticed that the spidev_test package in buildroot 
> > is different than the spidev_test from kernel tools.
> The file you link to is a newer version. You can find the version that
> buildroot uses here:
>   https://elixir.bootlin.com/linux/v4.10/source/tools/spi/spidev_test.c
> 
> Note SPIDEV_TEST_VERSION.
> 
> In my opinion, we can update to the latest version like any other
> upstream package.

This is not so clear-cut. As first approximation, I would have agreed.
And that is what I also initially suggested earlied in the thread.

However, that would be a regression to remove spidev_test in favour of
the one in linux-tools.

Indeed, it is today possible to build spidev_test even without building
a kernel. By moving it as a linux-tools, that would no longer be
possible.

And second, depending on the kernel version being used, there could be a
dependency on the jkernel headers version. If kernel >= 3.15,
spidev_tool would require a toolchain with headers >= 3.15 too.

But moving it as a linux-tools also makes it on-par with the other ones,
so this is acceptable too.

So, we have a few options (in my order of preference, but we can discuss
it):

 1. introduce spidev_test as a linux-tools, drop the old one, and handle
    legacy;

 2. introduce spidev_test as a lijnux-tools, keep the old one for when a
    kernel is not being built.

 3. introduce spidev_test as a lijnux-tools, keep the old one for when
    the new linux-tools version is not enabled.

Option (1) makes it totally like any other linux-tools, and I am OK with
the regression of not being able to build it without a kernel. But I
understand that this is a regression.

Option (2) is my close-to-first second prefered option, as it does not
provide a rgression, at the expense of a bit of possible confusion for
users.

Option (3) I do not like much, because it is even more confusing.

In either case, care must be taken to account for the kernel headers
version in the toolchain (which might be a prebuilt one older than the
selected kernel):

  - if the kernel is 3.15 or later, spidev_test requires a toolchain
    with headers at least 3.15

However, we do not have a way to know that situation... So either we
bite the bullet, and consider 3.15 are madnatory for spidev_test in
linux-tools, or we do a test at build time, whether spidev_test uses
SPI_TX_QUAD/SPI_RX_QUAD or not, and bail with an explicit error if thios
is the case and the toolchain uses older kernel headers...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

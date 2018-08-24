From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Aug 2018 09:02:03 +0200
Subject: [Buildroot] Autobnuilders timeouts [was: Re: autobuilder flock
 hangs]
In-Reply-To: <20180816111059.3a7f1b59@windsurf>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
 <1a4b53ec-1ed3-7770-3a65-8d4f4f596918@mentor.com>
 <20180816111059.3a7f1b59@windsurf>
Message-ID: <20180824070203.GK9365@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hollis, Julien, Matthew, Thomas, All,

On 2018-08-16 11:10 +0200, Thomas Petazzoni spake thusly:
> On Mon, 13 Aug 2018 11:18:10 -0700, Hollis Blanchard wrote:
> > flock was hanging. I don't know why; have you experienced anything like 
> > that?
> This happened again:
>   http://autobuild.buildroot.net/results/ddb/ddbc96b24017f2a2b06c6091dea3e19520bf2dd1/

I think we now can see a pattern in those timeouts from Hollis'
autobuilder: they only ever happen on a slect group of 4 packages that
are downloaded with git:
  - linux-firmware      (kernel.org)
  - f2fs-tools          (kernel.org)
  - azure-iot-sdk-c     (github.com)
  - uhttpd              (openwrt.org)

Could you try to download them manually from your autobuilder, and see
if that works or not, please?

Is there something on your network that systematically makes those
packages fail to download? Do you have firewalling restrictions or
extreme traffic shapping?

Note that the size of those packages ranges from ~150KiB for uhttpd,
which is not really big, to 195MiB for linux-firmware, which is rather
large but nothing compared to a kernel tree. So we can probably rule
out the actual size of the package...


Now, I also had a look at all the timeouts, and I also noticed a single
other pattern. Julien's and Matthew's autobuilder would always choke on
host-libsodium, and it happens only on those two autobuilders:

    http://autobuild.buildroot.org/?reason=host-libsodium

All failing at the same point:

    checking whether segmentation violations can be caught when using the C compiler...

Matthew, Julien, could you have a look at what is causing those on your
autobuilders?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

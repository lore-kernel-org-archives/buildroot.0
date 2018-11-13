From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Tue, 13 Nov 2018 18:20:57 +0100
Subject: [Buildroot] [PATCH v2] linux-firmware: bump version to latest
 1baa348
In-Reply-To: <20181109210610.GB2445@scaer>
References: <20181108153322.17362-1-m.niestroj@grinn-global.com>
 <20181109215700.6b8dc6af@windsurf> <20181109210610.GB2445@scaer>
Message-ID: <87bm6svqpy.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi All,

Yann E. MORIN <yann.morin.1998@free.fr> writes:

> Marcin, Thomas, All,
>
> On 2018-11-09 21:57 +0100, Thomas Petazzoni spake thusly:
>> On Thu,  8 Nov 2018 16:33:22 +0100, Marcin Niestroj wrote:
>> 
>> > -sha256 b279ca4d086887c2efab13e28a7ca36e409410d3df38a62d7c7b5799ee3de916 linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a.tar.gz
>> > +sha256 3e4fcbac18990a14d52159fefdc70081a56c5244adba28b14242e159a748e755 linux-firmware-1baa34868b2c0a004dc595b20678145e3fff83e7.tar.gz
>> 
>> I am sorry, but this hash is still not good for me, I get:
>> 
>>   5c636765fd1ac638176893feccfd4a4854f59fc3d01b38f3ccdbb89bd5bb6ef1
>> 
>> I.e:
>> 
>> ERROR: linux-firmware-1baa34868b2c0a004dc595b20678145e3fff83e7.tar.gz has wrong sha256 hash:
>> ERROR: expected: 3e4fcbac18990a14d52159fefdc70081a56c5244adba28b14242e159a748e755
>> ERROR: got     : 5c636765fd1ac638176893feccfd4a4854f59fc3d01b38f3ccdbb89bd5bb6ef1
>> 
>> And this morning, Yann E. Morin reported having the same hash as me:
>> 
>> 08:07 < y_morin> kos_tom: I also have a different hash here.
>> 08:10 < y_morin> kos_tom: FTR, I got: 5c636765fd1ac638176893feccfd4a4854f59fc3d01b38f3ccdbb89bd5bb6ef1
>
> Right.

Thank you both for testing.

>
>> My system tar is 1.29, which is considered as a "good" version by
>> support/dependencies/check-host-tar.sh. I have nonetheless forced
>> building host-tar, and I still get the same hash.
>
> Recently, another user reported hash issues as well, and it turned out
> that they had changed gzip to be really pigz (a parallel gzip). Can you
> check if that is not your case too?

I have investigated the issue on my side. It turns out that gzip is
really the issue here.

I have two PCs with Arch Linux. PC_1 is the one I have prepared
linux-firmware. Here gzip package info on that machine:

  [mniestroj at gm ~]$ LANG=C yaourt -Si gzip
  Repository      : core
  Name            : gzip
  Version         : 1.9-1
  Description     : GNU compression utility
  Architecture    : x86_64
  URL             : https://www.gnu.org/software/gzip/
  Licenses        : GPL3
  Groups          : base  base-devel
  Provides        : None
  Depends On      : glibc  bash  less
  Optional Deps   : None
  Conflicts With  : None
  Replaces        : None
  Download Size   : 77.78 KiB
  Installed Size  : 150.00 KiB
  Packager        : S
  Build Date      : Mon Jan 22 00:52:54 2018
  Validated By    : MD5 Sum  SHA-256 Sum  Signature

PC_2 is also Arch Linux, but with slightly more up-to-date
packages. gzip package info looks like this:

  [macius at zm ~]$ LANG=C yaourt -Si gzip
  Repository      : core
  Name            : gzip
  Version         : 1.9-2
  Description     : GNU compression utility
  Architecture    : x86_64
  URL             : https://www.gnu.org/software/gzip/
  Licenses        : GPL3
  Groups          : base  base-devel
  Provides        : None
  Depends On      : glibc  bash  less
  Optional Deps   : None
  Conflicts With  : None
  Replaces        : None
  Download Size   : 78.14 KiB
  Installed Size  : 185.00 KiB
  Packager        : Allan McRae <allan@archlinux.org>
  Build Date      : Sat Nov 3 23:10:39 2018
  Validated By    : MD5 Sum  SHA-256 Sum  Signature

You can find differences in package here:
https://git.archlinux.org/svntogit/packages.git/log/trunk?h=packages/gzip

I have also checked output of gzip command on another PC with pigz
configured as gzip drop-in replacement. It outputs even different file,
with different sha256 hash.

I think the overall conclusion is that a host-gzip package is needed,
just like host-tar. In the meantime I will send v3 of this patch with
proper hash (the same as you calculated above).

>
> Regards,
> Yann E. MORIN.
>
>> I have uploaded the tarball at
>> https://bootlin.com/~thomas/pub/linux-firmware-1baa34868b2c0a004dc595b20678145e3fff83e7.tar.gz.
>> Could you upload the tarball that was generated on your side so that we
>> can compare them, and see where the problem lies ?

Thank for sharing. After gunzipping your version and mine I ended with
the same *.tar files. So the difference was clearly because of gzip.

Regards,
Marcin

>> 
>> Best regards,
>> 
>> Thomas
>> -- 
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com

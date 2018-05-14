From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 14 May 2018 01:09:04 -0300
Subject: [Buildroot] [PATCH v2 1/2] toolchain/buildroot: Fix symbol for
 uClibc
References: <20180513211943.6a0e19b8@windsurf.home>
Message-ID: <5af90be055a7_3efa3fd79e0baa307529d@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, May 13, 2018 at 04:19 PM, Thomas Petazzoni wrote:

> On Wed,  9 May 2018 18:33:22 +0200, Petr Vorel wrote:
>> -	default BR2_TOOLCHAIN_UCLIBC
>> +	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
> 
> Just like I added a checker in check-package to verify automatically
> the issue raised by PATCH 2/2 of Petr's series [1], I wanted to add a
> checker to detect the problem raised by this patch.
> 
> My idea was to have something that:
> 
>  (1) Collects options defined by "config BR2_<something>"
> 
>  (2) Collects references to option, in "select", "depends on",
>      "default" clauses, etc.
> 
>  (3) Ensures that all references to options have a matching option
>      definition.
> 
> However, this requires a global pass on all Config.in files to do (1)
> and (2) before doing (3), and I'm not sure how this fits in the current
> check-package logic, which seems very per-file oriented.
> 
> What do you think about this ? Should this be done as part of
> check-package, or a separate checker ?

A separate checker seems more suitable in this case.

Since it will find global inconsistencies it creates two large databases to be
compared against each other, so running this when creating or changing any
package may be too much.
But it seems nice to have it as another job on Gitlab to warn us as soon an
inconsistency is detected.
And when people change a package with lots of dependencies it can be run
locally.


Regards,
Ricardo

From: Michael Rommel <rommel@layer-7.net>
Date: Sun, 8 Sep 2013 16:09:47 +0200
Subject: [Buildroot] [PATCH 1/3] knock: new package
In-Reply-To: <E9670545-EE12-445D-A15C-C0C3E4A4116A@layer-7.net>
References: <1378071216-19697-1-git-send-email-rommel@layer-7.net>
 <CAAXf6LXW8GfZzPAHkFjP_coASZ8CPNPNNc6=KjWrek94Ndn_cw@mail.gmail.com>
 <E9670545-EE12-445D-A15C-C0C3E4A4116A@layer-7.net>
Message-ID: <1DD66D3B-6E8F-41C4-859E-A36677BA0A6B@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas,

I got it. I could reproduce the issue with the missing dependency in the .mk file and have set up
a standard tree just for testing the build process. And with the new dependency in the .mk file, 
the build succeeds.

After the test build my tree looks like this:

rommel at pelican:/var/nfs/software/initrds/uclibc/buildroot-patchtest$ ls -la build/
total 108
drwxr-xr-x 24 rommel users  4096 Sep  8 16:04 .
drwxr-xr-x  7 rommel users  4096 Sep  8 16:02 ..
drwxr-xr-x  4 rommel users  4096 Sep  8 15:42 buildroot-config
drwxr-xr-x 34 rommel users  4096 Sep  8 16:00 busybox-1.21.1
drwxr-xr-x  9 rommel users  4096 Sep  8 15:47 host-autoconf-2.69
drwxr-xr-x  7 rommel users  4096 Sep  8 15:47 host-automake-1.11.6
drwxr-xr-x 18 rommel users  4096 Sep  8 15:45 host-binutils-2.21.1
drwxr-xr-x 14 rommel users  4096 Sep  8 16:03 host-bison-2.7.1
drwxr-xr-x  9 rommel users  4096 Sep  8 16:04 host-fakeroot-1.18.2
drwxr-xr-x 10 rommel users  4096 Sep  8 16:03 host-flex-2.5.37
drwxr-xr-x 31 rommel users  4096 Sep  8 16:00 host-gcc-final-4.7.3
drwxr-xr-x 31 rommel users  4096 Sep  8 15:49 host-gcc-initial-4.7.3
drwxr-xr-x 31 rommel users  4096 Sep  8 15:57 host-gcc-intermediate-4.7.3
drwxr-xr-x 16 rommel users  4096 Sep  8 15:46 host-gmp-5.1.2
drwxr-xr-x  5 rommel users  4096 Sep  8 15:47 host-libtool-2.4.2
drwxr-xr-x 10 rommel users  4096 Sep  8 15:46 host-m4-1.4.16
drwxr-xr-x  2 rommel users  4096 Sep  8 16:04 host-makedevs-undefined
drwxr-xr-x  7 rommel users  4096 Sep  8 15:47 host-mpc-1.0.1
drwxr-xr-x  9 rommel users  4096 Sep  8 15:46 host-mpfr-3.1.2
drwxr-xr-x  6 rommel users  4096 Sep  8 16:03 knock-7666f2e86e
drwxr-xr-x 13 rommel users 12288 Sep  8 16:03 libpcap-1.4.0
drwxr-xr-x 23 rommel users  4096 Sep  8 15:55 linux-headers-3.11
-rw-r--r--  1 rommel users     0 Sep  8 15:39 .root
drwxr-xr-x 19 rommel users  4096 Sep  8 15:58 uclibc-0.9.33.2
-rw-r--r--  1 rommel users     7 Sep  8 16:04 _users_table.txt
drwxr-xr-x 14 rommel users  4096 Sep  8 16:02 zlib-1.2.8

I will submit the patch later again.

Thanks,

  Michael.


On Sep 8, 2013, at 15:00 , Michael Rommel <rommel@layer-7.net> wrote:

> Hi Thomas,
> 
> thanks - will fix this in the next iteration. Is there a description, how one can go ahead with discovering things like
> this, i.e. an explanation of a "clean system"? I only have i586 infrastructure ready, so the error on the aiccu package
> I could not have found (but I will try to follow your suggestions and see, what I can come up with), but I certainly
> can set up a separate buildroot just for testing packages. I assume that a clean system is one, where I just get
> a clone of the git, apply the patch and just select this package - am I right or do I have to consider something else?
> 
> Thanks!
> 
>   Michael.
> 
> 
> On Sep 8, 2013, at 14:08 , Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
> 
>> Hi Michael,
>> 
>>> +KNOCK_SITE = https://github.com/jvinet/knock/tarball/master
>>> +KNOCK_LICENSE = GPLv2+
>>> +KNOCK_LICENSE_FILES = COPYING
>>> +KNOCK_AUTORECONF = YES
>>> +
>>> +$(eval $(autotools-package))
>>> --
>> 
>> The Config.in file mentions a dependency on libpcap, but this is not
>> properly expressed in the .mk file.
>> You need:
>> KNOCK_DEPENDENCIES = libpcap
>> Without this, the compilation on a clean system fails.

-- 
Michael Rommel, Erlangen, Germany

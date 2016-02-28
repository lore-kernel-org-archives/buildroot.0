From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 22:11:43 +0100
Subject: [Buildroot] [PATCH v3] ShellInABox: new package
In-Reply-To: <CAMt=8UKtsMxQcE1c7UCGd+cC5RxdRrMnayqCX-qOtn+TLVqUJQ@mail.gmail.com>
References: <1454771503-116304-1-git-send-email-lucas.zampar@gmail.com>
 <20160221223503.68a72fe1@free-electrons.com>
 <56CC8CF1.1040806@mclink.it>
 <CAMt=8UJvLdPCTm1aNgbd_szbbRhmpb005GNE9VOs-jfHLwN9tQ@mail.gmail.com>
 <CAMt=8UKtsMxQcE1c7UCGd+cC5RxdRrMnayqCX-qOtn+TLVqUJQ@mail.gmail.com>
Message-ID: <20160228221143.6a8cbcd4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Feb 2016 17:33:08 -0300, Lucas Zampar wrote:

> The work is almost done. I have a question:
> When I`m compiling the package I get:
> 
> libtool: link:
> /work/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
> -g -std=gnu99 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -Os -static -o shellinaboxd
> shellinabox/shellinaboxd.o shellinabox/externalfile.o
> shellinabox/launcher.o shellinabox/privileges.o shellinabox/service.o
> shellinabox/session.o shellinabox/usercss.o  ./.libs/liblogging.a
> ./.libs/libhttp.a -lz -ldl -lutil
> 
> /work/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> cannot find -lz
> collect2: error: ld returned 1 exit status
> 
> 
> To solve the problem with libz, I created the patch shellinabox
> -2.19-remove-static-library.patch:
> ..
> +#shellinaboxd_LDFLAGS = -static
> ..
> 
> Is it the best way to solve this? I checked and libz is compiled and
> available at my buildroot environment.

Linking with -static by default is indeed not very good, so removing
-static is a good idea.

However, it doesn't solve the problem: the user may have, in his
Buildroot configuration, request to link everything statically, in
which case Buildroot will pass -static in LDFLAGS.

So you really need to fix the problem.

Can you send the patch so that we can reproduce the problem?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

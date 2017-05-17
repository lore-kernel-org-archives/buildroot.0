From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 May 2017 21:20:23 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-16
In-Reply-To: <20170517062751.2CBF020789@mail.free-electrons.com>
References: <20170517062751.2CBF020789@mail.free-electrons.com>
Message-ID: <20170517212023.478bd24a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 May 2017 08:27:51 +0200 (CEST), Thomas Petazzoni wrote:

>       successes : 251
>        failures : 10 

This is getting better, and better, and better. We're down to 3.83% of
failures for yesterday. Today will be a little bit worse, with
currently 4.19% failures. But we're really below 5% of failures, which
is very good.

>       x86_64 |                    cmake-3.7.2 | NOK | http://autobuild.buildroot.net/results/e89a29fb06991d8da9b946e284741c56397ac4bc |     

/home/test/autobuild/run/instance-2/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/bdver3/usr/lib64/libgcrypt.so.20: undefined reference to `gpg_err_set_errno at GPG_ERROR_1.0'

Weird, because this looks like a static linking issue, but this is not
a statically linked configuration.

It appeared three times, but only with this toolchain (Sourcery CodeBench):

  http://autobuild.buildroot.net/?reason=cmake-3.7.2

>       x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/a7eb1ede552ae14f409cfd7bd877bcf25ca69a74 | ORPH

It's the same issue as the cmake issue above:

/home/test/autobuild/run/instance-3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so: undefined reference to `gpg_err_set_errno at GPG_ERROR_1.0'
/home/test/autobuild/run/instance-3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so: undefined reference to `gpgrt_lock_init at GPG_ERROR_1.0'
/home/test/autobuild/run/instance-3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so: undefined reference to `gpgrt_lock_destroy at GPG_ERROR_1.0'

>          sh4 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/38701cee74110de90cd72f720b3ee8bd69666325 |     

The EGL issue, I will send a patch.

>       x86_64 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/5ee26b9676acc1a360bb86aa13a0c992727309a2 |     

-fPIC issue it seems. It's weird because they only seem to appear with
musl toolchains.

>       x86_64 |            modem-manager-1.6.4 | NOK | http://autobuild.buildroot.net/results/8a551a29263d5daa12e1036a4e3804214fd4066a |     

Would be fixed by https://patchwork.ozlabs.org/patch/762195/. I'll
apply.

>     mips64el |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/25efd86193d0b0fea2a4b2d84fb7f19baa140eb5 | ORPH

Another -fPIC issue. We have a patch proposed at
https://patchwork.ozlabs.org/patch/762084/, I'll try it out.

>       x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/61074b69b81cd5c17a7f74dc1f7b31f3fc35fd8a | ORPH

protocol.cc:27:40: error: narrowing conversion of ''\37777777776'' from 'char' to 'uchar {aka unsigned char}' inside { } [-Wnarrowing]
 static uchar eof_buff[1]= { (char) 254 }; /* Marker for end of fields */

I searched the oracle-mysql Git history, and I believe I might have a
fix for this.

>        sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/4329cda610082053d0a8fd7796a690ddaa21de04 | ORPH
>        sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d1640867dee1b0fe8341698b1d4d02c5edff90a1 | ORPH

Fixed by https://git.buildroot.org/buildroot/commit/?id=ef9ffa3426edc895dc180d45b48bf305522b3450.

>          arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d90fc2ccf61518f3c3198ef566976096f75c2776 |     

Fixed by https://git.buildroot.org/buildroot/commit/?id=beb6524225f12549a216183abc07745f8d36e764

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

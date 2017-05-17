From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 May 2017 23:59:44 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-16
In-Reply-To: <20170517212023.478bd24a@free-electrons.com>
References: <20170517062751.2CBF020789@mail.free-electrons.com>
 <20170517212023.478bd24a@free-electrons.com>
Message-ID: <20170517235944.7c234a4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 May 2017 21:20:23 +0200, Thomas Petazzoni wrote:

> >       x86_64 |                    cmake-3.7.2 | NOK | http://autobuild.buildroot.net/results/e89a29fb06991d8da9b946e284741c56397ac4bc |       
> 
> /home/test/autobuild/run/instance-2/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/bdver3/usr/lib64/libgcrypt.so.20: undefined reference to `gpg_err_set_errno at GPG_ERROR_1.0'
> 
> Weird, because this looks like a static linking issue, but this is not
> a statically linked configuration.
> 
> It appeared three times, but only with this toolchain (Sourcery CodeBench):
> 
>   http://autobuild.buildroot.net/?reason=cmake-3.7.2

Couldn't reproduce so far. I've started a rebuild of a failed
configuration.

> >       x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/a7eb1ede552ae14f409cfd7bd877bcf25ca69a74 | ORPH  
> 
> It's the same issue as the cmake issue above:
> 
> /home/test/autobuild/run/instance-3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so: undefined reference to `gpg_err_set_errno at GPG_ERROR_1.0'
> /home/test/autobuild/run/instance-3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so: undefined reference to `gpgrt_lock_init at GPG_ERROR_1.0'
> /home/test/autobuild/run/instance-3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgcrypt.so: undefined reference to `gpgrt_lock_destroy at GPG_ERROR_1.0'

Fixed proposed at: https://patchwork.ozlabs.org/patch/763789/.

> >          sh4 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/38701cee74110de90cd72f720b3ee8bd69666325 |       
> 
> The EGL issue, I will send a patch.

I've worked on the patch tonight, I've started some builds to verify it
works fine in all situations.

> >       x86_64 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/5ee26b9676acc1a360bb86aa13a0c992727309a2 |       
> 
> -fPIC issue it seems. It's weird because they only seem to appear with
> musl toolchains.

Still needs investigation.

> >       x86_64 |            modem-manager-1.6.4 | NOK | http://autobuild.buildroot.net/results/8a551a29263d5daa12e1036a4e3804214fd4066a |       
> 
> Would be fixed by https://patchwork.ozlabs.org/patch/762195/. I'll
> apply.

Committed:
https://git.buildroot.org/buildroot/commit/?id=2677210f545c3f3e8c52c973e08c3a460c521e5b.

> >     mips64el |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/25efd86193d0b0fea2a4b2d84fb7f19baa140eb5 | ORPH  
> 
> Another -fPIC issue. We have a patch proposed at
> https://patchwork.ozlabs.org/patch/762084/, I'll try it out.

Fixed by
https://git.buildroot.org/buildroot/commit/?id=7fde83cdf0da338937dae13144eea2923e5c2730

> 
> >       x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/61074b69b81cd5c17a7f74dc1f7b31f3fc35fd8a | ORPH  
> 
> protocol.cc:27:40: error: narrowing conversion of ''\37777777776'' from 'char' to 'uchar {aka unsigned char}' inside { } [-Wnarrowing]
>  static uchar eof_buff[1]= { (char) 254 }; /* Marker for end of fields */
> 
> I searched the oracle-mysql Git history, and I believe I might have a
> fix for this.

Fixed by
https://git.buildroot.org/buildroot/commit/?id=19e78e509e5e729437d2188b28aee7655340c67d.

Summary, on 10 failures:

 - 2 remains to be investigated (cmake and libmemcached)
 - 6 have already been fixed
 - 2 have patches

Good night!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

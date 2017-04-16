From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Apr 2017 20:10:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: depends on
	BR2_TOOLCHAIN_HAS_SYNC_4
References: <20170416114135.5080-1-bernd.kuhls@t-online.de>
 <20170416170537.5eee03e2@free-electrons.com>
Message-ID: <XnsA759CD402B91FID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-
wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote in 
news:20170416170537.5eee03e2 at free-electrons.com:

> Hello,
> 
> On Sun, 16 Apr 2017 13:41:35 +0200, Bernd Kuhls wrote:
>> Fixes
>> 
http://autobuild.buildroot.net/results/5a2/5a2a7f24c8727f7f3aee2ca72b4472f2
61610c27/
> 
> In a patch sent yesterday, you made ffmpeg link against libatomic. It's
> a bit weird that it also uses the __sync built-ins. Does it use
> both __atomic and __sync built-ins? In all configurations? On all
> architectures?

Hi Thomas,

afaics both __atomic and __sync functions are used at the same time, for 
example:
http://git.videolan.org/?
p=ffmpeg.git;a=blob;f=libavcodec/mediacodecdec_common.c;h=2ec25c581d34f8f50
09b84161a79589dbaf21683;hb=refs/heads/release/3.3#l145

calls

atomic_fetch_add(&s->refcount, 1);

which translates to __sync_fetch_and_add:
http://git.videolan.org/?
p=ffmpeg.git;a=blob;f=compat/atomics/gcc/stdatomic.h;h=e13ed0e068b8fb50c7a6
9ca19a2600dae31a5a21;hb=refs/heads/release/3.3#l132

And http://git.videolan.org/?
p=ffmpeg.git;a=blob;f=libavutil/buffer.c;h=8d1aa5fa841eb934b9b1846672d9c43d
be23bca3;hb=refs/heads/release/3.3#l102

calls

atomic_fetch_add_explicit(&buf->buffer->refcount, 1, memory_order_relaxed);

which translates to atomic_fetch_add:
http://git.videolan.org/?
p=ffmpeg.git;a=blob;f=compat/atomics/gcc/stdatomic.h;h=e13ed0e068b8fb50c7a6
9ca19a2600dae31a5a21;hb=refs/heads/release/3.3#l135

Regards, Bernd

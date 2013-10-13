From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 13 Oct 2013 09:58:05 +0200
Subject: [Buildroot] [PATCH] ruby: fix 'pcrel too far' build problem on
 SuperH architectures
In-Reply-To: <20131013095140.7a9e70e5@skate>
References: <873298952161de3ed5aa.1381650276@argentina>
 <20131013095140.7a9e70e5@skate>
Message-ID: <CAAXf6LXA-UK2EcGnmRvhfA8cT_+-GsZTQ1o2ubjbFGnGAL4k2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Oct 13, 2013 at 9:51 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Sun, 13 Oct 2013 09:44:36 +0200, Thomas De Schampheleire wrote:
>
>> +# With some SuperH toolchains (like Sourcery CodeBench 2012.09), ruby fails to
>> +# build with 'pcrel too far'. This seems to be caused by the -Os option we pass
>> +# by default. To fix the problem, use standard -O2 optimization instead.
>> +ifeq ($(BR2_sh)$(BR2_sh64),y)
>> +TARGET_CFLAGS += -O2
>> +endif
>
> I don't think it's the right way of fixing the problem. This is going to
> affect the CFLAGS of *all* packages. You shouldn't change
> TARGET_CFLAGS, but instead do:
>
> RUBY_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O2"

Ah yes, you're right. The above was what I proposed initially, but I
tried to be too smart.
I was looking for a way to avoid duplicating TARGET_CFLAGS, because if
someone needs to add a new cflag for ruby specifically, they now need
to explicitly take the superh case into account.

I'll send a new version.

Thanks,
Thomas

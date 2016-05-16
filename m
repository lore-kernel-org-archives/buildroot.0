From: Martin Bark <martin@barkynet.com>
Date: Mon, 16 May 2016 15:34:20 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-05-13
In-Reply-To: <20160516145031.7ac19309@free-electrons.com>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
 <20160514154655.57ae0bad@free-electrons.com>
 <CAFGQKxf_m8c_u4j5_RKwLvKog3HC=mmAzqv-L3LJqX-tgbCL8w@mail.gmail.com>
 <20160516131538.70d77f39@free-electrons.com>
 <CAFGQKxdxSt8LBiipFExEE1KYY+DN_njddHCk0vDMyrK0Eg-2RA@mail.gmail.com>
 <20160516145031.7ac19309@free-electrons.com>
Message-ID: <CAFGQKxf8GyqxVOE3cuOyb8fj_Fv3X4Jt4ue=HeWL151Ak-V3DA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 16 May 2016 at 13:50, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 16 May 2016 13:23:44 +0100, Martin Bark wrote:
>
>> > And indeed, it has been merged half an hour ago. However, I'm wondering
>> > why you have not used pkg-config instead. The drawback of -lgcrypt
>> > -lgpg-error is that now, even in dynamic linking situations, the
>> > iputils binary has a direct reference to libgpg-error.
>>
>> yes my first thought was to use libgrypt-config but in the end I
>> decided to keep it simple because iputils only has a basic Makefile
>> with no configure script.  It's the same situation we had with linking
>> against the libm.  I going to asking the maintainer if they would
>> accept a change to add a cmake or autotools build system so solve this
>> kind of issue neatly.
>
> Well, going all the way to autotools or cmake is not really necessary
> to solve these problems. You can just call pkg-config from a Makefile:
>
> LDFLAGS = $(shell pkg-config --libs libgcrypt)
>
> and that's it. No?

gcrypt has it's owm libgrypt-config so you need something like

GCRYPT_CONFIG?=libgrypt-config
LDFLAG_GCRYPT=$(shell $(GCRYPT_CONFIG) --libs)

However, libgcrypt-config --libs always returns -lgcrypt -lgpg-error
so this method does not save you linking against libgpg-error.  Given
the iputils Makefile does not currently use anything like pkg-config
or libgcrypt-config i decided on the simpler method.

Thanks

Martin

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

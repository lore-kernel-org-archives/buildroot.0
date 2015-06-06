From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 6 Jun 2015 18:17:50 +0200
Subject: [Buildroot] [PATCH v4] moarvm: new package
In-Reply-To: <20150606170508.76f27879@free-electrons.com>
References: <1433516541-16421-1-git-send-email-francois.perrad@gadz.org>
 <1433543601-17425-1-git-send-email-arnout@mind.be>
 <CAB0FRsu3Fh42P6d1sv6zk8YDRV7DCa-OSKn4P1dS7vgEP10j2w@mail.gmail.com>
 <20150606170508.76f27879@free-electrons.com>
Message-ID: <CAB0FRsujNdZ4=gzYM02mmFAq4tjrhfEX8NVayJ3PW=rP-0J6EQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-06-06 17:05 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Fran?ois Perrad,
>
> On Sat, 6 Jun 2015 11:03:38 +0200, Fran?ois Perrad wrote:
>
>> > +MOARVM_DEPENDENCIES = host-luajit libuv libatomic_ops
>>
>> host-luajit seems overkill.
>
> Why? Lua is not part of the core dependencies of Buildroot, which are
> mandatory to run Buildroot. So if it's not part of these core
> dependencies, and used for the build process of moarvm, then it should
> be added as a dependency of that package.
>
> Otherwise the build will fail for users that don't have Luajit
> installed on their machine, like is the case for several of the
> autobuilders.
>

Moarvm reuses [DynASM](http://luajit.org/dynasm.html), the JIT engine of LuaJIT.
DynASM needs a Lua interpreter.
This Lua interpreter could be an external interpreter or minilua which
is included in DynASM
(see https://github.com/MoarVM/dynasm/blob/master/minilua.c).
minilua is used in a bootstrap step and is never installed.

Moarvm could be built without --lua option, in this case, the minilua
in Moarvm is compiled and used.

Moarvm could be built with --lua=$(HOST_DIR)/usr/bin/luajit, in this
case, host-luajit is built first, which includes the minilua in
LuaJIT.

In both case, a minilua is built.
host-luajit just slows down the process.

Fran?ois

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 14:49:25 -0300
Subject: [Buildroot] [PATCH 0/5] Add ILP32 support in aarch64
In-Reply-To: <CAOijeYJLdrDiOnYJ2fvPWi2peT56rTALryg7jgB-gJ_X0J5UBA@mail.gmail.com>
References: <1426500013-1276-1-git-send-email-bamvor.zhangjian@huawei.com>	<55082C5E.1070906@zacarias.com.ar>
 <CAOijeYJLdrDiOnYJ2fvPWi2peT56rTALryg7jgB-gJ_X0J5UBA@mail.gmail.com>
Message-ID: <55086925.3080102@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/17/2015 11:44 AM, Bamvor Zhang wrote:

>> 1) You're using -mabi unconditionally.
>> Current default gcc is 4.8.x which doesn't understand -mabi for aarch64.
> Yes.

This is bad for the scenario where gcc = default = 4.8.x and we use lp64
(default as well).
Since you're setting BR2_GCC_TARGET_ABI to lp64 in patch 4 and this is
used in package/gcc/gcc.mk it causes breakage for: internal toolchain,
aarch64 BE or LE, lp64.
Just make it empty, it's the default for gcc and that won't change:

arch/Config.in.aarch64 -> default "" if BR2_AARCH64_LP64

It's not "pretty" but it works just fine and reflects previous behaviour.

>> This will only fix the ILP32 problem, doesn't help for -mabi=lp64 though
>> (point 1).
> Well, do you mean I should handle -mabi=lp64 as well? It is the default
> api in aarch64 gcc 4.9.x. It may be useful when build the kernel.

See solution above.

>> 3) ILP32 little endian doesn't build with gcc 4.9.x/binutils 2.25/glibc
>> 2.20: it results in an internal compiler error while building glibc, so
>> very likely gcc's fault. This should be handled as well, by fixing it or
>> disabling the internal toolchain backend for this combination.
> I guess linaro has the patch in it while I hope I could deal with it
> after the external toolchain patches is accept. Do you comfortable with
> only external toolchain support at this time?

Yes that's not a problem, it'll probably be part of some future release
and then we can unleash it.
Or add the patch(es) if they're small and non-intrusive.
Regardless it may be an external-only option at this point since ILP32
is labelled as beta all over the place.
Regards.

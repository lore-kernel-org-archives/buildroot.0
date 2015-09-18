From: Chris Packham <judge.packham@gmail.com>
Date: Fri, 18 Sep 2015 21:43:10 +1200
Subject: [Buildroot] [PATCH v4 0/2] Micropython package
In-Reply-To: <55FBD989.7020102@imgtec.com>
References: <CAFOYHZB-oynjvUKa9CkHvBpvw+kuSuPLgWrZZwEOr7YSQOvW0g@mail.gmail.com>
 <1442446199-15963-1-git-send-email-judge.packham@gmail.com>
 <20150918093222.13fa5739@free-electrons.com>
 <CAFOYHZCxy2PWfdPXiTrxDzf4LnLnPCwATyia200X2kHucNqJSA@mail.gmail.com>
 <55FBD989.7020102@imgtec.com>
Message-ID: <CAFOYHZDSreZL_4FWoF7WzyChSx=Me1QO8NqtK25w8Js9NWyH8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 18, 2015 at 9:29 PM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> Dear Chris Packham,
>
> On 09/18/2015 09:22 AM, Chris Packham wrote:
>> On Fri, Sep 18, 2015 at 7:32 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Chris,
>>>
>>> On Thu, 17 Sep 2015 11:29:57 +1200, Chris Packham wrote:
>>>
>>>> Chris Packham (2):
>>>>   micropython: new package
>>>>   micropython-lib: new packages
>>>
>>> There are a number of build failures caused by Micropython in the
>>> autobuilders:
>>>
>>>  * On MIPS64
>>>    http://autobuild.buildroot.org/results/99a/99a610c72877fef53d93e1a923bd5c71b3376618/build-end.log
>>>
>>>  * On Xtensa
>>>    http://autobuild.buildroot.org/results/670/670907760d6b3e7eb46b433647b392cec3bafdcd/build-end.log
>>>
>>>  * On SH4A
>>>    http://autobuild.buildroot.org/results/f5a/f5a2c563b8bdab9e345960a5b92d31f3f92dba00/build-end.log
>>>
>>> See http://autobuild.buildroot.org/?reason=micropython-v1.4.5 for the
>>> complete list of build failures.
>>>
>>> If you could look into these, it would be helpful.
>>
>> Xtensa and SH4A look like they need MICROPY_GCREGS_SETJMP I'll send a
>> patch for them shortly. The MIPS64 one looks different so might need
>> some investigation.
>
> as the build error says, a right shift is being performed in the
> py/objint_mpz.c file, and the offending one is at line #54:
>
> MP_SSIZE_MAX >> MPZ_DIG_SIZE * 4
>
> in MIPS64 n64 the MP_SSIZE_MAX is 64-bit wide and the value of
> MPZ_DIG_SIZE 16, so MPZ_DIG_SIZE * 4 is 64. That shift causes a warning
> because its trying to shift 64 bits of a 64-bit variable:
>
> py/objint_mpz.c:54:5: error: right shift count >= width of type [-Werror]
>
> MIPS32 and MIPS64 n32 are fine because MP_SSIZE_MAX is 32-bit wide and
> the #if clauses in the py/objint_mpz.c protect that to happen.
>
> Look at this test for MIPS32:
>
> $ mips-linux-gnu-gcc -mips32r2 -EB ssize_t.c -o ssize_t
> $ qemu-mips ssize_t
> MP_SSIZE_MAX: 32 bits
> MPZ_DIG_SIZE: 16
> right-shifting 0 bits
> right-shifting 16 bits
>
> And now look at the same test for MIPS64 n64:
>
> $ mips-linux-gnu-gcc -mips64r2 -mabi=64 -EB ssize_t.c -o ssize_t
> ssize_t.c: In function 'main':
> ssize_t.c:24:2: warning: right shift count >= width of type
>   (MP_SSIZE_MAX >> MPZ_DIG_SIZE * 4) & DIG_MASK;
>   ^
> $ qemu-mips64 ssize_t
> MP_SSIZE_MAX: 64 bits
> MPZ_DIG_SIZE: 16
> right-shifting 0 bits
> right-shifting 16 bits
> right-shifting 32 bits
> right-shifting 48 bits
> right-shifting 64 bits
>
> I don't know what's the purpose of the code in py/objint_mpz.c and I
> don't know if they really want to do a 64-bit shift of a 64-bit
> variable. But the thing is that since it's compiled with the -Werror
> flag, that warning makes the compilation to fail.
>
> If they really want to do such a shift, then they should remove the
> -Werror. But if they don't want to do such a shift, then more #if
> clauses are needed in order to prevent that to happen. Perhaps you could
> talk with upstream about this.
>

I raised an issue [1]. But in the meantime I think I've found the
right setting to pass for a 64 bit target. Patch to follow.

[1] - https://github.com/micropython/micropython/issues/1465

From: martin krastev <blu.dark@gmail.com>
Date: Sun, 10 Feb 2013 19:22:14 +0200
Subject: [Buildroot] non-standard architecture targets
In-Reply-To: <201302101733.42143.yann.morin.1998@free.fr>
References: <CAKPuMhOrKZwAp5FZgvBO2M5dfvrFnCjBchwAfBn+_tu_XiwB2Q@mail.gmail.com>
 <201302101733.42143.yann.morin.1998@free.fr>
Message-ID: <CAKPuMhNBQKufPGtau-SbYz50zqCnuAFpUaO4faWQspjNRzb+hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you, Yann.

Unfortunately the tuple pattern in question is not something I have
control over - that is what gcc expects to have as a target (pattern)
to enable paired-singles support for ppc750cl.

Again, thank you for your time, and if you have any ideas how to solve
this conundrum - those would be much appreciated.

Best regards,

Martin

On Sun, Feb 10, 2013 at 6:33 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Martin, All,
>
> On Sunday 10 February 2013 martin krastev wrote:
>> I am trying to get buildroot (buildroot-2012.11.1) to produce a cross
>> toolchain (x86_64 -> powerpc) of a non-standard target triplet (if
>> it's still called that way).
>
> We call them tuples, rather than triplets, as they can have four parts.
>
>> I am currently getting
>> "powerpc-buildroot-linux-uclibc", and I would like to extend that to
>> "powerpc-buildroot-linux-uclibc-paired" or
>> "powerpc-buildroot-linux-paired-uclibc" - generally anything following
>> the powerpc*-*-linux*paired* pattern.
>>
>> What is the natural way to set this up in buildroot?
>
> That is not posible, as those are not valid tuple.
> A tuple is what describes the target, and needs to be constructed
> in a very precise (and inflexible) format:
>
>     arch-vendor-abi
>     arch-vendor-kernel-abi
>
> where:
>   - 'arch' is the architecture part of the tuple (arm, armeb, mipsel,
>     i386, powerpc...)
>   - 'vendor' is an almost-free-form part (but does not accept spaces
>     nor dashes, and globally, any other weird chars)
>   - 'abi' is the ABI part, for example: elf, eabi, gnueabi, uclibc...
>   - 'kernel' is the name of the kernel, eg. linux
>
> Not all combinations of {arch,vendor,{os,}abi} are valid.
>
> To check if a tuple is valid, use: ./support/gnuconfig/config.sub
>
>     $ ./support/gnuconfig/config.sub powerpc-buildroot-linux-paired-uclibc
>     Invalid configuration `powerpc-buildroot-linux-paired-uclibc': machine
>     `powerpc-buildroot-linux-paired' not recognized
>
> If your tuple is valid, but non-canonic, config.sub will output the
> canonic form of the tuple, eg:
>
>     $ ./support/gnuconfig/config.sub powerpc-linux
>     powerpc-unknown-linux-gnu
>
> Unfortunately, I am not aware of a central authoritative list of valid
> tuples, and the config.{guess,sub} scripts are the only authoritative
> reference for building tuples, AFAIK.
>
> However, if you want to differentiate your tuples, you can use the
> vendor-part of the tuple (typically, 'buildroot' in tuples above).
> This not possible with Buildroot: toolchains built with Buildroot
> will always have 'buildroot' as the vendor-part. Some other toolchain
> builders may allow you to override the vendor-part (eg. crosstool-NG
> does have that possibility).
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

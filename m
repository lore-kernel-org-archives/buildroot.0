From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 4 Sep 2019 09:38:00 +0200
Subject: [Buildroot] clang tool-chain support?
In-Reply-To: <f6b14715-2e1b-bf96-9a13-ee70901e3350@yandex.ru>
References: <87d78eb1-45aa-6200-03fe-20998152fd1a@yandex.ru>
 <f9265f6b-b188-ec04-5fc7-fd5dbb8c932b@smile.fr>
 <f6b14715-2e1b-bf96-9a13-ee70901e3350@yandex.ru>
Message-ID: <31dec2be-df01-ce24-e2e4-9e379da90c01@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stas,

Le 04/09/2019 ? 02:28, stsp a ?crit?:
> Hi!
> 
> 03.09.2019 23:58, Romain Naour ?????:
>> Hi Stas,
>>
>> Le 03/09/2019 ? 12:00, Stas Sergeev a ?crit?:
>>> Hello.
>>>
>>> Just a few toolchain-related questions from
>>> novice buildroot user.
>>>
>>> - Currently it seems buildroot does not support
>>> the clang toolchain natively, so is there any way
>>> (preferably a documented one) to use the host's
>>> clang tool-chain? (I've only found the way to build
>>> clang as a target package, which is not what I need)
>> Indded, Buildroot doesn't support yet clang as cross-toolchain.
>> Last year Valentin worked on llvm/clang integration into Buildroot to provide
>> llvm/clang libraries for the target.
> Do you mean that "clang as a target" is a
> pre-requisite for "clang as a cross tool-chain"?

No, but we (with Valentin) focussed on "clang as a target". I mean, provide
clang libraries for the target. Buildroot don't support compilers on the target.

> As otherwise I suspect this is what I mentioned
> as "which is not what I need". :)

Yes I know :)

> 
>> I recently tested clang to build a kernel for aarch64 and x86_64
> 
> But here you talk about "clang as a cross-toolchain",
> not a target package? You probably want to say that
> the work is ongoing in both directions (for target and
> for host), but I am not sure if you mean exactly that.

When you build host-clang package (clang for the host machine), clang compiler
is present in $(HOST_DIR)/bin but it's not used by any Buildroot infra/package.
By hacking the linux package to use clang instead of gcc, I'm able to build the
kernel. But this is not upstreamable.

> 
> 
>> Also, there are some questions about clang toolchain:
>>
>> "The long-term goal is to have a complete clang-based toolchain. The usefulness
>> of this is questionable however." [1]
>>
>> If clang can be used as a toolchain,
> 
> I suppose it definitely can, at least for some configurations.
> For others it won't be selectable (for example).

I mean "If clang can be used as a toolchain by Buildroot".
I believe it can but needs some work especially for building userspace programs.

> 
> 
>> ? it would be great to add it as part of an
>> Buildroot's internal toolchain. Also, the toolchain external infra should be
>> able to import clang and it's libraries if present in a pre-built toolchain.
>> To do so, we have to make sure that clang binaries are relocatable.
> 
> I think clang understands --sysroot= by default,
> so, if I understand you correctly, I just need to
> build the clang toolchain manually and put it into
> some "root". But its not really documented anywhere,
> right?

This is not easy, I'm aware of an issue about gcc files needed to run clang on
the host [1]. It seems clang has an issue with gcc toolchains where the sysroot
has been moved. I think clang should use gcc's search-dirs.

[1] http://lists.busybox.net/pipermail/buildroot/2019-August/256204.html

 By the way, can something like this (just googled)
> be of any help for me with that task?
> https://www.embtoolkit.org/
> It is said to "generate toolchains", but I wonder if
> they are "compatible" with what buildroot expects.

For now, Buildroot can't import a prebuit clang toolchain as external toolchain.

> 
> 
>>> - I know that currently there are not too many
>>> clang-only projects, but I just want to build a few
>>> of them. As their amount may only increase
>>> in the future, are there any plans to get the
>>> native clang support in buildroot?
>>> (not found in buildroot's TODO list)
>> Can you share the list of clang only projects you are interested in?
> 
> Well, the projects I am interested in, are written
> by me, in particular this one:
> https://github.com/stsp/fdpp
> I am reporting bugs to gcc bugzilla for around 20
> years (the above project is new but I have others),
> and the average time frame of them hanging
> in their bugzilla before being fixed, is 10 years.
> It was a big pain in the past, but now clang appeared
> and no pain if I just declare the project clang-only.
> And in this particular case the above project is absolutely
> not portable to gcc, i.e. if not for clang, the project would
> simply not exist. I only have just 1 bug report in
> the clang bugzilla currently pending for that project,
> where gcc produces the right code and clang miscompiles.
> Working around 1 bug was acceptable, clang seems
> quite stable to me.

Well, that's probably true for gcc... sometime we can report a bug without
having a reply for a long time.

At least for Binutils and Glibc this is not the case, we had some feedback from
maintainers when needed :)

> 
> 
>>> - buildroot seems to provide yasm instead of nasm.
>>> While I was able to work around yasm bugs and
>>> build the project with it, I wonder why such a choice?
>>> Unless I am mistaken, nasm is active and yasm is
>>> pretty much dead - I've got that impression from
>>> reporting bugs to both projects and getting replies
>>> (and instant fixes) only from nasm.
>>> So any plans to switch to nasm?
>> There is a nasm package in Buildroot for the host and the target.

Ok I made a mistake here. nasm is a host only package.

>> Yasm is also available but less used by other packages.
>> What is you Buildroot version ?
> Hmm, this is interesting.
> buildroot-2019.08
> In menuconfig I go to Target packages --> Development tools
> and only see yasm and no nasm. Then I do the search '/'
> and again, search gives BR2_PACKAGE_YASM for yasm
> and nothing for nasm. Of course having yasm in target
> packages is not what I want - I need it in the host. But
> are you sure nasm is there anywhere? I can't find it via
> menuconfig, but maybe I am doing something wrongly?

Ok, you mean nasm for the target.
I guess that because nobody contributed to make it a target package.

Yasm is available for the target but no package seems to depend on it.

Feel free to contribute a patch enabling nasm for the target :)

Best regards,
Romain

From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Feb 2014 15:16:40 +0100
Subject: [Buildroot] Parallel make messes up post-build in -next
In-Reply-To: <CAHkwnC-LRM1oVjxH1PNMHnB9x-H6C7QsO458t01TBtiFr2moOg@mail.gmail.com>
References: <20140220095550.GA16493@pc-eric>
 <CAAXf6LXRsk=roB4ogDfjcHwPZKB2YCUraR34bV3qi72ewuvK1A@mail.gmail.com>
 <CAHkwnC-LRM1oVjxH1PNMHnB9x-H6C7QsO458t01TBtiFr2moOg@mail.gmail.com>
Message-ID: <53060E48.2040403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/02/14 15:13, Fabio Porcedda wrote:
> On Thu, Feb 20, 2014 at 2:24 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>> On Thu, Feb 20, 2014 at 10:55 AM, Eric Le Bihan
>> <eric.le.bihan.dev@free.fr> wrote:
>>> Hi!
>>>
>>> I am currently testing the -next branch and I've encountered the following
>>> problem: the copy of my overlay and the execution of my post-build script is
>>> now performed *after* the generation of my image.
>>>
>>> Reverting commit a24877586a566e052897e50e6a0c2f53cfb029f5, which adds support
>>> for top-level parallel make, fixes the issue.
>>>
>>> Has anyone else experienced this problem?
>>
>> I haven't tried it myself yet.
>> But, the rootfs and post build scripts are done from target-finalize,
>> and the rules to make the rootfs depend on target-finalize.
>> This should be fine (but probably is not and we're overlooking something).
>>
>> However, aside from the above I have another doubt: I don't see any
>> special handling for the other special targets like
>> target-purgelocales, target-generatelocales, ... These targets should
>> be run after all generic targets, and before creating the rootfs. As
>> far as I can see, they could now run in parallel with the normal
>> targets, right?
> 
> Yes, it's a thing to fix for proper parallel bulding support, it's on
> my todo list.
> 
> The targets target-finalize, target-purgelocales,
> target-generatelocales, toolchain-eclipse-register can be executed in
> parallel after building the generic targets?

 I think target-finalize should depend on all other target-*. It's
something that you may want to call from the command line in order to get
an up-to-date target directory.

 toolchain-eclipse-register can be done in parallel with all the rest, it
should just depend on toolchain. There is nothing really that depends on
it, so probably 'world' is the best choice.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

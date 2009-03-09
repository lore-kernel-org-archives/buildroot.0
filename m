From: Maxim Grigoriev <maxim@tensilica.com>
Date: Mon, 09 Mar 2009 15:15:08 -0700
Subject: [Buildroot] Question about Buildroot concepts and strategies
In-Reply-To: <d6cda7730903071902n68cff1fdiaf584d9edf1aff1b@mail.gmail.com>
References: <49B17D64.50707@hq.tensilica.com>
	<d6cda7730903071902n68cff1fdiaf584d9edf1aff1b@mail.gmail.com>
Message-ID: <49B594EC.7050405@hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thiago and Peter,

Thank you very much for your detailed answers
and being ready to help us with Xtensa BUILDROOT.

 > The best way to get patches committed is posting them on the bugtracker.

I submitted an "enhancement" bug report "Xtensa architecture port" :

      https://bugs.busybox.net/show_bug.cgi?id=163

and attached a suggested patch

      https://bugs.busybox.net/attachment.cgi?id=115

which is supposed to be the first one in a set of Xtensa port patches.


 >> Tensilica is eager to become a part of BUILDROOT.
 >> We made a commitment to support Xtensa BUILDROOT
 >> and try to do our best to improve generic BUILDROOT.
 >
 > That would be great. Please try to send smaller patches first. Get
 > them into small/independent patches, then they will have the highest
 > chance of being applied.

I will prepare the rest of the patches and attach them to the
same bug report one by one, unless you suggest otherwise.


 > We don't blindly apply patches, so if something isn't quite
 > understood, it might require more discussion before someone risk their
 > neck applying. I think that's the case of your toolchain patches.

This is perfectly understandable. Everything we submit should match
the standards. We would highly appreciate any time spent on this.


 > I for one don't quite understand it. How does the upstream gcc handle
 > those "custom instructions"?

Xtensa is configurable and extensible.

Configurability means there is a basic set of instructions/registers,
which is always present. This basic Xtensa can be extended by adding
standard option(s) like FP, VLIW, Debug-OCD, Windowed registers, MMU,
and many-many others.

Extensibility means that user can use SoC technologies to add new
instructions and registers, e.g. to optimize their hardware for
specific applications.

All Xtensa tools ( binutils, compilers and compiler tools, assemblers,
and debugger ) were designed in a specific way to support both
configurability and extensibility. This functionality is encapsulated
into separate modules. Since it's all written in "C", encapsulation
basically means a separate set of "*.h" and "*.c" files.

When hardware configuration is done we call it Config.
It then can be tested on Tensilica ISS, FPGA, and/or final silicon.


 > Do you patch the same file always?

Yes. It's not actually patching. Source overlays overwrite all
the files describing Xtensa Configs.

 > Do you tell configure to add a C file to the build?

No. The names and locations of the files to overwrite are fixed.

There is a default Xtensa Config called "fsf". All Xtensa FSF
tools use this config. GNU/Linux can run on this Config.

If user uses "fsf" Config the overlays are not necessary.
All the hardware description files are already in place,
when user unpacks FSF tar-balls.

 > Do we really need to keep
 > binary (tgz) files in our repository ?

No. The way how it supposed to work is first user clones BUILDROOT
repository then either decides to use "fsf" Config or comes up
with his/her own overlay for a different Config. In the latter
case, an overlay "tgz" file should be placed into BUILDROOT tree
before the build starts.

Although, it might be reasonable to check in several overlays
for well-tested preconfigured Xtensa Configs ( like Diamond
Standard 232L ). This is desirable but not necessary.

Thanks much for you help,

-- Maxim Grigoriev
   MTS at Tensilica, Inc.
   (w) 408-566-1770
   (c) 510-749-0427




Thiago A. Corr?a wrote:
> Hi Maxim,
>
> On Fri, Mar 6, 2009 at 4:45 PM, Maxim Grigoriev <maxim@tensilica.com> wrote:
>   
>> Hello Peter and BUILDROOT maintainers,
>>
>> I understand you are busy individuals, and I'm sorry
>> for bothering you. An excuse could be I'm trying to
>> understand what BUILDROOT project is all about. Is it
>> similar to other open source projects or somewhat different ?
>>     
>
> All projects have their particularities. Buildroot for one didn't have
> a maintainer for a long time, until Peter stepped up as our fearless
> leader :)
> We also never had releases until last month, even though many were
> already using svn or snapshots.
> Many of us use buildroot commercially somehow, some as developers from
> board manufacturers like myself, systems integrators, and even a few
> from chip manufacturers. Of course, there are hobbyists too. But my
> point here is that we usually work each on their respective platforms
> under target and we all try to work together with the packages under
> packages or the toolchain. This is mainly because developers don't
> have every hardware platform each for testings and such, and we don't
> like to break other ppl's build.
>
>   
>> Are BUILDROOT maintainers interested in adding new
>> architectures to the project ?
>>     
>
> Well, as far as I'm concerned, the more the merrier :)
>
>   
>> On March 3d, I tried to start submitting Xtensa BUILDROOT :
>>
>> http://lists.busybox.net/pipermail/buildroot/2009-March/026260.html
>>
>> follow-ups :
>>
>> http://lists.busybox.net/pipermail/buildroot/2009-March/026263.html
>> http://lists.busybox.net/pipermail/buildroot/2009-March/026289.html
>>     
>
> Sorry about that. Sometimes the list gets too high traffic for some
> ppl (me included).
> There are times I just mark everything as read, otherwise I would
> spend all my working hours reading emails.
>
> The best way to get patches commited is posting them on the
> bugtracker. They might go unnoticed for a little while, but they won't
> get buried in all the mail.
>
>   
>> Tensilica is eager to become a part of BUILDROOT.
>> We made a commitment to support Xtensa BUILDROOT
>> and try to do our best to improve generic BUILDROOT.
>>     
>
> That would be great. Please try to send smaller patches first. Get
> them into small/independent patches, then they will have the highest
> chance of being applied.
> We don't blindly apply patches, so if something isn't quite
> understood, it might require more discussion before someone risk their
> neck applying. I think that's the case of your toolchain patches.
>
> I for one don't quite understand it. How does the upstream gcc handle
> those "custom instructions"? Do you patch the same file always? Do you
> tell configure to add a C file to the build? Do we really need to keep
> binary (tgz) files in our repository?
>
>   
>> Does BUILDROOT project has a concept of architecture
>> maintainers ? I mean developers with write-access,
>> who can check in architecture-specific updates without
>> approval and commit generic updates after approval from
>> main maintainers.
>>     
>
> Not formally, no. Those working with a given arch maintain that. Some
> archs got axed recently because there were no one actively using or
> maintaining them.
> At least in principle, any developer would do that, and add an arch.
> But we try to be responsible not to add bloat and to make sure we have
> things working before commiting. Buildroot developers had a great deal
> of freedom in that regard, this might change in the future though.
> With the advent of our first release, we had a feature freeze for the
> first time. Right now the window is open for anything, until April or
> something.
>
> Kind Regards,
>    Thiago A. Correa
>
>   

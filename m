From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Nov 2019 14:07:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/domoticz: fix build with RELRO
In-Reply-To: <CANQCQpYQN5siLJi80xqbqbW81wncZ9mPhSojwWqdc66hDhoaOw@mail.gmail.com>
References: <20191031102306.15433-1-fontaine.fabrice@gmail.com>
 <20191031134302.685d1858@windsurf.home>
 <CAPi7W81G6kXj_ueiGDq2ocz_Q8HesGVDpp5g7BgXJ1qpqpu6WQ@mail.gmail.com>
 <20191104231237.1954d080@windsurf.home>
 <CANQCQpYQN5siLJi80xqbqbW81wncZ9mPhSojwWqdc66hDhoaOw@mail.gmail.com>
Message-ID: <65074238-574a-e517-aa33-e137eb11f888@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/11/2019 21:19, Matthew Weber wrote:
> Thomas,
> 
> On Mon, Nov 4, 2019 at 4:12 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello,
>>
>> I'm adding a few more people in Cc: Matt, Yann, Arnout, Peter.
>>
>> On Thu, 31 Oct 2019 14:01:33 +0100
>> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>>
>>>> What is the relationship between using precompiled headers and relro
>>>> build problems ?
>>> I took me some time to understand the issue.
>>> It seems that linker flag such as -Wl,-z,relro should not be used when
>>> building a precompiled header.
>>> I discovered this through this domoticz commit message:
>>> https://github.com/domoticz/domoticz/commit/68698e7a5dce80dea5a9b997d7e171b80bf566ac
>>>
>>> However, this commit does not fix the issue on buildroot as
>>> -Wl,-z,relro is not passed through CXXFLAGS but through our
>>> toolchain-wrapper.
>>> Updating toolchain/toolchain-wrapper.c to add the logic to manage
>>> precompiled header seems more complicated than adding an option to
>>> disable this feature from domoticz.
>>
>> So, I looked into this, found
>> https://lists.fedoraproject.org/pipermail/devel/2011-July/153664.html
>> and https://bugzilla.redhat.com/show_bug.cgi?id=718719.
>>
>> So it really seems like -Wl,-z,relzo should not be passed when
>> compiling. But our compiler wrapper passes it unconditionally when
>> RELRO is enabled.
>>
>> Do we have a way to detect that the wrapper is called to compile or to
>> link ? I don't think we do.
> 
> Looks like we can just key on -xc-header or -xc++-header and
> selectively enable the RELRO flags.  I'll do some builds and then send
> a patch if that looks ok.
> 
> https://pastebin.com/XGc8bFxh

 I'm not so sure if that is a generic solution... As explained in [1]:

$ gcc -o /tmp/stdio.gch /usr/include/stdio.h
$ gcc -c -o /tmp/stdio.gch /usr/include/stdio.h -Wl,-z,relro
$ gcc -o /tmp/stdio.gch /usr/include/stdio.h -Wl,-z,relro
/usr/bin/ld: /usr/lib/gcc/x86_64-redhat-linux/9/../../../../lib64/crt1.o: in
function `_start':
(.text+0x24): undefined reference to `main'
collect2: error: ld returned 1 exit status

 The problem AFAICS is that if no -c or similar option is given, GCC decides
what needs to be done based on the rest of the arguments. If the rest of the
arguments include a -Wl,... option, it decides that linking needs to be done. If
the rest of the arguments are just header files, it decides to create a
precompiled header.

 I think a more appropriate solution is to patch domoticz to add the -c option
for building precompiled headers, which AFAICS should fix the issue.

 If we want to fix it at the toolchain level, I think it would be more
appropriate to handle it the way most distros do: by patching the spec file.

 Regards,
 Arnout


[1] https://lists.fedoraproject.org/pipermail/devel/2011-July/153864.html

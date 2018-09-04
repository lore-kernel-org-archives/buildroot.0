From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Sep 2018 22:17:58 +0200
Subject: [Buildroot] Fwd: Beginner help: Compilation errors for bison,
 ncurses and arm-buildroot-linux-uclibcgnueabihf
In-Reply-To: <CAL8qisnNqN9Mn1wM2FiMmgs3phgke4RF4xNCxprm3s-i4VAkqw@mail.gmail.com>
References: <CAL8qis=5F5kDuMjpsZJZLbnAkFKBVaH_V1CcV6uuK5Lu1ooPAw@mail.gmail.com>
 <20180904102005.1d63cc85@windsurf>
 <CAL8qisnsRCYbC5+x8GAT+wZ_qiB=6EGBUVkK=GRk0JHy-T4ifA@mail.gmail.com>
 <CAL8qisnNqN9Mn1wM2FiMmgs3phgke4RF4xNCxprm3s-i4VAkqw@mail.gmail.com>
Message-ID: <2e07e3d7-26f8-3ae2-1f19-26f60210cb36@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Faisal,

On 04/09/2018 17:32, Faisal Mehmood wrote:
> ---------- Forwarded message ---------
> From: Faisal Mehmood <f.m3hm00d@gmail.com>
> Date: Tue, Sep 4, 2018 at 3:31 PM
> Subject: Re: [Buildroot] Beginner help: Compilation errors for bison,
> ncurses and arm-buildroot-linux-uclibcgnueabihf
> To: <thomas.petazzoni@bootlin.com>
> 
> 
> On Tue, Sep 4, 2018 at 8:20 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello,
>>
>> On Tue, 4 Sep 2018 11:24:53 +0000, Faisal Mehmood wrote:
>>
>>> ################################1#1#1#1#1#1#1#1#1#1########################
>>>
>>> /home/kenobi/projects/zero/rootfs/buildroot-2018.02.5/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/Scrt1.o:
>>> In function `_start':
>>> (.text+0x54): undefined reference to `main'
>>> collect2: error: ld returned 1 exit status
>>> make[2]: *** [Makefile:850: ../lib/libncurses.so.6.0] Error 1

 As Thomas mentioned, for some reason you don't seem to be able to build a
shared library.

 To debug this, could you re-run (without cleaning) with BR2_DEBUG_WRAPPER=1 in
the environment? And also make it verbose, with V=1. And disable parallel build. So

BR2_DEBUG_WRAPPER=1 make V=1 BR2_JLEVEL=1

 If you haven't cleaned, the entire output is relevant (it would contain just
the commands that are run leading up to the failure).

[snip]
>>  - Your Buildroot .config file

 To make it smaller, you can run 'make savedefconfig' and include that in the mail.

 But anyway, the interesting bit is

BR2_RELRO_FULL=y

Full relro is currently broken. See the bug report [1] and the patches to fix it
[2].

 Regards,
 Arnout

[1] https://bugs.busybox.net/show_bug.cgi?id=11206
[2] http://patchwork.ozlabs.org/project/buildroot/list/?series=63203


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

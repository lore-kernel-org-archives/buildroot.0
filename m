From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Mar 2016 13:21:43 +0100
Subject: [Buildroot] [PATCH v7 03/18] core: re-enter make if $(CURDIR)
 or $(O) are not absolute canonical path
In-Reply-To: <CAHXCMMKaygcoS1PvO4hNxSDWsUgS1ReWXUR8mLLpQnoAaTq6sA@mail.gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-4-git-send-email-s.martin49@gmail.com>
 <CAFt09wNvtXGcfZ3PFZOgGu+bDvp6mEr44uwxa_ryjeP6DDQKBQ@mail.gmail.com>
 <CAFt09wOp3C44Y7WY48p2P9xKQr_EO7x_mAC7je--M0RwXc83sg@mail.gmail.com>
 <20160322220739.GA3441@free.fr>
 <CAFt09wPkL6Rvo_UUdk1UQ07bNphRTrn-yb=SqeZXLM8A0tNP8Q@mail.gmail.com>
 <CAFt09wNREbn8O=TxQB7hsugQ-6Y1-E4+K_Eyqr4yCD5WnKkdyQ@mail.gmail.com>
 <CAFt09wO_+pp58gvF5L_u4apAf1HYReFhV+wqF6oy1fC6Qj-_Kw@mail.gmail.com>
 <CAHXCMMKaygcoS1PvO4hNxSDWsUgS1ReWXUR8mLLpQnoAaTq6sA@mail.gmail.com>
Message-ID: <56F67ED7.1060309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/25/16 07:31, Samuel Martin wrote:
> On Wed, Mar 23, 2016 at 2:36 AM, Matthew Weber <matt@thewebers.ws> wrote:
>> Yann, Samuel
>>
>> On Tue, Mar 22, 2016 at 7:54 PM, Matthew Weber <matt@thewebers.ws> wrote:
>>> Yann, Samuel, All
>>>
>>> On Tue, Mar 22, 2016 at 6:11 PM, Matthew Weber <matt@thewebers.ws> wrote:
>>>> Yann, All
>>>>
>>>> On Tue, Mar 22, 2016 at 5:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>>>> Matthew, All,
>>>>>
>>>>> On 2016-03-20 20:45 -0500, Matthew Weber spake thusly:
>>>>>> On Sun, Mar 20, 2016 at 8:44 PM, Matthew Weber <matt@thewebers.ws> wrote:
>>>>>>> On Wed, Mar 9, 2016 at 4:58 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>>>>>>>> When $(CURDIR) or $(O) contain symlinks (or mount-bind) in their path,
[snip]
>>>>>>>> +ifneq ($(shell umask):$(CURDIR):$(patsubst %/.,%,$(O)),$(UMASK):$(realpath $(CURDIR)):$(realpath $(O)))
[snip]
>> One additional detail, I cloned https://github.com/tSed/buildroot.git
>> and checkout c55eeee30fe6106354c0f2cb6ce6ecb46972503a.  Then "make
>> qemu_x86_defconfig" and reproduced it.  I'll start dissecting the
>> other commits past that one.  Something must be masking it.
>>
>
> I think I get what happens:

  No you don't :-)


> According to [2,3], realpath return an empty string in case of ENOENT
> (file does not exist), hence the empty $(O) because output/ is not yet
> created when re-entering make.

  But since $(O) itself is also the empty string, the condition won't even 
trigger because 022:/tmp/buildroot: is equal to 022:/tmp/buildroot:

  Matthew, however, has umask 077 I think, so for him the condition will trigger 
even when O is not set.

  The same would happen if there would be a symlink in $PWD.

> However, I'm still not sure how to fix this, either pass O=$(O)
> instead of O=$(realpath $(O))

  Wasn't the point of this patch to give O a full path? So skipping that would 
defeat the purpose...

> when re-entering make, or mkdir $(O)
> before re-entering make. (I still need to think/test about it).
> Any suggestions more than welcome.

  Perhaps the whole ifneq ("$(origin O)", "command line") section should move 
before the conditional recursion, so that we always pass the appropriate O= 
using EXTRAMAKEARGS. Of course, this means that CONFIG_DIR and NEED_WRAPPER have 
to be passed in EXTRAMAKEARGS as well. So it's a rather complicated change.


  Regards,
  Arnout


>
> Note: even after downgrading make to make-3.81, I still don't trigger
> this issue. I figured this out using this tricks [4]... :-/
>
> [2] https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html
> [3] http://man7.org/linux/man-pages/man3/realpath.3.html
> [4] http://code.bulix.org/epvj9d-94510?raw
>
> Regards,
>
>> --
>> Thanks,
>> Matt
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

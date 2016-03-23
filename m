From: Matthew Weber <matt@thewebers.ws>
Date: Tue, 22 Mar 2016 20:36:47 -0500
Subject: [Buildroot] [PATCH v7 03/18] core: re-enter make if $(CURDIR)
 or $(O) are not absolute canonical path
In-Reply-To: <CAFt09wNREbn8O=TxQB7hsugQ-6Y1-E4+K_Eyqr4yCD5WnKkdyQ@mail.gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-4-git-send-email-s.martin49@gmail.com>
 <CAFt09wNvtXGcfZ3PFZOgGu+bDvp6mEr44uwxa_ryjeP6DDQKBQ@mail.gmail.com>
 <CAFt09wOp3C44Y7WY48p2P9xKQr_EO7x_mAC7je--M0RwXc83sg@mail.gmail.com>
 <20160322220739.GA3441@free.fr>
 <CAFt09wPkL6Rvo_UUdk1UQ07bNphRTrn-yb=SqeZXLM8A0tNP8Q@mail.gmail.com>
 <CAFt09wNREbn8O=TxQB7hsugQ-6Y1-E4+K_Eyqr4yCD5WnKkdyQ@mail.gmail.com>
Message-ID: <CAFt09wO_+pp58gvF5L_u4apAf1HYReFhV+wqF6oy1fC6Qj-_Kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Samuel

On Tue, Mar 22, 2016 at 7:54 PM, Matthew Weber <matt@thewebers.ws> wrote:
> Yann, Samuel, All
>
> On Tue, Mar 22, 2016 at 6:11 PM, Matthew Weber <matt@thewebers.ws> wrote:
>> Yann, All
>>
>> On Tue, Mar 22, 2016 at 5:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>> Matthew, All,
>>>
>>> On 2016-03-20 20:45 -0500, Matthew Weber spake thusly:
>>>> On Sun, Mar 20, 2016 at 8:44 PM, Matthew Weber <matt@thewebers.ws> wrote:
>>>> > On Wed, Mar 9, 2016 at 4:58 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>>>> >> When $(CURDIR) or $(O) contain symlinks (or mount-bind) in their path,
>>>> >> they can be resolved differently, depending on each package build-system
>>>> >> (whether it uses the given paths or get the absolute canonical ones).
>>>> >>
>>>> >> Thus, to make easier tracking down host machine paths leaking into the
>>>> >> host, target or staging trees, the CURDIR and O variables are set to
>>>> >> their absolute canonical paths.
>>>> >>
>>>> >> Note that this change takes care of the makefile wrapper installed in
>>>> >> $(O) to avoid unneeded make recursion.
>>>> >>
>>>> >> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>>> >>
>>>> >> ---
>>>> >> changes v6->v7:
>>>> >> - none
>>>> >>
>>>> >> changes v5->v6:
>>>> >> - new patch
>>>> >> ---
>>>> >>  Makefile | 22 ++++++++++++++++++----
>>>> >>  1 file changed, 18 insertions(+), 4 deletions(-)
>>>> >>
>>>> >> diff --git a/Makefile b/Makefile
>>>> >> index 98c8dc7..52a92f6 100644
>>>> >> --- a/Makefile
>>>> >> +++ b/Makefile
>>>> >> @@ -26,16 +26,30 @@
>>>> >>
>>>> >>  # Trick for always running with a fixed umask
>>>> >>  UMASK = 0022
>>>> >> -ifneq ($(shell umask),$(UMASK))
>>>> >> +
>>>> >> +# Check if we need to re-enter make for one or several of the following reasons:
>>>> >> +# 1- Wrong (too restrictive) umask:
>>>> >> +#    This prevents Buildroot and packages from creating files and directories.
>>>> >> +# 2- CWD (i.e. $(CURDIR)) not being the absolute canonical path:
>>>> >> +#    This makes harder tracking and fixing host machine path leaks.
>>>> >> +# 3- Output location (i.e. $(O)) not being the absolute canonical path:
>>>> >> +#    This makes harder tracking and fixing host machine path leaks.
>>>> >> +#
>>>> >> +# Note:
>>>> >> +# - remove the trailing '/.' from $(O) as it can be added by the makefile
>>>> >> +#   wrapper installed in the $(O).
>>>> >> +ifneq ($(shell umask):$(CURDIR):$(patsubst %/.,%,$(O)),$(UMASK):$(realpath $(CURDIR)):$(realpath $(O)))
>>>> >>  .PHONY: _all $(MAKECMDGOALS)
>>>> >>
>>>> >>  $(MAKECMDGOALS): _all
>>>> >>         @:
>>>> >>
>>>> >>  _all:
>>>> >> -       @umask $(UMASK) && $(MAKE) --no-print-directory $(MAKECMDGOALS)
>>>> >> +       umask $(UMASK) && \
>>>> >> +               $(MAKE) -C $(realpath $(CURDIR)) --no-print-directory \
>>>> >> +                       $(MAKECMDGOALS) O=$(realpath $(O))
>>>> >
>>>> > I've applied your v7 patches with these changes to the tip of
>>>> > buildroot and currently run into the following error.  I'm still
>>>> > poking around trying to understand why.
>>>> >
>>>> > $ make V=1 qemu_x86_defconfig
>>>> > umask 0022 && \
>>>> >         make -C /opt/buildroot --no-print-directory \
>>>> >                 qemu_x86_defconfig O=
>>>
>>> Why are you opassing an empty O= option here?
>>>
>>
>> I'm not passing the O= .
>>
>> However, if I modify the patch and remove that from the target in the
>> Makefile ie. remove the "O=$(realpath $(O))" , things build ok.
>
> I tested this tonight on another server with Make version 3.81 and
> reproduced with a fresh buildroot checkout
> (f34c69da2bfa2a485671dbbcf1ee24ad7409b63b) plus applying the commit
> mentioned as the latest from Samuel's fork.
>
> Same behavior, if I edit the Makefile and remove the "O=$(realpath
> $(O))" , the defconfig sets up as expected

One additional detail, I cloned https://github.com/tSed/buildroot.git
and checkout c55eeee30fe6106354c0f2cb6ce6ecb46972503a.  Then "make
qemu_x86_defconfig" and reproduced it.  I'll start dissecting the
other commits past that one.  Something must be masking it.

-- 
Thanks,
Matt

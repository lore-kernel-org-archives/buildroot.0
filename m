From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 12 Mar 2016 09:48:17 +0100
Subject: [Buildroot] [PATCH v7 03/18] core: re-enter make if $(CURDIR)
 or $(O) are not absolute canonical path
In-Reply-To: <20160309231552.GE5634@free.fr>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-4-git-send-email-s.martin49@gmail.com>
 <20160309231552.GE5634@free.fr>
Message-ID: <CAHXCMM+nZmLjY25yAp-BX+NaG8eTDXXBPVy+1E1p+yJuVi7OhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Thu, Mar 10, 2016 at 12:15 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Samuel, All,
>
> On 2016-03-09 23:58 +0100, Samuel Martin spake thusly:
>> When $(CURDIR) or $(O) contain symlinks (or mount-bind) in their path,
>> they can be resolved differently, depending on each package build-system
>> (whether it uses the given paths or get the absolute canonical ones).
>>
>> Thus, to make easier tracking down host machine paths leaking into the
>> host, target or staging trees, the CURDIR and O variables are set to
>> their absolute canonical paths.
>>
>> Note that this change takes care of the makefile wrapper installed in
>> $(O) to avoid unneeded make recursion.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>
>> ---
>> changes v6->v7:
>> - none
>>
>> changes v5->v6:
>> - new patch
>> ---
>>  Makefile | 22 ++++++++++++++++++----
>>  1 file changed, 18 insertions(+), 4 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 98c8dc7..52a92f6 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -26,16 +26,30 @@
>>
>>  # Trick for always running with a fixed umask
>>  UMASK = 0022
>> -ifneq ($(shell umask),$(UMASK))
>> +
>> +# Check if we need to re-enter make for one or several of the following reasons:
>> +# 1- Wrong (too restrictive) umask:
>> +#    This prevents Buildroot and packages from creating files and directories.
>> +# 2- CWD (i.e. $(CURDIR)) not being the absolute canonical path:
>> +#    This makes harder tracking and fixing host machine path leaks.
>> +# 3- Output location (i.e. $(O)) not being the absolute canonical path:
>> +#    This makes harder tracking and fixing host machine path leaks.
>> +#
>> +# Note:
>> +# - remove the trailing '/.' from $(O) as it can be added by the makefile
>> +#   wrapper installed in the $(O).
>> +ifneq ($(shell umask):$(CURDIR):$(patsubst %/.,%,$(O)),$(UMASK):$(realpath $(CURDIR)):$(realpath $(O)))
>
> This is a bit difficult to parse. What about setting intermediate
> variables, like so:
>
>     CUR_UMASK := $(shell umask)
>     REAL_CURDIR := $(realpath $(CURDIR))
>     O := $(patsubst %/.,%,$(O))
>     REAL_O := $(realpath $(O))
>
>     ifneq ($(CUR_UMASK):$(CURDIR):$(O),$(UMASK):$(REAL_CURDIR):$(REAL_O))
Fair enough

>
>>  .PHONY: _all $(MAKECMDGOALS)
>>
>>  $(MAKECMDGOALS): _all
>>       @:
>>
>>  _all:
>> -     @umask $(UMASK) && $(MAKE) --no-print-directory $(MAKECMDGOALS)
>> +     umask $(UMASK) && \
>
> Please keep the command silent, do not remove the leading @
I'll fix it

Regards,

-- 
Samuel

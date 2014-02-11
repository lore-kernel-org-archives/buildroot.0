From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 10 Feb 2014 22:02:30 -0500
Subject: [Buildroot] [PATCH] qemu: add host/target Linux version check
In-Reply-To: <20140210204650.GD5239@free.fr>
References: <1391896471-28299-1-git-send-email-fhunleth@troodon-software.com>
 <52F90717.6010103@mind.be> <20140210204650.GD5239@free.fr>
Message-ID: <CA+-urNRg0pFocW0cSa=ZhMuXvz87+fd0ucoNhSCMw4WRbeo2zQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 10, 2014 at 3:46 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Arnout, Frank, All,
>
> On 2014-02-10 18:06 +0100, Arnout Vandecappelle spake thusly:
>> On 02/08/14 22:54, Frank Hunleth wrote:
> [--SNIP--]
>> > +   host_version_parts=`uname -r | sed 's/\-.*//g' | sed 's/\./ /g'` ;\
>> > +   host_version_code=0 ;\
>> > +   multiplier=65536 ;\
>> > +   for host_version_part in $$host_version_parts; do \
>> > +           host_version_code=`echo "$$host_version_code + $$host_version_part * $$multiplier" | bc` ;\
>> > +           multiplier=`echo "$$multiplier / 256" | bc` ;\
>>
>>  Even though we do put bc in our dependencies, I'd prefer to avoid
>> relying on it - not many people know it. Instead, I'd use either bash's
>> let builtin, or POSIX-compliant expr.
>
> POSIX defines (basic) mathematical expressions, eg:
>   multiplier=$((multiplier/256))
>
> See: The Open Group Base Specifications Issue 7, Shell Command Language:
>     http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_04

Thanks Arnout and Yann - I always learn something when I submit a
patch to this project.

Revised patch coming shortly...

>
>> > +   if test $$host_version_code -lt $$target_version_code ; then \
>> > +           echo "Refusing to install qemu-user since the target Linux version is newer" ;\
>> > +           echo "than the host's. Missing system calls will fail." ;\
>> > +           exit 1 ;\
>> > +   fi
>> > +endef
>> > +
>> > +HOST_QEMU_POST_BUILD_HOOKS += HOST_QEMU_LINUX_VERSION_CHECK
>>
>>  I think a pre-configure hook is more appropriate.
>
> Indeed.
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



-- 
Frank Hunleth
Troodon Software LLC
Embedded Software Development
http://troodon-software.com/

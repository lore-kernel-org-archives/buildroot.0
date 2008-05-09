From: Roman Bigler <roeme@roeme.ch>
Date: Fri, 9 May 2008 09:13:34 +0200
Subject: [Buildroot] Python package broken, Trying to fix, Need hints.
In-Reply-To: <c166aa9f0805081041u160d0e43p1f54004f694eb724@mail.gmail.com>
References: <A5E553DC-19FF-4F4E-817E-996DA88B2858@roeme.ch>
	<c166aa9f0805081041u160d0e43p1f54004f694eb724@mail.gmail.com>
Message-ID: <41779374-2FC6-48B1-903C-3C6E7DCAEDB5@roeme.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the fix the build process continues.

However, it still gives some errors:
<snip>
make[1]: Entering directory `/home/roeme/minim/buildroot/latest/ 
buildroot/build_i586/Python-2.4.2'
Parser/pgen ./Grammar/Grammar ./Include/graminit.h ./Python/graminit.c
make[1]: Parser/pgen: Command not found
make[1]: [Include/graminit.h] Error 127 (ignored)
Parser/pgen ./Grammar/Grammar ./Include/graminit.h ./Python/graminit.c
make[1]: Parser/pgen: Command not found
make[1]: [Python/graminit.c] Error 127 (ignored)

<...some output omitted...>

libpython2.4.a(main.o): In function `Py_Main':
Modules/main.c:355: undefined reference to `__fgetc_unlocked'
libpython2.4.a(tokenizer.o): In function `get_coding_spec':
Parser/tokenizer.c:232: undefined reference to `__ctype_b'
libpython2.4.a(tokenizer.o): In function `tok_get':
Parser/tokenizer.c:1229: undefined reference to `__ctype_b'
<...a bunch of more undef refs...>
<snap>

I'll try to find out what went wrong, if it's related buildroot, i'll
let the list know about my findings.

Thanks again for your help!

CC'ed to list for status update

On 08.05.2008, at 19:41, Andrew Dyer wrote:

> On Thu, May 8, 2008 at 9:51 AM, Roman Bigler <roeme@roeme.ch> wrote:
>> Hello List,
>>
>> in the last two days I've tried to use the python package, however,  
>> it
>> fails to build.
>> The build process barfs the following at me:
>> <snip>
>> make[1]: Leaving directory `/home/roeme/minim/buildroot/buildroot/
>> build_i586/Python-2.4.2'
>> /bin/sh: line 8: -/usr/bin/make: No such file or directory
>> make: *** [/home/roeme/minim/buildroot/buildroot/build_i586/
>> Python-2.4.2/.hostpython] Error 127
>> <snap>
>>
>> The error is reproduceable.
>>
>
> the patch fragment below fixes the build error for me and was posted
> to the list a couple of days ago.  I did not test the resulting
> executable.
>
> Index: package/python/python.mk
> ===================================================================
> --- package/python/python.mk    (revision 21884)
> +++ package/python/python.mk    (working copy)
> @@ -89,7 +89,7 @@
>               $(MAKE) python Parser/pgen && \
>               mv python hostpython && \
>               mv Parser/pgen Parser/hostpgen && \
> -               -$(MAKE) distclean \
> +               $(MAKE) distclean \
>       ) && \
>       touch $@
>
>
>
> -- 
> Hardware, n.:
> The parts of a computer system that can be kicked.

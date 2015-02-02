From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 2 Feb 2015 21:16:52 +0100
Subject: [Buildroot] LuaRocks package infrastructure oddities
In-Reply-To: <20150202112354.3524ea47@free-electrons.com>
References: <CAAMhL_STu2FpiW86rn_Tzi1jkqrBVQL3qHOmtW+vtYWuU_HPtQ@mail.gmail.com>
 <20150202112354.3524ea47@free-electrons.com>
Message-ID: <CAB0FRsubE3Fmk5xkHo57XoHWU85UfSFRjehuKymMAmVb-PGOig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-02-02 11:23 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Ivan Sergeev,
>
> Thanks for your feedback.
>
> On Sun, 1 Feb 2015 20:44:34 -0800, Ivan Sergeev wrote:
>> It seems that the LuaRocks package infrastructure expects to find the
>> LUAFOO_ROCKSPEC file inside the LUAFOO_SUBDIR sources directory of the
>> package to build it. This is a bit odd, as the rockspec is already
>> downloaded or extracted from the source rock in the parent directory
>> containing LUAFOO_SUBDIR, but the infrastructure relies on packages
>> including that rockspec in their sources.
>>
>> A condensed version of what the build appears to be doing is:
>>
>> wget http://rocks.moonscript.org/lua-periphery-1.0.4-1.src.rock -O
>> /path/to/buildroot/dl/ua-periphery-1.0.4-1.src.rock
>>
>> cd /path/to/buildroot/output/build/ && luarocks unpack --force
>> /path/to/dl/lua-periphery-1.0.4-1.src.rock
>>
>> at which point is has:
>>     output/build/lua-periphery-1.0.4-1/lua-periphery/  (the sources)
>>     output/build/lua-periphery-1.0.4-1/lua-periphery-1.0.4-1.rockspec (the
>> rockspec)
>>
>> but then it descends into the sources and expects to find and build the
>> rockspec file there:
>>
>> cd /path/to/buildroot/output/build/lua-periphery-1.0.4-1/lua-periphery &&
>> luarocks make --keep lua-periphery-1.0.4-1.rockspec
>>
>> This works for me and the other LuaRocks packages currently in buildroot,
>> because they happen to version the rockspec with the rest of the sources,
>> but in general it seems unusual. I've attached a full log of the build.
>
> For this part, I'll let Fran?ois Perrad answer. He is the author of the
> Buildroot luarocks infrastructure.
>

This BR infrastructure works with *.src.rock supplied by rock.moonscript.org .
The format of *.src.rock was designed by LuaRocks.org, not by BR.

Fran?ois

>> I've also noticed that legal-info licenses are stored one extra
>> subdirectory deep, at output/legal-info/licenses/luafoo/$LUAFOO_SUBDIR/,
>> e.g. lua-periphery below:
>>
>> $ make legal-info
>> $ tree output/legal-info/licenses
>> output/legal-info/licenses
>> ??? am33x-cm3
>> ?   ??? License.txt
>> ??? busybox
>> ?   ??? LICENSE
>> ??? linux
>> ?   ??? COPYING
>> ??? lua
>> ?   ??? COPYRIGHT
>> ??? lua-periphery
>> ?   ??? lua-periphery
>> ?       ??? LICENSE
>> ??? uboot
>> ?   ??? Licenses
>> ?       ??? gpl-2.0.txt
>> ??? uclibc
>>     ??? COPYING.LIB
>> $
>
> Yes, this is expected: we had some packages that were doing:
>
> <pkg>_LICENSE_FILES = foo/COPYING bar/COPYING
>
> I.e, they have two COPYING files, in two different sub-directories of
> the package sources. If we were to copy all license files directly in
> output/legal-info/licenses/<package-name>/, they would overwrite each
> other. So instead, we replicate the hierarchy of those files inside
> output/legal-info/licenses/<package-name>/.
>
> So indeed, the fact that luarocks packages are always in a subdir means
> that you have this situation for all lua packages, which gets back to
> your previous question.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

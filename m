From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue, 16 Jul 2019 22:56:42 +0200
Subject: [Buildroot] [PATCH 1/1] utils/checkpackagelib:
 CommentsMenusPackagesOrder: fix order of packages checking
In-Reply-To: <20190715203401.GO29941@scaer>
References: <20190715065253.6072-1-jerzy.m.grzegorek@gmail.com>
 <20190715203401.GO29941@scaer>
Message-ID: <9986d013-13e7-83a8-5cfc-f98f36020a51@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> Jerzy, All,
>
> On 2019-07-15 08:52 +0200, Jerzy Grzegorek spake thusly:
>> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> Please provide more information in the commit log. See below...
>
>> ---
>>   utils/checkpackagelib/lib_config.py | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
>> index f0edb9993d..a135355f9a 100644
>> --- a/utils/checkpackagelib/lib_config.py
>> +++ b/utils/checkpackagelib/lib_config.py
>> @@ -72,8 +72,8 @@ class CommentsMenusPackagesOrder(_CheckFunction):
>>           return len(self.state.split('-')) - 1
>>   
>>       def check_line(self, lineno, text):
>> -        if text.startswith("comment") or text.startswith("if") or \
>> -           text.startswith("menu"):
>> +        if text.startswith("comment ") or text.startswith("if ") or \
>> +           text.startswith("menu "):
> I guess this superseds Arnout's own patch?
>      http://lists.busybox.net/pipermail/buildroot/2019-July/254466.html

Ah yes, actually.
This change filters out lines starting with e.g.
menuconfig ...
from those starting with
menu "...
Only lines starting with "comment ", "if " or "menu " build new state
to track the depth of menus and conditions.

>
>>               if text.startswith("comment"):
>>                   if not self.state.endswith("-comment"):
>> @@ -103,7 +103,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
>>   
>>           elif text.startswith('\tsource "package/'):
>>               level = self.get_level()
>> -            new_package = text[17: -(len(self.filename)-5):]
>> +            new_package = text[17: -(len(self.filename)-self.filename.index("Config")+3):]
> I fail to see how the two changes are related. This should be explained
> in the commit log. If they are not fixing the same thing, it should be
> two commits.

This one only took into account files: package/Config.in and 
package/Config.in.host .
In case of file package/kodi/Config.in packages' names in lines have 
been cut off to much:
\tsource "package/kodi-audiodecoder-modplug/Config.in" -> 
kodi-audiodecoder-mo
\tsource "package/kodi-audiodecoder-nosefart/Config.in" -> 
kodi-audiodecoder-nos
\tsource "package/kodi-audiodecoder-opus/Config.in" -> kodi-audiodecoder
...
and after comparing it caused an issue.
Thanks for the review.

Regards,
Jerzy


>
> Regards,
> Yann E. MORIN.
>
>>               # We order _ before A, so replace it with .
>>               new_package_ord = new_package.replace('_', '.')
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot

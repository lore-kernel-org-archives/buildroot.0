From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Oct 2019 23:03:24 +0200
Subject: [Buildroot] [PATCH v2 08/13] package/Config.in: fix packages
 ordering
In-Reply-To: <23d8ddf3-7c51-e8e2-6679-ea856118670c@gmail.com>
References: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
 <20191005122227.7297-9-jerzy.m.grzegorek@gmail.com>
 <38a72d15-feb7-bed8-6920-b67c5df02004@mind.be>
 <23d8ddf3-7c51-e8e2-6679-ea856118670c@gmail.com>
Message-ID: <aa3ef488-89dd-ef87-940d-a07eac55dbd7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/10/2019 17:23, Jerzy Grzegorek wrote:
> Hi Arnout,
> 
>> ? Hi Jerzy,
>>
>> On 05/10/2019 14:22, Jerzy Grzegorek wrote:
>>> Fixes:
>>> package/Config.in:594: Packages in: menu "Interpreter languages and scripting",
>>> ??????????????????????? are not alphabetically ordered;
>>> ??????????????????????? first incorrect package: luajit ;
>>> ??????????????????????? this package, placed just before if statement,
>>> ??????????????????????? should match the one used in
>>> ??????????????????????? if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS
>>>
>>> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
>>> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
>>> ---
>>> ? package/Config.in | 2 +-
>>> ? 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/package/Config.in b/package/Config.in
>>> index b52b2a96e3..d540ac00bf 100644
>>> --- a/package/Config.in
>>> +++ b/package/Config.in
>>> @@ -591,7 +591,6 @@ endif
>>> ????? source "package/jimtcl/Config.in"
>>> ????? source "package/lua/Config.in"
>>> ????? source "package/luainterpreter/Config.in"
>>> -??? source "package/luajit/Config.in"
>> ? This change is not good. After this change, the Lua modules will appear *above*
>> luajit when luajit is selected, instead of below luajit like they should. In
>> other words, this patch should not be applied.
>>
>> ? Which also implies that the preceding patch (adding the check for conditions to
>> follow there 'source' statement) should be removed. I anyway don't think it's
>> that valuable: this is something that is easily caught during review (unlike the
>> alphabetical ordering in general).
> 
> 
> You're right. I will drop this patch.
> In the previous patch (patch 7) I will change the condition to
> if BR2_PACKAGE_FOO ...
> The condition is now met in all such cases.

 That doesn't really help... It *accidentally* happens to be the case that all
current conditions immediately follow the corresponding package include except
for lua, and it also happens that lua has this additional !static condition, so
by coincidence checking for pure 'if BR2_PACKAGE_FOO' solves it. But in general,
it is very well possible that we'll have other cases similar to lua where the
condition does not immediatel follow the package include.

 So I stand by my earlier statement that patch 7 and following should be removed.

 Regards,
 Arnout


> 
> Thanks for the review.
> 
> Regards,
> Jerzy
> 
> 
>>
>> ? Regards,
>> ? Arnout
>>
>>
>>> ? if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS
>>> ? # lua modules are dynamically loaded, so not available on static builds
>>> ? menu "Lua libraries/modules"
>>> @@ -671,6 +670,7 @@ menu "Lua libraries/modules"
>>> ????? source "package/xavante/Config.in"
>>> ? endmenu
>>> ? endif
>>> +??? source "package/luajit/Config.in"
>>> ????? source "package/micropython/Config.in"
>>> ????? source "package/micropython-lib/Config.in"
>>> ????? source "package/moarvm/Config.in"
>>>
> 

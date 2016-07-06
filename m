From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Wed, 6 Jul 2016 12:22:18 +0200
Subject: [Buildroot] [PATCH 1/2 v2] spidermonkey185: New package.
In-Reply-To: <CAGduivzTWqWi7kf7OWz19OwcpQLUJ50GOhbu3=30i8HbmvKNNw@mail.gmail.com>
References: <20160520162929.04ca1b1b@free-electrons.com>
 <1465483576-28267-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <1465483576-28267-2-git-send-email-nicolas.cavallari@green-communications.fr>
 <CAGduivxXrJYZRt28=TOTbtBcZ4yd5jYO1NkTV1M8fMgCbni-_w@mail.gmail.com>
 <7a047c02-21c4-0dc9-7e76-74e8335768d6@green-communications.fr>
 <CAGduivzTWqWi7kf7OWz19OwcpQLUJ50GOhbu3=30i8HbmvKNNw@mail.gmail.com>
Message-ID: <0dc17f18-b259-a618-67f3-099fd6ef0897@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/2016 13:03, Maxime Hadjinlian wrote:
> Hi Nicolas, all
> 
> On Tue, Jul 5, 2016 at 11:46 AM, Nicolas Cavallari
> <Nicolas.Cavallari@green-communications.fr> wrote:
>> On 04/07/2016 23:37, Maxime Hadjinlian wrote:
>>> Hi Nicolas, all,
>>>
>>> Thanks for your patch, I look forward to have spidermonkey, because we
>>> can then update polkit, which is a long standing issue for me.
>>> My comments are inline.
>>>
>>> Some of your patches did not apply on the sources, I would recommend
>>> that you  extract the sources, then move the directory somehere and do
>>> a 'git init' then 'git add . && git commit -m "init"' and work in that
>>> directory, when you are finished you can use 'git format-patch HEAD~n'
>>> and collect your patch in a mailbox format.
>>
>> It works for me. How/why does it fails for you ?
> There's two problem on my side.
> First when I try to git-am your patch on top of the actual master I get this:
> 
> Applying patch #632988 using 'git am -s'
> Description: [1/2,v2] spidermonkey185: New package.
> Applying: spidermonkey185: New package.
> .git/rebase-apply/patch:93: space before tab in indent.
>   mv -f $(SHLIB_ANY_VER) $(SHLIB_EXACT_VER)

I am patching a makefile. The makefile is obviously indented with
tabs, and diff add a space at the beggining of context lines.

> .git/rebase-apply/patch:94: space before tab in indent.
>   @[ ! -h $(SHLIB_ABI_VER) ] || rm -f $(SHLIB_ABI_VER)
> .git/rebase-apply/patch:121: trailing whitespace.
> 
> .git/rebase-apply/patch:146: trailing whitespace.
> 
> .git/rebase-apply/patch:163: trailing whitespace.
> 

Those are context empty lines.

> error: patch failed: package/Config.in:1284
> error: package/Config.in: patch does not apply
> Patch failed at 0001 spidermonkey185: New package.
> The copy of the patch that failed is found in: .git/rebase-apply/patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 
> So I have to use patch -p1 to apply it by hand, I removed my git
> configuration but to no avail.
> 
> The second part is Buildroot applying the patches in your patch but it
> appears to be something in my git config, probably because there's
> some line ending mixes between Windows/Linux or things like that.
> I am using git.core.apply.whitespace=fix, maybe that's not an important issue.

If you "fix" the white space in these patch files, they obviously
won't apply anymore.

>>>> diff --git a/package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch b/package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch
>>>> new file mode 100644
>>>> index 0000000..cef1aae
>>>> --- /dev/null
>>>> +++ b/package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch
>>>> @@ -0,0 +1,18 @@
>>>> +From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>>>> +
>>>> +Remove the dependency on nspr.
>>>> +
>>>> +This dependency was removed when spidermonkey was extracted from the
>>>> +mozilla code base.  This is probably a left-over, since it is not used.
>>>> +
>>>> +Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>>>> +
>>>> +--- spidermonkey185-1.0.0/js/src/mozjs185.pc.in        2016-05-23 13:41:28.430466213 +0200
>>>> ++++ spidermonkey185-1.0.0/js/src/mozjs185.pc.in        2016-05-23 13:42:00.727558977 +0200
>>>> +@@ -5,6 +5,5 @@
>>>> + Name: SpiderMonkey 1.8.5
>>>> + Description: The Mozilla library for JavaScript 1.8.5
>>>> + Version: %MOZILLA_VERSION%
>>>> +-Requires: nspr >= 4.7
>>>> + Libs: -L${libdir} -lmozjs185
>>>> + Cflags: -I${includedir}/js
>>>> diff --git a/package/spidermonkey185/0002-make-shlib-synlink-relative.patch b/package/spidermonkey185/0002-make-shlib-synlink-relative.patch
>>>> new file mode 100644
>>>> index 0000000..c6bdce9
>>>
>>> When I quickly grepped through the source, you can still find:
>>> js/jsd/jsd_xpc.h:47:#include "nspr.h"
>>>
>>> Won't that cause trouble ? Since we have libnspr, why don't we add the
>>> dependencies and be done with it ?
>>
>> Anything outside of js/src is ignored.  Specifically, js/jsd has no
>> complete build system (there is Makefile.in, but no configure script),
>> so it cannot cause any problem.
>>
>> And why should we re-add libnspr when upstream did massive patches to
>> get rid of it, even if they missed some places ?
> Ok, it's indeed a small patch and if the file in question is not even
> touched there's no harm.
> There's no link to what does upstream as it's a deprecated version and
> it will never be updated anymore.

The spidermonkey code base heavily depended on nspr, especially its
various integer typedefs which were sprinkled everywhere.  To release
an independent javascript engine, almost all the source code had to be
converted to use the JSInt* typedefs. There are even some conversion
scripts left in the tarball.

Even if upstream stopped updating this package, the removal of the
nspr dependency is still 99.9% complete.

Anyway, here are the V3 of the patches.

From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Sep 2015 22:52:39 +0200
Subject: [Buildroot] [PATCHv2] package/kodi: needs .py modules
In-Reply-To: <20150915200353.GB3650@free.fr>
References: <1442178783-27567-1-git-send-email-yann.morin.1998@free.fr>
 <55F8493C.2030804@mind.be> <20150915200353.GB3650@free.fr>
Message-ID: <55F88517.9050306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-09-15 22:03, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-09-15 18:37 +0200, Arnout Vandecappelle spake thusly:
>> On 13-09-15 23:13, Yann E. MORIN wrote:
>>> Kodi segfaults as soon as it tries to load a python module:
>>>
>>>     Could not find platform independent libraries <prefix>
>>>     Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
>>>     ImportError: No module named site
>>>     Segmentation fault
>>>
>>> Turns out that keeping .py modules (with or without .pyc) fixes the
>>> issue.
>>>
>>> Currently, Kodi selects python, but since the format of modules is a
>>> choice, we can not select it.
>>
>>  I think it's a lot more user-friendly to do
>>
>> 	select BR2_PACKAGE_PYTHON_PY_PYC
> 
> Two problems with that option:
>   - first, it is not acceptable; one must *not* select a symbol that is
>     part of a choice
>   - Kconfig won't even act on that select, in fact:

 I guess 1 is a result of 2, right? Stupid Kconfig.

 In that case, there really is no alternative except what you propose. The
ugliness of BR2_PACKAGE_PYTHON_WANTS_PY is too horrible to even consider.

 Well, perhaps better would be to make kodi not crash in PYC_ONLY :-)

 Regards,
 Arnout


> 
>     $ cat select-choice.in
>     config FOO
>         bool "foo"
>         select BAR_B
>     
>     choice BAR
>         bool "bar"
>     
>     config BAR_A
>         bool "bar-a"
>     
>     config BAR_B
>         bool "bar-b"
>     
>     config BAR_C
>         bool "bar-c"
>     
>     endchoice
> 
>     $ cat .config
>     #
>     # Automatically generated file; DO NOT EDIT.
>     # Configuration
>     #
>     CONFIG_FOO=y
>     CONFIG_BAR_A=y
>     # CONFIG_BAR_B is not set
>     # CONFIG_BAR_C is not set
> 
> So, as you can see, even though FOO is set, BAR_B is not, even though
> FOO selects it.
> 
>>  That removes the possibility for the user to select the PY_ONLY option, but I
>> don't think that that's so terribly important. And it does make life a whole lot
>> simpler for someone who wants to select Kodi. They already have to go and enable
>> an EGL provider, so let's not make their life harder by requiring manual
>> selection of python with the correct, non-default _PY_PYC option...
> 
> One alternative (if we are *that* concerned with user-friendliness),
> would be to introduce an intermediate symbol that allows to get rid of
> .py, something like:
> 
>     config BR2_PKG_PYTHON_WANTS_PY
>         bool
> 
>     choice
>         bool "module fomat"
> 
>     config BR2_PKG_PYTHON_PY_ONLY
>         bool ".py only"
> 
>     config BR2_PKG_PYTHON_PYC_ONLY
>         bool ".pyc only"
>         depends on !BR2_PKG_PYTHON_WANTS_PY
> 
>     endchoice
> 
> (note: .py+.pyc option voluntarily omitted).
> 
> and then Kodi would select BR2_PKG_PYTHON_WANTS_PY.
> 
> But that's just ugly, even just for the sake of simplicity.
> 
> Regards,
> Yann E. MORIN.
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

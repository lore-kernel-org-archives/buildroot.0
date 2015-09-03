From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 4 Sep 2015 00:19:07 +0200
Subject: [Buildroot] [PATCH] pkg-generic: fix <pkg>-legal-info target
In-Reply-To: <20150903143043.GJ18583@tarshish>
References: <217433bd5ec057444b036dd8b72778f078f0926e.1441213919.git.baruch@tkos.co.il>
 <55E85556.4030103@lucaceresoli.net> <20150903143043.GJ18583@tarshish>
Message-ID: <55E8C75B.5080008@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch,

Baruch Siach wrote:
> Hi Luca,
>
> On Thu, Sep 03, 2015 at 04:12:38PM +0200, Luca Ceresoli wrote:
>> Baruch Siach wrote:
>>> When making the <pkg>-legal-info target before the main legal-info target, the
>>> following error shows:
>>>
>>> /bin/sh: /home/baruch/git/buildroot/output/legal-info/licenses.txt: No such file or directory
>>> package/freescale-imx/imx-vpu/imx-vpu.mk:39: recipe for target 'imx-vpu-legal-info' failed
>>> make: *** [imx-vpu-legal-info] Error 1
>>>
>>> Make <pkg>-legal-info depend on legal-info-prepare to ensure that
>>> $(LEGAL_INFO_DIR) exists when generating licenses.txt.
>>>
>>> Cc: Luca Ceresoli <luca@lucaceresoli.net>
>>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>>> ---
>>>   package/pkg-generic.mk | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>>> index 6a7d97efdf02..24b473b13ff2 100644
>>> --- a/package/pkg-generic.mk
>>> +++ b/package/pkg-generic.mk
>>> @@ -715,7 +715,7 @@ endif
>>>   endif
>>>
>>>   # legal-info: produce legally relevant info.
>>> -$(1)-legal-info:
>>> +$(1)-legal-info: legal-info-prepare
>>
>> Very weird, I can reproduce the bug, but only for packages under
>> package/freescale/, like imx-vpu. I tested a dozen other packages, and
>> they all work fine. My test command is:
>>
>>    git clean -xdf && make defconfig && \
>>      make BR2_DL_DIR=~/src ${PKG}-legal-info
>>
>> Any idea of why these packages are special?
> Which target creates the legal-info/ directory in the successful (non
> freescale) case?

Aah, yes, now I got it! Freescale packages have <PKG>_REDISTRIBUTE =
NO. This makes a difference in package/pkg-generic.mk, around line 710:

ifeq ($$($(2)_REDISTRIBUTE),YES)
...
$(1)-legal-info: $(1)-source $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
...
endif

Which creates output/legal-info/sources/, thus output/legal-info/ is
there as well and licenses.txt can be written, but not for
no-redistribute packages.

But let's see the issue from a more general point of view.

Note that calling <PKG>-legal-info is not really working in general,
since it does not understand whether it has already been run.
E.g. calling 'make busybox-legal-info; make busybox-legal-info'
produces, with your patch:

$ cat output/legal-info/manifest.csv
"PACKAGE","VERSION","LICENSE","LICENSE FILES","SOURCE ARCHIVE","SOURCE SITE"
"busybox","1.23.2","GPLv2","LICENSE","busybox-1.23.2.tar.bz2","http://www.busybox.net/downloads"
"PACKAGE","VERSION","LICENSE","LICENSE FILES","SOURCE ARCHIVE","SOURCE SITE"
"busybox","1.23.2","GPLv2","LICENSE","busybox-1.23.2.tar.bz2","http://www.busybox.net/downloads"

and without it:

$ cat output/legal-info/manifest.csv
"busybox","1.23.2","GPLv2","LICENSE","busybox-1.23.2.tar.bz2","http://www.busybox.net/downloads"
"busybox","1.23.2","GPLv2","LICENSE","busybox-1.23.2.tar.bz2","http://www.busybox.net/downloads"

Both results are "wrong", in that they produce duplicates.

If we really want to support this use case, a .stamp_legal_info would
be needed.

The only use case that works now is the full 'make legal-info', which
"executes" legal-info-clean, then legal-info-prepare, then
<PKG>-legal-info (via <PKG>-all-legal-info) for all packages, exactly
in that order.

This raises a couple of questions.

First, why do we have <pkg>-legal-info in 'make help' at all?

Arnout, you wrote that line in the help text, after a discussion IIRC.
Do you remember a good reason _not_ to remove it?

Second, is Baruch's patch (or any variation) to be committed?

A first sight I think it should, since 'make <PKG>-legal-info' might be
useful for testing a package legal info. But  I'm not sure the
duplicate results make things clearer or the foggier for the package
recipe developer.

The alternative is to leave the code as is, and clearly state
<PKG>-legal-info cannot be called.

However, if we want a patch, I think we should simply depend on
$(LEGAL_INFO_DIR), not on legal-info-prepare. The latter is too much,
and produces more duplicated lines.

-- 
Luca

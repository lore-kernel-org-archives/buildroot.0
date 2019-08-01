From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 1 Aug 2019 11:12:09 +0200
Subject: [Buildroot] [PATCH v3] package/libnss: use correct CFLAGS and
 LDFLAGS
In-Reply-To: <20190801005200.23317a95@windsurf.home>
References: <20190729142610.21331-1-giulio.benetti@micronovasrl.com>
 <20190801005200.23317a95@windsurf.home>
Message-ID: <93e84376-9b70-a3d4-422a-ceb3eadc71a6@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 01/08/2019 00:52, Thomas Petazzoni ha scritto:
> Hello Giulio,
> 
> On Mon, 29 Jul 2019 16:26:10 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> Actually libnss is configure with BUILD_OPT=1 that doesn't take into
>> account TARGET_CFLAGS nor TARGET_LDFLAGS resulting in pre-chosen
>> optimizations and debugging symbols.
>>
>> Can't pass TARGET_CFLAGS through CFLAGS or similar otherwise other
>> internal libnss one will be overwritten(i.e. -fPIC), so prefer to append
>> TARGET_CFLAGS at the end of Linux.mk as well as TARGET_LDFLAGS according
>> to internal libnss Makefile system's names. And obviously remove
>> BUILD_OPT=1 from BUILD_VARS. This reveals hidden bugs when building
>> with -Os due to uninitialized variables so add patches to fix those
>> bugs.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> In fact, after inspecting more closely those uninitialized warnings
> from gcc, they are bogus. The variables are properly initialized, it's
> just gcc that goes nuts. 

This is what I thought in the beginning but after trying and retrying 
I've found that those warnings were correct! And indeed...

> So the proper fix is not to change the libnss
> code, and your patches are most likely going to be rejected upstream
> (with good reason).

...they have all been upstreamed:
https://hg.mozilla.org/projects/nss/log?rev=Giulio+Benetti

They all have been discussed here:
https://bugzilla.mozilla.org/buglist.cgi?emailcc1=1&list_id=14831966&emaillongdesc1=1&emailtype1=exact&emailassigned_to1=1&short_desc_type=allwordssubstr&email1=giulio.benetti%40micronovasrl.com&emailbug_mentor1=1&emailreporter1=1&short_desc=Remove%20-Wmaybe-uninitialized%20warning&resolution=FIXED&classification=Client%20Software&classification=Developer%20Infrastructure&classification=Components&classification=Server%20Software&classification=Other&query_format=advanced&emailqa_contact1=1&product=NSS

The first and more ambiguos warning was this:
https://bugzilla.mozilla.org/show_bug.cgi?id=1561548
It sent me nut, not gcc :)
But in the end it was correct.

> So instead, I've dropped all of the patches, and simply passed
> NSS_ENABLE_WERROR=0 for both the target and host builds. This way
> -Werror is not passed, and those warnings become just warnings.

I'd say to keep as it is for the moment and when NSS_3_46 will be 
released(soon) it will contain all patches we will remove 
NSS_ENABLE_WERROR=0.

What do you think?

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

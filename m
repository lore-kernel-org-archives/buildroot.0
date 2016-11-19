From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 19 Nov 2016 21:55:19 +0100
Subject: [Buildroot] Analysis of autobuild failures 18-19/11
In-Reply-To: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
References: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
Message-ID: <11701811-0b8f-ef00-7c18-3846251d676d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for looking at these issues :)

Le 19/11/2016 ? 20:23, Arnout Vandecappelle a ?crit :
>  Hi all,
> 
>  Here's an analysis of autobuild failures. It looks a bit different from what
> Thomas usually sends because I based it on the website rather than the mail. I
> eliminated the ones that are already fixed in git, and also the powerpc64le
> failures that are due to libtool.m4.
> 
>  I'm not putting the people from get-developers in Cc, because they already get
> these mails.
> 
> http://autobuild.buildroot.net/results/58209c053c5d4b8f959ccf3645b03d7c959c737c
> arm / arm926ej-s	guile-2.0.13	glibc	
> http://autobuild.buildroot.net/results/b94b3ebc9e7bcc60b83e9dffc8cb276c6ee5bec5
> arm / arm926ej-s	guile-2.0.13	glibc	
> http://autobuild.buildroot.net/results/1c1bf79024d6d7aab1fc4c1e932768d975933af4
> arm / arm926ej-s	guile-2.0.13	glibc	
> 
>> foreign.c:801:***Mismatching FUNC_NAME.  Should be: `#define FUNC_NAME s_scm_i_pointer_to_procedure'
>> memoize.c:515:***Mismatching FUNC_NAME.  Should be: `#define FUNC_NAME s_"@prompt"'
>> net_db.c:468:***Missing or erroneous `#define FUNC_NAME s_AI_ADDRCONFIG);'
>> net_db.c:488:***Missing or erroneous #undef for AI_ADDRCONFIG);: 
>> /tmp/ccNL6XFZ.s: Assembler messages:
>> /tmp/ccNL6XFZ.s:9561: Error: bad immediate value for offset (4100)
>> Makefile:3210: recipe for target 'libguile_2.0_la-vm.lo' failed
>> make[4]: *** [libguile_2.0_la-vm.lo] Error 1
> 
>  Needs investigation.

I recently added an autobuilder exception to disable the
armv5-ctng-linux-gnueabi toolchain with guile package. Autobuilder maintainers
must update their autobuild-run script.
The issue is related to Os optimization with an old binutils < 2.25.

There is the same issue with the CS ARM 2014.05 which was fixed in guile.mk by:

# Triggers assembler error with -Os
ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM)$(BR2_OPTIMIZE_S),yy)
GUILE_CFLAGS += -O2
endif

> 
> http://autobuild.buildroot.net/results/f2a001031af381388cff71b4de1103fc11e08239
> xtensa	jack2-v1.9.10	uclibc	
> 
>> ../dbus/sigsegv.c: In function 'signal_segv':
>> ../dbus/sigsegv.c:110:20: error: 'NGREG' undeclared (first use in this function)
>>      for(i = 0; i < NGREG; i++)
>>                     ^
>> ../dbus/sigsegv.c:110:20: note: each undeclared identifier is reported only once for each function it appears in
>> ../dbus/sigsegv.c:119:38: error: 'mcontext_t {aka struct sigcontext}' has no member named 'gregs'
>>                  ucontext->uc_mcontext.gregs[i]
> 
>  Lots of similar failures exist with uClibc, but only on xtensa and arc.
> Incomplete / incompatible struct sigcontext definition maybe? Waldemar?

There is a patch submitted by Bernd and Thomas ('NGREG' undeclared):
http://lists.busybox.net/pipermail/buildroot/2016-May/161785.html

Best regards,
Romain

>  I'll try to do some of the low hanging fruit tomorrow.
> 
>  Regards,
>  Arnout
> 

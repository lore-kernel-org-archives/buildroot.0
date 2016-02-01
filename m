From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 1 Feb 2016 19:30:35 +0100
Subject: [Buildroot] [RFC] package/gdb: simplify the disable doc hook
In-Reply-To: <20160201160123.15b3470f@free-electrons.com>
References: <1454336547-23655-1-git-send-email-romain.naour@gmail.com>
 <20160201160123.15b3470f@free-electrons.com>
Message-ID: <56AFA44B.3030804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-02-16 16:01, Thomas Petazzoni wrote:
> Romain,
> 
> On Mon,  1 Feb 2016 15:22:27 +0100, Romain Naour wrote:
> 
>> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
>> index 3b0f501..65b2e67 100644
>> --- a/package/gdb/gdb.mk
>> +++ b/package/gdb/gdb.mk
>> @@ -53,13 +53,8 @@ endif
>>  
>>  # Prevent gdb to build the documentation
>>  define GDB_DISABLE_DOC
>> -	$(SED) '/^SUBDIRS =/ s/doc//' $(@D)/gdb/Makefile.in
>> -	if test -e $(@D)/bfd/doc/Makefile.in ; then \
>> -		$(SED) 's/^INFO_DEPS =.*$$/INFO_DEPS =/' $(@D)/bfd/doc/Makefile.in ; \
>> -	fi
>> -	if test -e $(@D)/gprof/Makefile.in ; then \
>> -		$(SED) 's/^INFO_DEPS =.*$$/INFO_DEPS =/' $(@D)/gprof/Makefile.in ; \
>> -	fi
>> +	echo "#!/bin/sh" > $(@D)/missing
>> +	echo "exit 0" >> $(@D)/missing
> 
> Is "missing" only used to check for makeinfo, or also for other things ?
> 
> We also have makeinfo related hacks in the gcc and binutils packages,
> which basically consists in pointing them to "missing" as being the
> makeinfo program.

 IUC, the 'missing' program will only be used if there is no makeinfo installed
on the system. So if your build host happens to have makeinfo, the documentation
will be built after all.

 I don't think that is a good thing, so ac_cv_prog_MAKEINFO=missing should
probably be added as well...

> 
> It is really annoying that we have to do those hacks :-/

 Maybe an easier workaround is to add a directory support/wrappers in the PATH
that has empty definitions or other wrappers for programs that we want to work
around.

 Regards,
 Arnout

> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

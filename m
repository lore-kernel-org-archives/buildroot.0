From: Martin Kepplinger <martink@posteo.de>
Date: Sun, 03 Mar 2019 14:57:14 +0100
Subject: [Buildroot] [PATCH v2] make printvars: avoid invalid calls when
 arguments are missing
In-Reply-To: <20190303132329.GH2721@scaer>
References: <20190303114916.28824-1-martink@posteo.de>
 <20190303132329.GH2721@scaer>
Message-ID: <869DDE67-B3D6-4EFB-8007-B5D128969431@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 3. M?rz 2019 14:23:29 MEZ schrieb "Yann E. MORIN" <yann.morin.1998@free.fr>:
>Martin, All,
>
>On 2019-03-03 12:49 +0100, Martin Kepplinger spake thusly:
>> during "make printvars > compare" the following error occurs -
>> reproducible after any "make *_defconfig":
>> 
>> /bin/bash: support/dependencies/check-host-.sh: no such file or
>directory
>> /bin/bash: -c: line 0: syntax error: ')' unexpected
>> /bin/bash: -c: line 0: `set -e; TMP="$(mktemp)"; if () >/dev/null
>2>&1; then echo ""; else echo ""; fi;
>> 
>> which is 2 errors, resulting from $(1) arguments being empty, but
>> called anyway. So this simply skips parts when otherwise we would
>exit
>> when wrong scripts are tried be executed.
>
>Actually, there are many more such spurious errors, depending on the
>configuration you use. For example, my current .config, which is not
>even
>yet built (i.e. I ran 'make foo_defconfig; make printvars >/dev/null'),
>yields:
>
>/bin/sh: /home/ymorin/dev/buildroot/O/host/bin/pkg-config: No such file
>or directory
>/bin/sh: /home/ymorin/dev/buildroot/O/host/bin/pkg-config: No such file
>or directory
>/bin/sh: /home/ymorin/dev/buildroot/O/host/bin/pkg-config: No such file
>or directory
>/bin/sh: /home/ymorin/dev/buildroot/O/host/bin/pkg-config: No such file
>or directory
>/bin/sh: /home/ymorin/dev/buildroot/O/host/bin/pkg-config: No such file
>or directory
>/bin/sh: /home/ymorin/dev/buildroot/O/host/bin/pkg-config: No such file
>or directory
>/bin/sh: /home/ymorin/dev/buildroot/O/host/bin/pkg-config: No such file
>or directory
>/bin/sh: /home/ymorin/dev/buildroot/O/host/bin/pkg-config: No such file
>or directory
>/bin/sh: /home/ymorin/dev/buildroot/O/host/bin/pkg-config: No such file
>or directory
>/bin/sh: /home/ymorin/dev/buildroot/O/host/bin/pkg-config: No such file
>or directory
>    sed: can't read ./.config: No such file or directory
>    sed: can't read ./.config: No such file or directory
>    sed: can't read ./.config: No such file or directory
>    sed: can't read ./.config: No such file or directory
>    sed: can't read ./.config: No such file or directory
>    make[1]: support/dependencies/check-host-.sh: Command not found
>    /bin/sh: -c: line 0: syntax error near unexpected token `)'
>/bin/sh: -c: line 0: `set -e; TMP="$(mktemp)"; if () >/dev/null 2>&1;
>then echo ""; else echo ""; fi; rm -f "$TMP"'
>
>And I'm pretty sure I'm not even getting everyone of them, as this
>.config is neither using an external toolchain, nor building a kernel
>or
>any other kconfig package, where we also call a lot of different macros
>as well...
>
>So, before trying to hide those errors under the rug, I'd prefer we
>udnerstand actually *why* they are reported in the first place: When
>doing a normal build, there is no such error being displayed, so why
>are
>they displayed when doing printvars?
>
>The reason is that we use a lot of internal macros. In Makefiles, a
>macro is just a variable, except it is not meant to be evaluate with
>$(...) like other variables, but it is expected to be called with
>$(call ...) instead, which will set the special variables $(1), $(2)
>etc...
>
>And then, macros may call to the shell, either explicitly by way of
>$(shell ...) or implicitly because it contains shell evaluation `...`.
>
>However, when we call printvars, all variables get evaluated with
>$(...), because we have *no* way of knowing whether a variable is
>indeed
>a variable or a macro.
>
>So, obviously, we end up evaluating variables which are instead
>supposed
>to be called, and we end up with those spurious error messages.
>
>And when that macro would call to the shell, we get those spurious
>errors.
>
>In my opinion, whe should not try to hide those messages, because:
>
>  * it makes the code heavier and harder to read and maintain. For
>    example, the next developer who looks at try-run would be very
>    tempted to wonder why-on-earth that macro tests whether it has
>    an argument (i.e. it is called or evaluated), as this is not
>    customary to do so, usually, and thus they would be tempted, and
>    rightfully so, to send a patch to remove the test.
>
>  * it is easy to add even more such macros, either in the infra or in
>   packages, and especially in packages in br2-external, and there will
>   always be such spurious error messages, because see above, it is not
>    customary to test the macro parameters.
>
>So, I'd be tempted to just live with that situation, and add a small
>explanation why there might be errors, and list the usual ones.
>

I totally think so too. Could you add a note about this to the docs?

thanks


>Regards,
>Yann E. MORIN.
>
>> When comparing the outputs, this removes "host-lzip" from all
>packages'
>> *EXTRACT_DEPENDENCIES.
>> 
>> Signed-off-by: Martin Kepplinger <martink@posteo.de>
>> ---
>> 
>> hi,                                                                  
>          
>>                                                                      
>          
>> ok so this neither breaks my build and "make printvars" succeeds too.
>When      
>> comparing "make printvars" output now, "host-lzip" is _removed_ from
>all        
>> packages' dependiencies (in contrast to the previous patch). 
>> 
>> thanks
>> 
>>                             martin
>> 
>> 
>> 
>>  package/Makefile.in                  | 8 ++++----
>>  support/dependencies/dependencies.mk | 2 +-
>>  2 files changed, 5 insertions(+), 5 deletions(-)
>> 
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index dc818a2c18..ae1e2e16f6 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -232,18 +232,18 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib
>-Wl,-rpath,$(HOST_DIR)/lib
>>  # Usage: option = $(call try-run, $(CC)...-o
>"$$TMP",option-ok,otherwise)
>>  # Exit code chooses option. "$$TMP" is can be used as temporary file
>and
>>  # is automatically cleaned up.
>> -try-run = $(shell set -e;               \
>> +try-run = $(if $(1), $(shell set -e;	\
>>  	TMP="$$(mktemp)";               \
>>  	if ($(1)) >/dev/null 2>&1;      \
>>  	then echo "$(2)";               \
>>  	else echo "$(3)";               \
>>  	fi;                             \
>> -	rm -f "$$TMP")
>> +	rm -f "$$TMP"))
>>  
>>  # host-cc-option
>>  # Usage: HOST_FOO_CFLAGS += $(call host-cc-option,-no-pie,)
>> -host-cc-option = $(call try-run,\
>> -        $(HOSTCC) $(HOST_CFLAGS) $(1) -c -x c /dev/null -o
>"$$TMP",$(1),$(2))
>> +host-cc-option = $(if $(1), $(call try-run,\
>> +        $(HOSTCC) $(HOST_CFLAGS) $(1) -c -x c /dev/null -o
>"$$TMP",$(1),$(2)))
>>  
>>  
>>  # host-intltool should be executed with the system perl, so we save
>> diff --git a/support/dependencies/dependencies.mk
>b/support/dependencies/dependencies.mk
>> index 4fac5c731b..c53bbe01ce 100644
>> --- a/support/dependencies/dependencies.mk
>> +++ b/support/dependencies/dependencies.mk
>> @@ -15,7 +15,7 @@ else
>>  # script should use 'which' to find a candidate. The script should
>return
>>  # the path to the suitable host tool, or nothing if no suitable tool
>was found.
>>  define suitable-host-package
>> -$(shell support/dependencies/check-host-$(1).sh $(2))
>> +$(if $(1), $(shell support/dependencies/check-host-$(1).sh $(2)))
>>  endef
>>  endif
>>  # host utilities needs host-tar to extract the source code tarballs,
>so
>> -- 
>> 2.20.1
>> 

-- 
Martin Kepplinger
sent from mobile

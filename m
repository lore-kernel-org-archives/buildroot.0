From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 8 Feb 2018 18:39:55 +0100
Subject: [Buildroot] [PATCH v2] ejabberd: Bump to version 17.11
In-Reply-To: <CAJtjsKZ6dGEwjh-UhQPSsKdX+kwAcvQOUw2fExJ7hVkP_wbVQA@mail.gmail.com>
References: <20180119162931.27721-1-johan.oudinet@gmail.com>
 <20180129222937.31264d2d@windsurf.lan>
 <CAJtjsKZ6dGEwjh-UhQPSsKdX+kwAcvQOUw2fExJ7hVkP_wbVQA@mail.gmail.com>
Message-ID: <89231559-4423-6520-8d39-afe3fab0d5dc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-02-18 17:30, Johan Oudinet wrote:
> Hi Thomas,
> 
> On Mon, Jan 29, 2018 at 10:29 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> On Fri, 19 Jan 2018 17:29:31 +0100, Johan Oudinet wrote:
>>> -EJABBERD_ERLANG_LIBS = sasl crypto public_key ssl mnesia inets compiler
>>> +# Install check-erlang-lib script to the directory in which the
>>> +# package has been uncompressed, so it is available during the
>>> +# configure step.
>>> +define EJABBERD_INSTALL_CHECK_ERLANG_LIB
>>> +     $(INSTALL) -m 0755 $(EJABBERD_PKGDIR)/check-erlang-lib \
>>> +             $(@D)/check-erlang-lib
>>> +endef
>>> +
>>> +EJABBERD_POST_EXTRACT_HOOKS += EJABBERD_INSTALL_CHECK_ERLANG_LIB
>>> +
>>> +EJABBERD_ERLANG_LIBS = sasl public_key mnesia inets compiler
>>>
>>>  # Guess answers for these tests, configure will bail out otherwise
>>>  # saying error: cannot run test program while cross compiling.
>>>  EJABBERD_CONF_ENV = \
>>>       ac_cv_erlang_root_dir="$(HOST_DIR)/lib/erlang" \
>>>       $(foreach lib,$(EJABBERD_ERLANG_LIBS), \
>>> -             ac_cv_erlang_lib_dir_$(lib)="`package/ejabberd/check-erlang-lib $(lib)`")
>>> +             ac_cv_erlang_lib_dir_$(lib)="`./check-erlang-lib $(lib)`")
>>
>> Why did you change the location of check-erlang-lib ? What was the
>> problem ? It looked like a good idea to directly used it from
>> package/ejabberd/ instead of copying it.
>>
>> Could you explain this ?
> 
> I changed it because I got "package/ejabberd/check-erlang-lib: command
> not found" during the configure step.
> I guess it is not necessarily in the PATH and the configure is done
> inside $(@D).
> TBH, I don't understand why this was working before.

 Originally, this was done with $(shell ....) so it would have worked. Two years
ago, in commit 7d69a79624b1f (signed off by yours truly) all the $(shell ...)
constructs were replaced with backticks `` and it stopped working. So it just
means all those variables would have been empty (the error messages would have
been visible on stderr but nobody looks at them). And I guess that the libraries
are just in default locations so it still works even if the lib_dir variables
are empty.


 To be honest, I find the solution of copying the script a bit fragile. It would
be safer to just prepend $TOPDIR to the path so it is absolute.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

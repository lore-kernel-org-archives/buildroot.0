From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 8 Feb 2018 17:30:26 +0100
Subject: [Buildroot] [PATCH v2] ejabberd: Bump to version 17.11
In-Reply-To: <20180129222937.31264d2d@windsurf.lan>
References: <20180119162931.27721-1-johan.oudinet@gmail.com>
 <20180129222937.31264d2d@windsurf.lan>
Message-ID: <CAJtjsKZ6dGEwjh-UhQPSsKdX+kwAcvQOUw2fExJ7hVkP_wbVQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jan 29, 2018 at 10:29 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Fri, 19 Jan 2018 17:29:31 +0100, Johan Oudinet wrote:
>> -EJABBERD_ERLANG_LIBS = sasl crypto public_key ssl mnesia inets compiler
>> +# Install check-erlang-lib script to the directory in which the
>> +# package has been uncompressed, so it is available during the
>> +# configure step.
>> +define EJABBERD_INSTALL_CHECK_ERLANG_LIB
>> +     $(INSTALL) -m 0755 $(EJABBERD_PKGDIR)/check-erlang-lib \
>> +             $(@D)/check-erlang-lib
>> +endef
>> +
>> +EJABBERD_POST_EXTRACT_HOOKS += EJABBERD_INSTALL_CHECK_ERLANG_LIB
>> +
>> +EJABBERD_ERLANG_LIBS = sasl public_key mnesia inets compiler
>>
>>  # Guess answers for these tests, configure will bail out otherwise
>>  # saying error: cannot run test program while cross compiling.
>>  EJABBERD_CONF_ENV = \
>>       ac_cv_erlang_root_dir="$(HOST_DIR)/lib/erlang" \
>>       $(foreach lib,$(EJABBERD_ERLANG_LIBS), \
>> -             ac_cv_erlang_lib_dir_$(lib)="`package/ejabberd/check-erlang-lib $(lib)`")
>> +             ac_cv_erlang_lib_dir_$(lib)="`./check-erlang-lib $(lib)`")
>
> Why did you change the location of check-erlang-lib ? What was the
> problem ? It looked like a good idea to directly used it from
> package/ejabberd/ instead of copying it.
>
> Could you explain this ?

I changed it because I got "package/ejabberd/check-erlang-lib: command
not found" during the configure step.
I guess it is not necessarily in the PATH and the configure is done
inside $(@D).
TBH, I don't understand why this was working before.

Best,
-- 
Johan

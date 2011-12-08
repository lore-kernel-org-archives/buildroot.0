From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 8 Dec 2011 11:06:26 +0100
Subject: [Buildroot] [PATCH 2 of 3 v2] dependencies: build a host-tar if
 no suitable tar can be found
In-Reply-To: <201112061823.36798.arnout@mind.be>
References: <patchbomb.1322053783@devws108>
 <d4b15640ce2d3ab89835.1322053785@devws108>
 <201112061823.36798.arnout@mind.be>
Message-ID: <CAAXf6LU+qVzGgJnhNnEJUShSaA5kZmUF=xp+gR7p5CP45rwikg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

(First of all: your sending mails in both plaintext and html, messes
up my Gmail sending: extra white lines are added between each line. Am
I the only one with this problem? Does anyone know a fix? (one fix
would be to send pure plain text to this list, but I don't know if
that's an option for you)

On Tue, Dec 6, 2011 at 6:23 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Wednesday 23 November 2011 14:59:59 Thomas De Schampheleire wrote:
>
>> diff --git a/toolchain/dependencies/check-host-tar.mk
>> b/toolchain/dependencies/check-host-tar.mk
>
>> new file mode 100644
>
>> --- /dev/null
>
>> +++ b/toolchain/dependencies/check-host-tar.mk
>
>> @@ -0,0 +1,32 @@
>
>> +TAR ?= tar
>
>> +
>
>> +# To extract tar, we always need a real (system) tar. Provide the
>> necessary
>
>> +# definitions here to avoid cluttering package/tar/tar.mk .
>
>> +# TAR will be overridden again when the tar .mk file is included, so we
>> must
>
>> +# finalize the value of SYSTEM_TAR by using :=
>
>> +SYSTEM_TAR := $(TAR)
>
>> +# Automatically detect tar --strip-path/components option
>
>> +# --strip-path was renamed to --strip-components in tar 1.15
>
>> +SYSTEM_TAR_STRIP_COMPONENTS := \
>
>> + $(shell $(SYSTEM_TAR) --help | grep strip-path > /dev/null ; \
>
>> + if test $$? = 0 ; then \
>
>> + echo '--strip-path' ; \
>
>> + else \
>
>> + echo '--strip-components' ; \
>
>> + fi)
>
>
> This can move inside the ifneq below, with a
>
> SYSTEM_TAR_STRIP_COMPONENTS := $(HOST_TAR_STRIP_COMPONENTS)
>
> in the else (and moving that one up of course).
>

I don't think this is true.
For the chicken-egg problem in the current patch, you need SYSTEM_TAR
(a real one) to build host-tar if needed. So in the 'else' case, you
need the full SYSTEM_TAR_STRIP_COMPONENTS.

You could do the following: (maybe this is what you meant)

HOST_TAR_STRIP_COMPONENTS = --strip-components
ifneq (,$(call suitable-host-package,tar))
  HOST_TAR = $(SYSTEM_TAR)
  SYSTEM_TAR_STRIP_COMPONENTS := $(HOST_TAR_STRIP_COMPONENTS)
else
  DEPENDENCIES_HOST_PREREQ += host-tar
  HOST_TAR = $(HOST_DIR)/usr/bin/tar
  SYSTEM_TAR_STRIP_COMPONENTS := \
    $(shell $(SYSTEM_TAR) --help | grep strip-path > /dev/null ; \
    if test $$? = 0 ; then \
     echo '--strip-path' ; \
    else \
     echo '--strip-components' ; \
    fi)
endif

But to be honest, I don't think we'll need any of this complexity
anymore with the cpio approach (see next mail).


>
>> +
>
>> +# Determine correct HOST_TAR
>
>> +ifneq (,$(call suitable-host-package,tar))
>
>> + HOST_TAR = $(SYSTEM_TAR)
>
>> +else
>
>> + DEPENDENCIES_HOST_PREREQ += host-tar
>
>> + HOST_TAR = $(HOST_DIR)/usr/bin/tar
>
>> +endif
>
>> +
>
>> +# Since HOST_TAR is at least 1.17, it will certainly support
>> --strip-components
>
>> +HOST_TAR_STRIP_COMPONENTS = --strip-components
>
>> +
>
>> +# Set definitions used by all .mk files included after this one and
>> before
>
>> +# package/tar/tar.mk
>
>> +TAR = $(HOST_TAR)
>
>> +TAR_STRIP_COMPONENTS = $(HOST_TAR_STRIP_COMPONENTS)
>
>> diff --git a/toolchain/dependencies/check-host-tar.sh
>> b/toolchain/dependencies/check-host-tar.sh
>
>> new file mode 100755
>
>> --- /dev/null
>
>> +++ b/toolchain/dependencies/check-host-tar.sh
>
>> @@ -0,0 +1,29 @@
>
>> +#!/bin/sh
>
>> +
>
>> +tar=`which tar`
>
>
> This contradicts the TAR ?= tar in check-host-tar.mk: if the user provided
>
> their own tar version, it isn't checked and host-tar will still be built...
>
> I guess $TAR should be given as an argument to this script.

You're right, I missed this one.

>
>
>> +if [ -z "$tar" ]; then
>
>> + return
>
>> +fi
>
>
> This could be a [ ! -x "$tar" ]

ok

>
> and it should be exit 1, not return.

Why? The convention is that the check-host-foo.sh script should give
as output either nothing (no suitable package found) or the path to
the suitable package. The return code is not checked.
Of course, it wouldn't hurt, but it's not needed for the implementation.

Thanks for your comments.

Best regards,
Thomas

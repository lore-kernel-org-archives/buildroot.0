From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 8 Jun 2014 16:29:45 +0200
Subject: [Buildroot] [PATCH 1 of 7 v3] infra: consistently use double
 dollar signs inside inner-xxx-targets
In-Reply-To: <20140607104959.70b268b8@free-electrons.com>
References: <patchbomb.1402085576@localhost>
 <b1861ead49778767b075.1402085577@localhost>
 <20140607104959.70b268b8@free-electrons.com>
Message-ID: <CAAXf6LXgYEvcWKxFry8GR8sfC64K2iMEuQLZPBf9YWTXd-eVCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Jun 7, 2014 at 10:49 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Fri, 06 Jun 2014 22:12:57 +0200, Thomas De Schampheleire wrote:
>
>> In some cases, this would potentially cause circular references, in
>> particular when the value of HOST_FOO_VAR would be obtained from the
>> corresponding FOO_VAR if HOST_FOO_VAR is not defined. In these cases, a test
>> is added to check for a host package (the only case where such constructions
>> are relevant; these are not circular).
>
> I'm not sure to understand this part really well.
>
>>  ifndef $(2)_LIBTOOL_PATCH
>>   ifdef $(3)_LIBTOOL_PATCH
>> -  $(2)_LIBTOOL_PATCH = $($(3)_LIBTOOL_PATCH)
>> +  $(2)_LIBTOOL_PATCH = $$($(3)_LIBTOOL_PATCH)
>>   else
>>    $(2)_LIBTOOL_PATCH ?= YES
>>   endif
>
> In this chunk, we are defining HOST_FOO_BAR depending on FOO_BAR, and
> it's not enclosed in a ifeq ($(4),host) test.

This construct behaves as follows:
For target packages: $(2) == $(3) == FOO
    ifndef FOO_BAR
     ifdef FOO_BAR
      FOO_BAR = $(FOO_BAR)
     else
      FOO_BAR = default_value
     endif
    endif

This means that if FOO_BAR is set explicitly (in the .mk file),
nothing is changed.
If FOO_BAR is not set explicitly, the above code will set the default value.

For host packages: $(2) = HOST_FOO, $(3) = FOO
    ifndef HOST_FOO_BAR
     ifdef FOO_BAR
      HOST_FOO_BAR = $(FOO_BAR)
     else
      HOST_FOO_BAR = default_value
     endif
    endif

This means that if HOST_FOO_BAR is set explicitly, nothing is changed.
If HOST_FOO_BAR is not set explicitly, and FOO_BAR is set explicitly,
HOST_FOO_BAR gets this (target) FOO_BAR value. If FOO_BAR (the target
value) is also not set, then HOST_FOO_BAR gets the default value.

An test on $(ifeq $(4),host) around the entire construct is not OK, as
the default value is also applicable for the target case. If there
were no default value, the extra check could be added but is not
really needed.

See below for the interpretation of the ?= construct...

>
> But here:
>
>> +ifeq ($(4),host)
>> + $(2)_AUTORECONF_OPT ?= $$($(3)_AUTORECONF_OPT)
>> +endif
>
> and here:
>
>> -$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool \
>> +ifeq ($(4),host)
>> +$(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-libtool \
>>                               host-toolchain $(1),\
>
> You're adding this ifeq ($(4),host). Can you explain a little bit more
> what the problem is, and why it isn't solved in the same way in all
> places?

In this case the (original) construct is:
Target case:
    FOO_BAR ?= $(FOO_BAR)

Host case:
    HOST_FOO_BAR ?= $(FOO_BAR)

For the target case there would be a circular reference, and the
statement doesn't make sense anyway.
To solve this, an extra check $(ifeq $(4),host) is really needed.
For the host case, if HOST_FOO_BAR is not yet set, it is set equal to
the value of FOO_BAR. FOO_BAR may or may not be set previously: there
is no default value at play here.

A very important thing to understand here, construct (a)
    HOST_FOO_BAR ?= $(FOO_BAR)
is not equivalent to (b)
    ifndef HOST_FOO_BAR
      HOST_FOO_BAR = $(FOO_BAR)
    endif

because 'ifdef' checks for a *non-empty value* while '?=' checks for
*set or not set*.
Since the .mk can have a statement like:
    FOO_PATCH = blaat.patch
    HOST_FOO_PATCH =
the second form (b) above will still set HOST_FOO_BAR to FOO_BAR which
is not what we want.


I hope the above is more clear to you, please let me know.

It is clear that the code is non-trivial, but I don't know if and how
we should document all this.
What do you think?
Do also let me know if you expect changes in the patch or commit
message to make any of this clear.

>
> Other than that, I looked through the patch and couldn't spot any other
> thing that looked problematic or raised questions.
>
> Thanks for doing this work, quite certainly a bit boring to do, but
> definitely very useful! We'll have to be careful in the future when
> changes are made to the 'inner' functions, but I'm sure you'll be there
> to point out the mistakes made in patches contributed by others!

In exchange, I'll expect suitable worshiping and gifts at the
Buildroot Developer meeting next February ;-)

Best regards,
Thomas

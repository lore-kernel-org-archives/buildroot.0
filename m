From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 4 Mar 2015 17:17:50 -0600
Subject: [Buildroot] [PATCH] pkg-generic: Fix host _DL_VERSION corner
	case
In-Reply-To: <20150304235606.23277563@free-electrons.com>
References: <1424816770-14271-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150304235606.23277563@free-electrons.com>
Message-ID: <CANn-YGRf7_yfdkXPwdjS-5CGSn8XkfUnhwKA+4-aO=PnAUOyxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Mar 4, 2015 at 4:56 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> $ make printvars 2> /dev/null | grep LIBGLIB2 | grep VERSION
> HOST_LIBGLIB2_DL_VERSION=2.42.0_bar (2.42.0_bar)
> HOST_LIBGLIB2_VERSION=2.42.0_bar (2.42.0_bar)
> LIBGLIB2_DL_VERSION=2.42.0/bar (2.42.0/bar)
> LIBGLIB2_VERSION=2.42.0_bar (2.42.0_bar)
>
> So indeed, HOST_LIBGLIB2_DL_VERSION is wrong, it should be '2.42.0/bar'.

That is exactly what I was running into.

>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index 1b09955..fcef461 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -323,7 +323,11 @@ $(2)_RAWNAME                     =  $$(patsubst host-%,%,$(1))
>>  # version control system branch or tag, for example remotes/origin/1_10_stable.
>>  ifndef $(2)_VERSION
>>   ifdef $(3)_VERSION
>> -  $(2)_DL_VERSION := $$(strip $$($(3)_VERSION))
>> +  ifdef $(3)_DL_VERSION
>> +   $(2)_DL_VERSION := $$(strip $$($(3)_DL_VERSION))
>> +  else
>> +   $(2)_DL_VERSION := $$(strip $$($(3)_VERSION))
>> +  endif
>
> However, I haven't yet made up my mind on whether this proposed
> solution is the best one, or if we have a chance of doing something
> clearer/nicer for this _VERSION vs. _DL_VERSION thing.

This was the simplest solution I could come up with without reworking
a lot of the pkg-download logic. I figured that if the _DL_VERSION of
non-host version was already set then it should be used, otherwise the
_VERSION string should be modified.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins

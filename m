From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 5 Jan 2015 15:52:27 +0100
Subject: [Buildroot] [PATCH v4 05/17] erlang-goldrush: new package.
In-Reply-To: <20150104223602.09aaf9da@free-electrons.com>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <1418135662-773-6-git-send-email-johan.oudinet@gmail.com>
 <20150104223602.09aaf9da@free-electrons.com>
Message-ID: <CAJtjsKYkHzbXw7RTzeC9L8sH40aFR3hnEwP6C1cDSHZ3HmjnHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sun, Jan 4, 2015 at 10:36 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Johan Oudinet,
>
> On Tue,  9 Dec 2014 15:34:10 +0100, Johan Oudinet wrote:
>> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
>> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
>> ---
>>  package/Config.in                          |  5 +++++
>>  package/erlang-goldrush/Config.in          |  6 ++++++
>>  package/erlang-goldrush/erlang-goldrush.mk | 14 ++++++++++++++
>>  3 files changed, 25 insertions(+)
>>  create mode 100644 package/erlang-goldrush/Config.in
>>  create mode 100644 package/erlang-goldrush/erlang-goldrush.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 600a68d..06c8e04 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -392,6 +392,11 @@ endmenu
>>  menu "Interpreter languages and scripting"
>>       source "package/enscript/Config.in"
>>       source "package/erlang/Config.in"
>> +if BR2_PACKAGE_ERLANG
>
> So all Erlang packages are not visible unless erlang is enabled. Which
> sounds good.
>
>> +menu "Erlang libraries/modules"
>> +     source "package/erlang-goldrush/Config.in"
>> +endmenu
>> +endif
>>       source "package/guile/Config.in"
>>       source "package/haserl/Config.in"
>>       source "package/jamvm/Config.in"
>> diff --git a/package/erlang-goldrush/Config.in b/package/erlang-goldrush/Config.in
>> new file mode 100644
>> index 0000000..685a887
>> --- /dev/null
>> +++ b/package/erlang-goldrush/Config.in
>> @@ -0,0 +1,6 @@
>> +config BR2_PACKAGE_ERLANG_GOLDRUSH
>> +     bool "erlang-goldrush"
>> +     depends on BR2_PACKAGE_ERLANG
>
> So why do we have this dependency again here?

Good point. I've removed it. Thanks for noticing it.

>> --- /dev/null
>> +++ b/package/erlang-goldrush/erlang-goldrush.mk
>> @@ -0,0 +1,14 @@
>> +################################################################################
>> +#
>> +# erlang-goldrush
>> +#
>> +################################################################################
>> +
>> +ERLANG_GOLDRUSH_VERSION = 0.1.6
>> +ERLANG_GOLDRUSH_SITE = $(call github,DeadZen,goldrush,$(ERLANG_GOLDRUSH_VERSION))
>> +ERLANG_GOLDRUSH_LICENSE_FILES = LICENSE
>
> No <pkg>_LICENSE ?

It is an ISC license, and the abbreviation is not available within Buildroot.

>
>> +ERLANG_GOLDRUSH_DEPENDENCIES = erlang host-erlang-rebar
>
> Why are those dependencies necessary? Aren't they handled by the rebar
> infra?

Excellent idea. I've just modified pkg-rebar to do that and I'll
remove erlang and host-erlang-rebar from the dependencies of all
erlang packages.

>
>> +ERLANG_GOLDRUSH_INSTALL_STAGING = YES
>> +
>> +$(eval $(rebar-package))
>> +$(eval $(host-rebar-package))
>
> Might be good to say a word in the commit log to explain why a host
> variant of this library is needed.

Ok. So I should not provide an host variant unless some other packages need it?

Thanks for the review.

-- 
Johan

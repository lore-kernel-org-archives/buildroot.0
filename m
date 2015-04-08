From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 08 Apr 2015 22:18:48 +0200
Subject: [Buildroot] [PATCH 4/4] package/thrift: add dependency on
	host-autoconf-archive
In-Reply-To: <552313A8.4020207@mind.be>
References: <1428339450-2158-1-git-send-email-romain.naour@openwide.fr>
 <1428339450-2158-4-git-send-email-romain.naour@openwide.fr>
 <552313A8.4020207@mind.be>
Message-ID: <55258D28.60201@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 07/04/2015 01:15, Arnout Vandecappelle a ?crit :
> On 06/04/15 18:57, Romain Naour wrote:
>> The ax_cxx_compile_stdcxx_11 macro bundled in thrift package is
>> brocken and out of date.
>> Remove it and use the one provided by autoconf-archive package.
>>
>> Related to:
>> [thrift]
>> http://autobuild.buildroot.net/results/21e/21e3fff1e0d714f94ac7e621289d1a59bc02a05f/build-end.log
>> [host-thrift]
>> http://autobuild.buildroot.net/results/b89/b89ffc2bff699eb10bb6abd92369a43d4900354d/build-end.log
> 
>  I fail to see what this really fixes... For both build failures, it failed
> before this patch and it still fails after it... and it should fail since these
> compilers indeed are not fully C++11 compliant (missing virtual overrides which
> were added in gcc 4.7).
> 
>  Oh, I get it, it will now fail consistently, instead of failing depending on
> whether host-autoconf-archive has been installed or not...

I added a link to the macro bug report for v2 to explain the issue.
http://savannah.gnu.org/patch/index.php?8287

> 
>  But the stupid thing is, the build does succeed with these non-conforming
> compilers, because thrift actually doesn't use that particular feature...
> 
>  So perhaps it's better to patch configure.ac and ax_cxx_compile_stdcxx_11.m4 to
> give the macro a different name, so that we can still compile thrift with gcc 4.5.

The macro accept a second argument to make C++11 optional:
AX_CXX_COMPILE_STDCXX_11([noext], [optional])

Thrift build fine but produce lot of warning about anonymous variadic macros but
it just for some debug macro:
#define T_DEBUG(format_string,...)
"warning: anonymous variadic macros were introduced in C99"

And some warning about the use of --std=c++0x (C++03) long long which is
available in gcc 4.5.
"warning: use of C++0x long long integer constant"

At least, it seems to be safe to make C++11 optional and use C++03 for this
release...

> 
>  Still...
> 

[snip]

>> +
>> +The ax_cxx_compile_stdcxx_11 macro is brocken and out of date.
>> +
>> +Remove it and use the one provided by autoconf-archive package.
> 
>  This is not needed, autoreconf will pick up the newer version automatically.

OK

> 
> [snip]
> 
>> diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
>> index 409b04d..5d4c515 100644
>> --- a/package/thrift/thrift.mk
>> +++ b/package/thrift/thrift.mk
>> @@ -8,8 +8,8 @@ THRIFT_VERSION = 0.9.2
>>  THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
>>  THRIFT_DEPENDENCIES = host-pkgconf host-thrift boost libevent openssl zlib
> 
>  Missing dependency on host-autoconf-archive here.

Ok

Best regards,
Romain

> 
> 
>  Regards,
>  Arnout
> 
>

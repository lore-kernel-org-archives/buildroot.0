From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Mon, 4 Mar 2013 02:55:59 +0800
Subject: [Buildroot] [PATCH] stress: honor the BR2_PREFER_STATIC_LIB
	preference
In-Reply-To: <51337F8E.9070803@mind.be>
References: <1362206128-27771-1-git-send-email-roylee17@gmail.com>
 <51337F8E.9070803@mind.be>
Message-ID: <CAEvN+1hHaUvusQPDV8qbs8ipzx-m0+Vhe02FmeWZp9NMrPYJ=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

    ifeq ($(BR2_PREFER_STATIC_LIB),y)
    SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
    TARGET_LDFLAGS += --static
    else
    SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
    endif

As you indicated, the --enable-static is given anyway in the
SHARED_STATIC_LIBS_OPTS.
Unfortunately, as long as the --enable-static is given, stress links the
program statically, regardless how the --enable-shared or --disable-shared.
In this case, stress would be linked statically regardless how the
BR2_PREFER_STATIC_LIB specifies.
So we need the patch to explicitly tell it link the program dynamically by
appending/overriding with --disable-static.

Thanks.

Roy

On Mon, Mar 4, 2013 at 12:51 AM, Arnout Vandecappelle <arnout@mind.be>wrote:

> On 02/03/13 07:35, Tzu-Jung Lee wrote:
>
>> From: roylee17 <roylee17@gmail.com>
>>
>> Change-Id: I13f849e76557fac81b488ab26b4ac**8b999888bc1
>> ---
>>   package/stress/stress.mk | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/package/stress/stress.mk b/package/stress/stress.mk
>> index 3a047b5..af79bf2 100644
>> --- a/package/stress/stress.mk
>> +++ b/package/stress/stress.mk
>> @@ -10,4 +10,7 @@ STRESS_VERSION = 1.0.4
>>   STRESS_SITE    = http://weather.ou.edu/~apw/**projects/stress<http://weather.ou.edu/~apw/projects/stress>
>>   STRESS_AUTORECONF = YES
>>
>> +STRESS_CONF_OPT = \
>> +       $(if $(BR2_PREFER_STATIC_LIB),--**enable-static,--disable-**
>> static)
>>
>
>  This is already part of the standard SHARED_STATIC_LIBS_OPTS, which is
> part of the argument list of configure. The difference being that in the
> shared case, --enable-static is still passed (to allow building static
> libraries, in case some client prefers to link statically after all).
>
>  Any reason why this doesn't work for stress?
>
>  Regards,
>  Arnout
>
>  +
>>   $(eval $(autotools-package))
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/**arnoutvandecappelle<http://www.linkedin.com/in/arnoutvandecappelle>
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130304/8dc2ff97/attachment-0001.html>

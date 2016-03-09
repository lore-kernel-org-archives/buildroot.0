From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Mar 2016 15:42:30 +0100
Subject: [Buildroot] [PATCH] pkgconf: make wrapper relocatable
In-Reply-To: <56E035D7.9080703@mind.be>
References: <1457529409-24102-1-git-send-email-gustavo@zacarias.com.ar>
 <87egbj228a.fsf@dell.be.48ers.dk> <56E02A78.1050701@zacarias.com.ar>
 <20160309150359.4ce78c05@free-electrons.com>
 <56E032F9.4070605@zacarias.com.ar> <56E035D7.9080703@mind.be>
Message-ID: <56E03656.80208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/09/16 15:40, Arnout Vandecappelle wrote:
> On 03/09/16 15:28, Gustavo Zacarias wrote:
>> On 09/03/16 11:03, Thomas Petazzoni wrote:
>>
>>> What about doing this relatively to the wrapper location?
>>>
>>> WRAPPER_DIR=$(dirname $0)
>>> STAGING_DIR=$(readlink -f ${WRAPPER_DIR}/../../../staging/)
>>>
>>> and there you are, it is both relocatable and doesn't rely on
>>> STAGING_DIR being defined in the environment.
>>>
>>> Thomas
>>
>> Hi.
>> That won't work, since staging is an absolute symlink, so when moving the SDK
>> around it will be broken and fail.
>> You need something like:
>>
>> WRAPPER_DIR=$(dirname $0)
>> STAGING_DIR=$(readlink -f ${WRAPPER_DIR}/../@TUPLE@/sysroot)
>>
>> And hardcode tuple which isn't likely to change.
>
>   Not just unlikely to change: if it changes, the sysroot is completely broken.
>
>   So this seems like the best solution to me. Thanks!

  One small thing: you should use $(STAGING_SUBDIR), which is already defined.

  Regards,
  Arnout

>
>   Regards,
>   Arnout
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

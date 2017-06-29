From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 29 Jun 2017 10:02:15 +0200
Subject: [Buildroot] [RFC PATCH v3 00/10] Make the SDK relocatable
In-Reply-To: <d0246c22-0486-a095-0bf4-77cc14784997@grandegger.com>
References: <1490255693-9134-1-git-send-email-wg@grandegger.com>
 <6799ad7b-a16e-d89e-eb73-d7d91880d341@mind.be>
 <d993626e-11b0-ab21-f022-d64f6a7340b6@grandegger.com>
 <8b074253-3002-1db9-d902-a73bb47e734b@grandegger.com>
 <dec2b16c-50f5-15d2-2082-c31ca82170ec@mind.be>
 <6a236664-6cd5-c2e6-e4bc-ee5f7b6b21a1@grandegger.com>
 <311f5c7c-ad46-e1f1-4570-dfffb5605292@mind.be>
 <4243e8e2-baaf-37f5-4149-d085388f3b13@grandegger.com>
 <319491ac-9a65-f82f-892c-1e54b8df70da@mind.be>
 <b3e97095-7453-5516-0f23-e68e56932930@grandegger.com>
 <790e33dd-2285-dd7e-7203-692f2cd3686f@mind.be>
 <c9adbe27-c7b1-b28d-5c38-7c79a5da9c18@grandegger.com>
 <84234ca1-b75f-84da-80cc-83a7234d0927@mind.be>
 <d0246c22-0486-a095-0bf4-77cc14784997@grandegger.com>
Message-ID: <681841f3-9d91-a2fe-d2ea-1282de1844e7@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

about rpath sanitazion of patchelf and m4...

Am 29.06.2017 um 08:13 schrieb Wolfgang Grandegger:
> 
> 
> Am 28.06.2017 um 21:33 schrieb Arnout Vandecappelle:
>>
>>
>> On 28-06-17 14:36, Wolfgang Grandegger wrote:
>>>
>>>
>>> Am 28.06.2017 um 13:16 schrieb Arnout Vandecappelle:
>>>>
>>>>
>>>> On 28-06-17 12:57, Wolfgang Grandegger wrote:
>>>> [snip]
>>>>> The list is built with "comm -13 ...". While implementing that way, 
>>>>> I realized
>>>>> that I need patchelf for the host as very first package. Any idea 
>>>>> how that could
>>>>> achieved?
>>>>
>>>>    host-patchelf should be added to DEPENDENCIES_HOST_PREREQ so it 
>>>> gets built
>>>> before all the rest. In the instrumentation hook, you should also 
>>>> skip the
>>>> sanitization when the package is not in DEPENDENCIES_HOST_PREREQ.
>>>
>>> I thought all host binaries must have an rpath to <path>/usr/lib, 
>>> which should
>>> be replaced with "$ORIGIN/../../../usr/lib"
>>
>>   Only if they use a library in $HOST_DIR/usr/lib - otherwise 
>> sanitize-rpath will
>> remove the rpatch completely, no?
> 
> Makes sense.
> 
>>   DEPENDENCIES_HOST_PREREQ contains only a few packages, none of which 
>> are linked
>> with any library in $HOST_DIR/usr/lib. At least I think so.
> 
> In may case it only contains "patchelf", which needs rpath sanitation.
> 
>>>>    That means that those packages will not get sanitized - which 
>>>> shouldn't be
>>>> necessary since they anyway don't have an rpath. But perhaps it's a 
>>>> good idea
>>>> then to add a readelf-based check for them that verifies they don't 
>>>> have
>>>> DT_RUNPATH or DT_RPATH. The latter is just a nice-to-have, though, 
>>>> so don't
>>>> worry about it at first.
>>>
>>> See above.
>>>
>>> Even with setting DEPENDENCIES_HOST_PREREQ to patchelf at the first 
>>> place, some
>>> packages are required in advance to build patchelf :(.
>>
>>   Really? Which ones? patchelf has no dependencies.
> 
>    host-m4-1.4.18
>    host-libtool-2.4.6
>    host-autoconf-2.69
>    host-automake-1.15
>    host-patchelf-29c085fd9d3fc972f75b3961905d6b4ecce7eb2b
> 
> Here is the order in which the packages are built. Patchelf needs 
> automake and friends. The "host-m4" binary m4 has an rpath;
> 
> <buildroot-build-dir>/host/usr/lib
> 
> The others have perl scripts only. Hence, we need to sanitize the 
> "host-m4" package after patchelf is available. Not too bad.

Neither patchelf nor m4 uses libraries from /usr/lib and therefore the 
rpath is empty. A mistake in my scripts confused me... sorry for the noise.

Wolfgang.

> 
> Wolfgang.

From: Wolfgang Grandegger <wg@grandegger.com>
Date: Mon, 30 Jan 2017 08:31:51 +0100
Subject: [Buildroot] Relocatable internal toolchain
In-Reply-To: <11e6deef-d790-33d8-b0ad-3477a51e369f@grandegger.com>
References: <57c96cfd-7d0c-c9de-04d2-2da8f5dd7f7c@grandegger.com>
 <CAHXCMML2HKsOgxZRLpcMbCY8Lci6-N_s1+qVTRxCHqyvP+rzgg@mail.gmail.com>
 <11e6deef-d790-33d8-b0ad-3477a51e369f@grandegger.com>
Message-ID: <a46d8432-bc43-5b0c-5a7a-a04e8993912e@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

Am 26.01.2017 um 18:46 schrieb Wolfgang Grandegger:
> Hi Samuel,
>
> Am 26.01.2017 um 11:47 schrieb Samuel Martin:
>> Hi Wolfgang, all,
>>
>> On Thu, Jan 26, 2017 at 9:25 AM, Wolfgang Grandegger
>> <wg@grandegger.com> wrote:
>>> Hello,
>>>
>>> I prefer a relocatable (internal) toolchain and before digging
>>> deeper... Are
>>> there any plans in that direction? I realized some attempts (patches) to
>>> make the buildroot toolchain relocatable but they have not (yet) been
>>> accepted. What are the pros and cons? Are there principle problems?
>>
>> Yes, there are plans for this.
>
> Great!
>
>> There had been a couple of the series posted on this topic (the latest
>> one [1]).
>> And we talked about this during the last Buildroot Meeting, you can
>> check the report [2] for detailed conclusions.
>> To sum-up:
>> - Producing the relocatable host tools will be addressed step-by-step;
>> - Preparatory changes making buildroot using absolute canonical paths
>> are already merged [4];
>> - Next step: fixing RPATH in host tools binaries thanks to some
>> patchelf [3] features to be implemented and upstreamed (this should be
>> enough to meet Buildroot needs);
>> - Cleaning up RPATH in target binaries is delayed.
>>
>> Unfortunately, I got no freetime to spend on patchelf source code
>> [3] since the meeting.
>
> Thanks for the quick introduction...
>
>> If you are interested in or want to take over this topic, don't
>> hesitate to drop a message on the Buildroot mailing list.
>
> I will have a closer look. Let's see if I can do something.

Buildroot's build system is quite new too me. At a first glance it's 
rather heavy stuff! So I first tried the patches you mentioned to see 
what I get. After some tweaking due to "file permissions" and "file in 
use" issues with patchelf, the build did succeed. But subsequent builds 
then required setting LD_LIBRARY_PATH for the host tools. Then I moved 
the buildroot output directory to a different location to see if 
relocation, as I understand it, works. My test cases are some 
out-of-tree QT5 examples:

   $ cd <a-path>/examples
   $ <path-to-buildroot-output>/host/usr/bin/qmake
   Could not find qmake configuration file devices/linux-buildroot-g++.
   Error processing project file: /home/wolf/junk/examples/examples.pro

How do I set the new path to the toolchain. Likely I have missed something.

Apart from the "rpath", the path to the build directory is also in many 
text (configuration scripts, etc.) files. What did work for me was 
replacing the path to the build directory 
("<buildroot-output>/host/usr") with the new location in all text files.

Not sure if we speak/think about the same "relocation" behaviour.

Wolfgang.

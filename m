From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed, 1 Feb 2017 09:13:55 +0100
Subject: [Buildroot] Relocatable internal toolchain
In-Reply-To: <418de570-9eff-444d-578e-792c7f03dae7@grandegger.com>
References: <57c96cfd-7d0c-c9de-04d2-2da8f5dd7f7c@grandegger.com>
 <CAHXCMML2HKsOgxZRLpcMbCY8Lci6-N_s1+qVTRxCHqyvP+rzgg@mail.gmail.com>
 <11e6deef-d790-33d8-b0ad-3477a51e369f@grandegger.com>
 <a46d8432-bc43-5b0c-5a7a-a04e8993912e@grandegger.com>
 <CAHXCMMJ1HL5EY=veTL02uA+LrEi1_4J4h008S2zhCEpgQjePig@mail.gmail.com>
 <418de570-9eff-444d-578e-792c7f03dae7@grandegger.com>
Message-ID: <d81c11f5-0003-133a-501a-6377af9ca970@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Am 30.01.2017 um 10:36 schrieb Wolfgang Grandegger:
> Hi Samuel,
>
> Am 30.01.2017 um 09:14 schrieb Samuel Martin:
>> Hi Wolfgang, all,
>>
>> On Mon, Jan 30, 2017 at 8:31 AM, Wolfgang Grandegger <wg@grandegger.com> wrote:
>>>
>>> Buildroot's build system is quite new too me. At a first glance it's rather
>>> heavy stuff! So I first tried the patches you mentioned to see what I get.
>>> After some tweaking due to "file permissions" and "file in use" issues with
>>> patchelf, the build did succeed. But subsequent builds then required setting
>>> LD_LIBRARY_PATH for the host tools. Then I moved the buildroot output
>>> directory to a different location to see if relocation, as I understand it,
>>> works. My test cases are some out-of-tree QT5 examples:
>>>
>>>   $ cd <a-path>/examples
>>>   $ <path-to-buildroot-output>/host/usr/bin/qmake
>>>   Could not find qmake configuration file devices/linux-buildroot-g++.
>>>   Error processing project file: /home/wolf/junk/examples/examples.pro
>>>
>>> How do I set the new path to the toolchain. Likely I have missed something.
>>
>> I have no clue about this, but a quick google search gives me a
>> possible way to fix/workaround this [5] (with no warranty at all).
>
> See below...
>
>>> Apart from the "rpath", the path to the build directory is also in many text
>>> (configuration scripts, etc.) files. What did work for me was replacing the
>>> path to the build directory ("<buildroot-output>/host/usr") with the new
>>> location in all text files.
>>>
>>> Not sure if we speak/think about the same "relocation" behaviour.
>>
>> Yes we are, I just forgot to give the main link to this task, which
>> details many things to fix/support for a complete relocatable SDK.
>> Note that the series I posted just dealt with the rpath point so far,
>> unstacking one point after the other.
>
> OK, I see! The script I mentioned does:
>
>   for FILE in $(grep -r  "${FINDSTR}"  . -l ) ; do
> 	if [ ! -h ${FILE} ] && [ -n  "$(file ${FILE} | cut -d: -f2 | grep text )" ]
> 		then
> 		echo ${FILE}
> 		sed -i s,"${FINDSTR}",${REPLACESTR},g ${FILE}
> 	fi 	
>   done
>
> Such a script is mentioned in [6]. Relocation works fine (for me) also
> without fixing "rpath", and for the qmake examples above.
>
>> [5] http://doc.qt.io/qt-5/qmake-environment-reference.html
>> [6] http://elinux.org/Buildroot#Core_Buildroot_infrastructure
>
> It's getting clearer what has do be done...

Digging deeper... Is there a simple way of re-triggering the population 
of the host, staging and target trees without doing a make clean?

Wolfgang.

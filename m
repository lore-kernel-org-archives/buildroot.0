From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jul 2017 16:19:45 +0200
Subject: [Buildroot] [PATCH v7 2/9] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <ee017453-259f-5e1c-0028-9d3b51b21376@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-3-git-send-email-wg@grandegger.com>
 <b381421f-9595-ad2d-defb-f94b7d325c09@mind.be>
 <16f616fc-173d-a201-8342-cda48dc102fe@grandegger.com>
 <a8c548d5-d6d0-53bf-2c6b-17e5a5f3101b@mind.be>
 <75ca9a71-aaf5-dd21-f71f-4bcfc2880faa@grandegger.com>
 <6994b7c9-7714-4941-8efc-ffb31f1adbb1@mind.be>
 <ee017453-259f-5e1c-0028-9d3b51b21376@grandegger.com>
Message-ID: <fae9da71-f806-a64f-042a-dbf3e9c0d068@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-07-17 16:08, Wolfgang Grandegger wrote:
> Hello Arnout,
> 
> Am 20.07.2017 um 15:45 schrieb Arnout Vandecappelle:
>>
>>
>> On 20-07-17 11:03, Wolfgang Grandegger wrote:
>>>      case "${tree}" in
>>>          host)
>>>              ...
>>>              # we always want $ORIGIN-based rpaths to make it relocatable.
>>
>>   Perfect. Just please start the sentence with a capital (it ends with a .)
> 
> Well, I followed the style of the original script... just to be consistent...
> otherwise we will have an ugly mix.

 There is no original script, only an original author :-)

 So indeed, fix it script-wide please.

[snip]
>>> As I said, the execution time comes form scanning for ELF files. The rest
>>> doesn't
>>> matter a lot.
>>
>>   Instead of the patch you attached, it might actually make more sense to create
>> a tiny C file that does this, and execute that as part of the find command. Or
>> you could just create support/scripts/elfmagic with those 4 bytes and use "cmp
>> -n 4 {} ${0%/*}/elfmagic".
> 
> Yes, I had that idea as well and I have already hacked something. The problem is
> that it does not check if it does have an rpath.

 Well, you could do that particular check in the find -exec and keep the
--print-rpath check in the while loop.


> "cmp" is not faster, I already
> tried!

 OK good. Might be a good idea to keep track of the things you already tried in
the cover letter.


 Regards,
 Arnout


> 
>>   By the way, I believe filtering with -exec is much faster than doing it with
>> while/if. Unfortunately you can't use that with patchelf --print-rpath because
>> the output of patchelf would be mixed up with the find output.
> 
> I already tried various other solutions.
> 
> Just preparing v8...
> 
> Wolfgang.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

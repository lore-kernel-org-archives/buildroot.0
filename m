From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 2 Apr 2018 22:27:43 +0200
Subject: [Buildroot] [PATCH v2] board: add support for ARC HS
 Development Kit (HSDK)
In-Reply-To: <1522682888.3989.34.camel@synopsys.com>
References: <20171219145554.17718-1-didin@synopsys.com>
 <ccf192ef-8200-f5c8-1a88-9bd348c90207@smile.fr>
 <c7e8fef5-cd6e-60b2-ab1c-00dc1eb931eb@mind.be>
 <1522682888.3989.34.camel@synopsys.com>
Message-ID: <195cd8bb-7fea-4b60-095f-fa82754e89d3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-04-18 17:28, Alexey Brodkin wrote:
> Hi Arnout,
> 
> On Sat, 2018-03-31 at 15:25 +0200, Arnout Vandecappelle wrote:
>>  I have a few more comments... Sorry it took so long to get any review at all,
>> but we have a really long patch backlog...
>>
>> On 31-03-18 14:56, Romain Naour wrote:
>>> Hi Evgeniy,
>>>
>>> Le 19/12/2017 ? 15:55, Evgeniy Didin a ?crit :

[snip]
>>>>  .gitlab-ci.yml                     |  1 +
>>>>  DEVELOPERS                         |  1 +
>>>>  board/synopsys/hsdk/genimage.cfg   | 26 +++++++++++++++++++++++++
>>>>  board/synopsys/hsdk/linux.fragment |  2 ++
>>>>  board/synopsys/hsdk/post-image.sh  | 18 ++++++++++++++++++
>>>>  board/synopsys/hsdk/uboot.env.txt  |  9 +++++++++
>>
>>  Please also add a readme.txt, cfr. vdk.
> 
> readme.txt is understood but what are "cfr. vdk."?

 There is another "board" in board/synopsys/vdk that has a proper readme.txt.
Since it's under board/synopsys, I assumed you guys were aware of it. I didn't
realize that it was an ARM simulator, not a real board.

>>>>  N:	Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
>>>>  F:	package/axfsutils/
>>>> diff --git a/board/synopsys/hsdk/genimage.cfg b/board/synopsys/hsdk/genimage.cfg
>>>> new file mode 100644
>>>> index 0000000000..8928f704a2
>>>> --- /dev/null
>>>> +++ b/board/synopsys/hsdk/genimage.cfg
>>>> @@ -0,0 +1,26 @@
>>>> +image boot.vfat {
>>>> +  vfat {
>>>> +    files = {
>>>> +      "uboot.env",
>>>> +      "uImage"
>>>> +    }
>>>> +  }
>>>> +  size = 100M
>>
>>  Does it really need to be that large? Making this partition large means that
>> also the sdcard.img will be large, which means it takes longer to dd it to an
>> actual SD card.
> 
> Well 100 Mb is not that much and with write speed ~20Mb/sec it's still tolerable.

 You mean I should buy faster SD cards than the 1.4MB/s cards I typically use? :-)

> But in the same time it leaves as an ability to put more things to that partition.
> Like other uImages etc. Indeed if that was a production image we'd only expect fixed
> and predefined stuff to be put there and say 10Mb would be just ok. But that vanilla
> Buildroot config is just a good starting point for people to play with the board.

 IMO 100MB is total overkill. A kernel shouldn't grow much over 5MB (definitely
not in the buildroot context) and you don't need 20 different ones, do you?
Looking at other boards, 20-30MB is more typical.

 That said, I'm not going to block the patch over this thing :-).

 Regards,
 Arnout

> 
> The only downside here is larger sdcard.img which if not compressed is not that
> convenient for sharing thus we wanted to compress it.
> 
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Apr 2016 15:17:46 +0200
Subject: [Buildroot] [PATCH 1/3] c-icap: avoid host library search path
In-Reply-To: <20160421065830.GP2476@tarshish>
References: <f4a2d607557dd8a5b7fdc322f0ae8ef083890076.1461089746.git.baruch@tkos.co.il>
 <20160419211457.11d9bf2a@free-electrons.com> <20160420180433.GK2476@tarshish>
 <5717F63F.8040605@mind.be> <20160421065830.GP2476@tarshish>
Message-ID: <5718D2FA.2090708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/21/16 08:58, Baruch Siach wrote:
> Hi Arnout,
>
> On Wed, Apr 20, 2016 at 11:35:59PM +0200, Arnout Vandecappelle wrote:
>> On 04/20/16 20:04, Baruch Siach wrote:
[snip]
>>> It turns out that forcing AUTORECONF is enough to fix the problem. I'm not
>>> sure why. I have only noticed that after AUTORECONF, -lz appears explicitly in
>>> the link command line, whereas before libz was linked in implicitly via
>>> libicapapi.so NEEDED tag. Manually running the failed link command with -lz
>>> added, fixes the link as well. I guess that -lz makes the linker search in
>>> sysroot before rpath, but I could not find an explanation to this behaviour in
>>> the ld documentation.
>>
>>   As I wrote yesterday: -rpath is used for searching for NEEDED entries, not
>> for searching for -l argument. And vice versa: -L is used to search for -l
>> arguments, but not for NEEDED entries.
>
> That explains the behaviour I see, thanks. The twist here is that -rpath does
> not search for libraries that were found already as a result of -l. This
> apparently means that -L would indirectly affect the results of -rpath search.
>
> Do you have any reference to gcc/binutils documentation on that?

  I just did 'man ld'.

  Regards,
  Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

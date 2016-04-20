From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Apr 2016 23:35:59 +0200
Subject: [Buildroot] [PATCH 1/3] c-icap: avoid host library search path
In-Reply-To: <20160420180433.GK2476@tarshish>
References: <f4a2d607557dd8a5b7fdc322f0ae8ef083890076.1461089746.git.baruch@tkos.co.il>
 <20160419211457.11d9bf2a@free-electrons.com> <20160420180433.GK2476@tarshish>
Message-ID: <5717F63F.8040605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/20/16 20:04, Baruch Siach wrote:
> Hi Thomas,
>
> On Tue, Apr 19, 2016 at 09:14:57PM +0200, Thomas Petazzoni wrote:
>> On Tue, 19 Apr 2016 21:15:44 +0300, Baruch Siach wrote:
>>> +C_ICAP_MAKE_OPTS = exec_prefix=$(STAGING_DIR)/usr
>>
>> This is not correct. Setting exec_prefix to $(STAGING_DIR)/usr is
>> wrong. Instead, can you try to remove:
>>
>>     -rpath @libdir@
>>
>> from the various Makefile.am ?
>
> It turns out that forcing AUTORECONF is enough to fix the problem. I'm not
> sure why. I have only noticed that after AUTORECONF, -lz appears explicitly in
> the link command line, whereas before libz was linked in implicitly via
> libicapapi.so NEEDED tag. Manually running the failed link command with -lz
> added, fixes the link as well. I guess that -lz makes the linker search in
> sysroot before rpath, but I could not find an explanation to this behaviour in
> the ld documentation.

  As I wrote yesterday: -rpath is used for searching for NEEDED entries, not for 
searching for -l argument. And vice versa: -L is used to search for -l 
arguments, but not for NEEDED entries.

  Regards,
  Arnout

>
> Any suggestion for the comment text to explain the AUTORECONF?
>
> baruch
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

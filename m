From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 17:06:36 +0200
Subject: [Buildroot] [RFC 4/4] board/acmesystems/aria-g25: set
 BR2_GENIMAGE_CFG_FILES
In-Reply-To: <674007428.52191.1491831872252.JavaMail.zimbra@savoirfairelinux.com>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
 <ccc877c5-1ea5-e2d6-1739-c913f4d6d0a7@mind.be>
 <20170401155116.66464885@free-electrons.com>
 <8760ilvozx.fsf@dell.be.48ers.dk>
 <2ce8812c-d95e-bd4a-9cde-f02ab8e3ca60@mind.be>
 <87wpazuaa1.fsf@dell.be.48ers.dk>
 <02a1a330-c947-2a64-29bb-88f6ac7d9c9f@mind.be>
 <20170405181424.1d69fee5@free-electrons.com>
 <674007428.52191.1491831872252.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <82c11e17-e096-1ffb-58e3-609459674b2e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 15:44, ?tienne Ph?lip wrote:
> Good morning everyone,
> 
> ----- Le 5 Avr 17, ? 12:14, Thomas Petazzoni thomas.petazzoni at free-electrons.com a ?crit :
> 
>> Hello,
>>
>> On Wed, 5 Apr 2017 17:02:36 +0200, Arnout Vandecappelle wrote:
>>
>>>  Combined with the other discussion in this thread, long-term I see us evolving
>>> towards:
>>>
>>> - deprecate some of the finer-grain fs tuning options we have now;
>>> - always using genimage to generate the target filesystems;
>>> - position our fs targets more as a 'quick fix' solution than for production;
>>> - make host-e2fsprogs etc. blind options again.
>>
>> To be honest, I am not sure I share this long-term view. I like the way
>> things are done today, very modular: we can generate just a filesystem
>> image, optionally use genimage afterwards, etc. So the "always using
>> genimage to generate the target filesystem" is not something that I see
>> as an improvement, for example.
> 
> To sum things up:

 Peter has the final word in things, and nobody objected anymore to introducing
BR2_GENIMAGE_CFG_FILES, so:

>  - Should I add BR2_GENIMAGE_CFG_FILES or reuse the script in the
> postimage script

 Introduce BR2_GENIMAGE_CFG_FILES.

>  - if BR2_GENIMAGE_CFG_FILES is choosen, should it 'depends on' or
> 'select' BR2_PACKAGE_HOST_GENIMAGE?

 select BR2_PACKAGE_HOST_GENIMAGE

 Note that since BR2_GENIMAGE_CFG_FILES is a string option, you can't do that
directly. You need to introduce a blind helper option:

config BR2_GENIMAGE_CFG_FILES_SELECT
	bool
	default y if BR2_GENIMAGE_CFG_FILES != ""
	select BR2_PACKAGE_HOST_GENIMAGE

>  - should I convert all boards or just the one already in this RFC?

 I think you can start converting more boards. But you can already stop before
all boards are converted.

 For each board you should verify that the build result with and without your
change is identical! To save build time, you may want to use an external
toolchain though...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 May 2016 01:29:33 +0200
Subject: [Buildroot] [PATCH 04/34] reproducibility: make rootfs.tar
 reproducible
In-Reply-To: <20160508201721.GP13285@hermes.click-hack.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-4-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160507152318.017bf013@free-electrons.com>
 <8465e4e8-3c5b-13ac-ee57-552bceeaa768@mind.be>
 <20160508201721.GP13285@hermes.click-hack.org>
Message-ID: <7b840988-f369-ca39-1a6c-8a7cd7be7e7b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/08/16 22:17, Gilles Chanteperdrix wrote:
> On Sat, May 07, 2016 at 09:51:36PM +0200, Arnout Vandecappelle wrote:
>> On 05/07/16 15:23, Thomas Petazzoni wrote:
>>> Hello,
>>>
>>> On Sat, 30 Apr 2016 09:49:00 +0200, Gilles Chanteperdrix wrote:
>>>
>>>> +define ROOTFS_TAR_CMD
>>>> +	cd $(TARGET_DIR) && { \
>>>> +		find . -\( -! -type d -o -empty -\) -print0 | \
>>>> +		sort -z | \
>>>> +		tar --null -T - -c$(TAR_OPTS)f $@ --mtime=@$(SOURCE_DATE_EPOCH) --numeric-owner; \
>>>> +	}
>>>
>>> We normally write such constructs as:
>>>
>>> 	(cd $(TARGET_DIR) && \
>>> 		foo ....)
>>
>>   Actually, we don't AFAIK... In general, the parenthesis are not needed so they
>> should be removed. So also in this case it should be
>>
>> 	cd $(TARGET_DIR);
>> 		find ....
>>
>>>
>>> However, this raises the question of what's needed for all the other
>>> filesystem formats. Will they all have to implement a different
>>> ROOTFS_<foo>_CMD variable ? Or will there be some commonalities that
>>> should be factored out in the common rootfs image infrastructure ?
>>
>>   Yes, to me it makes more sense to do this in the actual target directory after
>> the post-build scripts have been run.
>
> I do not understand what you mean. The aim of the command is to sort
> the list of files passed to tar, it does not operate on the file
> system.

  Duh, sorry, I was just talking about the --mtime bit.

  Regards,
  Arnout

>
> Sorting is indeed needed for most other outputs I have tested (cpio,
> isofs).
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

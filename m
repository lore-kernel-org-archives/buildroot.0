From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Nov 2015 07:42:05 +0100
Subject: [Buildroot] [PATCH 2/2] package/systemd: Respect
 BR2_TARGET_GENERIC_GETTY_BAUDRATE
In-Reply-To: <20151113120800.24ae9c86@camb691>
References: <1446099102-5205-1-git-send-email-cyrilbur@gmail.com>
 <1446099102-5205-2-git-send-email-cyrilbur@gmail.com>
 <20151029171702.0fa0b81c@camb691>
 <CAFGQKxfgm1KvBR95ksPgha3XKaix_NPorSWfCcDmYYYOmhYdSw@mail.gmail.com>
 <CAGduivzujEuVZeNZ2mzwLE89-bsw3Eq6=TO3dz1ahEDBouABOw@mail.gmail.com>
 <20151113120800.24ae9c86@camb691>
Message-ID: <5645863D.7020307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-11-15 02:08, Cyril Bur wrote:
> On Wed, 4 Nov 2015 10:22:51 +0100
> Maxime Hadjinlian <maxime.hadjinlian@gmail.com> wrote:
> 
>> Hi Cyril, Martin, all
>>
>> On Thu, Oct 29, 2015 at 11:41 AM, Martin Bark <martin@barkynet.com> wrote:
>>
>>> Cyril, All,
>>>
>>> Some comment inline below
>>>
>>> On 29 October 2015 at 06:17, Cyril Bur <cyrilbur@gmail.com> wrote:  
>>>> On Thu, 29 Oct 2015 17:11:42 +1100
>>>> Cyril Bur <cyrilbur@gmail.com> wrote:
[snip]
>>>>> +     if [ $(BR2_TARGET_GENERIC_GETTY_BAUDRATE) -gt 0 ] ; \
>>>>> +     then \
>>>>> +             $(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),'  
>>> $(TARGET_DIR)/lib/systemd/system/$${SERVICE}@.service; \  
>>>>> +     fi  
>>>
>>> $(BR2_TARGET_GENERIC_GETTY_BAUDRATE) will have double quotes around it
>>> which will need to be removed so i don't think the -gt test will ever
>>> work.  Have a look in package/skeleton/skeleton.mk where it uses
>>> $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE)) to strip the
>>> double quotes before it uses the value, you'll need to do something
>>> similar.
>>>
> 
> I believe it will work, Nicolas Cavallari provided a good explanation as to
> why:
> 
> This test will work just fine, it will be expanded to e.g.
> 
> if [ "38400" -gt 0 ];
> 
> Which is a perfectly valid shell condition.  However, the sed will
> introduce the double quotes in the systemd unit file.  Which,
> according to the systemd documentation, is also fine in an ExecStart
> statement, which somewhat mimic the behavior of the shell.

 Even though it works without the qstrip, I would prefer to use qstrip after all
to make things consistent.


 Ideally, by the way, I would like the getty handling to be done together for
systemd and old init. But unfortunately, moving it to skeleton is not going to
work since this patch requires systemd to be installed and systemd requires
skeleton to be installed. So we'll have to keep it split up like this until we
find a better solution.


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

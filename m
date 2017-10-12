From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Oct 2017 16:41:38 +0200
Subject: [Buildroot] [RFC 1/3] support/kconfig/merge_config.sh: merge
 also buildroot config files
In-Reply-To: <CA+TH9VkYrz1cKyVaHk-iT6_uB45tLs71i+tLe+Lhia5f0EsZvg@mail.gmail.com>
References: <1507668210-5427-1-git-send-email-angelo.compagnucci@gmail.com>
 <1507668210-5427-2-git-send-email-angelo.compagnucci@gmail.com>
 <4b5e865a-dfba-4fdf-4043-0bcd401832b6@mind.be>
 <CA+TH9VkYrz1cKyVaHk-iT6_uB45tLs71i+tLe+Lhia5f0EsZvg@mail.gmail.com>
Message-ID: <cfc59c1c-b783-5ba7-178b-b63b8ea00f04@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-10-17 08:42, Angelo Compagnucci wrote:
> Dear Arnout Vandecappelle,
> 
> 2017-10-11 23:43 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>>
>>
>> On 10-10-17 22:43, Angelo Compagnucci wrote:
>>> This patch adds a way to merge buildroot config file programmatically.
>>
>>  We already do that in test-pkg, without this patch. What are we doing wrong?
> 
> The actual support/kconfig/merge_config.sh looks for CONFIG_ symbols
> via a regexp to print it's output and to check for inconsistencies.
> Without the correct regexp this is impossible. Probably the right
> commit message should be: "support/kconfig/merge_config.sh: check also
> buildroot config files"

 Ah, and in test-pkg we don't need it because we check for that explicitly after
running merge_config.sh.

 But if you start from a full .config (which you do in the example of 'make
foo_defconfig; make bar_stack), isn't it going to give a warning for each and
every symbol defined in the stack?

[snip]
>>> @@ -131,7 +140,12 @@ fi
>>>  # Use the merged file as the starting point for:
>>>  # alldefconfig: Fills in any missing symbols with Kconfig default
>>>  # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
>>> +if [ "$BUILDROOT_MODE" = "false" ]; then
>>>  make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
>>> +else
>>> +cp $TMP_FILE $OUTPUT/.config
>>> +make $OUTPUT_ARG olddefconfig
>>
>>  Why is this needed? alldefconfig works fine, no?
> 
> Yes, indeed, this part could be removed.

 We only added alldefconfig a few months ago, perhaps your initial patch still
predates that.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

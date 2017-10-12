From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 12 Oct 2017 08:42:25 +0200
Subject: [Buildroot] [RFC 1/3] support/kconfig/merge_config.sh: merge
 also buildroot config files
In-Reply-To: <4b5e865a-dfba-4fdf-4043-0bcd401832b6@mind.be>
References: <1507668210-5427-1-git-send-email-angelo.compagnucci@gmail.com>
 <1507668210-5427-2-git-send-email-angelo.compagnucci@gmail.com>
 <4b5e865a-dfba-4fdf-4043-0bcd401832b6@mind.be>
Message-ID: <CA+TH9VkYrz1cKyVaHk-iT6_uB45tLs71i+tLe+Lhia5f0EsZvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

2017-10-11 23:43 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>
>
> On 10-10-17 22:43, Angelo Compagnucci wrote:
>> This patch adds a way to merge buildroot config file programmatically.
>
>  We already do that in test-pkg, without this patch. What are we doing wrong?

The actual support/kconfig/merge_config.sh looks for CONFIG_ symbols
via a regexp to print it's output and to check for inconsistencies.
Without the correct regexp this is impossible. Probably the right
commit message should be: "support/kconfig/merge_config.sh: check also
buildroot config files"

>> It adds an option (-b, buildroot mode) to manage buildroot config files.
>
>  I wouldn't bother with that option. It's only going to be used for Buildroot
> config files (other packages using Kconfig will have a copy of the script
> already). So we can just change it directly. And we already have a stack of
> changes on the upstream kconfig.
>
>> The buildroot mode changes the way the script looks for configurations
>> entries using the BR2_ prefix and modify the call to the make command
>> to be buildroot friendly.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> [snip]
>> @@ -81,7 +90,7 @@ INITFILE=$1
>>  shift;
>>
>>  MERGE_LIST=$*
>> -SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
>> +SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
>
>  So here you can just hardcode BR2_

Ok

>
>>  TMP_FILE=$(mktemp -t .tmp.config.XXXXXXXXXX)
>>
>>  echo "Using $INITFILE as base"
>> @@ -131,7 +140,12 @@ fi
>>  # Use the merged file as the starting point for:
>>  # alldefconfig: Fills in any missing symbols with Kconfig default
>>  # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
>> +if [ "$BUILDROOT_MODE" = "false" ]; then
>>  make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
>> +else
>> +cp $TMP_FILE $OUTPUT/.config
>> +make $OUTPUT_ARG olddefconfig
>
>  Why is this needed? alldefconfig works fine, no?

Yes, indeed, this part could be removed.

>
>> +fi
>>
>>
>>  # Check all specified config values took (might have missed-dependency issues)
>
>  Since the kconfig stuff comes from upstream but is modified, we also maintain
> the changes as a stack of patches in support/kconfig/patches. So you should
> generate a new patch for this change and add it to the series file. I'm not sure
> why we don't use a vendor branch and just merge, but that's the way we do it :-).

Ok.

>
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo

From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 10 Nov 2013 11:17:12 +0100
Subject: [Buildroot] [PATCH 1/1] Generation of locales: made call to tr
	more	robust
In-Reply-To: <527F56D9.8060809@wanadoo.fr>
References: <1383927916-27001-1-git-send-email-thierry.bultel@wanadoo.fr>
 <c8339166-9470-405a-ad3f-6f8b4a6e6159@email.android.com>
 <527F56D9.8060809@wanadoo.fr>
Message-ID: <ca01f976-f93a-496a-9b4b-9b02c81c940a@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thierry Bultel <thierry.bultel@wanadoo.fr> wrote:
>Le 09/11/2013 14:47, Thomas De Schampheleire a ?crit :
>> Thierry Bultel <thierry.bultel@wanadoo.fr> wrote:
>>> From: tbultel <tbultel@basystemes.fr>
>>>
>>> When calling 'tr' without quoting braces, bash can make really weird things
>>> if there are existing 'single-letter-named' directories
>>> eg:
>>> tbultel at laois:~/test$ echo AAA | tr [A-Z] [a-z]
>>> aaa
>>> tbultel at laois:~/test$ echo AAA | tr [A-Z] [a-z]
>>> AAA
>>>
>>> The (quick) analysis is that the callee (tr) argvs then
>>> contain 'm' thus the translation does not work
>>>
>>> Using quotes works around it
>>> tbultel at laois:~/test$ echo AAA | tr '[A-Z]' '[a-z]'
>>> aaa
>>>
>>>
>>> Signed-off-by: tbultel <tbultel@basystemes.fr>
>>
>> This should be real name, not a username.
>>
>>> ---
>>> Makefile |    2 +-
>>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 1496bd7..7f835c0 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -548,7 +548,7 @@ target-generatelocales: host-localedef
>>> 		I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
>>> 		$(HOST_DIR)/usr/bin/localedef \
>>> 			--prefix=$(TARGET_DIR) \
>>> -			--`echo $(BR2_ENDIAN) | tr [A-Z] [a-z]`-endian \
>>> +			--`echo $(BR2_ENDIAN) | tr '[A-Z]' '[a-z]'`-endian \
>>> 			-i $${inputfile} -f $${charmap} \
>>> 			$${locale} ; \
>>> 	done
>>
>> While there's nothing wrong with your fix itself, I wonder why this isn't using the UPPERCASE and LOWERCASE macros we have defined in package/pkg-utils.mak...
>>
>> Best regards,
>> Thomas
>>
>>
>>
>
>The LOWERCASE macro does not seem to exist
>

It should be straightforward to implement it based on the existing UPPERCASE macro. I justfind odd there'd be two ways of converting case. One with direct tr and the other with a make macro...

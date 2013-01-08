From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jan 2013 08:48:18 +0100
Subject: [Buildroot] [PATCH] divine: fix divine-config
In-Reply-To: <50EB4DAD.6040409@petroprogram.com>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <50E6BFE2.2090405@zacarias.com.ar>
 <CAHXCMMKhDpanjesHYjMSh-dcAHKt-84B3gEgyzs6UgN_8VRZvQ@mail.gmail.com>
 <50E6E757.10809@zacarias.com.ar> <50E6EDB5.9070004@petroprogram.com>
 <20130106054113.GD13545@sapphire.tkos.co.il>
 <50E9BE9A.4030703@petroprogram.com> <50EB496B.60301@mind.be>
 <50EB4DAD.6040409@petroprogram.com>
Message-ID: <50EBCF42.3000505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/13 23:35, Stefan Fr?berg wrote:
> Hi Arnout
>
> 8.1.2013 0:17, Arnout Vandecappelle kirjoitti:
>> On 06/01/13 19:12, Stefan Fr?berg wrote:
[snip]
>>> ui/libui.a codecs/libcodec.a wiretap/.libs/libwiretap.a
>>> epan/.libs/libwireshark.a -lgnutls -L/usr/lib
>>                                       ^^^^^^^^^^
>>   Here's your culprit.
>>
>>   Probably one of the .la files incorrectly adds /usr/lib.
>>
>>   Question is why libtool adds it, of course...
>>
>
> Bug in libtool ?
> I tried checking all my $(STAGING_DIR)/usr/lib/*.la files but so far
> everything seems fine...

  I expect it will be one of the *.la files in wireshark itself. Or it 
could be one of the -lfoo link arguments - IIRC, libtool hard-codes 
searching in /usr/lib for libraries.

  Looking a bit more in detail, I see that autoconf's AC_PROG_LIBTOOL 
expands into a hard-coded
sys_lib_dlsearch_path_spec="/lib /usr/lib \$lt_ld_extra"

(sys_lib_search_path_spec is computed based on the compiler's search 
path.) So we actually risk running into this problem for any 
libtool-based package... Maybe we should globally patch the configure 
scripts to make sys_lib_dlsearch_path_spec empty.

  But anyway, Stefan, for wireshark you should try to find out which host 
library is found by configure. Because making sys_lib_dlsearch_path_spec 
empty would just change the error into a slightly better 'cannot find -lfoo'.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

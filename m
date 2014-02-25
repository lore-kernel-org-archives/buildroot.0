From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Feb 2014 18:13:48 +0100
Subject: [Buildroot] [PATCH v3 1/1] ncftp: fix cross-compilation test
In-Reply-To: <530A7B97.3090701@openwide.fr>
References: <1393016452-10812-1-git-send-email-romain.naour@openwide.fr>
 <530A74F4.8030906@mind.be> <530A7B97.3090701@openwide.fr>
Message-ID: <530CCF4C.7090208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/02/14 23:52, Romain Naour wrote:
> Hi Arnout,
> Le 23/02/2014 23:23, Arnout Vandecappelle a ?crit :
>> On 02/21/14 22:00, Romain Naour wrote:
>>> The cross-compilation test is based on the ability to run
>>> a test program on the host, which is wrong.
>>>
>>> If it runs, then the configure script concludes
>>> that we're doing native compilation,
>>> if it doesn't run, we're doing cross-compilation.
>>>
>>> The configure script needs to be regenerated to fix the
>>> cross-compilation test.
>>>
>>> Fixes
>>> http://autobuild.buildroot.net/results/969/969a49ae97a50634ea846a82b9c360e4fb020ace/build-end.log
>>>
>>>
>>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>>> ---
>>>   package/ncftp/ncftp.mk | 8 ++++++++
>>   Looks like the patch file itself got lost in this revision...
> 
> Thanks to the advice of ThomasP, the patch file is no longer necessary
> since the configure script is regenerated correctly by autoconf.
> I tested this patch in the same conditions as for ncftp build errors
> (with a chrootwhere ncurses was not installed on the host)

 OK, now I understand.

 I'm going to send a follow-up patch to clarify this. Otherwise, an
eventual version bumper will have a hard time understanding what is going on.


 Regards,
 Arnout

> 
> Best regards,
> Romain
> 
>>
>>
>>   Regards,
>>   Arnout
>>
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
>>> index ff6c70a..841c82b 100644
>>> --- a/package/ncftp/ncftp.mk
>>> +++ b/package/ncftp/ncftp.mk
>>> @@ -11,6 +11,14 @@ NCFTP_TARGET_BINS = ncftp
>>>   NCFTP_LICENSE = Clarified Artistic License
>>>   NCFTP_LICENSE_FILES = doc/LICENSE.txt
>>>   +NCFTP_DEPENDENCIES = host-autoconf
>>> +
>>> +define NCFTP_RUN_AUTOCONF
>>> +       (cd $(@D); $(HOST_DIR)/usr/bin/autoconf -I$(@D)/autoconf_local/)
>>> +endef
>>> +
>>> +NCFTP_PRE_CONFIGURE_HOOKS += NCFTP_RUN_AUTOCONF
>>> +
>>>   ifeq ($(BR2_PACKAGE_NCFTP_GET),y)
>>>       NCFTP_TARGET_BINS += ncftpget
>>>   endif
>>>
>>
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

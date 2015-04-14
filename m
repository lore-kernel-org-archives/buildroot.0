From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 22:06:04 +0200
Subject: [Buildroot] [PATCHv2 11/21] pkg-download: extend DOWNLOAD_INNER,
 add a SOURCE_CHECK macro
In-Reply-To: <20150413210024.GK29025@free.fr>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-12-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150413210024.GK29025@free.fr>
Message-ID: <552D732C.3060907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/04/15 23:00, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2015-04-12 18:37 +0200, Thomas Petazzoni spake thusly:
>> As part of moving to a package infrastructure based source-check
>> implementation, we are going to move away from the global DL_MODE
>> variable to select the behavior of the DOWNLOAD_INNER macro.
>>
>> As a preparation to this, this commit makes the DOWNLOAD_INNER macro
>> take a third argument, which is the action to be done: either DOWNLOAD
>> or SOURCE_CHECK. For now, the DOWNLOAD macro passes $(DL_MODE) as this
>> third argument, in order to keep the existing behavior.
>>
>> In addition, a SOURCE_CHECK macro is added, which calls DOWNLOAD_INNER
>> with the appropriate action. This macro will be used in the upcoming
>> package infra based implementation of source-check.

 It seems a bit weird to do that in this commit, more logical to do it in the
next one or as a separate commit. But that's no major issue, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> [tested by doing a "make source" on a randpackageconfig]

 You should have tested make source-check.

 I tested it but didn't finish because of a failure in github (it seems that the
AWS servers don't accept the HEAD request, and after a couple of retries I ran
into github's bandwidth limitation, so eventually I gave up).


 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>  package/pkg-download.mk | 28 ++++++++++++++++------------
>>  1 file changed, 16 insertions(+), 12 deletions(-)
>>
>> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
>> index be3babb..829b54d 100644
>> --- a/package/pkg-download.mk
>> +++ b/package/pkg-download.mk
>> @@ -209,14 +209,18 @@ endef
>>  ################################################################################
>>  
>>  define DOWNLOAD
>> -	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)))
>> +	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)),$(DL_MODE))
>> +endef
>> +
>> +define SOURCE_CHECK
>> +	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)),SOURCE_CHECK)
>>  endef
>>  
>>  define DOWNLOAD_INNER
>>  	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
>>  		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
>> -			scp) $(call $(DL_MODE)_SCP,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
>> -			*) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
>> +			scp) $(call $(3)_SCP,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
>> +			*) $(call $(3)_WGET,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
>>  		esac ; \
>>  	fi ; \
>>  	if test "$(BR2_PRIMARY_SITE_ONLY)" = "y" ; then \
>> @@ -229,18 +233,18 @@ define DOWNLOAD_INNER
>>  			scheme="$($(PKG)_SITE_METHOD)" ; \
>>  		fi ; \
>>  		case "$$scheme" in \
>> -			git) $($(DL_MODE)_GIT) && exit ;; \
>> -			svn) $($(DL_MODE)_SVN) && exit ;; \
>> -			cvs) $($(DL_MODE)_CVS) && exit ;; \
>> -			bzr) $($(DL_MODE)_BZR) && exit ;; \
>> -			file) $($(DL_MODE)_LOCALFILES) && exit ;; \
>> -			scp) $($(DL_MODE)_SCP) && exit ;; \
>> -			hg) $($(DL_MODE)_HG) && exit ;; \
>> -			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
>> +			git) $($(3)_GIT) && exit ;; \
>> +			svn) $($(3)_SVN) && exit ;; \
>> +			cvs) $($(3)_CVS) && exit ;; \
>> +			bzr) $($(3)_BZR) && exit ;; \
>> +			file) $($(3)_LOCALFILES) && exit ;; \
>> +			scp) $($(3)_SCP) && exit ;; \
>> +			hg) $($(3)_HG) && exit ;; \
>> +			*) $(call $(3)_WGET,$(1),$(2)) && exit ;; \
>>  		esac ; \
>>  	fi ; \
>>  	if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
>> -		$(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE)/$(2),$(2)) && exit ; \
>> +		$(call $(3)_WGET,$(BR2_BACKUP_SITE)/$(2),$(2)) && exit ; \
>>  	fi ; \
>>  	exit 1
>>  endef
>> -- 
>> 2.1.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

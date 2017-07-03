From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 00:30:51 +0200
Subject: [Buildroot] [RFC PATCH v5 06/11] pkg-generic: add
 GLOBAL_INSTRUMENTATION_HOOKS for rpath sanitation
In-Reply-To: <4e40ba89-7c3b-f25d-4182-76388c1b0243@mind.be>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-7-git-send-email-wg@grandegger.com>
 <4e40ba89-7c3b-f25d-4182-76388c1b0243@mind.be>
Message-ID: <00d2dee8-fe63-bc07-b3bd-93b7df740b8f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-07-17 23:47, Arnout Vandecappelle wrote:
> 
> 
> On 30-06-17 10:37, Wolfgang Grandegger wrote:
>> The hook calls the script "fix-rpath" at the end of the installation
>> step.
>>
>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> 
>  Looks good to me. I'm not adding my reviewed-by yet because it will still
> change when the fix-rpath arguments change.
> 
>  Regards,
>  Arnout
> 
>> ---
>>  package/pkg-generic.mk | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index 825ab0c..8812193 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -139,6 +139,16 @@ define step_check_build_dir
>>  endef
>>  GLOBAL_INSTRUMENTATION_HOOKS += step_check_build_dir
>>  
>> +define step_sanitize_rpath
>> +	$(if $(filter install-host-end,$(2)-$(1)),\
>> +		support/scripts/fix-rpath "host" $($(PKG)_DIR)/.br_host_filelist)
>> +	$(if $(filter install-staging-end,$(2)-$(1)),\
>> +		support/scripts/fix-rpath "staging" $($(PKG)_DIR)/.br_staging_filelist)
>> +	$(if $(filter install-target-end,$(2)-$(1)),\
>> +		support/scripts/fix-rpath "target" $($(PKG)_DIR)/.br_target_filelist)

 After reviewing the qt.conf thing, I realized that this is in fact not enough.
Indeed, staging-install may install things into host dir as well...

 So I think that both for generating the lists and for doing fix-rpath, we
should not just look at the directory corresponding to the step, but to all three.

 Since that means that the same directory may be iterated over three times, I
think it's best to also make a total of 9 files:

.br_host_install_host_filelist   -> things installed to host during host-install
.br_host_install_target_filelist -> things installed to target during host-install
.br_target_install_host_filelist -> things installed to target during target-install

 Ideally .br_host_install_target_filelist etc. should be empty, so we can also
warn or error if that is not the case.

 What do you think?

 Regards,
 Arnout

>> +endef
>> +GLOBAL_INSTRUMENTATION_HOOKS += step_sanitize_rpath
>> +
>>  # User-supplied script
>>  ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
>>  define step_user
>>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

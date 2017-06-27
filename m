From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Jun 2017 00:41:09 +0200
Subject: [Buildroot] [RFC PATCH v3 00/10] Make the SDK relocatable
In-Reply-To: <822e2bea-84d3-30a6-3c88-1aa2813cee4e@grandegger.com>
References: <1490255693-9134-1-git-send-email-wg@grandegger.com>
 <6799ad7b-a16e-d89e-eb73-d7d91880d341@mind.be>
 <d993626e-11b0-ab21-f022-d64f6a7340b6@grandegger.com>
 <8b074253-3002-1db9-d902-a73bb47e734b@grandegger.com>
 <dec2b16c-50f5-15d2-2082-c31ca82170ec@mind.be>
 <d447e85c-6c32-d73f-377c-cf109c425511@mind.be>
 <822e2bea-84d3-30a6-3c88-1aa2813cee4e@grandegger.com>
Message-ID: <c66dd2a5-831d-bee4-17cf-1ce38f0a3b6f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-06-17 12:54, Wolfgang Grandegger wrote:
> Hello,
> 
> Am 21.06.2017 um 23:06 schrieb Arnout Vandecappelle:
>>
>>
>> On 21-06-17 23:03, Arnout Vandecappelle wrote:
>>>   Preferably as an instrumentation hook, because:
>>> - it speeds things up dramatically if you do 'make foo-rebuild';
>>> - things are still correct if you interrupt the build in the middle;
>>> - it makes no difference if you do a rebuild (if patchelf is done at the end,
>>> and then you rebuild a package, the RPATH in the libs you link with is different
>>> than the first time you built it).
>>
>>   Note, however, that doing it as an instrumentation hook could be a pretty
>> dramatic rewrite of your series, so if you don't feel up to it, I'm ok with
>> committing the current approach to begin with.
> 
> I just sent out v4 of my patch series doing the sanitation at the end of the
> build. Yes, using GLOBAL_INSTRUMENTATION_HOOKS would requires further
> modification to the framework. But also "check-bin-arch" and "check-host-rpath"
> does a lot of useless scanning for ELF files.
> Therefore it would make sense to use this mechanism to create a list of ELF
> files similar to the hook "step_pkg_size" (creating packages-file-list.txt),
> either per installation step or even better per package:
> 
>   build/target-packages-elf-files.txt
>   build/staging-packages-elf-files.txt
>   build/host-packages-elf-files.txt
> 
> or (per package)
> 
>   build/elf-file-list/<host|staging|target>-<package>-elf-files.txt

 I definitely like the per-package file list, because it smoothly scales to
per-package-staging. Ideally then the packages-file-list.txt should also be
split into a separate list per package. From there it's a small step to have an
elf-file list as well.

 Since it's anyway per-package, I'd put it directly in the package build
directory, e.g. $(@D)/.<host|staging|target>-files.txt and
$(@D)/.<host|staging|target>-elf-files.txt.

 But as I understand it, your proposal is to commit your series as is, with the
scanning done only in the finalize step, and refactor it with elf files lists later?


> If we do not need the per package list lateron, we could create it
> temporarily, call "fix-rpath" to do the sanitation and delete it afterwards. Or,
> even simpler, fix-rpath could work on ".br_filelist_before" and
> ".br_filelist_after" directly... that seems not too difficult to implement. What
> do you think?

 The latter was actually what I had in mind: refactor the step_pkg_size_end to
save the output of comm in a temporary file, and use that file to call the
fix-rpath script. That temporary file is basically $(@D)/.target-files.txt.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

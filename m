From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 4 Jul 2017 21:54:52 +0200
Subject: [Buildroot] [PATCH v6 00/10] Make the SDK relocatable
In-Reply-To: <7fa2231c-4942-da98-6c91-435b4761940b@mind.be>
References: <1499185359-8293-1-git-send-email-wg@grandegger.com>
 <7fa2231c-4942-da98-6c91-435b4761940b@mind.be>
Message-ID: <684e2d2e-8611-01f3-1184-8dd982a871fe@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Am 04.07.2017 um 19:55 schrieb Arnout Vandecappelle:
>   Hi Wolfgang,
> 
>   I've already marked patch 7 and 10 as superseded in patchwork because they were
> already applied by Thomas. Can you check if there is a significant difference
> with what was applied?
> 
> On 04-07-17 18:22, Wolfgang Grandegger wrote:
>> Hello,
>>
>> this is v6 of my patch series to make the buildroot SDK (HOST_DIR)
>> relocatable. It sanitizes the RPATH of all ELF files in the "target",
>> "staging" and "host" tree using "patchelf --make-rpath-relative". We
>> now use patchelf v0.9 to still support old Debian and RHEL systems.
>>
>> v5 did RPATH sanitization per package after package installation into
>> the host, staging or target tree using GLOBAL_INSTRUMENTATION_HOOKS.
>> This approach got more and more complex and inefficient. Therefore
>> it was abandoned in favor of global sanititation at the end of the
>> host, staging and target build (see changes since v5).
>>
>> Furthermore this patch creates the script "relocate-sdk.sh" in the top
>> directory of the "host" tree allowing to relocate the SDK after it has
>> been moved to a new location. It replaces the old path with the new
>> one in all text files identified by "file --mime-type". The location
>> is stored in "usr/share/buildroot/sdk-location".
>>
>> Unfortunately, "qmake" uses hard-coded pathes compiled into the QT5
>> libraries. To overcome this problem, "qt5pase" now creates "qt.conf".
>>
>> Hope I have not too much pending issues.
> 
>   We all do :-) But this is really complicated infrastructural work, so it is to
> be expected that it takes time. Just 7 revisions would already be pretty good!

It's going forward... that's really good news!
>>
>> Wolfgang.
>>
>> Things not yet addressed:
>>
>> - "make toolchain" creates a toolchain tree which still has references
>>    to the build system (in ELF and text files).
>>
>> Changes since v5:
>> - switch back to v4
>> - patchelf patches are now based on v0.9
>> - patchelf now calculates minimal relative path to the ELF file
>>    (and not to the rootdir as before).
>> - patchelf: neededLibFound is now passed to libFoundInRPath
> 
>   If any more issues are found in the rpath fixup, they can be handled in
> follow-up patches.

Great!

BTW, I have another little patch for patchelf speeding up the open path 
significantly. Currently, the complete file will be read in regardless 
if it's an ELF file or not. Then it starts checking size, magic number, 
etc. Now it just reads the necessary data (ELF Header) for the checks 
and only if it's an ELF file, the rest of the data will be read as well. 
More soon...

Wolfgang.

From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 27 Apr 2017 11:37:39 +0200
Subject: [Buildroot] [RFC PATCH v3 00/10] Make the SDK relocatable
In-Reply-To: <6799ad7b-a16e-d89e-eb73-d7d91880d341@mind.be>
References: <1490255693-9134-1-git-send-email-wg@grandegger.com>
 <6799ad7b-a16e-d89e-eb73-d7d91880d341@mind.be>
Message-ID: <d993626e-11b0-ab21-f022-d64f6a7340b6@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Am 12.04.2017 um 15:59 schrieb Arnout Vandecappelle:
>
>
> On 23-03-17 08:54, Wolfgang Grandegger wrote:
>> Hello,
>>
>> this is v3 of my RFC patch series to make the buildroot SDK (HOST_DIR)
>> relocatable. It sanitizes the RPATH of all ELF files in the "target"
>> and "host" tree using "patchelf --make-rpath-relative". I have started
>> the mainlining process implementing "--make-rpath-relative" using
>> GitHub pull request [1]... till now, no answer!
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
>> Other Questions:
>>
>> - Why do we want relative RPATHs starting with "$ORIGIN" also for ELF
>>   files in the target tree. "/lib" and "/usr/lib" have been removed
>>   already.
>
>  Good point, I don't think we want that... Neither for the ones in staging, I
> suppose. The RPATHs there should all be absolute paths which should be
> interpreted relative to $(TARGET_DIR) resp. $(STAGING_DIR).

Could be done, no problem. Just requires some further modifications to 
patchelf. BTW, so far I have not received any response to my related 
Github pull request... like many others:

   https://github.com/NixOS/patchelf/pulls

The project seems not really to be maintained... or I use the wrong 
channel. In principle we could maintain your own version.

>  I'm not entirely sure about staging, whether ld will use RPATH as an
> alternative to -L and in that case whether it is done relative to sysroot or not.

So far, the patch series works for me very well. Just my usecase, of course.

>> Things not yet addressed:
>>
>> - "make toolchain" creates a toolchain tree which still has references
>>   to the build system (in ELF and text files).
>
>  A solution to this (and other problems) is to use the same approach as
> check-bin-arch: do it as an instrumentation hook for each package, and only look
> at the files added by that package. That way, the overhead is spread out over
> the entire build process, and doing rebuilds doesn't run patchelf on all files
> anymore in the finalize step.

This is just to solve the issue mentioned above or a general approach 
(instead of doning rtpath sanitation at the end)?

How should I go ahead to get this patch series accepted sooner than 
later? We could make the option configurable, for example, to reduce the 
risk of breaking something.

Wolfgang.

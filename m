From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Apr 2017 15:59:59 +0200
Subject: [Buildroot] [RFC PATCH v3 00/10] Make the SDK relocatable
In-Reply-To: <1490255693-9134-1-git-send-email-wg@grandegger.com>
References: <1490255693-9134-1-git-send-email-wg@grandegger.com>
Message-ID: <6799ad7b-a16e-d89e-eb73-d7d91880d341@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-03-17 08:54, Wolfgang Grandegger wrote:
> Hello,
> 
> this is v3 of my RFC patch series to make the buildroot SDK (HOST_DIR)
> relocatable. It sanitizes the RPATH of all ELF files in the "target"
> and "host" tree using "patchelf --make-rpath-relative". I have started
> the mainlining process implementing "--make-rpath-relative" using
> GitHub pull request [1]... till now, no answer!
> 
> Furthermore this patch creates the script "relocate-sdk.sh" in the top
> directory of the "host" tree allowing to relocate the SDK after it has
> been moved to a new location. It replaces the old path with the new
> one in all text files identified by "file --mime-type". The location
> is stored in "usr/share/buildroot/sdk-location".
> 
> Unfortunately, "qmake" uses hard-coded pathes compiled into the QT5
> libraries. To overcome this problem, "qt5pase" now creates "qt.conf".
> 
> Other Questions:
> 
> - Why do we want relative RPATHs starting with "$ORIGIN" also for ELF
>   files in the target tree. "/lib" and "/usr/lib" have been removed
>   already. 

 Good point, I don't think we want that... Neither for the ones in staging, I
suppose. The RPATHs there should all be absolute paths which should be
interpreted relative to $(TARGET_DIR) resp. $(STAGING_DIR).

 I'm not entirely sure about staging, whether ld will use RPATH as an
alternative to -L and in that case whether it is done relative to sysroot or not.

> 
> Things not yet addressed:
> 
> - "make toolchain" creates a toolchain tree which still has references
>   to the build system (in ELF and text files).  

 A solution to this (and other problems) is to use the same approach as
check-bin-arch: do it as an instrumentation hook for each package, and only look
at the files added by that package. That way, the overhead is spread out over
the entire build process, and doing rebuilds doesn't run patchelf on all files
anymore in the finalize step.



 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Mar 2014 11:10:44 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140305100431.62d2715c@skate>
References: <20140302073008.028A91015DC@stock.ovh.net>	<20140302095754.13319d04@skate>	<53165F4D.5060405@mind.be>
 <20140305100431.62d2715c@skate>
Message-ID: <5316F824.5000805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/03/14 10:04, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Wed, 05 Mar 2014 00:18:37 +0100, Arnout Vandecappelle wrote:
>> On 02/03/14 09:57, Thomas Petazzoni wrote:
>>>>       i686 |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/2a62de3247ba5ad273f03d01e690a3eeb11aa7b4/
>>> Parallel installation issue with Python 3. Either we should make Python
>>> 3 entirely use MAKE1, or fix the problem. I have analyzed the problem,
>>> and it is caused by the parallel installation of libpython into the
>>> HOST_DIR and the execution of ./python in the Python source directory.
>>
>>  Is that because we export an LD_LIBRARY_PATH that points to the freshly
>> installed libpython? Because I would expect that ./python uses the build
>> directory's libpython, not the installed one...
>>
>>  Oh, but it actually does get called with the correct LD_LIBRARY_PATH:
>>
>> LD_LIBRARY_PATH=/home/peko/scratch/build/host-python3-3.4.0rc1:/home/peko/scratch/host/usr/lib:
>> ./python ...
>>
>>  The issue is that the executable contains an RPATH pointing to the
>> install location of libpython.so (in $(HOST_DIR)).
> 
> Correct. I came to the same conclusion when analyzing the problem the
> other day (but I reported only my findings on IRC, and didn't send a
> summary to the list, my bad).
> 
>> When the file doesn't
>> exist yet there, LD_LIBRARY_PATH kicks in and it finds the so file in the
>> build directory. When the file does exist, it can link against it -
>> except when it hasn't been fully written yet.
>>
>>  The solution would be if the executable would use RUNPATH instead of
>> RPATH - which according to e.g. [1] is what everybody should do (and I
>> tend to agree). IOW, the option --enable-new-dtags should be passed to
>> the linker ("new" is not really true BTW, the option has existed for
>> since more than 10 years). When we would add a toolchain wrapper for ld,
>> we could add it there.
>>
>>  But for the time being, I'll post a patch for python3 (and python, which
>> suffers from the same problem) that adds --enable-new-dtags there.
> 
> Indeed, DT_RUNPATH would fix the problem, but to me it feels more like
> a workaround than a real fix, no? Wouldn't the real fix be to ensure
> that the installation is atomic, i.e either the library is present in
> $(HOST_DIR)/usr/lib, or it is not? The problem here apparently occurs
> when Python is executed when the library file already exists in
> $(HOST_DIR)/usr/lib, but its copy hasn't finished yet.

 In this case, that happens to be the problem. But in general, it is
possible that there is already an old version of the library in
$(HOST_DIR)/usr/lib, and then that one will be used instead of the newly
built one. Nothing catastrophic, but still wrong.

 The thing is, RPATH was just a mistake to begin with: you _always_ want
LD_LIBRARY_PATH to take precedence over RPATH, otherwise LD_LIBRARY_PATH
doesn't make much sense. That's why I think that adding
--enable-new-dtags unconditionally for all builds would be a great idea.


 I just noticed now that the idea of an ld wrapper that adds that option
would not work in this case anyway, because this is the host ld... Note
that some distros (I think Gentoo and SUSE at least) patch binutils to
make the --enable-new-dtags the default, so there you wouldn't even see
this issue.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 17 Aug 2016 23:18:42 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-05
In-Reply-To: <20160809141506.GA28979@megas.kitware.com>
References: <20160806063028.356101023A1@stock.ovh.net>
 <20160807112654.7b520594@free-electrons.com>
 <CAHXCMM+xOgCuMNHMSqj4tOP2jMGP7OPOLD1_x0_8HCgXb_h21g@mail.gmail.com>
 <20160809141506.GA28979@megas.kitware.com>
Message-ID: <CAHXCMMKG2e5BmaAwvLtJMC2-Q2m7kbrNKSBOfHDRYfbc_FQkGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ben, Thomas, all,

(sorry for the delayed response :-|)

On Tue, Aug 9, 2016 at 4:15 PM, Ben Boeckel <mathstuf@gmail.com> wrote:
> On Sun, Aug 07, 2016 at 17:48:46 +0200, Samuel Martin wrote:
>> It seems to be another error due to "-isystem
>> $(STAGING_DIR)/usr/include" passed to g++ [1].
>>
>> AFAICS, this is done by CMake when generating the flags.make files.
>> Note that removing it from the CXX_INCLUDES variables in all generated
>> flags.make prevent from triggering this error.
>>
>> It is not clear to me whether it is a gcc-6.x bug or a CMake one.
>> According to fedora developers, this is not a gcc-6 bug [2].
>> Ben, do you have any idea?
>
> It might be that CMake is having trouble determining the paths that the
> compiler uses by default? It should exclude any such directories from
> the -I setup (though -isystem may change this behavior). CMake builds up
> this variable:
>
>     https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_IMPLICIT_INCLUDE_DIRECTORIES.html
>
> based on the platform. It prefixes these with the value of CMAKE_SYSROOT
> to create the list of implicit directories it ignores when building up
> -I lines. Is CMAKE_SYSROOT not set properly?

Good catch!
CMAKE_SYSROOT is not set in the toolchainfile. Setting it is enough to
fix this problem.
It seems the heuristics used by CMake is somehow confused with gcc-6.

Anyway, I'll post shortly a patch with this fix.

Ben, thanks a lot for your valuable insights.

Regards,

-- 
Samuel

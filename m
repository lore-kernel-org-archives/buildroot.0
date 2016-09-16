From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Sep 2016 09:42:18 +0200
Subject: [Buildroot] CMAKE_SYSROOT issue [was: Re: [PATCH]
 toolchain-external: fix potential entire root filesystem removal]
In-Reply-To: <87lgysdflp.fsf@dell.be.48ers.dk>
References: <1473929908-25697-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87k2edeay4.fsf@dell.be.48ers.dk>
 <fc0a0de7-398a-8b83-cf76-c4c0b031e01a@mind.be>
 <87y42tc4fl.fsf@dell.be.48ers.dk>
 <a4cc525b-c26a-fb0d-23c5-c72482377e95@mind.be>
 <87lgysdflp.fsf@dell.be.48ers.dk>
Message-ID: <cb88e552-39e6-81fd-bf4f-b80d7cb59b7e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-09-16 23:21, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>  >> >  But nothing is really screaming that it should be included.
>  >> 
>  >> Ok. We should probably figure out if we need to revert the CMAKE_SYSROOT
>  >> addition (e8c3755676) and include that if needed.
> 
>  >  Er, why would we need to revert it? Did I miss something?
> 
> I thought it had been discussed on the list, but apparently not. We got
> a report on IRC (I unfortunately don't have logs) that builds of custom
> packages using cmake were failing with 2016.08. It is apparently caused
> by CMAKE_SYSROOT transforming -I$STAGING_DIR/usr/include into --sysroot
> $STAGING_DIR -I /usr/include. In 2016.08 we now default
> BR2_COMPILER_PARANOID_UNSAFE_PATH to y, so it complains about it.

 OK, I found it in my logs:

> [01/09 11:29:38] <pdgendt> hi all, I just used 2016.08-rc3 today but for some reason I get an error with a cmake package (which I didn't have with 2016.05), the error is that /usr/include is used over the buildroot generated include files
> [01/09 11:29:50] <pdgendt> I see the problem with boost headers included
> [01/09 11:30:41] <pdgendt>  # include_next <limits.h>
> [01/09 11:30:56] <uclibc-bot> buildroot:master Peter Korsgaard * 2016.08-rc3-7-g78e9914 Update for 2016.08
> [01/09 11:31:01] <pdgendt>  /usr/include/limits.h:123:3: error: #include_next is a GCC extension [-Werror]
> [01/09 11:31:20] <uclibc-bot> buildroot:2016.08 Peter Korsgaard * 2016.08 Update for 2016.08
> [01/09 11:32:08] <pdgendt> from /usr/include/boost/thread/mutex.hpp:16
> [01/09 11:32:53] <pdgendt> am I missing a dependency or something?
> [01/09 11:38:29] <Jacmet> pdgendt: no, we enable the check-for-unsafe-includes (/usr/include is for you build host, not for your cross compiler)
> [01/09 11:39:07] <Jacmet> pdgendt: you can disable the check under build options->advanced->paranoid check of library/header paths
> [01/09 11:39:39] <Jacmet> pdgendt: the check is done by the toolchain wrapper, so I believe you need to do a make clean; make to get rid of it
> [01/09 11:40:00] <pdgendt> Jacmet: the check is fine, I don't want the /usr/include, but the odd part is that all the required headers are available in the generated includes
> [01/09 11:40:14] <pdgendt> and still /usr/include is used
> [01/09 11:40:48] <Jacmet> pdgendt: what toolchain do you use?
> [01/09 11:41:55] <pdgendt> glibc
> [01/09 11:43:29] <Jacmet> pdgendt: ok, built by buildroot or from somewhere else?
> [01/09 11:43:34] <pdgendt> buildroot
> [01/09 11:43:55] <pdgendt> the package that has issues is a custom one: http://pastebin.com/YMhqfZ4W
> [01/09 11:44:53] <Jacmet> pdgendt: ok, and does that end up adding -I/usr/include when it calls gcc or similar?
> [01/09 11:52:47] <pdgendt> don't see that here, should I enable some verbose things?
> [01/09 11:53:09] <Jacmet> pdgendt: depends, do you see the $CROSS-gcc invocations?
> [01/09 11:54:47] <pdgendt> the log: http://pastebin.com/mSCCCq87
> [01/09 11:55:38] <pdgendt> the invocations are not verbose I guess
> [01/09 11:56:47] <Jacmet> pdgendt: I believe cmake supports the VERBOSE=1 option, could you try sticking that in CPPRESTSDK_MAKE_OPTS?
> [01/09 11:57:38] <kos_tom> Jacmet: even for CMake, I just pass "make V=1" on the Buildroot command line, and it works
> [01/09 11:58:14] <Jacmet> kos_tom: ok
> [01/09 11:58:21] <kos_tom> I believe the logic in our Makefile defines VERBOSE=1 when V=1
> [01/09 11:58:31] <kos_tom> ifeq ($(KBUILD_VERBOSE),1) Q =
> [01/09 11:58:31] <kos_tom> ifndef VERBOSE VERBOSE = 1
> [01/09 11:58:31] <kos_tom> endif
> [01/09 11:59:05] <pdgendt> -I/usr/include is indeed added
> [01/09 11:59:32] <Jacmet> pdgendt: ok, then you need to track down where it gets added
> [01/09 12:00:27] <Jacmet> ready for autobuilder breakage? ;)
> [01/09 12:01:25] <pdgendt> I guess I can just execute the last compiler command without the -I/usr/include and see which file is missing?
> [01/09 12:01:38] <Jacmet> pdgendt: probably nothing is missing
> [01/09 12:01:56] <Jacmet> pdgendt: as the cross compiler already looks in $STAGING_DIR/usr/include by default
> [01/09 12:03:04] <pdgendt> I probably can't force the compiler to get rid of the -I/usr/include ?
> [01/09 12:03:14] <Jacmet> pdgendt: probably something goes wrong in the cmake file when it detects dependencies
> [01/09 12:04:24] <pdgendt> I am guessing the same thing, a find_package that resolves to including /usr/include
> [01/09 12:09:05] <pdgendt> wouldn't it be wise to always remove -I/usr/include in buildroot toolchain by default?
> [01/09 12:09:25] <pdgendt> for none-host packages
> [01/09 12:19:09] <Jacmet> pdgendt: well, they shouldn't be there, so it is really an error if they are. With the recent change we complain if it happens so the bug can be fixed instead of just ignored
> [01/09 12:19:44] <Jacmet> pdgendt: E.G. their presence is normally an indication of a bigger problem
> [01/09 13:04:51] <pdgendt> Jacmet: indeed, but forcing the removal of /usr/include would generate compiler errors like "could not find header.h" which would point out the issue directly
> [01/09 13:05:18] <pdgendt>  /usr/include as an include directory of course
> [01/09 13:06:18] <Jacmet> pdgendt: no, it normally wouldn't as /usr/include is in the default search path of your system compiler, and $STAGING_DIR/usr/include in the search path of your cross compiler
> [01/09 13:06:52] <pdgendt> but I do use the cross compiler right?
> [01/09 13:08:47] <Jacmet> pdgendt: yes, but you most likely have $STAGING_DIR/usr/include/header.h as well
> [01/09 13:17:41] <pdgendt> Jacmet: hmm strange thing is that I use exactly the same package on 2016.05 which didn't throw errors
> [01/09 13:44:09] <Jacmet> pdgendt: we changed the check to default on in 2016.08-rc1
> [01/09 14:04:52] <pdgendt> Jacmet: no I mean with 2016.05 the -I/usr/include is not added to the compiler
> [01/09 14:13:52] <Jacmet> pdgendt: ahh, ok
> [01/09 14:22:15] <pdgendt> I want to push the new cpprestsdk package upstream but not if I can't figure out what is going wrong :-p
> [01/09 14:23:43] <uclibc-bot> buildroot:master Peter Korsgaard * 2016.08-1-ga895c27 docs/website/news.html: add 2016.08 announcement link
> [01/09 14:23:44] <uclibc-bot> buildroot:master Peter Korsgaard * 2016.08-2-gcff53ce Kickoff 2016.11 cycle
> [01/09 14:26:16] <kos_tom> Jacmet: yooohoo, a release :)
> [01/09 14:28:07] <Jacmet> kos_tom: yeah. I cut the release this morning though, didn't you get the release mail?
> [01/09 14:28:58] <kos_tom> I did get it
> [01/09 14:29:07] <kos_tom> just didn't had the time to say "yooohoo" :)
> [01/09 14:29:49] <Jacmet> kos_tom: heh
> [01/09 14:42:40] <pdgendt> Jacmet: So would my comment then be valid, i I could force remove the include that I should be pointed to the missing header?
> [01/09 14:50:03] <Jacmet> pdgendt: well, the way to remove the include is to figure out where it gets added and fix the code that adds it
> [01/09 15:18:07] <pda123> kos_tom trying to get usbnet added into the build as a module but cant see how to get this added I've check the kernel config and usb networking. is set as a module? any ideas? thanks
> [01/09 15:21:15] <kos_tom> grep CONFIG_USBNET output/build/linux-*/.config ?
> [01/09 15:41:20] <y_morin> ?Ola!
> [01/09 15:45:25] <pdgendt> in output/host/usr/share/buildroot/toolchain.cmake the following is added which breaks my build:  set(CMAKE_SYSROOT "${RELOCATED_HOST_DIR}/usr/arm-buildroot-linux-gnueabi/sysroot")
> [01/09 15:45:50] <pdgendt> Jacmet^
> [01/09 15:46:55] <pdgendt> output/host/usr/share/buildroot/toolchainfile.cmake*
> [01/09 15:48:36] <pdgendt> this adds the --sysroot argument for g++ but refactors the include as -I/usr/include
> [01/09 15:49:23] <pdgendt> simply commenting out the "set (CMAKE_SYSROOT ...)" allows me to compile
> [01/09 15:52:45] <pdgendt> smartin: maybe you can help me?
> [01/09 15:52:51] <pdgendt> since this was added in e8c3755676111dbd5c45d556da7982993e33e227
> [01/09 15:52:54] <Jacmet> pdgendt: that's no good. Samuel added this on the 17th
> [01/09 15:53:16] <Jacmet> pdgendt: do you mind bringing up the issue on the mailing list with Samuel? I know very little about cmake
> [01/09 16:04:09] <pdgendt> sure, I will put it on later, now that my build issue is fixed I need to do some other things first :)
> [01/09 16:32:00] <kos_tom> Jacmet: pdgendt: gaah, bad regression this is :-/
> [01/09 16:36:58] <pdgendt> kos_tom: I think this also conflicts with the paranoid /usr/include check..
> [01/09 16:38:20] <Jacmet> kos_tom: yeah, odd that nothing showed up on the autobuilders
> [01/09 16:38:45] <kos_tom> pdgendt: do you have an example of a cmake package that fails to build with this?
> [01/09 16:39:17] <pdgendt> kos_tom: yes but it is a custom one, not pushed upstream yet
> [01/09 16:40:33] <kos_tom> yeah, but if you can submit it as a test case of the sysroot thing breaking, it would be very useful
> [01/09 16:41:20] <pdgendt> can I do this quick and dirty since I don't have time to post a formal patch? xD
> [01/09 16:42:33] <kos_tom> yes
> [01/09 16:42:36] <y_morin> pdgendt: Yes, just shoot.
> [01/09 16:42:38] <kos_tom> just don't submit as a formal patch
> [01/09 16:42:48] <kos_tom> just put it within your bug report or something.
> [01/09 16:43:12] <y_morin> That's weird nothing broke because of that... :-/
> [01/09 16:43:45] <pdgendt> patch on top of master or 2016.08?
> [01/09 16:44:06] <y_morin> pdgendt: They currently are the same, as far as I can see.
> [01/09 16:44:31] <Jacmet> pdgendt: yes, I haven't merged next into master yet
> [01/09 16:51:10] <pdgendt> dirty paste: http://pastebin.com/f4Q5pPcn
> [01/09 16:55:48] <y_morin> pdgendt: Looking at the CMakeLists, I see line 175 and 177, it points to /usr/lib/cmake/websocketpp which is definitely an usafe path.
> [01/09 16:56:42] <y_morin> So I could see how it would faiL:  you have websocketpp installed on the host, and the package is disabled in Buildroot: it would try to use the host headers.
> [01/09 16:56:58] <y_morin> And then trigger the paranoid unsafe path check.
> [01/09 16:57:00] <pdgendt> I have it enabled in buildroot
> [01/09 16:57:54] <pdgendt> and not in my system
> [01/09 16:58:28] <y_morin> pdgendt: OK, but still that could be an issue on other systems.
> [01/09 16:58:49] <y_morin> pdgendt: Better to make websocketpp a mandatory dependency (to avoid using the bundled version)
> [01/09 16:59:30] <pdgendt> y_morin: true, or we could use the explicit CPPREST_EXCLUDE_WEBSOCKETS if not enabled
> [01/09 16:59:38] <pdgendt> but as I said: dirty dirty patch
> [01/09 16:59:48] <kos_tom> we already had a package submission for websocketpp: https://patchwork.ozlabs.org/patch/659477/
> [01/09 17:00:33] <y_morin> kos_tom: Yup, I was just looking at the cpprestsdk package as posted by pdgendt
> [01/09 17:00:49] <y_morin> Anyway, I can try to spin a build here.
> [01/09 17:01:19] <pdgendt> btw I also added websocketpp as a cmake package on my build
> [01/09 17:03:14] <y_morin> pdgendt: Care to share your .config please?
> [01/09 17:06:56] <pdgendt> http://pastebin.com/HPEwaV93
> [01/09 17:07:07] <pdgendt> keep in mind that I also have websocketpp as a package
> [01/09 17:08:02] <y_morin> pdgendt: Yep, I added here too.
> [01/09 17:09:13] <pdgendt> I added websocketpp as a cmake-package, not a generic though
> [01/09 17:15:24] <y_morin> pdgendt: You have a global patch dir set. Are there patches I'd need?
> [01/09 17:19:05] <pdgendt> y_morin: none relevant
> [01/09 17:19:51] <y_morin> OK
> [01/09 17:19:53] <pdgendt> y_morin: I do see in my config that our modified bootloader and kernel is set
> [01/09 17:20:08] <pdgendt> but you can ignore those
> [01/09 17:20:51] <y_morin> pdgendt: Sure, I was going to just build cpprestsdk:    make cpprestsdk
> [01/09 17:22:00] <y_morin> OK, build started.
> [01/09 17:22:19] <pdgendt> y_morin: I mean the build would fail on kernel or bootloader since they are on a private git
> [01/09 17:26:56] <smartin> pdgendt: do you have a pastebin with the log outputs of the failure (with V=1)?
> [01/09 17:27:15] <pdgendt> I think so, just a sec
> [01/09 17:35:53] <pdgendt> smartin: I think this shows the relevant part: http://pastebin.com/KA6PRzBx
> [01/09 17:44:02] <smartin> pdgendt: well, first the build because of -Werror... but there is still the wrong include paths
> [01/09 17:45:07] <smartin> pdgendt: could you also pastebin the CMakeCache.txt from the build dir. please?
> [01/09 17:51:20] <pdgendt> http://pastebin.com/rFnAqpSk
> [01/09 17:51:25] <pdgendt> smartin^
> [01/09 17:52:22] <pdgendt> I need to go now, but I will leave chat open for tomorrow and will monitor the mailing list for messages
> [01/09 17:52:32] <pdgendt> thx already for the effort everyone
> [01/09 19:00:51] <y_morin> pdgendt: Sorry, I had to go for a moment.
> [01/09 19:01:24] <y_morin> pdgendt: So, I usedthe websocketpp package that is in patchwork, and it fails to isntall. So the cpprestsdk did not build yet.,
> [01/09 19:01:36] <y_morin> pdgendt: I'll try to fis that and re-run the build.
> [01/09 19:02:17] <y_morin> OK, simple typo on my side.
> [01/09 19:07:53] <y_morin> smartin: Hello! Still around?
> [01/09 19:16:20] <y_morin> pdgendt: So, the build was sucessful for me (after removing -Werror)
> [01/09 19:17:07] <y_morin> pdgendt: I.e. I did not hit the usafe path check... :-/
> [01/09 19:20:25] <smartin> y_morin: + or - ...
> [01/09 19:21:01] <smartin> y_morin: with paranoid check on, there was no warning?
> [01/09 19:21:14] <y_morin> smartin: None at all...
> [01/09 19:21:33] <y_morin> smartin: I had the paranoid check in enforce mode, so it would have failed the build.
> [01/09 19:23:34] <smartin> no patch applied to use cmake from the distro?
> [01/09 19:23:47] <y_morin> Nope
> [01/09 19:23:56] <y_morin> smartin: Using master as of now.
> [01/09 19:24:08] <smartin> on what distro?
> [01/09 19:24:14] <y_morin> smartin: I however used a prebuilt toolchain.
> [01/09 19:24:26] <smartin> nothing in the env?
> [01/09 19:24:42] <y_morin> smartin: Ubuntu 14.04 I think...
> [01/09 19:25:23] <y_morin> smartin: Well, env is pretty lean, yes. Nothing fancy (no CC, CXX or the likes, nor CMAKE_* either, if that's what you mean
> [01/09 19:28:54] <y_morin> smartin: Ah, I also disabled the compiler cache (ccache) because I hate with a pation... :-/
> [01/09 19:29:16] <y_morin> smartin: I've restarted a build with the exact same settings now (except paranoid check in enforce mode, of course)
> [01/09 19:29:21] <y_morin> pdgendt: ^^^
> [01/09 19:29:42] <y_morin> s/pation/passion/

> [02/09 10:46:02] <smartin> hi all o/
> [02/09 10:54:20] <pdgendt> hey smartin, quick question: if the toolchain was not rebuilt, would the toolchainfile.cmake be built for packages?
> [02/09 10:54:59] <pdgendt> as y_morin did not rebuilt the toolchain yesterday
> [02/09 11:07:12] <smartin> pdgendt: the toolchainfile.cmake is generated at the end of the toolchain build or installation (depending on the toolchain backend used)
> [02/09 11:07:48] <pdgendt> smartin: so if y_morin did not rebuild the toolchain the set (CMAKE_SYSROOT ...) line would not be added to the file
> [02/09 11:08:03] <smartin> and it will reflect the toolchain configuration as set in the current buildroot .config file
> [02/09 11:08:04] <pdgendt> which is causing my problem
> [02/09 11:09:45] <smartin> pdgendt: i think it will
> [02/09 11:13:13] <smartin> pdgendt: if you run 'make clean ; make' using this external toolchain backend, the toolchainfile.cmake will be regenerated after every single clean operation
> [02/09 11:14:05] <smartin> it does not take care of when the toolchain was built (before or after  the commit adding 'set (CMAKE_SYSROOT ...)'
> [02/09 11:14:09] <pdgendt> smartin: ok, it's odd why I get the issue, will investigate further
> [02/09 11:15:58] <smartin> from the CMakeCache, i saw that: there is some INCLUDE_DIR pointing to <STAGING_DIR>/usr/include,
> [02/09 11:16:52] <pdgendt> isn't that expected?
> [02/09 11:17:31] <smartin> cmake seems to split it like this: '--sysroot <STAGING_DIR> -I/urs/include' , i guess cmake does it because of/based on the CMAKE_SYSROOT.
> [02/09 11:17:57] <smartin> ^^^ is to be confirm with cmake developers
> [02/09 11:18:45] <smartin> but i wonder why it keep '-I/usr/include' since it is a standard location that gcc will check anyway
> [02/09 11:19:02] <smartin> ^^^ also, to be figured out with cmake developers


(I didn't read all of the above yet :-)


 Regards,
 Arnout


> 
> I don't quite understand how come this doesn't trigger on the
> autobuilders and I haven't had time to investigate, but I got a 2nd
> report off list with the same problem, so it sounds real.
> 
> Samuel, any ideas?
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Jul 2017 15:12:40 +0200
Subject: [Buildroot] [FYI 2/2] WIP:qt5: Bump up to 5.9
In-Reply-To: <BN6PR03MB2914E567ED3AEF1B387F2D17BFD60@BN6PR03MB2914.namprd03.prod.outlook.com>
References: <104a0453-7ac4-f6d9-3e66-2671b313d757@melcoinc.co.jp>
 <1cc8737a-4ecd-5aa7-2a2e-628cea1e6652@melcoinc.co.jp>
 <20170629213647.020e3fb0@gmx.net>
 <09654530-e03b-bcfd-0e52-1be644792111@melcoinc.co.jp>
 <4d0a7e96-00c8-4234-9174-f584aeda7844@mind.be>
 <1498957590990-168959.post@n4.nabble.com>
 <4aafe02d-451d-c972-07c3-a6a47acd7d92@mind.be>
 <BN6PR03MB2914E567ED3AEF1B387F2D17BFD60@BN6PR03MB2914.namprd03.prod.outlook.com>
Message-ID: <35ddfd8c-6505-458e-37ad-bae9c2ecf287@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-07-17 07:31, Brent Sink wrote:
> Hi Arnout,
> 
> Thanks for the feedback!  I've modified my patch with your suggestions, 
> and I'll try to submit it correctly using the send-email function tomorrow.
> 
> On 7/2/2017 6:58 AM, Arnout Vandecappelle wrote:
> 
>>   The name of the config symbol shouldn't be changed. The idea is that people who
>> select LATEST always get the latest version and don't need to change their
>> .config all the time.
> That makes sense.  I've changed _5_9 to _LATEST.  As Naoki stated, this 
> can be revisited when 5.10 is released.
> 
>>   When you test, can you (also) test it with a gcc 4.8 toolchain to be sure that
>> that is still supported? They tend to use more and more C++11 features which may
>> require more recent toolchains.
> I'm using gcc 6 and currently do not have a way to test for gcc 4.8.  Is 
> someone else able to test with gcc 4.8?

 You can use the following config fragment:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="armv5-ctng-linux-gnueabi"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y

This is one of the toolchains used in the autobuilders. In fact, ideally you
should test all 48 toolchains using the test-pkg script (used to be in
support/scripts, since Saturday it's in utils). But for Qt5 that's going to take
rather long...


> 
>> -# Hash from:
>> http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qt3d-opensource-src-5.8.0.tar.xz
>> -sha256 3a224576fc922195ac0063b5b351cd6b9d13afcde9cec14317be0347d10c8ae5
>> qt3d-opensource-src-5.8.0.tar.xz
>> +# Hash from:
>> http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qt3d-opensource-src-5.9.1.tar.xz
>>   There was something wrong with the original here and you just kept it: the hash
>> is in ....tar.xz.mirrorlist, not in ....tar.xz. Which makes me suspect that you
>> didn't actually get the hash from there, so you're lying :-)
> You caught me. :)  I have now appended ".mirrolist" onto the end of the 
> comment.  I had to manually go there and copy the hash for each one into 
> the .hash file.  Is there a better or more automated way to do this?

 Unfortunately there is no more automated way. For qt5 it would in fact be
possible to write a script since both the URL and the mirrorlist file is quite
predictable so it's easy to scrape. But in general those things are shown in
wildly different ways. You're welcome to contribute a script that automates if
for Qt5 :-)



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

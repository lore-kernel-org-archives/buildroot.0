From: Brent Sink <brents_3@hotmail.com>
Date: Mon, 3 Jul 2017 05:31:17 +0000
Subject: [Buildroot] [FYI 2/2] WIP:qt5: Bump up to 5.9
In-Reply-To: <4aafe02d-451d-c972-07c3-a6a47acd7d92@mind.be>
References: <104a0453-7ac4-f6d9-3e66-2671b313d757@melcoinc.co.jp>
 <1cc8737a-4ecd-5aa7-2a2e-628cea1e6652@melcoinc.co.jp>
 <20170629213647.020e3fb0@gmx.net>
 <09654530-e03b-bcfd-0e52-1be644792111@melcoinc.co.jp>
 <4d0a7e96-00c8-4234-9174-f584aeda7844@mind.be>
 <1498957590990-168959.post@n4.nabble.com>
 <4aafe02d-451d-c972-07c3-a6a47acd7d92@mind.be>
Message-ID: <BN6PR03MB2914E567ED3AEF1B387F2D17BFD60@BN6PR03MB2914.namprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for the feedback!  I've modified my patch with your suggestions, 
and I'll try to submit it correctly using the send-email function tomorrow.

On 7/2/2017 6:58 AM, Arnout Vandecappelle wrote:

>   The name of the config symbol shouldn't be changed. The idea is that people who
> select LATEST always get the latest version and don't need to change their
> .config all the time.
That makes sense.  I've changed _5_9 to _LATEST.  As Naoki stated, this 
can be revisited when 5.10 is released.

>   When you test, can you (also) test it with a gcc 4.8 toolchain to be sure that
> that is still supported? They tend to use more and more C++11 features which may
> require more recent toolchains.
I'm using gcc 6 and currently do not have a way to test for gcc 4.8.  Is 
someone else able to test with gcc 4.8?

> -# Hash from:
> http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qt3d-opensource-src-5.8.0.tar.xz
> -sha256 3a224576fc922195ac0063b5b351cd6b9d13afcde9cec14317be0347d10c8ae5
> qt3d-opensource-src-5.8.0.tar.xz
> +# Hash from:
> http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qt3d-opensource-src-5.9.1.tar.xz
>   There was something wrong with the original here and you just kept it: the hash
> is in ....tar.xz.mirrorlist, not in ....tar.xz. Which makes me suspect that you
> didn't actually get the hash from there, so you're lying :-)
You caught me. :)  I have now appended ".mirrolist" onto the end of the 
comment.  I had to manually go there and copy the hash for each one into 
the .hash file.  Is there a better or more automated way to do this?
>> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
>> index 5fe8bb8..97db864 100644
>> --- a/package/qt5/qt5base/qt5base.mk
>> +++ b/package/qt5/qt5base/qt5base.mk
>> @@ -9,6 +9,13 @@ QT5BASE_SITE = $(QT5_SITE)
>>   QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz
>>   
>>   QT5BASE_DEPENDENCIES = host-pkgconf zlib pcre
>   pcre should be removed from DEPENDENCIES here.
Ok, I have fixed this.

>
>> +#TODO:More better syntax? likely BR2_PACKAGE_QT5_VERSION < 5.9
>   You can drop this comment added by Naoki, it no longer applies.
Gone.

>> +ifeq ($(BR2_PACKAGE_QT5_VERSION_5_9),y)
>   Since we may add another choice option for 5.9 LTS later, it's more future-safe
> to make the condition on BR2_PACKAGE_QT5_VERSION_5_6. So
>
> ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
> QT5BASE_DEPENDENCIES += pcre
> else
> QT5BASE_DEPENDENCIES += pcre2
> endif
Ok, this has been changed.

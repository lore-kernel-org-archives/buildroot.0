From: Andreas Naumann <dev@andin.de>
Date: Wed, 27 Mar 2019 23:13:27 +0100
Subject: [Buildroot] [PATCH v4 5/6] qt5base: Fix inconsistencies when
 overriding qmake properties
In-Reply-To: <dc0979e0-6204-4969-338f-64a14441bb78@mind.be>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
 <20190322183904.22401-6-anaumann@ultratronik.de>
 <dc0979e0-6204-4969-338f-64a14441bb78@mind.be>
Message-ID: <dfc5a0f1-cef5-0dcd-f382-7003627c019a@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 26.03.19 um 00:50 schrieb Arnout Vandecappelle:
> 
> 
> On 22/03/2019 19:39, Andreas Naumann wrote:
>> When querying the qmake properties with our custom qt.conf
>> present, I noticed that they were different from the built-in ones
>> (without qt.conf). Most notably QT_INSTALL_PREFIX was a
>> concatenated string of two absolute pathes (hostdir + sysroot).
>> 
>> This is due to Prefix being set to our HOST_DIR and HostPrefix not 
>> being set at all. I guess this was also the root cause of the 
>> initial problem with qt.conf.in, because once Prefix and
>> HostPrefix were set to their correct values, re-setting all the
>> other default pathes became obsolete. (However, since our pathes
>> for Headers, Plugins and Examples are non-default, they still have
>> to be explicitely set.)
>> 
>> There is one additional exception to this: Omitting 'Settings' 
>> leads to the CONFIGURATION path being plain /usr, whereas the 
>> default without qt.conf is /usr/etc/xdg. Thus 'Settings' is now 
>> also explicitely set, in order to keep behaviour with/without 
>> qt.conf as similar as possible.
> 
> This used to be the first patch in the series, and AFAICS it should 
> indeed be OK to apply it already. Or am I mistaken? Have you tested 
> some packages with just this patch?

After v1 I have not tested just this patch exclusively, but always with
the other patches on top. If something was wrong it should fail anyway
though.
I reordered it because it's not a prerequisite to qmake infra. Actually
I wasn't sure to resend it at all because its more a prerequisite to the
ppsh changes (which I left out at v4).

But true, it stands on its own and I'd be happy if it could be
tested/applied by someone. Should I resend standalone?

Regards,
Andreas



> 
> The changelog in the cover letter doesn't bring enlightenment...
> 
> Regards, Arnout
> 
>> 
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de> --- 
>> package/qt5/qt5base/qt.conf.in | 17 +++-------------- 1 file 
>> changed, 3 insertions(+), 14 deletions(-)
>> 
>> diff --git a/package/qt5/qt5base/qt.conf.in 
>> b/package/qt5/qt5base/qt.conf.in index 9a0b9cd53b..46ebe61614 
>> 100644 --- a/package/qt5/qt5base/qt.conf.in +++ 
>> b/package/qt5/qt5base/qt.conf.in @@ -1,19 +1,8 @@ [Paths] 
>> -Prefix=@@HOST_DIR@@ +Prefix=/usr +HostPrefix=@@HOST_DIR@@ 
>> Sysroot=@@STAGING_DIR@@ Headers=/usr/include/qt5 
>> -Libraries=/usr/lib -LibraryExecutables=/usr/libexec 
>> -Binaries=/usr/bin Plugins=/usr/lib/qt/plugins 
>> Examples=/usr/lib/qt/examples -Qml2Imports=/usr/qml 
>> -Imports=/usr/imports -Translations=/usr/translations 
>> -Examples=/usr/lib/qt/examples -Demos=/usr/lib/qt/examples 
>> -Tests=/usr/tests -Settings=/usr -Documentation=/usr/doc 
>> -ArchData=/usr -Data=/usr +Settings=/usr/etc/xdg
>> 
> 

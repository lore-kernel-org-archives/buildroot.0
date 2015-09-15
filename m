From: Julien CORJON <corjon.j@ecagroup.com>
Date: Tue, 15 Sep 2015 10:35:42 +0000
Subject: [Buildroot] [PATCH 1/2] qt/qt5base: force gstreamer on configure
In-Reply-To: <55F7D8BB.9040301@carallon.com>
References: <1438855575-4767-1-git-send-email-corjon.j@ecagroup.com>
 <20150808151617.2f10d4b3@free-electrons.com> <55F7D8BB.9040301@carallon.com>
Message-ID: <55F7F47D.5080102@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Will Wagner,

Le 15/09/2015 10:37, Will Wagner a ?crit :
> On 08/08/2015 14:16, Thomas Petazzoni wrote:
>> Dear Julien Corjon,
>>
>> On Thu,  6 Aug 2015 12:06:14 +0200, Julien Corjon wrote:
>>> Fixes:
>>> http://autobuild.buildroot.net/results/0ee0f879e8563954c64b3940cdec39d2e6de937a/
>>>
>>>
>>> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
>>> ---
>>>   package/qt5/qt5base/qt5base.mk | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>
>> I'm sorry, but I don't think this is really the source of the problem.
>> I did reproduce this build failure, and even if GStreamer is built
>> before Qt5 (which is the case in the build failure you're linking in
>> the commit log), Qt5 concludes that GStreamer is not available.
>>
>> And this is because for some reason, Qt5 now seems to ignore the
>> PKG_CONFIG environment variable that we pass to it. I've added some
>> debugging messages to the packagesExist() function, and it uses just
>> "pkg-config" (i.e the system pkg-config, not the one built and
>> installed by Buildroot in $(HOST_DIR)/usr/bin).
>>
>> While I think that your patch should be applied (it's good to make
>> optional dependencies explicit), I also think the pkg-config problem
>> should be investigated and fixed.
>>
>
> I have just been testing 2015.08 and have immediately hit exactly the
> same issue. I have done some digging into qt5 and I think I see the
> issue. The problem is that qmake never looks at environment variables,
> only things passed on the command line. The patch below fixes the issue
> for me by explicitly passing PKG_CONFIG on the command line. What is
> unclear is why I am suddenly seeing the issue in 5.5.0 but not 5.4.1 as
> that bit of code seems the same in both versions.

I also do not understand why this bug has shows up suddenly...

>
> I'll report the issue upstream and see what they say.

I already report a bug on Qt bug-tracking system[1]. Feel free to reply 
to it with your investigation

>
> Should I spin this into a patch?

Sure you should spin thin into a patch for Buildroot and for Qt mainline.

Regards,

Julien

[1] https://bugreports.qt.io/browse/QTBUG-48046

>
> --- qt5base-5.5.0/config.tests/unix/compile.test.orig    2015-09-15
> 08:53:45.202320408 +0100
> +++ qt5base-5.5.0/config.tests/unix/compile.test    2015-09-15
> 08:54:02.720770491 +0100
> @@ -67,7 +67,7 @@ test -r Makefile && $MAKE distclean >/de
>   # Make sure output from possible previous tests is gone
>   rm -f "$EXE" "${EXE}.exe"
>
> -set -- "$OUTDIR/bin/qmake" -nocache -spec "$QMKSPEC"
> "CONFIG+=$QMAKE_CONFIG" "CONFIG+=android_app" "CONFIG-=debug_and_release
> app_bundle lib_bundle" "LIBS*=$LFLAGS" "LIBS+=$MAC_ARCH_LFLAGS"
> "INCLUDEPATH*=$INCLUDEPATH" "QMAKE_CXXFLAGS*=$CXXFLAGS"
> "QMAKE_CXXFLAGS+=$MAC_ARCH_CXXFLAGS" "$SRCDIR/$TEST/$EXE.pro" -o
> "$OUTDIR/$TEST/Makefile"
> +set -- "$OUTDIR/bin/qmake" "PKG_CONFIG=$PKG_CONFIG" -nocache -spec
> "$QMKSPEC" "CONFIG+=$QMAKE_CONFIG" "CONFIG+=android_app"
> "CONFIG-=debug_and_release app_bundle lib_bundle" "LIBS*=$LFLAGS"
> "LIBS+=$MAC_ARCH_LFLAGS" "INCLUDEPATH*=$INCLUDEPATH"
> "QMAKE_CXXFLAGS*=$CXXFLAGS" "QMAKE_CXXFLAGS+=$MAC_ARCH_CXXFLAGS"
> "$SRCDIR/$TEST/$EXE.pro" -o "$OUTDIR/$TEST/Makefile"
>   if [ "$VERBOSE" = "yes" ]; then
>       OUTDIR=$OUTDIR "$@" && $MAKE && SUCCESS=yes
>   else
>
>
> Regards
> Will
>
>

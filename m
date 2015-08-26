From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Thu, 27 Aug 2015 00:10:29 +0200
Subject: [Buildroot] [PATCH] pacakge/qt5/qt5base: fix build with ccache
In-Reply-To: <20150826154534.3e67c9bc@free-electrons.com>
References: <1440499298-39957-1-git-send-email-benoit@wsystem.com>
 <20150826154534.3e67c9bc@free-electrons.com>
Message-ID: <CA+sos7-LVKNjkVc+1hg0w8WZMGEtnthaJnaA7-fUKEOizjJCeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Aug 26, 2015 at 3:45 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Tue, 25 Aug 2015 12:41:38 +0200, Beno?t Th?baudeau wrote:
>> +-    # Check if QMAKE_CXX points to an executable.
>> +-    ensurePathEnv()
>> +-    for (dir, QMAKE_PATH_ENV) {
>> +-        exists($$dir/$${QMAKE_CXX}$$sfx): \
>> +-            return()
>> +-    }
>
> Instead of removing this entire piece of code, can you try to replace
> just this last part by something like:
>
>         system($${QMAKE_CXX}$$sfx --version): return()
>
> Instead of trying to look for a file, it will actually try to run the
> compiler.
>
> Also, can you report the bug and submit the patch upstream to Qt? See
> https://bugreports.qt.io/secure/Dashboard.jspa.

I have opened a bug report upstream as you suggested:
https://bugreports.qt.io/browse/QTBUG-47951

As explained in this report, I think that your suggestion would work
for Buildroot (not yet tested), but not for upstream Qt.

My point with this patch was that upstream could consider this
Buildroot use case as illegal because the definition of QMAKE_CXX
(http://doc.qt.io/qt-5/qmake-variable-reference.html#qmake-cxx) only
mentions a filename and a path as possibilities. In that case, the bug
is in Buildroot, and since this sanity check of the compiler is not
needed for Buildroot, we can just remove this test. If we don't want a
local patch for this, maybe we could use a wrapper above ccache, or
put ccache into QMAKE_CXX and the compiler into QMAKE_CXXFLAGS (not
tested, and a bit ugly).

Wait and see what upstream says.

Best regards,
Beno?t

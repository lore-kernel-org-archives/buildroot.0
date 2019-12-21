From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 21 Dec 2019 19:24:35 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/qt5/qt5webengine: fix build
 error
In-Reply-To: <20191221111218.26960-1-b.bilas@grinn-global.com>
References: <20191221111218.26960-1-b.bilas@grinn-global.com>
Message-ID: <f1c338c9-88fd-80f0-87af-da0b2b9ef902@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bartosz,

On 12/21/19 12:12 PM, Bartosz Bilas wrote:
> This commit adds a patch from upstream chromium [1].
> 
> Fixes:
>    ../../3rdparty/chromium/third_party/skia/third_party/skcms/skcms.cc:1909:16:
>    note: in definition of macro 'NS'
>    #define NS(id) id

This is not what this patch fixes. That build log is not an error log, 
previously it was pointing a gcc ICE, but now not anymore because gcc 
it's been fixed. The error instead we're experiencing here, in 
qt5webengine, is this:
'''
  In file included from 
/usr/lib/gcc/x86_64-pc-linux-gnu/6.1.0/include/g++-v6/bits/stl_algo.h:59:0,
                  from 
/usr/lib/gcc/x86_64-pc-linux-gnu/6.1.0/include/g++-v6/algorithm:62,
                  from /usr/include/qt5/QtCore/qglobal.h:85,
                  from /usr/include/qt5/QtCore/qalgorithms.h:37,
                  from /usr/include/qt5/QtCore/qlist.h:37,
                  from /usr/include/qt5/QtCore/qstringlist.h:34,
                  from /usr/include/qt5/QtCore/QStringList:1,
                  from base/http/requestparser.cpp:32:
/usr/lib/gcc/x86_64-pc-linux-gnu/6.1.0/include/g++-v6/cstdlib:75:25: 
fatal error: stdlib.h: No such file or directory
  #include_next <stdlib.h>
'''

Please can you update commit log with:
'''
This commit adds a patch from upstream chromium[1] that allows passing 
-I instead of -isystem to CFLAGS.

Fixes:
  In file included from 
/usr/lib/gcc/x86_64-pc-linux-gnu/6.1.0/include/g++-v6/bits/stl_algo.h:59:0,
                  from 
/usr/lib/gcc/x86_64-pc-linux-gnu/6.1.0/include/g++-v6/algorithm:62,
                  from /usr/include/qt5/QtCore/qglobal.h:85,
                  from /usr/include/qt5/QtCore/qalgorithms.h:37,
                  from /usr/include/qt5/QtCore/qlist.h:37,
                  from /usr/include/qt5/QtCore/qstringlist.h:34,
                  from /usr/include/qt5/QtCore/QStringList:1,
                  from base/http/requestparser.cpp:32:
/usr/lib/gcc/x86_64-pc-linux-gnu/6.1.0/include/g++-v6/cstdlib:75:25: 
fatal error: stdlib.h: No such file or directory
  #include_next <stdlib.h>

[1] 
https://chromium.googlesource.com/chromium/src/+/a8c8396fd20d98666d517c45b358c63736e345ef
'''

and send a v3?

Thank you
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

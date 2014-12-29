From: =?utf-8?B?RmF0aWggQcWfxLFjxLE=?= <fatih.asici@gmail.com>
Date: Mon, 29 Dec 2014 10:07:19 +0200
Subject: [Buildroot] [PATCH 3/4] qt5: bump to version 5.4.0
In-Reply-To: <20141226160241.574a1ae0@free-electrons.com>
References: <1419595603-15591-1-git-send-email-fatih.asici@gmail.com>
 <1419595603-15591-3-git-send-email-fatih.asici@gmail.com>
 <20141226160241.574a1ae0@free-electrons.com>
Message-ID: <e1879db0-83ea-42d7-9413-a808380673a9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, December 26, 2014 5:02:41 PM EEST, Thomas Petazzoni wrote:
> On Fri, 26 Dec 2014 14:06:42 +0200, Fatih A??c? wrote:
>> qt5base:
>>   - Add patches to fix uClibc build.
>>   - Remove -no-c++11 option since qt5connectivity needs some C++11
>>     features.
>
> Hum, we don't really have a good "handling" of C++11 in Buildroot. I
> believe C++11 is only available starting from certain gcc versions, no?
> So maybe not all toolchains will support C++11 ?

We need to depend on GCC version that supports certain C++11 features used 
by Qt. I just realized that Qt has a configure-time test for C++11. So, I 
think it should be safe to remove this option.

qt5connectivity issue could be a bug. It might be patched to compile 
without C++11. I will try that and report to upstream.

>> qt5webkit:
>>   - Remove egl patch. This should be fixed with CONFIG += egl option.
>
> Hum, looking at the patch, I don't really understand this. The patch
> does add some include paths when EGL is enabled. How does CONFIG += egl
> solves the problem?

This is the content of qtbase/mkspecs/features/egl.prf:

  INCLUDEPATH += $$QMAKE_INCDIR_EGL
  LIBS_PRIVATE += $$QMAKE_LIBS_EGL
  QMAKE_CFLAGS += $$QMAKE_CFLAGS_EGL
  QMAKE_CXXFLAGS += $$QMAKE_CFLAGS_EGL
  LIBS += $$QMAKE_LFLAGS_EGL
  for(p, QMAKE_LIBDIR_EGL) {
      exists($$p): LIBS_PRIVATE += -L$$p
  }

So, when a .pro file includes "egl" in their "CONFIG", these paths are also 
included.

>>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
>>  QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
>> -QT5BASE_LICENSE = LGPLv2.1 or GPLv3.0
>> -QT5BASE_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
>> +QT5BASE_LICENSE = LGPLv2.1 with exception or LGPLv3
>> +QT5BASE_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
>
> So the license of qt5base is not the same as the license of the other
> Qt modules?

Honestly, I am confused by this licensing issue.

http://doc.qt.io/qt-5/licensing.html mentions GPLv3; but the commit 
https://codereview.qt-project.org/#/c/92878/ removes references to GPL from 
headers and removes the GPL license text.

So I only wrote the licenses found in the root of the archive.

>
> For the other Qt modules, I see:
>
>> +QT5CONNECTIVITY_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
>> +QT5CONNECTIVITY_LICENSE_FILES = LICENSE.LGPLv21 
>> LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
>
>> +QT5DECLARATIVE_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
>> +QT5DECLARATIVE_LICENSE_FILES = LICENSE.LGPLv21 
>> LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2

See https://codereview.qt-project.org/#/c/92867/.

This commit removes references to GPLv3 from headers; but keeps 
LICENSE.GPLv2.

There are also some new modules coming with Qt 5.4. They are licensed with 
LGPLv3 or GPLv2. No LGPLv21 option exists for them.

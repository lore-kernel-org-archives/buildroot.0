From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2020 20:41:08 +0000
Subject: [Buildroot] [Bug 12906] qt PrefixPath is wrong on 2020.05-rc1
In-Reply-To: <bug-12906-163@https.bugs.busybox.net/>
References: <bug-12906-163@https.bugs.busybox.net/>
Message-ID: <bug-12906-163-zYDZGwjiNs@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12906

--- Comment #4 from jharjuma at gmail.com ---
I don't have any dynamic linker configuration files, eg. /etc/ld.so.conf,
/etc/ld.so.cache. In system search path /lib is before /usr/lib. libQt5Core.so
is installed in /lib/libQt5Core.so and /usr/lib/libQt5Core.so. Relocatable Qt
determines PrefixPath by going up towards root from the directory of the loaded
libQt5Core and chooses directory that contains 'lib' as PrefixPath
(https://github.com/qt/qtbase/blob/3a6d8df5219653b043bd642668cee193f563ec84/src/corelib/global/qlibraryinfo.cpp#L623).
If Qt is non-relocatable, value of -prefix config switch is used as PrefixPath.
qtdiag reports correct PrefixPath if it is forced to use
/usr/lib/libQt5Core.so. Should buildroot configure qt as non-relocatable?

LD_LIBRARY_PATH=/usr/lib qtdiag --no-gl

Qt 5.14.2 (arm-little_endian-ilp32-eabi-hardfloat shared (dynamic) release
build; by GCC 7.5.0) on "eglfs"
OS: Buildroot 2020.02 [linux version 5.4.3]

Architecture: arm; features:

Environment:

Features: QT_NO_EXCEPTIONS

Library info:
  PrefixPath: /usr
  DocumentationPath: /usr/doc
  HeadersPath: /usr/include/qt5
  LibrariesPath: /usr/lib
  LibraryExecutablesPath: /usr/libexec
  BinariesPath: /usr/bin
  PluginsPath: /usr/lib/qt/plugins
  ImportsPath: /usr/imports
  Qml2ImportsPath: /usr/qml
  ArchDataPath: /usr
  DataPath: /usr
  TranslationsPath: /usr/translations
  ExamplesPath: /usr/lib/qt/examples
  TestsPath: /usr/tests
  SettingsPath: /usr/etc/xdg

-- 
You are receiving this mail because:
You are on the CC list for the bug.

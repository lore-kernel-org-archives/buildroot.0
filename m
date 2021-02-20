From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 09:58:40 +0100
Subject: [Buildroot] [PATCH/next 21/54]
 package/kodi-pvr-mediaportal-tvserver: bump version to 8.1.0-Matrix
In-Reply-To: <20210220085913.888324-1-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
Message-ID: <20210220085913.888324-22-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added patch series from upstream PR 127 to remove the dependency to
kodi-platform, switch dependency to kodi.

Added missing dependency to tinyxml.

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...o-more-supported-C-17-declaration-ke.patch |  29 +
 .../0002-Remove-p8-os-includes.patch          | 160 +++++
 .../0003-Use-kodi-StringUtils.patch           | 127 ++++
 .../0004-Remove-SAFE_DELETE.patch             | 292 ++++++++
 ...d-sleep_for-instead-of-p8-time-utils.patch | 311 ++++++++
 ...td-mutex-condition_variable-instead-.patch | 676 ++++++++++++++++++
 ...-Remove-charset-converter-dependency.patch |  58 ++
 .../0008-Remove-p8-platform-dependency.patch  |  77 ++
 .../0009-Travis-changes-for-cpp17.patch       |  31 +
 ...-keyword-as-no-longer-valid-in-CPP17.patch |  26 +
 .../0011-changelog-and-version-v8.1.1.patch   |  45 ++
 .../kodi-pvr-mediaportal-tvserver/Config.in   |   2 +-
 .../kodi-pvr-mediaportal-tvserver.hash        |   4 +-
 .../kodi-pvr-mediaportal-tvserver.mk          |   6 +-
 14 files changed, 1838 insertions(+), 6 deletions(-)
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0001-Revert-Removed-no-more-supported-C-17-declaration-ke.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0002-Remove-p8-os-includes.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0003-Use-kodi-StringUtils.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0004-Remove-SAFE_DELETE.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0005-Use-thread-sleep_for-instead-of-p8-time-utils.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0006-Use-std-thread-std-mutex-condition_variable-instead-.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0007-Remove-charset-converter-dependency.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0008-Remove-p8-platform-dependency.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0009-Travis-changes-for-cpp17.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0010-Remove-register-keyword-as-no-longer-valid-in-CPP17.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0011-changelog-and-version-v8.1.1.patch

diff --git a/package/kodi-pvr-mediaportal-tvserver/0001-Revert-Removed-no-more-supported-C-17-declaration-ke.patch b/package/kodi-pvr-mediaportal-tvserver/0001-Revert-Removed-no-more-supported-C-17-declaration-ke.patch
new file mode 100644
index 0000000000..c09bbc14de
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/0001-Revert-Removed-no-more-supported-C-17-declaration-ke.patch
@@ -0,0 +1,29 @@
+From 8696d5408d6ec14b1ff4395ed538b7a48528fe68 Mon Sep 17 00:00:00 2001
+From: phunkyfish <phunkyfish@gmail.com>
+Date: Thu, 8 Oct 2020 16:12:18 +0100
+Subject: [PATCH] Revert "Removed no more supported (C++17) declaration keyword
+ (register)"
+
+This reverts commit a8edcafe6cc7a424615319995f4f7bdfab3856b1.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/lib/tsreader/DvbUtil.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/tsreader/DvbUtil.cpp b/src/lib/tsreader/DvbUtil.cpp
+index c973062..8c4798a 100644
+--- a/src/lib/tsreader/DvbUtil.cpp
++++ b/src/lib/tsreader/DvbUtil.cpp
+@@ -77,7 +77,7 @@ namespace MPTV
+     //*******************************************************************
+     uint32_t crc32(char *data, int len)
+     {
+-        int i;
++        register int i;
+         uint32_t crc = 0xffffffff;
+ 
+         for (i = 0; i < len; i++)
+-- 
+2.29.2
+
diff --git a/package/kodi-pvr-mediaportal-tvserver/0002-Remove-p8-os-includes.patch b/package/kodi-pvr-mediaportal-tvserver/0002-Remove-p8-os-includes.patch
new file mode 100644
index 0000000000..2e99e0fa7e
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/0002-Remove-p8-os-includes.patch
@@ -0,0 +1,160 @@
+From be13de0679d1707eadaf5349ab904a07fa83bb13 Mon Sep 17 00:00:00 2001
+From: phunkyfish <phunkyfish@gmail.com>
+Date: Wed, 7 Oct 2020 17:34:56 +0100
+Subject: [PATCH] Remove p8 os includes
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/Socket.cpp                  |  1 -
+ src/lib/tsreader/FileReader.h   |  1 -
+ src/lib/tsreader/MemorySink.cpp |  1 -
+ src/lib/tsreader/Section.cpp    |  2 ++
+ src/os-dependent.h              | 40 ++++++++++++++++++---------------
+ src/timers.cpp                  |  1 -
+ src/windows/FileUtils.cpp       |  6 ++++-
+ 7 files changed, 29 insertions(+), 23 deletions(-)
+
+diff --git a/src/Socket.cpp b/src/Socket.cpp
+index 12f7e80..b7dd250 100644
+--- a/src/Socket.cpp
++++ b/src/Socket.cpp
+@@ -7,7 +7,6 @@
+ 
+ #include "utils.h"
+ #include <string>
+-#include "p8-platform/os.h"
+ #include "Socket.h"
+ 
+ #include <kodi/General.h>
+diff --git a/src/lib/tsreader/FileReader.h b/src/lib/tsreader/FileReader.h
+index 986bbc4..edb01f2 100644
+--- a/src/lib/tsreader/FileReader.h
++++ b/src/lib/tsreader/FileReader.h
+@@ -33,7 +33,6 @@
+  *  http://forums.dvbowners.com/
+  */
+ 
+-#include "p8-platform/os.h" // for __stat
+ #include <string>
+ #include <kodi/Filesystem.h>
+ 
+diff --git a/src/lib/tsreader/MemorySink.cpp b/src/lib/tsreader/MemorySink.cpp
+index 2d60696..dafef56 100644
+--- a/src/lib/tsreader/MemorySink.cpp
++++ b/src/lib/tsreader/MemorySink.cpp
+@@ -29,7 +29,6 @@
+ 
+ #if defined LIVE555
+ 
+-#include "p8-platform/os.h"
+ #include "MemorySink.h"
+ #include "GroupsockHelper.hh"
+ #include <kodi/General.h> //for kodi::Log
+diff --git a/src/lib/tsreader/Section.cpp b/src/lib/tsreader/Section.cpp
+index 258c6a9..aac6b53 100644
+--- a/src/lib/tsreader/Section.cpp
++++ b/src/lib/tsreader/Section.cpp
+@@ -22,6 +22,8 @@
+ #include "os-dependent.h"
+ #include "Section.h"
+ 
++#include <cstring>
++
+ namespace MPTV
+ {
+     CSection::CSection(void)
+diff --git a/src/os-dependent.h b/src/os-dependent.h
+index 1f368ea..cdc6980 100644
+--- a/src/os-dependent.h
++++ b/src/os-dependent.h
+@@ -7,29 +7,33 @@
+ 
+ #pragma once
+ 
+-#include "p8-platform/os.h"
++#include <cstdint>
+ 
+-#ifdef TARGET_LINUX
+-// Retrieve the number of milliseconds that have elapsed since the system was started
+-#include <time.h>
+-inline unsigned long long GetTickCount64(void)
+-{
+-  struct timespec ts;
+-  if(clock_gettime(CLOCK_MONOTONIC, &ts) != 0)
+-  {
+-    return 0;
+-  }
+-  return (unsigned long long)( (ts.tv_sec * 1000) + (ts.tv_nsec / 1000000) );
+-};
+-#elif defined(TARGET_DARWIN)
+-#include <time.h>
++#if (defined(_WIN32) || defined(_WIN64))
++
++#ifndef _SSIZE_T_DEFINED
++#ifdef  _WIN64
++typedef __int64    ssize_t;
++#else
++typedef _W64 int   ssize_t;
++#endif
++#define _SSIZE_T_DEFINED
++#endif
++
++#else
++
++#if (defined(TARGET_LINUX) || defined(TARGET_DARWIN))
++#include <sys/types.h>
++#include <chrono>
++#include <cstring>
+ inline unsigned long long GetTickCount64(void)
+ {
+-  struct timeval tv;
+-  gettimeofday(&tv, NULL);
+-  return (unsigned long long)( (tv.tv_sec * 1000) + (tv.tv_usec / 1000) );
++  auto now = std::chrono::steady_clock::now();
++  return std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch()).count();
+ };
+ #endif /* TARGET_LINUX || TARGET_DARWIN */
+ 
++#endif
++
+ // Additional typedefs
+ typedef uint8_t byte;
+diff --git a/src/timers.cpp b/src/timers.cpp
+index a8760e4..a60b4c2 100644
+--- a/src/timers.cpp
++++ b/src/timers.cpp
+@@ -11,7 +11,6 @@
+ 
+ using namespace std;
+ 
+-#include "p8-platform/os.h" //needed for snprintf
+ #include "timers.h"
+ #include "settings.h"
+ #include "utils.h"
+diff --git a/src/windows/FileUtils.cpp b/src/windows/FileUtils.cpp
+index 0d26bc6..0c8a03e 100644
+--- a/src/windows/FileUtils.cpp
++++ b/src/windows/FileUtils.cpp
+@@ -6,7 +6,6 @@
+  */
+ 
+ #include "../FileUtils.h"
+-#include "p8-platform/os.h"
+ #include "p8-platform/windows/CharsetConverter.h"
+ #include <string>
+ #include "../utils.h"
+@@ -14,6 +13,11 @@
+ #include <Shlobj.h>
+ #endif
+ 
++#ifdef TARGET_WINDOWS
++#include <windows.h>
++#include <fileapi.h>
++#endif
++
+ namespace OS
+ {
+   bool CFile::Exists(const std::string& strFileName, long* errCode)
+-- 
+2.29.2
+
diff --git a/package/kodi-pvr-mediaportal-tvserver/0003-Use-kodi-StringUtils.patch b/package/kodi-pvr-mediaportal-tvserver/0003-Use-kodi-StringUtils.patch
new file mode 100644
index 0000000000..4ded2588e2
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/0003-Use-kodi-StringUtils.patch
@@ -0,0 +1,127 @@
+From 621a98436875f8b4ceea18218a23025e0b59aeb3 Mon Sep 17 00:00:00 2001
+From: phunkyfish <phunkyfish@gmail.com>
+Date: Wed, 7 Oct 2020 17:46:14 +0100
+Subject: [PATCH] Use kodi StringUtils
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/GUIDialogRecordSettings.cpp |  6 +++---
+ src/lib/tsreader/TSReader.cpp   | 10 +++++-----
+ src/pvrclient-mediaportal.cpp   |  3 ++-
+ src/utils.cpp                   |  3 ++-
+ 4 files changed, 12 insertions(+), 10 deletions(-)
+
+diff --git a/src/GUIDialogRecordSettings.cpp b/src/GUIDialogRecordSettings.cpp
+index cf36d82..8e942d2 100644
+--- a/src/GUIDialogRecordSettings.cpp
++++ b/src/GUIDialogRecordSettings.cpp
+@@ -9,9 +9,9 @@
+ #include "timers.h"
+ #include "utils.h"
+ #include "DateTime.h"
+-#include "p8-platform/util/StringUtils.h"
+ 
+ #include <kodi/General.h>
++#include <kodi/tools/StringUtils.h>
+ 
+ /* Dialog item identifiers */
+ #define BUTTON_OK                       1
+@@ -106,7 +106,7 @@ bool CGUIDialogRecordSettings::OnInit()
+ 
+   // Populate PreRecord spin control
+   std::string marginStart;
+-  marginStart = StringUtils::Format("%d (%s)", m_timerinfo.GetMarginStart(), kodi::GetLocalizedString(30136).c_str());
++  marginStart = kodi::tools::StringUtils::Format("%d (%s)", m_timerinfo.GetMarginStart(), kodi::GetLocalizedString(30136).c_str());
+   m_spinPreRecord->SetType(kodi::gui::controls::ADDON_SPIN_CONTROL_TYPE_TEXT);
+   m_spinPreRecord->AddLabel(kodi::GetLocalizedString(30135), -1);
+   m_spinPreRecord->AddLabel(marginStart, m_timerinfo.GetMarginStart()); //value from XBMC
+@@ -120,7 +120,7 @@ bool CGUIDialogRecordSettings::OnInit()
+ 
+   // Populate PostRecord spin control
+   std::string marginEnd;
+-  marginEnd = StringUtils::Format("%d (%s)", m_timerinfo.GetMarginEnd(), kodi::GetLocalizedString(30136).c_str());
++  marginEnd = kodi::tools::StringUtils::Format("%d (%s)", m_timerinfo.GetMarginEnd(), kodi::GetLocalizedString(30136).c_str());
+   m_spinPostRecord->SetType(kodi::gui::controls::ADDON_SPIN_CONTROL_TYPE_TEXT);
+   m_spinPostRecord->AddLabel(kodi::GetLocalizedString(30135), -1);
+   m_spinPostRecord->AddLabel(marginEnd, m_timerinfo.GetMarginEnd()); //value from XBMC
+diff --git a/src/lib/tsreader/TSReader.cpp b/src/lib/tsreader/TSReader.cpp
+index 1129c8e..3f9725b 100644
+--- a/src/lib/tsreader/TSReader.cpp
++++ b/src/lib/tsreader/TSReader.cpp
+@@ -34,7 +34,7 @@
+ #include "utils.h"
+ #include "TSDebug.h"
+ #include "p8-platform/util/timeutils.h"
+-#include "p8-platform/util/StringUtils.h"
++#include <kodi/tools/StringUtils.h>
+ #ifdef LIVE555
+ #include "MemoryReader.h"
+ #include "MepoRTSPClient.h"
+@@ -104,7 +104,7 @@ namespace MPTV
+             {
+                 if (!tscard.TimeshiftFolderUNC.empty())
+                 {
+-                    StringUtils::Replace(sFileName, tscard.TimeshiftFolder.c_str(), tscard.TimeshiftFolderUNC.c_str());
++                    kodi::tools::StringUtils::Replace(sFileName, tscard.TimeshiftFolder.c_str(), tscard.TimeshiftFolderUNC.c_str());
+                     bFound = true;
+                 }
+                 else
+@@ -129,7 +129,7 @@ namespace MPTV
+                         if (!it->RecordingFolderUNC.empty())
+                         {
+                             // Remove the original base path and replace it with the given path
+-                            StringUtils::Replace(sFileName, it->RecordingFolder.c_str(), it->RecordingFolderUNC.c_str());
++                            kodi::tools::StringUtils::Replace(sFileName, it->RecordingFolder.c_str(), it->RecordingFolderUNC.c_str());
+                             bFound = true;
+                             break;
+                         }
+@@ -412,8 +412,8 @@ namespace MPTV
+         if (tmp.find("smb://") != string::npos)
+         {
+           // Convert XBMC smb share name back to a real windows network share...
+-          StringUtils::Replace(tmp, "smb://", "\\\\");
+-          StringUtils::Replace(tmp, "/", "\\");
++          kodi::tools::StringUtils::Replace(tmp, "smb://", "\\\\");
++          kodi::tools::StringUtils::Replace(tmp, "/", "\\");
+         }
+ #else
+         //TODO: do something useful...
+diff --git a/src/pvrclient-mediaportal.cpp b/src/pvrclient-mediaportal.cpp
+index 93ca1bc..fdb31e7 100644
+--- a/src/pvrclient-mediaportal.cpp
++++ b/src/pvrclient-mediaportal.cpp
+@@ -11,7 +11,7 @@
+ #include <clocale>
+ 
+ #include "p8-platform/util/timeutils.h"
+-#include "p8-platform/util/StringUtils.h"
++#include <kodi/tools/StringUtils.h>
+ 
+ #include "timers.h"
+ #include "channels.h"
+@@ -29,6 +29,7 @@
+ #include <kodi/General.h>
+ #include <kodi/Filesystem.h>
+ 
++using namespace kodi::tools;
+ using namespace std;
+ using namespace MPTV;
+ 
+diff --git a/src/utils.cpp b/src/utils.cpp
+index 63c823a..9b8def8 100644
+--- a/src/utils.cpp
++++ b/src/utils.cpp
+@@ -13,8 +13,9 @@
+ #include "settings.h"
+ #include <string>
+ #include <stdio.h>
+-#include "p8-platform/util/StringUtils.h"
++#include <kodi/tools/StringUtils.h>
+ 
++using namespace kodi::tools;
+ using namespace std;
+ 
+ void Tokenize(const string& str, vector<string>& tokens, const string& delimiters = " ")
+-- 
+2.29.2
+
diff --git a/package/kodi-pvr-mediaportal-tvserver/0004-Remove-SAFE_DELETE.patch b/package/kodi-pvr-mediaportal-tvserver/0004-Remove-SAFE_DELETE.patch
new file mode 100644
index 0000000000..6b369ae22f
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/0004-Remove-SAFE_DELETE.patch
@@ -0,0 +1,292 @@
+From 00d0d90fdac9257ed02e24677ba4f008f2486c94 Mon Sep 17 00:00:00 2001
+From: phunkyfish <phunkyfish@gmail.com>
+Date: Wed, 7 Oct 2020 18:00:57 +0100
+Subject: [PATCH] Remove SAFE_DELETE
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/lib/tsreader/FileReader.cpp      |  9 ++++++++-
+ src/lib/tsreader/MemoryBuffer.cpp    | 22 +++++++++++++---------
+ src/lib/tsreader/MultiFileReader.cpp | 11 ++++++++++-
+ src/lib/tsreader/TSReader.cpp        | 25 +++++++++++++++++--------
+ src/pvrclient-mediaportal.cpp        | 27 ++++++++++++++++++---------
+ src/utils.h                          |  2 --
+ 6 files changed, 66 insertions(+), 30 deletions(-)
+
+diff --git a/src/lib/tsreader/FileReader.cpp b/src/lib/tsreader/FileReader.cpp
+index ac8725c..3df22f2 100644
+--- a/src/lib/tsreader/FileReader.cpp
++++ b/src/lib/tsreader/FileReader.cpp
+@@ -38,7 +38,6 @@
+ #include "p8-platform/threads/threads.h"
+ #include <algorithm> //std::min, std::max
+ #include "p8-platform/util/timeutils.h" // for usleep
+-#include "p8-platform/util/util.h"
+ #include "utils.h"
+ #include <errno.h>
+ 
+@@ -58,6 +57,14 @@
+ /* calcuate bitrate for file while reading */
+ #define READ_BITRATE   0x10
+ 
++template<typename T> void SafeDelete(T*& p)
++{
++  if (p)
++  {
++    delete p;
++    p = nullptr;
++  }
++}
+ namespace MPTV
+ {
+     FileReader::FileReader() :
+diff --git a/src/lib/tsreader/MemoryBuffer.cpp b/src/lib/tsreader/MemoryBuffer.cpp
+index 6d411d7..609b575 100644
+--- a/src/lib/tsreader/MemoryBuffer.cpp
++++ b/src/lib/tsreader/MemoryBuffer.cpp
+@@ -31,7 +31,6 @@
+ 
+ #include "p8-platform/util/timeutils.h"
+ #include "p8-platform/threads/mutex.h"
+-#include "p8-platform/util/util.h"
+ #include "MemoryBuffer.h"
+ #include <kodi/General.h> //for kodi::Log
+ #include "TSDebug.h"
+@@ -59,11 +58,14 @@ void CMemoryBuffer::Clear()
+   P8PLATFORM::CLockObject BufferLock(m_BufferLock);
+   std::vector<BufferItem *>::iterator it = m_Array.begin();
+ 
+-  for ( ; it != m_Array.end(); ++it )
++  for (auto& item : m_Array)
+   {
+-    BufferItem *item = *it;
+-    SAFE_DELETE_ARRAY(item->data);
+-    SAFE_DELETE(item);
++    if (item)
++    {
++      if (item->data)
++        delete[] item->data;
++      delete item;
++    }
+   }
+ 
+   m_Array.clear();
+@@ -150,8 +152,9 @@ size_t CMemoryBuffer::ReadFromBuffer(unsigned char *pbData, size_t lDataLength)
+     if (item->nOffset >= item->nDataLength)
+     {
+       m_Array.erase(m_Array.begin());
+-      SAFE_DELETE_ARRAY(item->data);
+-      SAFE_DELETE(item);
++      if (item->data)
++        delete[] item->data;
++      delete item;
+     }
+   }
+   return bytesWritten;
+@@ -182,8 +185,9 @@ long CMemoryBuffer::PutBuffer(unsigned char *pbData, size_t lDataLength)
+ 
+       m_BytesInBuffer -= copyLength;
+       m_Array.erase(m_Array.begin());
+-      SAFE_DELETE_ARRAY(item2->data);
+-      SAFE_DELETE(item2);
++      if (item2->data)
++        delete[] item2->data;
++      delete item2;
+     }
+     if (m_BytesInBuffer > 0)
+     {
+diff --git a/src/lib/tsreader/MultiFileReader.cpp b/src/lib/tsreader/MultiFileReader.cpp
+index b8005b3..3828e06 100644
+--- a/src/lib/tsreader/MultiFileReader.cpp
++++ b/src/lib/tsreader/MultiFileReader.cpp
+@@ -48,6 +48,15 @@ using namespace P8PLATFORM;
+ //Maximum time in msec to wait for the buffer file to become available - Needed for DVB radio (this sometimes takes some time)
+ #define MAX_BUFFER_TIMEOUT 1500
+ 
++template<typename T> void SafeDelete(T*& p)
++{
++  if (p)
++  {
++    delete p;
++    p = nullptr;
++  }
++}
++
+ namespace MPTV
+ {
+     MultiFileReader::MultiFileReader() :
+@@ -484,7 +493,7 @@ namespace MPTV
+ 
+                 TSDEBUG(ADDON_LOG_DEBUG, "MultiFileReader: Removing file %s\n", file->filename.c_str());
+ 
+-                SAFE_DELETE(file);
++                SafeDelete(file);
+                 m_tsFiles.erase(m_tsFiles.begin());
+ 
+                 filesToRemove--;
+diff --git a/src/lib/tsreader/TSReader.cpp b/src/lib/tsreader/TSReader.cpp
+index 3f9725b..4a72f4f 100644
+--- a/src/lib/tsreader/TSReader.cpp
++++ b/src/lib/tsreader/TSReader.cpp
+@@ -44,6 +44,15 @@
+ 
+ using namespace std;
+ 
++template<typename T> void SafeDelete(T*& p)
++{
++  if (p)
++  {
++    delete p;
++    p = nullptr;
++  }
++}
++
+ namespace MPTV
+ {
+     CTsReader::CTsReader() : m_demultiplexer(*this),
+@@ -69,10 +78,10 @@ namespace MPTV
+ 
+     CTsReader::~CTsReader(void)
+     {
+-        SAFE_DELETE(m_fileReader);
++        SafeDelete(m_fileReader);
+ #ifdef LIVE555
+-        SAFE_DELETE(m_buffer);
+-        SAFE_DELETE(m_rtspClient);
++        SafeDelete(m_buffer);
++        SafeDelete(m_rtspClient);
+ #endif
+     }
+ 
+@@ -225,8 +234,8 @@ namespace MPTV
+ 
+             if ( !m_rtspClient->OpenStream(m_fileName.c_str()) )
+             {
+-                SAFE_DELETE(m_rtspClient);
+-                SAFE_DELETE(m_buffer);
++                SafeDelete(m_rtspClient);
++                SafeDelete(m_buffer);
+                 return E_FAIL;
+             }
+ 
+@@ -318,8 +327,8 @@ namespace MPTV
+ #ifdef LIVE555
+                 kodi::Log(ADDON_LOG_INFO, "TsReader: closing RTSP client");
+                 m_rtspClient->Stop();
+-                SAFE_DELETE(m_rtspClient);
+-                SAFE_DELETE(m_buffer);
++                SafeDelete(m_rtspClient);
++                SafeDelete(m_buffer);
+ #endif
+             }
+             else
+@@ -327,7 +336,7 @@ namespace MPTV
+                 kodi::Log(ADDON_LOG_INFO, "TsReader: closing file");
+                 m_fileReader->CloseFile();
+             }
+-            SAFE_DELETE(m_fileReader);
++            SafeDelete(m_fileReader);
+             m_State = State_Stopped;
+         }
+     }
+diff --git a/src/pvrclient-mediaportal.cpp b/src/pvrclient-mediaportal.cpp
+index fdb31e7..5479950 100644
+--- a/src/pvrclient-mediaportal.cpp
++++ b/src/pvrclient-mediaportal.cpp
+@@ -42,6 +42,15 @@ int g_iTVServerKodiBuild = 0;
+ #define TVSERVERKODI_RECOMMENDED_VERSION_STRING "1.2.3.122 till 1.20.0.140"
+ #define TVSERVERKODI_RECOMMENDED_VERSION_BUILD  140
+ 
++template<typename T> void SafeDelete(T*& p)
++{
++  if (p)
++  {
++    delete p;
++    p = nullptr;
++  }
++}
++
+ /************************************************************/
+ /** Class interface */
+ 
+@@ -75,10 +84,10 @@ cPVRClientMediaPortal::~cPVRClientMediaPortal()
+   kodi::Log(ADDON_LOG_DEBUG, "->~cPVRClientMediaPortal()");
+   Disconnect();
+ 
+-  SAFE_DELETE(Timer::lifetimeValues);
+-  SAFE_DELETE(m_tcpclient);
+-  SAFE_DELETE(m_genretable);
+-  SAFE_DELETE(m_lastSelectedRecording);
++  SafeDelete(Timer::lifetimeValues);
++  SafeDelete(m_tcpclient);
++  SafeDelete(m_genretable);
++  SafeDelete(m_lastSelectedRecording);
+ }
+ 
+ string cPVRClientMediaPortal::SendCommand(const char* command)
+@@ -321,7 +330,7 @@ void cPVRClientMediaPortal::Disconnect()
+       if ((CSettings::Get().GetStreamingMethod()==TSReader) && (m_tsreader != NULL))
+       {
+         m_tsreader->Close();
+-        SAFE_DELETE(m_tsreader);
++        SafeDelete(m_tsreader);
+       }
+       SendCommand("StopTimeshift:\n");
+     }
+@@ -1748,7 +1757,7 @@ bool cPVRClientMediaPortal::OpenLiveStream(const kodi::addon::PVRChannel& channe
+     m_iCurrentChannel = -1;
+     if (m_tsreader != nullptr)
+     {
+-      SAFE_DELETE(m_tsreader);
++      SafeDelete(m_tsreader);
+     }
+     return false;
+   }
+@@ -1959,7 +1968,7 @@ void cPVRClientMediaPortal::CloseLiveStream(void)
+     if (CSettings::Get().GetStreamingMethod() == TSReader && m_tsreader)
+     {
+       m_tsreader->Close();
+-      SAFE_DELETE(m_tsreader);
++      SafeDelete(m_tsreader);
+     }
+     result = SendCommand("StopTimeshift:\n");
+     kodi::Log(ADDON_LOG_INFO, "CloseLiveStream: %s", result.c_str());
+@@ -2141,7 +2150,7 @@ void cPVRClientMediaPortal::CloseRecordedStream(void)
+   {
+     kodi::Log(ADDON_LOG_INFO, "CloseRecordedStream: Stop TSReader...");
+     m_tsreader->Close();
+-    SAFE_DELETE(m_tsreader);
++    SafeDelete(m_tsreader);
+   }
+   else
+   {
+@@ -2409,7 +2418,7 @@ cRecording* cPVRClientMediaPortal::GetRecordingInfo(const kodi::addon::PVRRecord
+     {
+       return m_lastSelectedRecording;
+     }
+-    SAFE_DELETE(m_lastSelectedRecording);
++    SafeDelete(m_lastSelectedRecording);
+   }
+ 
+   if (!IsUp())
+diff --git a/src/utils.h b/src/utils.h
+index 823b46e..d03569a 100644
+--- a/src/utils.h
++++ b/src/utils.h
+@@ -11,13 +11,11 @@
+ #include <vector>
+ #include <ctime>
+ #include "uri.h"
+-#include "p8-platform/util/util.h"
+ 
+ #ifdef TARGET_WINDOWS
+ #include "windows/WindowsUtils.h"
+ #endif
+ 
+-
+ /**
+  * String tokenize
+  * Split string using the given delimiter into a vector of substrings
+-- 
+2.29.2
+
diff --git a/package/kodi-pvr-mediaportal-tvserver/0005-Use-thread-sleep_for-instead-of-p8-time-utils.patch b/package/kodi-pvr-mediaportal-tvserver/0005-Use-thread-sleep_for-instead-of-p8-time-utils.patch
new file mode 100644
index 0000000000..c7e45910eb
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/0005-Use-thread-sleep_for-instead-of-p8-time-utils.patch
@@ -0,0 +1,311 @@
+From 4b4a16157870d5816339700616f1efdb60fb59e3 Mon Sep 17 00:00:00 2001
+From: phunkyfish <phunkyfish@gmail.com>
+Date: Wed, 7 Oct 2020 18:12:10 +0100
+Subject: [PATCH] Use thread sleep_for instead of p8 time utils
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/lib/tsreader/DeMultiplexer.cpp   |  6 ++++--
+ src/lib/tsreader/FileReader.cpp      |  5 +++--
+ src/lib/tsreader/MemoryBuffer.cpp    |  5 +++--
+ src/lib/tsreader/MepoRTSPClient.cpp  |  5 +++--
+ src/lib/tsreader/MultiFileReader.cpp |  9 +++++----
+ src/lib/tsreader/TSReader.cpp        |  5 +++--
+ src/pvrclient-mediaportal.cpp        | 23 +++++++++++++----------
+ 7 files changed, 34 insertions(+), 24 deletions(-)
+
+diff --git a/src/lib/tsreader/DeMultiplexer.cpp b/src/lib/tsreader/DeMultiplexer.cpp
+index 63bf20e..436e452 100644
+--- a/src/lib/tsreader/DeMultiplexer.cpp
++++ b/src/lib/tsreader/DeMultiplexer.cpp
+@@ -37,6 +37,8 @@
+ #include <kodi/General.h>  //for kodi::Log
+ #include "TSReader.h"
+ 
++#include <thread>
++
+ #define MAX_BUF_SIZE 8000
+ #define BUFFER_LENGTH 0x1000
+ #define READ_SIZE (1316*30)
+@@ -83,7 +85,7 @@ namespace MPTV
+         {
+             size_t BytesRead = ReadFromFile();
+             if (0 == BytesRead)
+-                usleep(10000);
++                std::this_thread::sleep_for(std::chrono::milliseconds(10));
+         }
+         m_bStarting = false;
+     }
+@@ -248,7 +250,7 @@ namespace MPTV
+         {
+             size_t BytesRead = ReadFromFile();
+             if (0 == BytesRead)
+-                usleep(10000);
++                std::this_thread::sleep_for(std::chrono::milliseconds(10));
+             dwBytesProcessed += BytesRead;
+         }
+ 
+diff --git a/src/lib/tsreader/FileReader.cpp b/src/lib/tsreader/FileReader.cpp
+index 3df22f2..73b23af 100644
+--- a/src/lib/tsreader/FileReader.cpp
++++ b/src/lib/tsreader/FileReader.cpp
+@@ -37,10 +37,10 @@
+ #include "TSDebug.h"
+ #include "p8-platform/threads/threads.h"
+ #include <algorithm> //std::min, std::max
+-#include "p8-platform/util/timeutils.h" // for usleep
+ #include "utils.h"
+ #include <errno.h>
+ 
++#include <thread>
+ 
+ /* indicate that caller can handle truncated reads, where function returns before entire buffer has been filled */
+ #define READ_TRUNCATED 0x01
+@@ -145,7 +145,8 @@ namespace MPTV
+                     }
+                 }
+             }
+-            usleep(20000);
++            std::this_thread::sleep_for(std::chrono::milliseconds(20));
++
+         } while (--Tmo);
+ 
+         if (Tmo)
+diff --git a/src/lib/tsreader/MemoryBuffer.cpp b/src/lib/tsreader/MemoryBuffer.cpp
+index 609b575..0e736f2 100644
+--- a/src/lib/tsreader/MemoryBuffer.cpp
++++ b/src/lib/tsreader/MemoryBuffer.cpp
+@@ -29,12 +29,13 @@
+ 
+ #ifdef LIVE555
+ 
+-#include "p8-platform/util/timeutils.h"
+ #include "p8-platform/threads/mutex.h"
+ #include "MemoryBuffer.h"
+ #include <kodi/General.h> //for kodi::Log
+ #include "TSDebug.h"
+ 
++#include <thread>
++
+ #define MAX_MEMORY_BUFFER_SIZE (1024L*1024L*12L)
+ 
+ CMemoryBuffer::CMemoryBuffer(void)
+@@ -197,7 +198,7 @@ long CMemoryBuffer::PutBuffer(unsigned char *pbData, size_t lDataLength)
+ 
+   if (sleep)
+   {
+-    usleep(10000);
++    std::this_thread::sleep_for(std::chrono::milliseconds(10));
+   }
+   return S_OK;
+ }
+diff --git a/src/lib/tsreader/MepoRTSPClient.cpp b/src/lib/tsreader/MepoRTSPClient.cpp
+index 4971986..ccd6761 100644
+--- a/src/lib/tsreader/MepoRTSPClient.cpp
++++ b/src/lib/tsreader/MepoRTSPClient.cpp
+@@ -18,13 +18,14 @@
+ 
+ #if defined LIVE555
+ 
+-#include "p8-platform/util/timeutils.h"
+ #include "MepoRTSPClient.h"
+ #include "MemorySink.h"
+ #include <kodi/General.h> //for kodi::Log
+ #include "utils.h"
+ #include "os-dependent.h"
+ 
++#include <thread>
++
+ CRTSPClient::CRTSPClient()
+ {
+   kodi::Log(ADDON_LOG_DEBUG, "CRTSPClient::CRTSPClient()");
+@@ -531,7 +532,7 @@ void CRTSPClient::FillBuffer(unsigned long byteCount)
+ 
+   while ( IsRunning() && m_buffer->Size() < byteCount)
+   {
+-    usleep(5000);
++    std::this_thread::sleep_for(std::chrono::milliseconds(5));
+     if (GetTickCount64() - tickCount > 3000)
+       break;
+   }
+diff --git a/src/lib/tsreader/MultiFileReader.cpp b/src/lib/tsreader/MultiFileReader.cpp
+index 3828e06..21fd7b2 100644
+--- a/src/lib/tsreader/MultiFileReader.cpp
++++ b/src/lib/tsreader/MultiFileReader.cpp
+@@ -39,10 +39,11 @@
+ #include <string>
+ #include "utils.h"
+ #include <algorithm>
+-#include "p8-platform/util/timeutils.h"
+ #include "p8-platform/threads/threads.h"
+ #include <inttypes.h>
+ 
++#include <thread>
++
+ using namespace P8PLATFORM;
+ 
+ //Maximum time in msec to wait for the buffer file to become available - Needed for DVB radio (this sometimes takes some time)
+@@ -112,7 +113,7 @@ namespace MPTV
+             retryCount++;
+             kodi::Log(ADDON_LOG_DEBUG, "MultiFileReader: buffer file has zero length, closing, waiting 100 ms and re-opening. Attempt: %d.", retryCount);
+             m_TSBufferFile.CloseFile();
+-            usleep(100000);
++            std::this_thread::sleep_for(std::chrono::milliseconds(100));
+             hResult = m_TSBufferFile.OpenFile();
+             kodi::Log(ADDON_LOG_DEBUG, "MultiFileReader: buffer file opened return code %d.", hResult);
+         }
+@@ -124,7 +125,7 @@ namespace MPTV
+ 
+             do
+             {
+-                usleep(100000);
++                std::this_thread::sleep_for(std::chrono::milliseconds(100));
+                 if (timeout.TimeLeft() == 0)
+                 {
+                     kodi::Log(ADDON_LOG_ERROR, "MultiFileReader: timed out while waiting for buffer file to become available");
+@@ -457,7 +458,7 @@ namespace MPTV
+                 // try to clear local / remote SMB file cache. This should happen when we close the filehandle
+                 m_TSBufferFile.CloseFile();
+                 m_TSBufferFile.OpenFile();
+-                usleep(5000);
++                std::this_thread::sleep_for(std::chrono::milliseconds(5));
+             }
+ 
+             if (Error)
+diff --git a/src/lib/tsreader/TSReader.cpp b/src/lib/tsreader/TSReader.cpp
+index 4a72f4f..40a4faf 100644
+--- a/src/lib/tsreader/TSReader.cpp
++++ b/src/lib/tsreader/TSReader.cpp
+@@ -33,7 +33,6 @@
+ #include "MultiFileReader.h"
+ #include "utils.h"
+ #include "TSDebug.h"
+-#include "p8-platform/util/timeutils.h"
+ #include <kodi/tools/StringUtils.h>
+ #ifdef LIVE555
+ #include "MemoryReader.h"
+@@ -42,6 +41,8 @@
+ #endif
+ #include "FileUtils.h"
+ 
++#include <thread>
++
+ using namespace std;
+ 
+ template<typename T> void SafeDelete(T*& p)
+@@ -396,7 +397,7 @@ namespace MPTV
+                 fileReader->OnChannelChange();
+ 
+                 kodi::Log(ADDON_LOG_DEBUG, "%s:: move from %I64d to %I64d tsbufpos  %I64d", __FUNCTION__, pos_before, pos_after, timeShiftBufferPos);
+-                usleep(100000);
++                std::this_thread::sleep_for(std::chrono::milliseconds(100));
+ 
+                 // Set the stream start times to this new channel
+                 time(&m_startTime);
+diff --git a/src/pvrclient-mediaportal.cpp b/src/pvrclient-mediaportal.cpp
+index 5479950..851b940 100644
+--- a/src/pvrclient-mediaportal.cpp
++++ b/src/pvrclient-mediaportal.cpp
+@@ -10,7 +10,6 @@
+ #include <stdlib.h>
+ #include <clocale>
+ 
+-#include "p8-platform/util/timeutils.h"
+ #include <kodi/tools/StringUtils.h>
+ 
+ #include "timers.h"
+@@ -29,6 +28,8 @@
+ #include <kodi/General.h>
+ #include <kodi/Filesystem.h>
+ 
++#include <thread>
++
+ using namespace kodi::tools;
+ using namespace std;
+ using namespace MPTV;
+@@ -389,7 +390,7 @@ void* cPVRClientMediaPortal::Process(void)
+     if (keepWaiting)
+     {
+       // Wait for 1 minute before re-trying
+-      usleep(60000000);
++      std::this_thread::sleep_for(std::chrono::milliseconds(60000));
+     }
+   }
+   SetConnectionState(state);
+@@ -1571,7 +1572,8 @@ PVR_ERROR cPVRClientMediaPortal::AddTimer(const kodi::addon::PVRTimer& timerinfo
+   if (timerinfo.GetStartTime() <= 0)
+   {
+     // Refresh the recordings list to see the newly created recording
+-    usleep(100000);
++    std::this_thread::sleep_for(std::chrono::milliseconds(100));
++
+     kodi::addon::CInstancePVRClient::TriggerRecordingUpdate();
+   }
+ 
+@@ -1785,7 +1787,8 @@ bool cPVRClientMediaPortal::OpenLiveStream(const kodi::addon::PVRChannel& channe
+       kodi::Log(ADDON_LOG_INFO, "Channel timeshift buffer: %s", timeshiftfields[2].c_str());
+       if (channelinfo.GetIsRadio())
+       {
+-        usleep(100000); // 100 ms sleep to allow the buffer to fill
++        // 100 ms sleep to allow the buffer to fill
++        std::this_thread::sleep_for(std::chrono::milliseconds(100));
+       }
+     }
+     else
+@@ -1796,7 +1799,7 @@ bool cPVRClientMediaPortal::OpenLiveStream(const kodi::addon::PVRChannel& channe
+     if (CSettings::Get().GetSleepOnRTSPurl() > 0)
+     {
+       kodi::Log(ADDON_LOG_INFO, "Sleeping %i ms before opening stream: %s", CSettings::Get().GetSleepOnRTSPurl(), timeshiftfields[0].c_str());
+-      usleep(CSettings::Get().GetSleepOnRTSPurl() * 1000);
++      std::this_thread::sleep_for(std::chrono::milliseconds(CSettings::Get().GetSleepOnRTSPurl()));
+     }
+ 
+     // Check the returned stream URL. When the URL is an rtsp stream, we need
+@@ -1878,7 +1881,7 @@ bool cPVRClientMediaPortal::OpenLiveStream(const kodi::addon::PVRChannel& channe
+           CloseLiveStream();
+           return false;
+         }
+-        usleep(400000);
++        std::this_thread::sleep_for(std::chrono::milliseconds(400));
+       }
+     }
+ 
+@@ -1924,7 +1927,7 @@ int cPVRClientMediaPortal::ReadLiveStream(unsigned char *pBuffer, unsigned int i
+ 
+     if (m_tsreader->Read(bufptr, read_wanted, &read_wanted) > 0)
+     {
+-      usleep(20000);
++      std::this_thread::sleep_for(std::chrono::milliseconds(20));
+       read_timeouts++;
+       return static_cast<int>(read_wanted);
+     }
+@@ -1948,7 +1951,7 @@ int cPVRClientMediaPortal::ReadLiveStream(unsigned char *pBuffer, unsigned int i
+       }
+       bufptr += read_wanted;
+       read_timeouts++;
+-      usleep(10000);
++      std::this_thread::sleep_for(std::chrono::milliseconds(10));
+     }
+   }
+   read_timeouts = 0;
+@@ -2175,7 +2178,7 @@ int cPVRClientMediaPortal::ReadRecordedStream(unsigned char *pBuffer, unsigned i
+ 
+     if (m_tsreader->Read(bufptr, read_wanted, &read_wanted) > 0)
+     {
+-      usleep(20000);
++      std::this_thread::sleep_for(std::chrono::milliseconds(20));
+       return static_cast<int>(read_wanted);
+     }
+     read_done += read_wanted;
+@@ -2183,7 +2186,7 @@ int cPVRClientMediaPortal::ReadRecordedStream(unsigned char *pBuffer, unsigned i
+     if ( read_done < static_cast<size_t>(iBufferSize) )
+     {
+       bufptr += read_wanted;
+-      usleep(20000);
++      std::this_thread::sleep_for(std::chrono::milliseconds(20));
+     }
+   }
+ 
+-- 
+2.29.2
+
diff --git a/package/kodi-pvr-mediaportal-tvserver/0006-Use-std-thread-std-mutex-condition_variable-instead-.patch b/package/kodi-pvr-mediaportal-tvserver/0006-Use-std-thread-std-mutex-condition_variable-instead-.patch
new file mode 100644
index 0000000000..974337d7ea
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/0006-Use-std-thread-std-mutex-condition_variable-instead-.patch
@@ -0,0 +1,676 @@
+From 482d898333facf53bd3208cf5e44a0cf3e1f4f3b Mon Sep 17 00:00:00 2001
+From: phunkyfish <phunkyfish@gmail.com>
+Date: Thu, 8 Oct 2020 14:59:55 +0100
+Subject: [PATCH] Use std::thread, std::mutex, condition_variable instead of
+ event
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/lib/tsreader/DeMultiplexer.cpp   |  2 +-
+ src/lib/tsreader/DeMultiplexer.h     |  4 +-
+ src/lib/tsreader/FileReader.cpp      |  2 +-
+ src/lib/tsreader/MemoryBuffer.cpp    | 15 +++--
+ src/lib/tsreader/MemoryBuffer.h      |  7 +-
+ src/lib/tsreader/MemoryReader.h      |  1 +
+ src/lib/tsreader/MemorySink.cpp      |  2 +-
+ src/lib/tsreader/MemorySink.h        |  4 +-
+ src/lib/tsreader/MepoRTSPClient.cpp  | 28 ++++----
+ src/lib/tsreader/MepoRTSPClient.h    | 10 ++-
+ src/lib/tsreader/MultiFileReader.cpp |  9 ++-
+ src/os-dependent.h                   | 95 ++++++++++++++++++++++++++++
+ src/pvrclient-mediaportal.cpp        | 29 ++++-----
+ src/pvrclient-mediaportal.h          | 21 +++---
+ 14 files changed, 168 insertions(+), 61 deletions(-)
+
+diff --git a/src/lib/tsreader/DeMultiplexer.cpp b/src/lib/tsreader/DeMultiplexer.cpp
+index 436e452..3d0d9a2 100644
+--- a/src/lib/tsreader/DeMultiplexer.cpp
++++ b/src/lib/tsreader/DeMultiplexer.cpp
+@@ -104,7 +104,7 @@ namespace MPTV
+         if (m_filter.IsSeeking())
+             return 0;       // Ambass : to check
+ 
+-        P8PLATFORM::CLockObject lock(m_sectionRead);
++        std::lock_guard<std::mutex> lock(m_sectionRead);
+         if (NULL == m_reader)
+             return 0;
+ 
+diff --git a/src/lib/tsreader/DeMultiplexer.h b/src/lib/tsreader/DeMultiplexer.h
+index c7cd577..72ed87d 100644
+--- a/src/lib/tsreader/DeMultiplexer.h
++++ b/src/lib/tsreader/DeMultiplexer.h
+@@ -37,7 +37,7 @@
+ #include "PacketSync.h"
+ #include "TSHeader.h"
+ #include "PatParser.h"
+-#include "p8-platform/threads/mutex.h"
++#include <mutex>
+ 
+ namespace MPTV
+ {
+@@ -60,7 +60,7 @@ namespace MPTV
+     private:
+         unsigned long long m_LastDataFromRtsp;
+         bool m_bEndOfFile;
+-        P8PLATFORM::CMutex m_sectionRead;
++        std::mutex m_sectionRead;
+         FileReader* m_reader;
+         CPatParser m_patParser;
+         CTsReader& m_filter;
+diff --git a/src/lib/tsreader/FileReader.cpp b/src/lib/tsreader/FileReader.cpp
+index 73b23af..358b05f 100644
+--- a/src/lib/tsreader/FileReader.cpp
++++ b/src/lib/tsreader/FileReader.cpp
+@@ -35,7 +35,7 @@
+ #include "FileReader.h"
+ #include <kodi/General.h> //for kodi::Log
+ #include "TSDebug.h"
+-#include "p8-platform/threads/threads.h"
++#include "os-dependent.h"
+ #include <algorithm> //std::min, std::max
+ #include "utils.h"
+ #include <errno.h>
+diff --git a/src/lib/tsreader/MemoryBuffer.cpp b/src/lib/tsreader/MemoryBuffer.cpp
+index 0e736f2..b5400da 100644
+--- a/src/lib/tsreader/MemoryBuffer.cpp
++++ b/src/lib/tsreader/MemoryBuffer.cpp
+@@ -29,7 +29,7 @@
+ 
+ #ifdef LIVE555
+ 
+-#include "p8-platform/threads/mutex.h"
++#include "os-dependent.h"
+ #include "MemoryBuffer.h"
+ #include <kodi/General.h> //for kodi::Log
+ #include "TSDebug.h"
+@@ -56,7 +56,7 @@ bool CMemoryBuffer::IsRunning()
+ 
+ void CMemoryBuffer::Clear()
+ {
+-  P8PLATFORM::CLockObject BufferLock(m_BufferLock);
++  std::lock_guard<std::mutex> BufferLock(m_BufferLock);
+   std::vector<BufferItem *>::iterator it = m_Array.begin();
+ 
+   for (auto& item : m_Array)
+@@ -104,14 +104,17 @@ size_t CMemoryBuffer::ReadFromBuffer(unsigned char *pbData, size_t lDataLength)
+   {
+     if (!m_bRunning)
+       return 0;
+-    m_event.Wait(5000);
++
++    std::unique_lock<std::mutex> lock(m_BufferLock);
++    m_condition.wait_for(lock, std::chrono::milliseconds(5000));
++
+     if (!m_bRunning)
+       return 0;
+   }
+ 
+   // kodi::Log(ADDON_LOG_DEBUG, "get..%d/%d", lDataLength, m_BytesInBuffer);
+   size_t bytesWritten = 0;
+-  P8PLATFORM::CLockObject BufferLock(m_BufferLock);
++  std::lock_guard<std::mutex> BufferLock(m_BufferLock);
+ 
+   while (bytesWritten < lDataLength)
+   {
+@@ -172,7 +175,7 @@ long CMemoryBuffer::PutBuffer(unsigned char *pbData, size_t lDataLength)
+   memcpy(item->data, pbData, lDataLength);
+   bool sleep = false;
+   {
+-    P8PLATFORM::CLockObject BufferLock(m_BufferLock);
++    std::lock_guard<std::mutex> BufferLock(m_BufferLock);
+     m_Array.push_back(item);
+     m_BytesInBuffer += lDataLength;
+ 
+@@ -192,7 +195,7 @@ long CMemoryBuffer::PutBuffer(unsigned char *pbData, size_t lDataLength)
+     }
+     if (m_BytesInBuffer > 0)
+     {
+-      m_event.Broadcast();
++      m_condition.notify_one();
+     }
+   }
+ 
+diff --git a/src/lib/tsreader/MemoryBuffer.h b/src/lib/tsreader/MemoryBuffer.h
+index 080553b..4f8708f 100644
+--- a/src/lib/tsreader/MemoryBuffer.h
++++ b/src/lib/tsreader/MemoryBuffer.h
+@@ -30,7 +30,8 @@
+ 
+ #ifdef LIVE555
+ 
+-#include "p8-platform/threads/mutex.h"
++#include <condition_variable>
++#include <mutex>
+ #include <vector>
+ 
+ class CMemoryBuffer
+@@ -55,9 +56,9 @@ class CMemoryBuffer
+ 
+   protected:
+     std::vector<BufferItem *> m_Array;
+-    P8PLATFORM::CMutex m_BufferLock;
++    std::mutex m_BufferLock;
+     size_t    m_BytesInBuffer;
+-		P8PLATFORM::CEvent m_event;
++    std::condition_variable m_condition;
+     bool m_bRunning;
+ };
+ #endif //LIVE555
+diff --git a/src/lib/tsreader/MemoryReader.h b/src/lib/tsreader/MemoryReader.h
+index fef4f98..288984b 100644
+--- a/src/lib/tsreader/MemoryReader.h
++++ b/src/lib/tsreader/MemoryReader.h
+@@ -32,6 +32,7 @@
+ 
+ #include "FileReader.h"
+ #include "MemoryBuffer.h"
++#include "os-dependent.h"
+ 
+ namespace MPTV
+ {
+diff --git a/src/lib/tsreader/MemorySink.cpp b/src/lib/tsreader/MemorySink.cpp
+index dafef56..af8b74c 100644
+--- a/src/lib/tsreader/MemorySink.cpp
++++ b/src/lib/tsreader/MemorySink.cpp
+@@ -84,7 +84,7 @@ void CMemorySink::addData(unsigned char* data, size_t dataSize, struct timeval U
+     return;
+   }
+ 
+-  P8PLATFORM::CLockObject BufferLock(m_BufferLock);
++  std::lock_guard<std::mutex> BufferLock(m_BufferLock);
+ 
+   m_bReEntrant = true;
+   m_buffer.PutBuffer(data, dataSize);
+diff --git a/src/lib/tsreader/MemorySink.h b/src/lib/tsreader/MemorySink.h
+index cc0f3c8..22d91c6 100644
+--- a/src/lib/tsreader/MemorySink.h
++++ b/src/lib/tsreader/MemorySink.h
+@@ -35,7 +35,7 @@
+ #endif
+ 
+ #include "MemoryBuffer.h"
+-#include "p8-platform/threads/mutex.h"
++#include <mutex>
+ 
+ class CMemorySink: public MediaSink
+ {
+@@ -57,7 +57,7 @@ class CMemorySink: public MediaSink
+   private: // redefined virtual functions:
+     virtual Boolean continuePlaying();
+ 
+-		P8PLATFORM::CMutex m_BufferLock;
++		std::mutex m_BufferLock;
+     unsigned char* m_pSubmitBuffer;
+     int   m_iSubmitBufferPos;
+     bool  m_bReEntrant;
+diff --git a/src/lib/tsreader/MepoRTSPClient.cpp b/src/lib/tsreader/MepoRTSPClient.cpp
+index ccd6761..688ae84 100644
+--- a/src/lib/tsreader/MepoRTSPClient.cpp
++++ b/src/lib/tsreader/MepoRTSPClient.cpp
+@@ -54,7 +54,7 @@ CRTSPClient::CRTSPClient()
+   m_env = NULL;
+   m_fDuration = 0.0f;
+   m_url[0] = '\0';
+-  m_bRunning = false;
++  m_running = false;
+ }
+ 
+ CRTSPClient::~CRTSPClient()
+@@ -496,7 +496,9 @@ void CRTSPClient::StartBufferThread()
+ 
+   if (!m_BufferThreadActive)
+   {
+-    CreateThread();
++    m_running = true;
++    m_thread = std::thread([&] { Process(); });
++
+     m_BufferThreadActive = true;
+   }
+   kodi::Log(ADDON_LOG_DEBUG, "CRTSPClient::StartBufferThread done");
+@@ -505,11 +507,12 @@ void CRTSPClient::StartBufferThread()
+ void CRTSPClient::StopBufferThread()
+ {
+   kodi::Log(ADDON_LOG_DEBUG, "CRTSPClient::StopBufferThread");
+-  m_bRunning = false;
++  m_running = false;
+   if (!m_BufferThreadActive)
+     return;
+ 
+-  StopThread();
++  if (m_thread.joinable())
++    m_thread.join();
+ 
+   m_BufferThreadActive = false;
+   kodi::Log(ADDON_LOG_DEBUG, "CRTSPClient::StopBufferThread done");
+@@ -539,25 +542,22 @@ void CRTSPClient::FillBuffer(unsigned long byteCount)
+   kodi::Log(ADDON_LOG_DEBUG, "CRTSPClient::Fillbuffer...%d/%d\n", byteCount, m_buffer->Size() );
+ }
+ 
+-void *CRTSPClient::Process()
++void CRTSPClient::Process()
+ {
+   m_BufferThreadActive = true;
+-  m_bRunning = true;
+ 
+   kodi::Log(ADDON_LOG_DEBUG, "CRTSPClient:: thread started");
+ 
+-  while (m_env != NULL && !IsStopped())
++  while (m_env != NULL && m_running)
+   {
+     m_env->taskScheduler().doEventLoop();
+-    if (m_bRunning == false)
++    if (m_running == false)
+       break;
+   }
+ 
+   kodi::Log(ADDON_LOG_DEBUG, "CRTSPClient:: thread stopped");
+ 
+   m_BufferThreadActive = false;
+-
+-  return NULL;
+ }
+ 
+ void CRTSPClient::Continue()
+@@ -582,8 +582,12 @@ bool CRTSPClient::Pause()
+   if (m_ourClient != NULL && m_session != NULL)
+   {
+     kodi::Log(ADDON_LOG_DEBUG, "CRTSPClient::Pause() stopthread");
+-    StopThread(10000);                    // Ambass : sometimes 100mS ( prev value ) is not enough and thread is not stopped.
+-                                                 //          now stopping takes around 5 secs ?!?! why ????
++    // Ambass : sometimes 100mS ( prev value ) is not enough and thread is not stopped.
++    //          now stopping takes around 5 secs ?!?! why ????
++    m_running = false;
++    if (m_thread.joinable())
++      m_thread.join();
++
+     kodi::Log(ADDON_LOG_DEBUG, "CRTSPClient::Pause() thread stopped");
+     RTSPClient* rtspClient=(RTSPClient*)m_ourClient;
+     rtspClient->pauseMediaSession(*m_session);
+diff --git a/src/lib/tsreader/MepoRTSPClient.h b/src/lib/tsreader/MepoRTSPClient.h
+index bd6e578..9bb0421 100644
+--- a/src/lib/tsreader/MepoRTSPClient.h
++++ b/src/lib/tsreader/MepoRTSPClient.h
+@@ -31,7 +31,8 @@
+ 
+ #ifdef LIVE555
+ 
+-#include "p8-platform/threads/threads.h"
++#include <atomic>
++#include <thread>
+ #include "lib/tsreader/MemoryBuffer.h"
+ 
+ #include "liveMedia.hh"
+@@ -41,7 +42,7 @@
+ 
+ #define RTSP_URL_BUFFERSIZE 2048
+ 
+-class CRTSPClient: public P8PLATFORM::CThread
++class CRTSPClient
+ {
+ public:
+   CRTSPClient();
+@@ -101,7 +102,7 @@ public:
+ 
+   // Thread
+ private:
+-  virtual void *Process(void);
++  void Process();
+   void StartBufferThread();
+   void StopBufferThread();
+   bool m_BufferThreadActive;
+@@ -113,5 +114,8 @@ private:
+   bool m_bRunning;
+   bool m_bPaused;
+   char m_outFileName[1000];
++
++  std::atomic<bool> m_running = {false};
++  std::thread m_thread;
+ };
+ #endif //LIVE555
+diff --git a/src/lib/tsreader/MultiFileReader.cpp b/src/lib/tsreader/MultiFileReader.cpp
+index 21fd7b2..5106418 100644
+--- a/src/lib/tsreader/MultiFileReader.cpp
++++ b/src/lib/tsreader/MultiFileReader.cpp
+@@ -35,17 +35,16 @@
+ #include "MultiFileReader.h"
+ #include <kodi/General.h> //for kodi::Log
+ #include <kodi/Filesystem.h>
++#include <kodi/tools/EndTime.h>
+ #include "TSDebug.h"
+ #include <string>
+ #include "utils.h"
+ #include <algorithm>
+-#include "p8-platform/threads/threads.h"
+ #include <inttypes.h>
++#include "os-dependent.h"
+ 
+ #include <thread>
+ 
+-using namespace P8PLATFORM;
+-
+ //Maximum time in msec to wait for the buffer file to become available - Needed for DVB radio (this sometimes takes some time)
+ #define MAX_BUFFER_TIMEOUT 1500
+ 
+@@ -121,12 +120,12 @@ namespace MPTV
+         if (RefreshTSBufferFile() == S_FALSE)
+         {
+             // For radio the buffer sometimes needs some time to become available, so wait and try it more than once
+-            P8PLATFORM::CTimeout timeout(MAX_BUFFER_TIMEOUT);
++            kodi::tools::CEndTime timeout(MAX_BUFFER_TIMEOUT);
+ 
+             do
+             {
+                 std::this_thread::sleep_for(std::chrono::milliseconds(100));
+-                if (timeout.TimeLeft() == 0)
++                if (timeout.MillisLeft() == 0)
+                 {
+                     kodi::Log(ADDON_LOG_ERROR, "MultiFileReader: timed out while waiting for buffer file to become available");
+                     kodi::QueueNotification(QUEUE_ERROR, "", "Time out while waiting for buffer file");
+diff --git a/src/os-dependent.h b/src/os-dependent.h
+index cdc6980..28c162c 100644
+--- a/src/os-dependent.h
++++ b/src/os-dependent.h
+@@ -11,6 +11,13 @@
+ 
+ #if (defined(_WIN32) || defined(_WIN64))
+ 
++#include <wchar.h>
++
++/* Handling of 2-byte Windows wchar strings */
++#define WcsLen wcslen
++#define WcsToMbs wcstombs
++typedef wchar_t Wchar_t; /* sizeof(wchar_t) = 2 bytes on Windows */
++
+ #ifndef _SSIZE_T_DEFINED
+ #ifdef  _WIN64
+ typedef __int64    ssize_t;
+@@ -20,20 +27,108 @@ typedef _W64 int   ssize_t;
+ #define _SSIZE_T_DEFINED
+ #endif
+ 
++/* Prevent deprecation warnings */
++#define strnicmp _strnicmp
++
++#define PATH_SEPARATOR_CHAR '\\'
++
+ #else
+ 
+ #if (defined(TARGET_LINUX) || defined(TARGET_DARWIN))
+ #include <sys/types.h>
+ #include <chrono>
+ #include <cstring>
++
++#define strnicmp(X,Y,N) strncasecmp(X,Y,N)
++
+ inline unsigned long long GetTickCount64(void)
+ {
+   auto now = std::chrono::steady_clock::now();
+   return std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch()).count();
+ };
++
++#define PATH_SEPARATOR_CHAR '/'
++
++#if defined(__APPLE__)
++// for HRESULT
++#include <CoreFoundation/CFPlugInCOM.h>
++#endif
++
++/* Handling of 2-byte Windows wchar strings on non-Windows targets
++ * Used by The MediaPortal and ForTheRecord pvr addons
++ */
++typedef uint16_t Wchar_t; /* sizeof(wchar_t) = 4 bytes on Linux, but the MediaPortal buffer files have 2-byte wchars */
++
++/* This is a replacement of the Windows wcslen() function which assumes that
++ * wchar_t is a 2-byte character.
++ * It is used for processing Windows wchar strings
++ */
++inline size_t WcsLen(const Wchar_t *str)
++{
++  const unsigned short *eos = (const unsigned short*)str;
++  while( *eos++ ) ;
++  return( (size_t)(eos - (const unsigned short*)str) -1);
++};
++
++/* This is a replacement of the Windows wcstombs() function which assumes that
++ * wchar_t is a 2-byte character.
++ * It is used for processing Windows wchar strings
++ */
++inline size_t WcsToMbs(char *s, const Wchar_t *w, size_t n)
++{
++  size_t i = 0;
++  const unsigned short *wc = (const unsigned short*) w;
++  while(wc[i] && (i < n))
++  {
++    s[i] = wc[i];
++    ++i;
++  }
++  if (i < n) s[i] = '\0';
++
++  return (i);
++};
++
+ #endif /* TARGET_LINUX || TARGET_DARWIN */
+ 
+ #endif
+ 
++typedef long LONG;
++#if !defined(__APPLE__)
++typedef LONG HRESULT;
++#endif
++
++#ifndef FAILED
++#define FAILED(Status) ((HRESULT)(Status)<0)
++#endif
++
++#ifndef SUCCEEDED
++#define SUCCEEDED(hr) (((HRESULT)(hr)) >= 0)
++#endif
++
++#define _FILE_OFFSET_BITS 64
++#define FILE_BEGIN              0
++#define FILE_CURRENT            1
++#define FILE_END                2
++
++#ifndef S_OK
++#define S_OK           0L
++#endif
++
++#ifndef S_FALSE
++#define S_FALSE        1L
++#endif
++
++// Error codes
++#define ERROR_FILENAME_EXCED_RANGE 206L
++#define ERROR_INVALID_NAME         123L
++
++#ifndef E_OUTOFMEMORY
++#define E_OUTOFMEMORY              0x8007000EL
++#endif
++
++#ifndef E_FAIL
++#define E_FAIL                     0x8004005EL
++#endif
++
+ // Additional typedefs
+ typedef uint8_t byte;
+diff --git a/src/pvrclient-mediaportal.cpp b/src/pvrclient-mediaportal.cpp
+index 851b940..c1052e3 100644
+--- a/src/pvrclient-mediaportal.cpp
++++ b/src/pvrclient-mediaportal.cpp
+@@ -28,8 +28,6 @@
+ #include <kodi/General.h>
+ #include <kodi/Filesystem.h>
+ 
+-#include <thread>
+-
+ using namespace kodi::tools;
+ using namespace std;
+ using namespace MPTV;
+@@ -70,7 +68,6 @@ cPVRClientMediaPortal::cPVRClientMediaPortal(KODI_HANDLE instance, const std::st
+   m_BackendTime            = 0;
+   m_tsreader               = NULL;
+   m_genretable             = NULL;
+-  m_iLastRecordingUpdate   = 0;
+   m_signalStateCounter     = 0;
+   m_iSignal                = 0;
+   m_iSNR                   = 0;
+@@ -99,7 +96,7 @@ string cPVRClientMediaPortal::SendCommand(const char* command)
+ 
+ string cPVRClientMediaPortal::SendCommand(const string& command)
+ {
+-  P8PLATFORM::CLockObject critsec(m_mutex);
++  std::lock_guard<std::mutex> critsec(m_mutex);
+ 
+   if ( !m_tcpclient->send(command) )
+   {
+@@ -174,10 +171,10 @@ ADDON_STATUS cPVRClientMediaPortal::TryConnect()
+     case PVR_CONNECTION_STATE_SERVER_UNREACHABLE:
+       kodi::Log(ADDON_LOG_ERROR, "Could not connect to MediaPortal TV Server backend.");
+       // Start background thread for connecting to the backend
+-      if (!IsRunning())
++      if (!m_running)
+       {
+-        kodi::Log(ADDON_LOG_INFO, "Waiting for a connection in the background.");
+-        CreateThread();
++        m_running = true;
++        m_thread = std::thread([&] { Process(); });
+       }
+       return ADDON_STATUS_LOST_CONNECTION;
+     case PVR_CONNECTION_STATE_CONNECTING:
+@@ -190,7 +187,7 @@ ADDON_STATUS cPVRClientMediaPortal::TryConnect()
+ 
+ PVR_CONNECTION_STATE cPVRClientMediaPortal::Connect(bool updateConnectionState)
+ {
+-  P8PLATFORM::CLockObject critsec(m_connectionMutex);
++  std::lock_guard<std::mutex> critsec(m_connectionMutex);
+ 
+   string result;
+ 
+@@ -317,9 +314,11 @@ void cPVRClientMediaPortal::Disconnect()
+ 
+   kodi::Log(ADDON_LOG_INFO, "Disconnect");
+ 
+-  if (IsRunning())
++  if (m_running)
+   {
+-    StopThread(1000);
++    m_running = false;
++    if (m_thread.joinable())
++      m_thread.join();
+   }
+ 
+   if (m_tcpclient->is_valid() && m_bTimeShiftStarted)
+@@ -361,14 +360,14 @@ bool cPVRClientMediaPortal::IsUp()
+   }
+ }
+ 
+-void* cPVRClientMediaPortal::Process(void)
++void cPVRClientMediaPortal::Process()
+ {
+   kodi::Log(ADDON_LOG_DEBUG, "Background thread started.");
+ 
+   bool keepWaiting = true;
+   PVR_CONNECTION_STATE state;
+ 
+-  while (!IsStopped() && keepWaiting)
++  while (m_running && keepWaiting)
+   {
+     state = Connect(false);
+ 
+@@ -396,8 +395,6 @@ void* cPVRClientMediaPortal::Process(void)
+   SetConnectionState(state);
+ 
+   kodi::Log(ADDON_LOG_DEBUG, "Background thread finished.");
+-
+-  return NULL;
+ }
+ 
+ 
+@@ -1188,7 +1185,7 @@ PVR_ERROR cPVRClientMediaPortal::GetRecordings(bool deleted, kodi::addon::PVRRec
+     }
+   }
+ 
+-  m_iLastRecordingUpdate = P8PLATFORM::GetTimeMs();
++  m_iLastRecordingUpdate = std::chrono::system_clock::now();
+ 
+   return PVR_ERROR_NO_ERROR;
+ }
+@@ -1383,7 +1380,7 @@ PVR_ERROR cPVRClientMediaPortal::GetTimers(kodi::addon::PVRTimersResultSet& resu
+     }
+   }
+ 
+-  if ( P8PLATFORM::GetTimeMs() >  m_iLastRecordingUpdate + 15000)
++  if ( std::chrono::system_clock::now() >  m_iLastRecordingUpdate + std::chrono::milliseconds(15000))
+   {
+     kodi::addon::CInstancePVRClient::TriggerRecordingUpdate();
+   }
+diff --git a/src/pvrclient-mediaportal.h b/src/pvrclient-mediaportal.h
+index 3087634..e5da832 100644
+--- a/src/pvrclient-mediaportal.h
++++ b/src/pvrclient-mediaportal.h
+@@ -7,6 +7,10 @@
+ 
+ #pragma once
+ 
++#include <atomic>
++#include <chrono>
++#include <mutex>
++#include <thread>
+ #include <vector>
+ 
+ /* Master defines for client control */
+@@ -17,8 +21,6 @@
+ #include "Cards.h"
+ #include "epg.h"
+ #include "channels.h"
+-#include "p8-platform/threads/mutex.h"
+-#include "p8-platform/threads/threads.h"
+ 
+ /* Use a forward declaration here. Including RTSPClient.h via TSReader.h at this point gives compile errors */
+ namespace MPTV
+@@ -28,9 +30,7 @@ namespace MPTV
+ class cRecording;
+ 
+ class ATTRIBUTE_HIDDEN cPVRClientMediaPortal
+-  : public kodi::addon::CInstancePVRClient,
+-    public P8PLATFORM::PreventCopy,
+-    public P8PLATFORM::CThread
++  : public kodi::addon::CInstancePVRClient
+ {
+ public:
+   /* Class interface */
+@@ -110,7 +110,7 @@ protected:
+ 
+ private:
+   /* TVServerKodi Listening Thread */
+-  void* Process(void);
++  void Process();
+   PVR_CONNECTION_STATE Connect(bool updateConnectionState = true);
+ 
+   void LoadGenreTable(void);
+@@ -134,9 +134,9 @@ private:
+   time_t                  m_BackendTime;
+   CCards                  m_cCards;
+   CGenreTable*            m_genretable;
+-  P8PLATFORM::CMutex      m_mutex;
+-  P8PLATFORM::CMutex      m_connectionMutex;
+-  int64_t                 m_iLastRecordingUpdate;
++  std::mutex              m_mutex;
++  std::mutex              m_connectionMutex;
++  std::chrono::system_clock::time_point m_iLastRecordingUpdate;
+   MPTV::CTsReader*        m_tsreader;
+   std::map<int,cChannel>  m_channels;
+   int                     m_signalStateCounter;
+@@ -145,6 +145,9 @@ private:
+ 
+   cRecording*             m_lastSelectedRecording;
+ 
++  std::atomic<bool> m_running = {false};
++  std::thread m_thread;
++
+   //Used for TV Server communication:
+   std::string SendCommand(const char* command);
+   std::string SendCommand(const std::string& command);
+-- 
+2.29.2
+
diff --git a/package/kodi-pvr-mediaportal-tvserver/0007-Remove-charset-converter-dependency.patch b/package/kodi-pvr-mediaportal-tvserver/0007-Remove-charset-converter-dependency.patch
new file mode 100644
index 0000000000..9260008c54
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/0007-Remove-charset-converter-dependency.patch
@@ -0,0 +1,58 @@
+From bb752566a31029df4ca2c8a2d7fca6680570bfe6 Mon Sep 17 00:00:00 2001
+From: phunkyfish <phunkyfish@gmail.com>
+Date: Thu, 8 Oct 2020 16:10:44 +0100
+Subject: [PATCH] Remove charset converter dependency
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/windows/FileUtils.cpp | 20 ++++++++++++++++----
+ 1 file changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/src/windows/FileUtils.cpp b/src/windows/FileUtils.cpp
+index 0c8a03e..f829b2a 100644
+--- a/src/windows/FileUtils.cpp
++++ b/src/windows/FileUtils.cpp
+@@ -6,24 +6,36 @@
+  */
+ 
+ #include "../FileUtils.h"
+-#include "p8-platform/windows/CharsetConverter.h"
+ #include <string>
+ #include "../utils.h"
+ #ifdef TARGET_WINDOWS_DESKTOP
+ #include <Shlobj.h>
+ #endif
+ 
+-#ifdef TARGET_WINDOWS
+ #include <windows.h>
+ #include <fileapi.h>
+-#endif
++
++std::wstring ToW(const char* str, size_t length)
++{
++  int result = MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, str, length, nullptr, 0);
++  if (result == 0)
++    return std::wstring();
++
++  auto newStr = std::make_unique<wchar_t[]>(result);
++  result = MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, str, length, newStr.get(), result);
++
++  if (result == 0)
++    return std::wstring();
++
++  return std::wstring(newStr.get(), result);
++}
+ 
+ namespace OS
+ {
+   bool CFile::Exists(const std::string& strFileName, long* errCode)
+   {
+     std::string strWinFile = ToWindowsPath(strFileName);
+-    std::wstring strWFile = p8::windows::ToW(strWinFile.c_str());
++    std::wstring strWFile = ToW(strWinFile.c_str(), 0);
+     DWORD dwAttr = GetFileAttributesW(strWFile.c_str());
+ 
+     if(dwAttr != 0xffffffff)
+-- 
+2.29.2
+
diff --git a/package/kodi-pvr-mediaportal-tvserver/0008-Remove-p8-platform-dependency.patch b/package/kodi-pvr-mediaportal-tvserver/0008-Remove-p8-platform-dependency.patch
new file mode 100644
index 0000000000..c17019a809
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/0008-Remove-p8-platform-dependency.patch
@@ -0,0 +1,77 @@
+From e78eb2db7c42e302713d5e7129603e56d0e9b43b Mon Sep 17 00:00:00 2001
+From: phunkyfish <phunkyfish@gmail.com>
+Date: Thu, 8 Oct 2020 16:11:19 +0100
+Subject: [PATCH] Remove p8-platform dependency
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ CMakeLists.txt                                   | 7 ++-----
+ debian/control                                   | 2 +-
+ depends/common/p8-platform/p8-platform.txt       | 1 -
+ depends/windowsstore/p8-platform/p8-platform.txt | 1 -
+ 4 files changed, 3 insertions(+), 8 deletions(-)
+ delete mode 100644 depends/common/p8-platform/p8-platform.txt
+ delete mode 100644 depends/windowsstore/p8-platform/p8-platform.txt
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1226685..f612570 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -4,7 +4,6 @@ project(pvr.mediaportal.tvserver)
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})
+ 
+ find_package(Kodi REQUIRED)
+-find_package(p8-platform REQUIRED)
+ find_package(TinyXML REQUIRED)
+ 
+ set(LIVE555_INCLUDE_DIR
+@@ -17,8 +16,7 @@ set(LIVE555_INCLUDE_DIR
+ 
+ set(LIVE555_DEFINES -DLIVE555 -D_WINSOCK_DEPRECATED_NO_WARNINGS -DSOCKLEN_T=socklen_t -DBSD=1)
+ 
+-include_directories(${p8-platform_INCLUDE_DIRS}
+-                    ${TINYXML_INCLUDE_DIR}
++include_directories(${TINYXML_INCLUDE_DIR}
+                     ${KODI_INCLUDE_DIR}/.. # Hack way with "/..", need bigger Kodi cmake rework to match right include ways
+                     ${PROJECT_SOURCE_DIR}/src
+                     ${PROJECT_BINARY_DIR}
+@@ -229,8 +227,7 @@ source_group("Header Files\\lib\\live555" FILES ${LIVE555_HEADERS})
+ # Make sure that CMake adds all files to the MSVC project
+ list(APPEND MPTV_SOURCES ${MPTV_HEADERS} ${TSREADER_SOURCES} ${TSREADER_HEADERS} ${LIVE555_SOURCES} ${LIVE555_HEADERS})
+ 
+-set(DEPLIBS ${p8-platform_LIBRARIES}
+-            ${TINYXML_LIBRARIES})
++set(DEPLIBS ${TINYXML_LIBRARIES})
+ 
+ if(WIN32)
+   list(APPEND DEPLIBS ws2_32)
+diff --git a/debian/control b/debian/control
+index 667e47c..e81ff45 100644
+--- a/debian/control
++++ b/debian/control
+@@ -2,7 +2,7 @@ Source: kodi-pvr-mediaportal-tvserver
+ Priority: extra
+ Maintainer: Nobody <nobody@kodi.tv>
+ Build-Depends: debhelper (>= 9.0.0), cmake, libtinyxml-dev,
+-               libp8-platform-dev, kodi-addon-dev
++               kodi-addon-dev
+ Standards-Version: 4.1.2
+ Section: libs
+ Homepage: http://kodi.tv
+diff --git a/depends/common/p8-platform/p8-platform.txt b/depends/common/p8-platform/p8-platform.txt
+deleted file mode 100644
+index 98ed58a..0000000
+--- a/depends/common/p8-platform/p8-platform.txt
++++ /dev/null
+@@ -1 +0,0 @@
+-p8-platform https://github.com/xbmc/platform.git cee64e9dc0b69e8d286dc170a78effaabfa09c44
+diff --git a/depends/windowsstore/p8-platform/p8-platform.txt b/depends/windowsstore/p8-platform/p8-platform.txt
+deleted file mode 100644
+index db6f782..0000000
+--- a/depends/windowsstore/p8-platform/p8-platform.txt
++++ /dev/null
+@@ -1 +0,0 @@
+-p8-platform https://github.com/afedchin/platform.git win10
+-- 
+2.29.2
+
diff --git a/package/kodi-pvr-mediaportal-tvserver/0009-Travis-changes-for-cpp17.patch b/package/kodi-pvr-mediaportal-tvserver/0009-Travis-changes-for-cpp17.patch
new file mode 100644
index 0000000000..127d79b9d1
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/0009-Travis-changes-for-cpp17.patch
@@ -0,0 +1,31 @@
+From e613bfbb4561173046451e9bb1ec64c7879de859 Mon Sep 17 00:00:00 2001
+From: phunkyfish <phunkyfish@gmail.com>
+Date: Sat, 17 Oct 2020 14:06:04 +0100
+Subject: [PATCH] Travis changes for cpp17
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ .travis.yml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index 1f2b61f..285f827 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -10,11 +10,11 @@ env:
+ matrix:
+   include:
+     - os: linux
+-      dist: xenial
++      dist: bionic
+       sudo: required
+       compiler: gcc
+     - os: linux
+-      dist: xenial
++      dist: bionic
+       sudo: required
+       compiler: clang
+     - os: linux
+-- 
+2.29.2
+
diff --git a/package/kodi-pvr-mediaportal-tvserver/0010-Remove-register-keyword-as-no-longer-valid-in-CPP17.patch b/package/kodi-pvr-mediaportal-tvserver/0010-Remove-register-keyword-as-no-longer-valid-in-CPP17.patch
new file mode 100644
index 0000000000..3f09da20be
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/0010-Remove-register-keyword-as-no-longer-valid-in-CPP17.patch
@@ -0,0 +1,26 @@
+From 5cf2d4e05673964e269e4b9a2e779d20f57c0d17 Mon Sep 17 00:00:00 2001
+From: phunkyfish <phunkyfish@gmail.com>
+Date: Sat, 6 Feb 2021 12:56:50 +0000
+Subject: [PATCH] Remove register keyword as no longer valid in CPP17
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/lib/tsreader/DvbUtil.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/tsreader/DvbUtil.cpp b/src/lib/tsreader/DvbUtil.cpp
+index 8c4798a..c973062 100644
+--- a/src/lib/tsreader/DvbUtil.cpp
++++ b/src/lib/tsreader/DvbUtil.cpp
+@@ -77,7 +77,7 @@ namespace MPTV
+     //*******************************************************************
+     uint32_t crc32(char *data, int len)
+     {
+-        register int i;
++        int i;
+         uint32_t crc = 0xffffffff;
+ 
+         for (i = 0; i < len; i++)
+-- 
+2.29.2
+
diff --git a/package/kodi-pvr-mediaportal-tvserver/0011-changelog-and-version-v8.1.1.patch b/package/kodi-pvr-mediaportal-tvserver/0011-changelog-and-version-v8.1.1.patch
new file mode 100644
index 0000000000..ad37720713
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/0011-changelog-and-version-v8.1.1.patch
@@ -0,0 +1,45 @@
+From 79e33e1799976e2196132f90bd7f322f213c1a99 Mon Sep 17 00:00:00 2001
+From: phunkyfish <phunkyfish@gmail.com>
+Date: Sat, 6 Feb 2021 00:16:19 +0000
+Subject: [PATCH] changelog and version v8.1.1
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ pvr.mediaportal.tvserver/addon.xml.in  |  2 +-
+ pvr.mediaportal.tvserver/changelog.txt | 10 ++++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/pvr.mediaportal.tvserver/addon.xml.in b/pvr.mediaportal.tvserver/addon.xml.in
+index de30c2a..1944bc0 100644
+--- a/pvr.mediaportal.tvserver/addon.xml.in
++++ b/pvr.mediaportal.tvserver/addon.xml.in
+@@ -1,7 +1,7 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+ <addon
+   id="pvr.mediaportal.tvserver"
+-  version="8.1.0"
++  version="8.1.1"
+   name="MediaPortal PVR Client"
+   provider-name="Marcel Groothuis">
+   <requires>@ADDON_DEPENDS@</requires>
+diff --git a/pvr.mediaportal.tvserver/changelog.txt b/pvr.mediaportal.tvserver/changelog.txt
+index 7d1630e..8e06c48 100644
+--- a/pvr.mediaportal.tvserver/changelog.txt
++++ b/pvr.mediaportal.tvserver/changelog.txt
+@@ -1,3 +1,13 @@
++v8.1.1
++- Remove p8-platform dependency
++- Remove charset converter dependency
++- Use std::thread, std::mutex, condition_variable instead of event and bool defines
++- Use thread sleep_for instead of p8 time utils
++- Remove SAFE_DELETE
++- Use kodi StringUtils
++- Remove p8 os includes
++- Revert "Removed no more supported (C++17) declaration keyword (register)"
++
+ v8.1.0
+ - Update PVR API 7.1.0
+ 
+-- 
+2.29.2
+
diff --git a/package/kodi-pvr-mediaportal-tvserver/Config.in b/package/kodi-pvr-mediaportal-tvserver/Config.in
index 733ca8859e..e8f1e3d611 100644
--- a/package/kodi-pvr-mediaportal-tvserver/Config.in
+++ b/package/kodi-pvr-mediaportal-tvserver/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_MEDIAPORTAL_TVSERVER
 	bool "kodi-pvr-mediaportal-tvserver"
-	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_TINYXML
 	help
 	  MediaPortal TVServer PVR client addon for Kodi
 
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index 53d4316d06..9f700ceef2 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9c05578566f7448dc3a7677587c804596aa314afd493cb9c62cc65ea883645aa  kodi-pvr-mediaportal-tvserver-3.5.18-Leia.tar.gz
-sha256  f9df5b0c11a23b2d5ca84828c67412ecd8752df46527285aeff48f4d7988d367  debian/copyright
+sha256  862b8b0c7c1cd49f0a304dd7caeb6a02dd2b6f767fff256875457040e5ca1177  kodi-pvr-mediaportal-tvserver-8.1.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index a00711c662..d2cacae8a5 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 3.5.18-Leia
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 8.1.0-Matrix
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
-KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = debian/copyright
-KODI_PVR_MEDIAPORTAL_TVSERVER_DEPENDENCIES = kodi-platform
+KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = LICENSE.md
+KODI_PVR_MEDIAPORTAL_TVSERVER_DEPENDENCIES = kodi tinyxml
 
 $(eval $(cmake-package))
-- 
2.29.2

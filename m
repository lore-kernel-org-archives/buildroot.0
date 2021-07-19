From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:08:26 +0200
Subject: [Buildroot] [git commit] package/p7zip: bump to version v17.04
Message-ID: <20210719203514.45C598765D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=9332ab86f8953a8710b9377d3fba46c986610254
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new attempt to maintain p7zip is already picked up by Distributions.
It fixes CVE-2016-9296, CVE-2017-17969, CVE-2018-5996 and CVE-2018-10115.

Signed-off-by: Andr?? Zwing <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/p7zip/0001-CVE-2016-9296.patch         |  25 ---
 package/p7zip/0002-CVE-2017-17969.patch        |  37 ----
 package/p7zip/0003-CVE-2018-5996.patch         | 223 -------------------------
 package/p7zip/0004-Fix-build-with-gcc-10.patch |  32 ----
 package/p7zip/p7zip.hash                       |   7 +-
 package/p7zip/p7zip.mk                         |  12 +-
 6 files changed, 4 insertions(+), 332 deletions(-)

diff --git a/package/p7zip/0001-CVE-2016-9296.patch b/package/p7zip/0001-CVE-2016-9296.patch
deleted file mode 100644
index 6e6fc9f58f..0000000000
--- a/package/p7zip/0001-CVE-2016-9296.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From: Robert Luberda <robert@debian.org>
-Date: Sat, 19 Nov 2016 08:48:08 +0100
-Subject: Fix nullptr dereference (CVE-2016-9296)
-
-Patch taken from https://sourceforge.net/p/p7zip/bugs/185/
-
-Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
----
- CPP/7zip/Archive/7z/7zIn.cpp | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/CPP/7zip/Archive/7z/7zIn.cpp b/CPP/7zip/Archive/7z/7zIn.cpp
-index b0c6b98..7c6dde2 100644
---- a/CPP/7zip/Archive/7z/7zIn.cpp
-+++ b/CPP/7zip/Archive/7z/7zIn.cpp
-@@ -1097,7 +1097,8 @@ HRESULT CInArchive::ReadAndDecodePackedStreams(
-       if (CrcCalc(data, unpackSize) != folders.FolderCRCs.Vals[i])
-         ThrowIncorrect();
-   }
--  HeadersSize += folders.PackPositions[folders.NumPackStreams];
-+  if (folders.PackPositions)
-+      HeadersSize += folders.PackPositions[folders.NumPackStreams];
-   return S_OK;
- }
- 
diff --git a/package/p7zip/0002-CVE-2017-17969.patch b/package/p7zip/0002-CVE-2017-17969.patch
deleted file mode 100644
index 9198127cb9..0000000000
--- a/package/p7zip/0002-CVE-2017-17969.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From: =?utf-8?q?Antoine_Beaupr=C3=A9?= <anarcat@debian.org>
-Date: Fri, 2 Feb 2018 11:11:41 +0100
-Subject: Heap-based buffer overflow in 7zip/Compress/ShrinkDecoder.cpp
-
-Origin: vendor, https://sourceforge.net/p/p7zip/bugs/_discuss/thread/0920f369/27d7/attachment/CVE-2017-17969.patch
-Forwarded: https://sourceforge.net/p/p7zip/bugs/_discuss/thread/0920f369/#27d7
-Bug: https://sourceforge.net/p/p7zip/bugs/204/
-Bug-Debian: https://bugs.debian.org/888297
-Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2017-17969
-Reviewed-by: Salvatore Bonaccorso <carnil@debian.org>
-Last-Update: 2018-02-01
-Applied-Upstream: 18.00-beta
-
-Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
----
- CPP/7zip/Compress/ShrinkDecoder.cpp | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/CPP/7zip/Compress/ShrinkDecoder.cpp b/CPP/7zip/Compress/ShrinkDecoder.cpp
-index 80b7e67..ca37764 100644
---- a/CPP/7zip/Compress/ShrinkDecoder.cpp
-+++ b/CPP/7zip/Compress/ShrinkDecoder.cpp
-@@ -121,8 +121,13 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStream, ISequentialOutStream *
-     {
-       _stack[i++] = _suffixes[cur];
-       cur = _parents[cur];
-+      if (cur >= kNumItems || i >= kNumItems)
-+        break;
-     }
--    
-+
-+    if (cur >= kNumItems || i >= kNumItems)
-+      break;
-+
-     _stack[i++] = (Byte)cur;
-     lastChar2 = (Byte)cur;
- 
diff --git a/package/p7zip/0003-CVE-2018-5996.patch b/package/p7zip/0003-CVE-2018-5996.patch
deleted file mode 100644
index dc3e90ad3a..0000000000
--- a/package/p7zip/0003-CVE-2018-5996.patch
+++ /dev/null
@@ -1,223 +0,0 @@
-From: Robert Luberda <robert@debian.org>
-Date: Sun, 28 Jan 2018 23:47:40 +0100
-Subject: CVE-2018-5996
-
-Hopefully fix Memory Corruptions via RAR PPMd (CVE-2018-5996) by
-applying a few changes from 7Zip 18.00-beta.
-
-Bug-Debian: https://bugs.debian.org/#888314
-
-Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
----
- CPP/7zip/Compress/Rar1Decoder.cpp | 13 +++++++++----
- CPP/7zip/Compress/Rar1Decoder.h   |  1 +
- CPP/7zip/Compress/Rar2Decoder.cpp | 10 +++++++++-
- CPP/7zip/Compress/Rar2Decoder.h   |  1 +
- CPP/7zip/Compress/Rar3Decoder.cpp | 23 ++++++++++++++++++++---
- CPP/7zip/Compress/Rar3Decoder.h   |  2 ++
- 6 files changed, 42 insertions(+), 8 deletions(-)
-
-diff --git a/CPP/7zip/Compress/Rar1Decoder.cpp b/CPP/7zip/Compress/Rar1Decoder.cpp
-index 1aaedcc..68030c7 100644
---- a/CPP/7zip/Compress/Rar1Decoder.cpp
-+++ b/CPP/7zip/Compress/Rar1Decoder.cpp
-@@ -29,7 +29,7 @@ public:
- };
- */
- 
--CDecoder::CDecoder(): m_IsSolid(false) { }
-+CDecoder::CDecoder(): m_IsSolid(false), _errorMode(false) { }
- 
- void CDecoder::InitStructures()
- {
-@@ -406,9 +406,14 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStream, ISequentialOutStream *
-   InitData();
-   if (!m_IsSolid)
-   {
-+    _errorMode = false;
-     InitStructures();
-     InitHuff();
-   }
-+
-+  if (_errorMode)
-+    return S_FALSE;
-+
-   if (m_UnpackSize > 0)
-   {
-     GetFlagsBuf();
-@@ -477,9 +482,9 @@ STDMETHODIMP CDecoder::Code(ISequentialInStream *inStream, ISequentialOutStream
-     const UInt64 *inSize, const UInt64 *outSize, ICompressProgressInfo *progress)
- {
-   try { return CodeReal(inStream, outStream, inSize, outSize, progress); }
--  catch(const CInBufferException &e) { return e.ErrorCode; }
--  catch(const CLzOutWindowException &e) { return e.ErrorCode; }
--  catch(...) { return S_FALSE; }
-+  catch(const CInBufferException &e) { _errorMode = true; return e.ErrorCode; }
-+  catch(const CLzOutWindowException &e) { _errorMode = true; return e.ErrorCode; }
-+  catch(...) { _errorMode = true; return S_FALSE; }
- }
- 
- STDMETHODIMP CDecoder::SetDecoderProperties2(const Byte *data, UInt32 size)
-diff --git a/CPP/7zip/Compress/Rar1Decoder.h b/CPP/7zip/Compress/Rar1Decoder.h
-index 630f089..01b606b 100644
---- a/CPP/7zip/Compress/Rar1Decoder.h
-+++ b/CPP/7zip/Compress/Rar1Decoder.h
-@@ -39,6 +39,7 @@ public:
- 
-   Int64 m_UnpackSize;
-   bool m_IsSolid;
-+  bool _errorMode;
- 
-   UInt32 ReadBits(int numBits);
-   HRESULT CopyBlock(UInt32 distance, UInt32 len);
-diff --git a/CPP/7zip/Compress/Rar2Decoder.cpp b/CPP/7zip/Compress/Rar2Decoder.cpp
-index b3f2b4b..0580c8d 100644
---- a/CPP/7zip/Compress/Rar2Decoder.cpp
-+++ b/CPP/7zip/Compress/Rar2Decoder.cpp
-@@ -80,7 +80,8 @@ static const UInt32 kHistorySize = 1 << 20;
- static const UInt32 kWindowReservSize = (1 << 22) + 256;
- 
- CDecoder::CDecoder():
--  m_IsSolid(false)
-+  m_IsSolid(false),
-+  m_TablesOK(false)
- {
- }
- 
-@@ -100,6 +101,8 @@ UInt32 CDecoder::ReadBits(unsigned numBits) { return m_InBitStream.ReadBits(numB
- 
- bool CDecoder::ReadTables(void)
- {
-+  m_TablesOK = false;
-+
-   Byte levelLevels[kLevelTableSize];
-   Byte newLevels[kMaxTableSize];
-   m_AudioMode = (ReadBits(1) == 1);
-@@ -170,6 +173,8 @@ bool CDecoder::ReadTables(void)
-   }
-   
-   memcpy(m_LastLevels, newLevels, kMaxTableSize);
-+  m_TablesOK = true;
-+
-   return true;
- }
- 
-@@ -344,6 +349,9 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStream, ISequentialOutStream *
-       return S_FALSE;
-   }
- 
-+  if (!m_TablesOK)
-+    return S_FALSE;
-+
-   UInt64 startPos = m_OutWindowStream.GetProcessedSize();
-   while (pos < unPackSize)
-   {
-diff --git a/CPP/7zip/Compress/Rar2Decoder.h b/CPP/7zip/Compress/Rar2Decoder.h
-index 3a0535c..0e9005f 100644
---- a/CPP/7zip/Compress/Rar2Decoder.h
-+++ b/CPP/7zip/Compress/Rar2Decoder.h
-@@ -139,6 +139,7 @@ class CDecoder :
- 
-   UInt64 m_PackSize;
-   bool m_IsSolid;
-+  bool m_TablesOK;
- 
-   void InitStructures();
-   UInt32 ReadBits(unsigned numBits);
-diff --git a/CPP/7zip/Compress/Rar3Decoder.cpp b/CPP/7zip/Compress/Rar3Decoder.cpp
-index 3bf2513..6cb8a6a 100644
---- a/CPP/7zip/Compress/Rar3Decoder.cpp
-+++ b/CPP/7zip/Compress/Rar3Decoder.cpp
-@@ -92,7 +92,8 @@ CDecoder::CDecoder():
-   _writtenFileSize(0),
-   _vmData(0),
-   _vmCode(0),
--  m_IsSolid(false)
-+  m_IsSolid(false),
-+  _errorMode(false)
- {
-   Ppmd7_Construct(&_ppmd);
- }
-@@ -545,6 +546,9 @@ HRESULT CDecoder::ReadTables(bool &keepDecompressing)
-     return InitPPM();
-   }
- 
-+  TablesRead = false;
-+  TablesOK = false;
-+
-   _lzMode = true;
-   PrevAlignBits = 0;
-   PrevAlignCount = 0;
-@@ -606,6 +610,9 @@ HRESULT CDecoder::ReadTables(bool &keepDecompressing)
-       }
-     }
-   }
-+  if (InputEofError())
-+    return S_FALSE;
-+
-   TablesRead = true;
- 
-   // original code has check here:
-@@ -623,6 +630,9 @@ HRESULT CDecoder::ReadTables(bool &keepDecompressing)
-   RIF(m_LenDecoder.Build(&newLevels[kMainTableSize + kDistTableSize + kAlignTableSize]));
- 
-   memcpy(m_LastLevels, newLevels, kTablesSizesSum);
-+
-+  TablesOK = true;
-+
-   return S_OK;
- }
- 
-@@ -824,7 +834,12 @@ HRESULT CDecoder::CodeReal(ICompressProgressInfo *progress)
-     PpmEscChar = 2;
-     PpmError = true;
-     InitFilters();
-+    _errorMode = false;
-   }
-+
-+  if (_errorMode)
-+    return S_FALSE;
-+
-   if (!m_IsSolid || !TablesRead)
-   {
-     bool keepDecompressing;
-@@ -838,6 +853,8 @@ HRESULT CDecoder::CodeReal(ICompressProgressInfo *progress)
-     bool keepDecompressing;
-     if (_lzMode)
-     {
-+      if (!TablesOK)
-+        return S_FALSE;
-       RINOK(DecodeLZ(keepDecompressing))
-     }
-     else
-@@ -901,8 +918,8 @@ STDMETHODIMP CDecoder::Code(ISequentialInStream *inStream, ISequentialOutStream
-     _unpackSize = outSize ? *outSize : (UInt64)(Int64)-1;
-     return CodeReal(progress);
-   }
--  catch(const CInBufferException &e)  { return e.ErrorCode; }
--  catch(...) { return S_FALSE; }
-+  catch(const CInBufferException &e)  { _errorMode = true; return e.ErrorCode; }
-+  catch(...) { _errorMode = true; return S_FALSE; }
-   // CNewException is possible here. But probably CNewException is caused
-   // by error in data stream.
- }
-diff --git a/CPP/7zip/Compress/Rar3Decoder.h b/CPP/7zip/Compress/Rar3Decoder.h
-index c130cec..2f72d7d 100644
---- a/CPP/7zip/Compress/Rar3Decoder.h
-+++ b/CPP/7zip/Compress/Rar3Decoder.h
-@@ -192,6 +192,7 @@ class CDecoder:
-   UInt32 _lastFilter;
- 
-   bool m_IsSolid;
-+  bool _errorMode;
- 
-   bool _lzMode;
-   bool _unsupportedFilter;
-@@ -200,6 +201,7 @@ class CDecoder:
-   UInt32 PrevAlignCount;
- 
-   bool TablesRead;
-+  bool TablesOK;
- 
-   CPpmd7 _ppmd;
-   int PpmEscChar;
diff --git a/package/p7zip/0004-Fix-build-with-gcc-10.patch b/package/p7zip/0004-Fix-build-with-gcc-10.patch
deleted file mode 100644
index b01833db29..0000000000
--- a/package/p7zip/0004-Fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 78b760eae21d7b340c69e8abab8ca706e1e00adc Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
-Date: Mon, 4 May 2020 09:19:46 +0200
-Subject: [PATCH] Fix build with gcc 10.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Add cast to code that mixes HRESULT (aka long) and DWORD (aka unsigned
-int) which causes an narrowing error with gcc 10.
-
-Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
----
- CPP/Windows/ErrorMsg.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CPP/Windows/ErrorMsg.cpp b/CPP/Windows/ErrorMsg.cpp
-index 99684ae..ab48352 100644
---- a/CPP/Windows/ErrorMsg.cpp
-+++ b/CPP/Windows/ErrorMsg.cpp
-@@ -13,7 +13,7 @@ UString MyFormatMessage(DWORD errorCode)
-   const char * txt = 0;
-   AString msg;
- 
--  switch(errorCode) {
-+  switch((HRESULT)errorCode) {
-     case ERROR_NO_MORE_FILES   : txt = "No more files"; break ;
-     case E_NOTIMPL             : txt = "E_NOTIMPL"; break ;
-     case E_NOINTERFACE         : txt = "E_NOINTERFACE"; break ;
--- 
-2.26.2
-
diff --git a/package/p7zip/p7zip.hash b/package/p7zip/p7zip.hash
index a63a0b4a97..0048777d89 100644
--- a/package/p7zip/p7zip.hash
+++ b/package/p7zip/p7zip.hash
@@ -1,6 +1,3 @@
-# From https://sourceforge.net/projects/p7zip/files/p7zip/16.02/
-md5 a0128d661cfe7cc8c121e73519c54fbf  p7zip_16.02_src_all.tar.bz2
-sha1 e8819907132811aa1afe5ef296181d3a15cc8f22  p7zip_16.02_src_all.tar.bz2
-# Locally computed
-sha256  5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6e2341f  p7zip_16.02_src_all.tar.bz2
+# Locally calculated
+sha256  ea029a2e21d2d6ad0a156f6679bd66836204aa78148a4c5e498fe682e77127ef  p7zip-17.04.tar.gz
 sha256  555806657dcf0f1e720b581c52643c195ec86ae3f00bd18cc66d2e0f88ffa210  DOC/License.txt
diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
index 43fbe775dc..f94b55ecd2 100644
--- a/package/p7zip/p7zip.mk
+++ b/package/p7zip/p7zip.mk
@@ -4,20 +4,12 @@
 #
 ################################################################################
 
-P7ZIP_VERSION = 16.02
-P7ZIP_SOURCE = p7zip_$(P7ZIP_VERSION)_src_all.tar.bz2
-P7ZIP_SITE = http://downloads.sourceforge.net/project/p7zip/p7zip/$(P7ZIP_VERSION)
+P7ZIP_VERSION = 17.04
+P7ZIP_SITE = $(call github,jinfeihan57,p7zip,v$(P7ZIP_VERSION))
 P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
 P7ZIP_LICENSE_FILES = DOC/License.txt
 P7ZIP_CPE_ID_VENDOR = 7-zip
 
-# 0001-CVE-2016-9296.patch
-P7ZIP_IGNORE_CVES += CVE-2016-9296
-# 0002-CVE-2017-17969.patch
-P7ZIP_IGNORE_CVES += CVE-2017-17969
-# 0003-CVE-2018-5996.patch
-P7ZIP_IGNORE_CVES += CVE-2018-5996
-
 # p7zip buildsystem is a mess: it plays dirty tricks with CFLAGS and
 # CXXFLAGS, so we can't pass them. Instead, it accepts ALLFLAGS_C
 # and ALLFLAGS_CPP as variables to pass the CFLAGS and CXXFLAGS.

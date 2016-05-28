From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 May 2016 09:20:12 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/kodi: add backported patch to
	fix a bug when using taglib 1.11
Message-ID: <1464420013-23211-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ding-issue-when-reading-certain-id3v1-tag.patch | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 package/kodi/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch

diff --git a/package/kodi/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch b/package/kodi/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch
new file mode 100644
index 0000000..dc428d6
--- /dev/null
+++ b/package/kodi/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch
@@ -0,0 +1,82 @@
+From 78571ed421e3fd3d5244cd76670e4e1bab69132f Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Fri, 27 May 2016 17:30:28 +0200
+Subject: [PATCH 1/1] Fix nullpadding issue when reading certain id3v1 tags
+
+backported from upstream commit to master branch:
+
+https://github.com/xbmc/xbmc/commit/cdabf9dd9e82f4b2d639fb769db08227a7c52046
+
+to fix problems with taglib-1.11:
+
+http://trac.kodi.tv/ticket/16454
+https://github.com/taglib/taglib/issues/741#issuecomment-218059031
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/music/tags/TagLoaderTagLib.cpp | 21 ---------------------
+ xbmc/music/tags/TagLoaderTagLib.h   |  3 +++
+ 2 files changed, 3 insertions(+), 21 deletions(-)
+
+diff --git a/xbmc/music/tags/TagLoaderTagLib.cpp b/xbmc/music/tags/TagLoaderTagLib.cpp
+index b78a591..0fc346a 100644
+--- a/xbmc/music/tags/TagLoaderTagLib.cpp
++++ b/xbmc/music/tags/TagLoaderTagLib.cpp
+@@ -46,31 +46,12 @@
+ #include "utils/URIUtils.h"
+ #include "utils/log.h"
+ #include "utils/StringUtils.h"
+-#include "utils/CharsetConverter.h"
+ #include "utils/Base64.h"
+ #include "settings/AdvancedSettings.h"
+ 
+ using namespace TagLib;
+ using namespace MUSIC_INFO;
+ 
+-template<class T>
+-class TagStringHandler : public T
+-{
+-public:
+-  TagStringHandler() {}
+-  virtual ~TagStringHandler() {}
+-  virtual String parse(const ByteVector &data) const
+-  {
+-    std::string strSource(data.data(), data.size());
+-    std::string strUTF8;
+-    g_charsetConverter.unknownToUTF8(strSource, strUTF8);
+-    return String(strUTF8, String::UTF8);
+-  }
+-};
+-
+-static const TagStringHandler<ID3v1::StringHandler> ID3v1StringHandler;
+-static const TagStringHandler<ID3v2::Latin1StringHandler> ID3v2StringHandler;
+-
+ CTagLoaderTagLib::CTagLoaderTagLib()
+ {
+ }
+@@ -824,8 +805,6 @@ bool CTagLoaderTagLib::Load(const std::string& strFileName, CMusicInfoTag& tag,
+     return false;
+   }
+ 
+-  ID3v1::Tag::setStringHandler(&ID3v1StringHandler);
+-  ID3v2::Tag::setLatin1StringHandler(&ID3v2StringHandler);
+   TagLib::File*              file = NULL;
+   TagLib::APE::File*         apeFile = NULL;
+   TagLib::ASF::File*         asfFile = NULL;
+diff --git a/xbmc/music/tags/TagLoaderTagLib.h b/xbmc/music/tags/TagLoaderTagLib.h
+index f83ea4f..0edb84f 100644
+--- a/xbmc/music/tags/TagLoaderTagLib.h
++++ b/xbmc/music/tags/TagLoaderTagLib.h
+@@ -44,6 +44,9 @@
+ #include <taglib/mp4tag.h>
+ #include "ImusicInfoTagLoader.h"
+ 
++#include <string>
++#include <vector>
++
+ namespace MUSIC_INFO
+ {
+   class CMusicInfoTag;
+-- 
+2.8.1
+
-- 
2.8.1

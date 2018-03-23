From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 23 Mar 2018 20:59:42 +0200
Subject: [Buildroot] [PATCH v2/next 4/4] webkitgtk: Add upstream patch for
 better memory monitoring
In-Reply-To: <20180323185942.60252-1-aperez@igalia.com>
References: <20180323185942.60252-1-aperez@igalia.com>
Message-ID: <20180323185942.60252-5-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This imports a patch which has been committed upstream, but is not part
of the 2.20.0 release which modifies WebKitGTK+'s memory monitor to take
into account the available memory when calculating the thresholds at
which the Web engine will try to return memory back to the system. The
net result is that on constrained systems WebKitGTK+ will try to free
memory it does not need more often.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...memory-monitor-thresholds-should-be-bette.patch | 93 ++++++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 package/webkitgtk/0001-WebProcess-memory-monitor-thresholds-should-be-bette.patch

diff --git a/package/webkitgtk/0001-WebProcess-memory-monitor-thresholds-should-be-bette.patch b/package/webkitgtk/0001-WebProcess-memory-monitor-thresholds-should-be-bette.patch
new file mode 100644
index 0000000000..9848ec8526
--- /dev/null
+++ b/package/webkitgtk/0001-WebProcess-memory-monitor-thresholds-should-be-bette.patch
@@ -0,0 +1,93 @@
+From 25fe9c19e4fb3519e34df7e16b3d761812b921aa Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Wed, 21 Mar 2018 01:05:53 +0200
+Subject: [PATCH xserver 1/2] WebProcess memory monitor thresholds should be
+ better tuned for embedded systems.
+ https://bugs.webkit.org/show_bug.cgi?id=183773
+
+Patch by Carlos Alberto Lopez Perez <clopez@igalia.com> on 2018-03-20
+Reviewed by NOBODY (OOPS!).
+
+Take into account the total system RAM for the thresholds calculation.
+
+For systems with more than 3GB the conservative and strict thresholds remain as they are,
+but for systems with less RAM the thresholds are dynamically configured as follows:
+
+- Conservative threshold (release non critical memory) if WebProcess using more than 33% of the total RAM.
+- Strict threshold (release all possible memory) if WebProcess using more than 50% of the total RAM.
+
+The Kill threshold is also modified. Now it is capped at 90% of the total RAM.
+
+* wtf/MemoryPressureHandler.cpp:
+(WTF::thresholdForMemoryKillWithProcessState):
+(WTF::thresholdForPolicy):
+(WTF::MemoryPressureHandler::shrinkOrDie):
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream-Status: Committed
+
+diff --git a/Source/WTF/wtf/MemoryPressureHandler.cpp b/Source/WTF/wtf/MemoryPressureHandler.cpp
+index 0e1d1a60fe0..d31180883eb 100644
+--- a/Source/WTF/wtf/MemoryPressureHandler.cpp
++++ b/Source/WTF/wtf/MemoryPressureHandler.cpp
+@@ -28,6 +28,7 @@
+ 
+ #include <wtf/MemoryFootprint.h>
+ #include <wtf/NeverDestroyed.h>
++#include <wtf/RAMSize.h>
+ 
+ #define LOG_CHANNEL_PREFIX Log
+ 
+@@ -84,20 +85,17 @@ static const char* toString(MemoryUsagePolicy policy)
+ 
+ static size_t thresholdForMemoryKillWithProcessState(WebsamProcessState processState, unsigned tabCount)
+ {
++    size_t baseThreshold = 2 * GB;
+ #if CPU(X86_64) || CPU(ARM64)
+-    size_t baseThreshold;
+     if (processState == WebsamProcessState::Active)
+         baseThreshold = 4 * GB;
+-    else
+-        baseThreshold = 2 * GB;
+-    if (tabCount <= 1)
+-        return baseThreshold;
+-    return baseThreshold + (std::min(tabCount - 1, 4u) * 1 * GB);
++    if (tabCount > 1)
++        baseThreshold += std::min(tabCount - 1, 4u) * 1 * GB;
+ #else
+-    UNUSED_PARAM(processState);
+-    UNUSED_PARAM(tabCount);
+-    return 3 * GB;
++    if ((tabCount > 1) || (processState == WebsamProcessState::Active))
++        baseThreshold = 3 * GB;
+ #endif
++    return std::min(baseThreshold, static_cast<size_t>(ramSize() * 0.9));
+ }
+ 
+ void MemoryPressureHandler::setPageCount(unsigned pageCount)
+@@ -114,11 +112,12 @@ size_t MemoryPressureHandler::thresholdForMemoryKill()
+ 
+ static size_t thresholdForPolicy(MemoryUsagePolicy policy)
+ {
++    const size_t baseThresholdForPolicy = std::min(3 * GB, ramSize());
+     switch (policy) {
+     case MemoryUsagePolicy::Conservative:
+-        return 1 * GB;
++        return baseThresholdForPolicy / 3;
+     case MemoryUsagePolicy::Strict:
+-        return 1.5 * GB;
++        return baseThresholdForPolicy / 2;
+     case MemoryUsagePolicy::Unrestricted:
+     default:
+         ASSERT_NOT_REACHED();
+@@ -150,6 +149,7 @@ void MemoryPressureHandler::shrinkOrDie()
+         return;
+     }
+ 
++    WTFLogAlways("Unable to shrink memory footprint of process (%lu MB) below the kill thresold (%lu MB). Killed\n", footprint.value() / MB, thresholdForMemoryKill() / MB);
+     RELEASE_ASSERT(m_memoryKillCallback);
+     m_memoryKillCallback();
+ }
+-- 
+2.16.2
+
-- 
2.16.2

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E138BC46467
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 12:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DE334071E;
	Mon,  2 Jan 2023 12:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DE334071E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9pV_xZ-KoGCO; Mon,  2 Jan 2023 12:09:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56A7A4094E;
	Mon,  2 Jan 2023 12:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56A7A4094E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B2471BF33E
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2757E405FD
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2757E405FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0mdNlaIe2fsY for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 12:09:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42C1D40256
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 12:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42C1D40256
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25918870CC; Mon,  2 Jan 2023 12:09:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Jan 2023 13:05:48 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 1427f9c63fde7fda7edb9c5d841110718d391d5f
X-Git-Newrev: 29aca00e17da210c9d4bdf18098bcdd0ee152e43
X-Patchwork-Hint: ignore
Message-Id: <20230102120930.25918870CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/gcc: fix gcc12
 with uClibc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=29aca00e17da210c9d4bdf18098bcdd0ee152e43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

GCC 12 produces broken binaries when used with uClibc.
E.g. `gdb` crashes on startup.

GCC HEAD fixes this in:
https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=ee4af2ed0b7322884ec4ff537564683c3749b813

Adds the commit as patch for GCC 12.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 327fab5b9d45891233ff647d5b352cc94b3c27ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/12.2.0/0002-fix-condvar.patch | 82 +++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/package/gcc/12.2.0/0002-fix-condvar.patch b/package/gcc/12.2.0/0002-fix-condvar.patch
new file mode 100644
index 0000000000..5044942e9f
--- /dev/null
+++ b/package/gcc/12.2.0/0002-fix-condvar.patch
@@ -0,0 +1,82 @@
+From ee4af2ed0b7322884ec4ff537564683c3749b813 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Thu, 22 Dec 2022 09:56:47 +0000
+Subject: [PATCH] libstdc++: Avoid recursion in __nothrow_wait_cv::wait
+ [PR105730]
+
+The commit r12-5877-g9e18a25331fa25 removed the incorrect
+noexcept-specifier from std::condition_variable::wait and gave the new
+symbol version @@GLIBCXX_3.4.30. It also redefined the original symbol
+std::condition_variable::wait(unique_lock<mutex>&)@GLIBCXX_3.4.11 as an
+alias for a new symbol, __gnu_cxx::__nothrow_wait_cv::wait, which still
+has the incorrect noexcept guarantee. That __nothrow_wait_cv::wait is
+just a wrapper around the real condition_variable::wait which adds
+noexcept and so terminates on a __forced_unwind exception.
+
+This doesn't work on uclibc, possibly due to a dynamic linker bug. When
+__nothrow_wait_cv::wait calls the condition_variable::wait function it
+binds to the alias symbol, which means it just calls itself recursively
+until the stack overflows.
+
+This change avoids the possibility of a recursive call by changing the
+__nothrow_wait_cv::wait function so that instead of calling
+condition_variable::wait it re-implements it. This requires accessing
+the private _M_cond member of condition_variable, so we need to use the
+trick of instantiating a template with the member-pointer of the private
+member.
+
+libstdc++-v3/ChangeLog:
+
+	PR libstdc++/105730
+	* src/c++11/compatibility-condvar.cc (__nothrow_wait_cv::wait):
+	Access private data member of base class and call its wait
+	member.
+
+Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
+---
+ .../src/c++11/compatibility-condvar.cc        | 22 ++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/libstdc++-v3/src/c++11/compatibility-condvar.cc b/libstdc++-v3/src/c++11/compatibility-condvar.cc
+index e3a8b8403ca..3cef3bc0714 100644
+--- a/libstdc++-v3/src/c++11/compatibility-condvar.cc
++++ b/libstdc++-v3/src/c++11/compatibility-condvar.cc
+@@ -67,6 +67,24 @@ _GLIBCXX_END_NAMESPACE_VERSION
+     && defined(_GLIBCXX_HAVE_SYMVER_SYMBOL_RENAMING_RUNTIME_SUPPORT)
+ namespace __gnu_cxx _GLIBCXX_VISIBILITY(default)
+ {
++namespace
++{
++  // Pointer-to-member for private std::condition_variable::_M_cond member.
++  std::__condvar std::condition_variable::* __base_member;
++
++  template<std::__condvar std::condition_variable::*X>
++    struct cracker
++    { static std::__condvar std::condition_variable::* value; };
++
++  // Initializer for this static member also initializes __base_member.
++  template<std::__condvar std::condition_variable::*X>
++    std::__condvar std::condition_variable::*
++      cracker<X>::value = __base_member = X;
++
++  // Explicit instantiation is allowed to access the private member.
++  template class cracker<&std::condition_variable::_M_cond>;
++}
++
+ struct __nothrow_wait_cv : std::condition_variable
+ {
+   void wait(std::unique_lock<std::mutex>&) noexcept;
+@@ -76,7 +94,9 @@ __attribute__((used))
+ void
+ __nothrow_wait_cv::wait(std::unique_lock<std::mutex>& lock) noexcept
+ {
+-  this->condition_variable::wait(lock);
++  // In theory this could be simply this->std::condition_variable::wait(lock)
++  // but with uclibc that binds to the @GLIBCXX_3.4.11 symbol, see PR 105730.
++  (this->*__base_member).wait(*lock.mutex());
+ }
+ } // namespace __gnu_cxx
+ 
+-- 
+2.31.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

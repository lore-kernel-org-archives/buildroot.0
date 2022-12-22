Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9F2C4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 10:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F2A440136;
	Thu, 22 Dec 2022 10:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F2A440136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Vsca5CTDE0w; Thu, 22 Dec 2022 10:49:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF128402BC;
	Thu, 22 Dec 2022 10:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF128402BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 76C531BF304
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 10:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52256402BC
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 10:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52256402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id flrHa2Nv_Vze for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 10:49:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DCEB40136
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DCEB40136
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 10:49:38 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 4B7D1BDE7453;
 Thu, 22 Dec 2022 11:49:33 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 22 Dec 2022 10:49:33 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Gleb Mazovetskiy <glex.spb@gmail.com>
In-Reply-To: <mailman.11703.1671657429.89793.buildroot@buildroot.org>
References: <mailman.11703.1671657429.89793.buildroot@buildroot.org>
Message-ID: <85f94ed27ffc69b7cc453d5f8a5505d7@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH] package/gcc: fix gcc12 with uClibc
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes a recursive call to __nothrow_wait_cv::wait() in 
libstdc++-v3/src/c++11/compatibility-condvar.cc which occurs whenever a 
C++ application (gcc12 +uClibc) calls std::condition_variable::wait()

Also observed with: mpd using liburing.

Tested-by: Andreas Ziegler <br015@umbiko.net>

On 2022-12-21 12:52, Gleb Mazovetskiy <glex.spb@gmail.com> wrote:
> GCC 12 produces broken binaries when used with uClibc.
> E.g. `gdb` crashes on startup.
> 
> This adds a patch to address the issue.
> The patch is from:
> 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105730#c8
> 
> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
> ---
>  .../gcc/12.2.0/0002-fix-condvar-compat.patch  | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/gcc/12.2.0/0002-fix-condvar-compat.patch
> 
> diff --git a/package/gcc/12.2.0/0002-fix-condvar-compat.patch 
> b/package/gcc/12.2.0/0002-fix-condvar-compat.patch
> new file mode 100644
> index 0000000000..9bbd481dbe
> --- /dev/null
> +++ b/package/gcc/12.2.0/0002-fix-condvar-compat.patch
> @@ -0,0 +1,33 @@
> +--- a/libstdc++-v3/src/c++11/compatibility-condvar.cc
> ++++ b/libstdc++-v3/src/c++11/compatibility-condvar.cc
> +@@ -67,6 +67,22 @@ _GLIBCXX_END_NAMESPACE_VERSION
> +     && defined(_GLIBCXX_HAVE_SYMVER_SYMBOL_RENAMING_RUNTIME_SUPPORT)
> + namespace __gnu_cxx _GLIBCXX_VISIBILITY(default)
> + {
> ++namespace
> ++{
> ++  std::__condvar std::condition_variable::* __base_member;
> ++
> ++  template<std::__condvar std::condition_variable::*X>
> ++    struct cracker
> ++    {
> ++      static std::__condvar std::condition_variable::* value;
> ++    };
> ++  template<std::__condvar std::condition_variable::*X>
> ++    std::__condvar std::condition_variable::*
> ++      cracker<X>::value = __base_member = X;
> ++
> ++  template class cracker<&std::condition_variable::_M_cond>;
> ++}
> ++
> + struct __nothrow_wait_cv : std::condition_variable
> + {
> +   void wait(std::unique_lock<std::mutex>&) noexcept;
> +@@ -76,7 +92,7 @@ __attribute__((used))
> + void
> + __nothrow_wait_cv::wait(std::unique_lock<std::mutex>& lock) noexcept
> + {
> +-  this->condition_variable::wait(lock);
> ++  (this->*__base_member).wait(*lock.mutex());
> + }
> + } // namespace __gnu_cxx
> --
> 2.37.2
> 
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

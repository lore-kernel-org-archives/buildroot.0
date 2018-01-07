From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jan 2018 23:09:33 +0100
Subject: [Buildroot] [PATCH] asterisk: security bump to version 14.6.2
In-Reply-To: <20180107214629.18544-1-peter@korsgaard.com>
References: <20180107214629.18544-1-peter@korsgaard.com>
Message-ID: <20180107220933.GA2774@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-01-07 22:46 +0100, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
> 14.6.1:
> 
> * AST-2017-005 (applied to all released versions): The "strictrtp" option in
>   rtp.conf enables a feature of the RTP stack that learns the source address
>   of media for a session and drops any packets that do not originate from
>   the expected address.  This option is enabled by default in Asterisk 11
>   and above.  The "nat" and "rtp_symmetric" options for chan_sip and
>   chan_pjsip respectively enable symmetric RTP support in the RTP stack.
>   This uses the source address of incoming media as the target address of
>   any sent media.  This option is not enabled by default but is commonly
>   enabled to handle devices behind NAT.
> 
>   A change was made to the strict RTP support in the RTP stack to better
>   tolerate late media when a reinvite occurs.  When combined with the
>   symmetric RTP support this introduced an avenue where media could be
>   hijacked.  Instead of only learning a new address when expected the new
>   code allowed a new source address to be learned at all times.
> 
>   If a flood of RTP traffic was received the strict RTPsupport would allow
>   the new address to provide media and with symmetric RTP enabled outgoing
>   traffic would be sent to this new address, allowing the media to be
>   hijacked.  Provided the attacker continued to send traffic they would
>   continue to receive traffic as well.
> 
> * AST-2017-006 (applied to all released versions): The app_minivm module has
>   an ?externnotify? program configuration option that is executed by the
>   MinivmNotify dialplan application.  The application uses the caller-id
>   name and number as part of a built string passed to the OS shell for
>   interpretation and execution.  Since the caller-id name and number can
>   come from an untrusted source, a crafted caller-id name or number allows
>   an arbitrary shell command injection.
> 
> * AST-2017-007 (applied only to 13.17.1 and 14.6.1): A carefully crafted URI
>   in a From, To or Contact header could cause Asterisk to crash
> 
> For more details, see the announcement:
> https://www.asterisk.org/downloads/asterisk-news/asterisk-11252-13171-1461-116-cert17-1313-cert5-now-available-security
> 
> 14.6.2:
> 
> * AST-2017-008: Insufficient RTCP packet validation could allow reading
>   stale buffer contents and when combined with the ?nat? and ?symmetric_rtp?
>   options allow redirecting where Asterisk sends the next RTCP report.
> 
>   The RTP stream qualification to learn the source address of media always
>   accepted the first RTP packet as the new source and allowed what
>   AST-2017-005 was mitigating.  The intent was to qualify a series of
>   packets before accepting the new source address.
> 
> For more details, see the announcement:
> https://www.asterisk.org/downloads/asterisk-news/asterisk-11253-13172-1462-116-cert18-1313-cert6-now-available-security
> 
> Drop 0004-configure-in-cross-complation-assimne-eventfd-are-av.patch as this
> is now handled differently upstream (by disabling eventfd for cross
> compilation, see commit 2e927990b3d2 (eventfd: Disable during cross
> compilation)).  If eventfd support is needed then this should be submitted
> upstream.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...sure-target-directory-for-modules-exists.patch} |  0
>  ...n-cross-complation-assimne-eventfd-are-av.patch | 37 ----------------------
>  ...0005-install-samples-need-the-data-files.patch} |  0
>  package/asterisk/asterisk.hash                     |  2 +-
>  package/asterisk/asterisk.mk                       |  2 +-
>  5 files changed, 2 insertions(+), 39 deletions(-)
>  rename package/asterisk/{0005-build-ensure-target-directory-for-modules-exists.patch => 0004-build-ensure-target-directory-for-modules-exists.patch} (100%)
>  delete mode 100644 package/asterisk/0004-configure-in-cross-complation-assimne-eventfd-are-av.patch
>  rename package/asterisk/{0006-install-samples-need-the-data-files.patch => 0005-install-samples-need-the-data-files.patch} (100%)
> 
> diff --git a/package/asterisk/0005-build-ensure-target-directory-for-modules-exists.patch b/package/asterisk/0004-build-ensure-target-directory-for-modules-exists.patch
> similarity index 100%
> rename from package/asterisk/0005-build-ensure-target-directory-for-modules-exists.patch
> rename to package/asterisk/0004-build-ensure-target-directory-for-modules-exists.patch
> diff --git a/package/asterisk/0004-configure-in-cross-complation-assimne-eventfd-are-av.patch b/package/asterisk/0004-configure-in-cross-complation-assimne-eventfd-are-av.patch
> deleted file mode 100644
> index dae36d173d..0000000000
> --- a/package/asterisk/0004-configure-in-cross-complation-assimne-eventfd-are-av.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From e7de812c979d219765fbf1292f0e150bfa087716 Mon Sep 17 00:00:00 2001
> -From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -Date: Sun, 18 Jun 2017 21:54:16 +0200
> -Subject: [PATCH] configure: in cross-complation, assume eventfd are available
> -
> -eventfd have been in the kernel since 2.6.22, and in glibc since 2.8,
> -repectively released in July 2007 and April 2008, almost a decade ago
> -now.
> -
> -Assume that no one building from now on for cross-compilation will be
> -unlucky enough to get versions older than that...
> -
> -As such, in cross-compilation, assume eventfd are available.
> -
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ----
> - configure.ac | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 1c20517864..474d17ae55 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1107,7 +1107,9 @@ AC_RUN_IFELSE(
> -       [return eventfd(0, EFD_NONBLOCK | EFD_SEMAPHORE) == -1;])],
> -   AC_MSG_RESULT(yes)
> -   AC_DEFINE([HAVE_EVENTFD], 1, [Define to 1 if your system supports eventfd and the EFD_NONBLOCK and EFD_SEMAPHORE flags.]),
> --  AC_MSG_RESULT(no)
> -+  AC_MSG_RESULT(no),
> -+  AC_MSG_RESULT([cross-compile; assume yes])
> -+  AC_DEFINE([HAVE_EVENTFD], 1, [Define to 1 if your system supports eventfd and the EFD_NONBLOCK and EFD_SEMAPHORE flags.])
> - )
> - 
> - AST_GCC_ATTRIBUTE(pure)
> --- 
> -2.11.0
> -
> diff --git a/package/asterisk/0006-install-samples-need-the-data-files.patch b/package/asterisk/0005-install-samples-need-the-data-files.patch
> similarity index 100%
> rename from package/asterisk/0006-install-samples-need-the-data-files.patch
> rename to package/asterisk/0005-install-samples-need-the-data-files.patch
> diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
> index 7ae35bc4b1..d1667acaae 100644
> --- a/package/asterisk/asterisk.hash
> +++ b/package/asterisk/asterisk.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  c122fbe88e089737fa2c80356762ceed38498aa26da1dfdd4da5506f9b135696  asterisk-14.5.0.tar.gz
> +sha256  f85f6df802de485d9b8cb1bfa5493e22f6401dce8246646af9506489a264d7b1  asterisk-14.6.2.tar.gz
>  
>  # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
>  # sha256 locally computed
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index 50512c0b3a..da78b25405 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ASTERISK_VERSION = 14.5.0
> +ASTERISK_VERSION = 14.6.2
>  # Use the github mirror: it's an official mirror maintained by Digium, and
>  # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
>  ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

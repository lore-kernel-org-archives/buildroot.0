From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 23:47:59 +0100
Subject: [Buildroot] [PATCH] asterisk: security bump to version 14.6.2
In-Reply-To: <20180107214629.18544-1-peter@korsgaard.com>
References: <20180107214629.18544-1-peter@korsgaard.com>
Message-ID: <20180107234759.11189ae5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Jan 2018 22:46:29 +0100, Peter Korsgaard wrote:
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

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

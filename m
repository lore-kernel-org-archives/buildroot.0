From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Aug 2016 22:30:05 -0700
Subject: [Buildroot] [PATCH 2/3] ffmpeg: explicitly disable NEON support
In-Reply-To: <1470864544-31919-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470864544-31919-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1470864544-31919-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <6CC4787F-4C98-4A71-9184-73F1B2D83443@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 10, 2016, at 2:29 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> When BR2_ARM_CPU_HAS_NEON=y, we pass --enable-neon. However, when
> BR2_ARM_CPU_HAS_NEON is disabled, we don't pass anything. This generally
> works fine, but turned out to integrate NEON code in ARMv7-M
> builds (since it's ARMv7, ffmpeg assumed it should enable NEON code).
> 
> Even though ffmpeg is now disabled for ARMv7-M, it still makes sense to
> be explicit, and disable NEON support when the CPU doesn't have it.

Just an aside. You can add ?enable-thumb when the default ISA
chosen is thumb

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> package/ffmpeg/ffmpeg.mk | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index c42336f..2b4219a 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -437,6 +437,8 @@ FFMPEG_CONF_OPTS += --disable-vfp
> endif
> ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
> FFMPEG_CONF_OPTS += --enable-neon
> +else
> +FFMPEG_CONF_OPTS += --disable-neon
> endif
> 
> ifeq ($(BR2_MIPS_SOFT_FLOAT),y)
> --
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160811/e67fffad/attachment.asc>

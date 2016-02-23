From: John Keeping <john@keeping.me.uk>
Date: Tue, 23 Feb 2016 10:12:33 +0000
Subject: [Buildroot] Analysis of build results for 2016-02-21
In-Reply-To: <20160222150539.0301105e@free-electrons.com>
References: <20160222073022.D29851025E8@stock.ovh.net>
 <20160222150539.0301105e@free-electrons.com>
Message-ID: <20160223101233.GH1766@serenity.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 22, 2016 at 03:05:39PM +0100, Thomas Petazzoni wrote:
> On Mon, 22 Feb 2016 08:30:22 +0100 (CET), Thomas Petazzoni wrote:
> 
> >         mips |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/2bf4e5ea9b67b80ba38bfeaf71b747a92be09011/
> 
> tools/avinfo.c:193:24: error: unknown type name 'a2dp_ldac_t'
>  static void print_ldac(a2dp_ldac_t *ldac)
> 
> It's not MIPS specific, since the same build issue occurred on other
> architectures.
> 
> Could someone have a look ?

I think the problem affects all big endian systems and the necessary
patch to bluez5 is below, but I don't have a suitable toolchain or
system to test it.

If someone is able to test the patch I will submit it upstream and roll
a proper patch for Buildroot.

-- >8 --
diff --git a/profiles/audio/a2dp-codecs.h b/profiles/audio/a2dp-codecs.h
index e9da0bf..4fb5c0c 100644
--- a/profiles/audio/a2dp-codecs.h
+++ b/profiles/audio/a2dp-codecs.h
@@ -234,6 +234,11 @@ typedef struct {
 	uint8_t channel_mode:4;
 } __attribute__ ((packed)) a2dp_aptx_t;
 
+typedef struct {
+	a2dp_vendor_codec_t info;
+	uint8_t unknown[2];
+} __attribute__ ((packed)) a2dp_ldac_t;
+
 #else
 #error "Unknown byte order"
 #endif

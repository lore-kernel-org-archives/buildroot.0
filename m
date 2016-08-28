From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Aug 2016 13:35:35 +0200
Subject: [Buildroot] [PATCH] package/libshout: add patches to fix static
 linking
In-Reply-To: <20160827231337.29284-1-joerg.krause@embedded.rocks>
References: <20160827231337.29284-1-joerg.krause@embedded.rocks>
Message-ID: <20160828133535.0a6b2499@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Aug 2016 01:13:37 +0200, J?rg Krause wrote:

> +The Libs.private field is specifically designed for such usage:
> +
> +From pkg-config documentation:
> +
> +  Libs.private:
> +
> +     This line should list any private libraries in use. Private
> +     libraries are libraries which are not exposed through your
> +     library, but are needed in the case of static linking.
> +
> +Therefore, this patch adds a reference to vorbis and speex in the Libs.private
> +field of libshouts pkg-config file.
> +
> +Upstream status: pending
> +https://github.com/xiph/Icecast-libshout/pull/5
> +
> +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> +---
> + shout.pc.in | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/shout.pc.in b/shout.pc.in
> +index 867a0be..4827295 100644
> +--- a/shout.pc.in
> ++++ b/shout.pc.in
> +@@ -12,4 +12,5 @@ Description: Audio streaming library for icecast encoders
> + Version: @VERSION@
> + Requires.private: @SHOUT_REQUIRES@
> + Libs: -L${libdir} -lshout
> ++Libs.private: @VORBIS_LIBS@ @XIPH_LIBS@
> + Cflags: -I${includedir} @PTHREAD_CPPFLAGS@ @SHOUT_CFLAGS@

Since OpenSSL installs its own .pc files, you should rather look at
using the Requires.private field rather than the Libs.private field.

Requires.private is a list of pkg-config packages that you need to link
with, when static linking.

In other words, you need to make sure that @SHOUT_REQUIRES@ contains
the right list of pkg-config packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 23:00:22 +0100
Subject: [Buildroot] [PATCH] package/cups: fix static linking with GnuTLS
In-Reply-To: <1456675640-22176-1-git-send-email-joerg.krause@embedded.rocks>
References: <1456675640-22176-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160228230022.3d8805d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun, 28 Feb 2016 17:07:20 +0100, J?rg Krause wrote:
> cups forgets to link against the libs found by pkg-config if it is build with
> GnuTLS support.

If this was true, then it would not only fail in static linking
scenarios, but also in dynamic linking scenarios.

What apparently is happening is that libcups.so is properly linked
against libgnutls.so, so that when you link a binary against
libcups.so, everything works fine.

However, when you switch to static linking, this doesn't work, because
library dependencies are not recursively taken into account.

While your fix probably works (I haven't tested it), it has the
drawback of linking the cups binaries directly with libgnutls.so even
in a dynamic linking scenario, while this is not really needed.

This is normally fixed with pkg-config by using the Libs.private field,
but here we are *inside* a given package, so the pkg-config files have
not yet been installed by the time we link the cups binaries.

I think this problem is normally handled by libtool, but since cups is
using only autoconf and not automake/libtool... Maybe we should consult
with the cups developers?

Arnout, Yann, do you have other advises?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Aug 2017 17:22:13 +0200
Subject: [Buildroot] [V2 1/1] package/strongswan: Install libraries to
 /usr/lib
In-Reply-To: <1504192688-56951-1-git-send-email-sam.voss@rockwellcollins.com>
References: <1504192688-56951-1-git-send-email-sam.voss@rockwellcollins.com>
Message-ID: <20170831172213.0cb44929@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Wolfgang in Cc.

On Thu, 31 Aug 2017 10:18:08 -0500, Sam Voss wrote:
> Install strongswan ipsec libraries into /usr/lib instead of
> /usr/lib/ipsec in an effort to not need a custom RPATH for this package.
> 
> Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>

However, as said on IRC: I don't think it is normal that we drop the
RPATH from a target binary if this RPATH is needed. So there is
probably some additional investigation needed here to figure out if our
RPATH-sanitization logic is correct.

Wolfgang: Sam realized that stronswan was no longer working, because it
installs libraries in a non-standard path (/usr/lib/<something>/). The
strongswan build system apparently adds the correct RPATH, but our
RPATH sanitization step ($(TOPDIR)/support/scripts/fix-rpath target)
removes it. Sam tested after dropping the call to
$(TOPDIR)/support/scripts/fix-rpath target, and the RPATH was correct,
strongswan would work.

Aren't we supposed to keep legitimate RPATH from target binaries ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

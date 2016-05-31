From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 22:50:15 +0200
Subject: [Buildroot] [PATCH] linux: provide symlink dtc->linux-dtc is
 there is no dtc yet
In-Reply-To: <1452252619-13802-1-git-send-email-patrickdepinguin@gmail.com>
References: <1452252619-13802-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160531225015.0f2039e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Jan 2016 12:30:19 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Commit ab74e09eb4e28dab8bed8d783c5f0464d39a32e7 renamed the dtc host tool
> provided by linux to linux-dtc to avoid clashes with the dtc host tool
> provided by host-dtc.
> 
> However, external scripting may well rely on the existence of a device tree
> compiler as $(HOST_DIR)/usr/bin/dtc, regardless of its source. Changing
> these external scripts to use linux-dtc means that the scripts need to be
> aware of the buildroot release they are working with, which is not very
> nice.
> 
> Add a symlink dtc->linux-dtc when no $(HOST_DIR)/usr/bin/dtc is present.
> When host-dtc is not enabled, the end result will be dtc and
> linux-dtc representing the same thing.
> When host-dtc is enabled, either it is build before linux and no symlink
> is created at any time, or it is build after linux, and the 'install'
> command in host-dtc will overwrite the symlink with a proper dtc. In both
> cases, the end result will be dtc and linux-dtc representing a different
> thing.
> 
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

I've applied this patch to next, mainly because Arnout gave his
Reviewed-by, and because it has been waiting for a loooong time.

However, I don't quite get why you simply don't include host-dtc in
your build if you want to be sure to have something in
$(HOST_DIR)/usr/bin/dtc. We could even push the thing further and not
installed the Linux DTC at all in $(HOST_DIR) and simply ask people to
add host-dtc to their build if they need it.

But oh well, if we decide to move in this direction, it can be reworked
later, which is why I've applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

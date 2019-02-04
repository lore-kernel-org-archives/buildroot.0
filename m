From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 17:58:09 +0100
Subject: [Buildroot] [PATCH] store debug information in
 $HOST_DIR/lib/debug
In-Reply-To: <20190123131539.24699-1-Gerhard@Heift.Name>
References: <20190123131539.24699-1-Gerhard@Heift.Name>
Message-ID: <20190204175809.7b710934@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gerhard,

Thanks for this contribution. I'm adding in Cc a few other people to
hopefully get their attention.

On Wed, 23 Jan 2019 14:15:39 +0100
Gerhard Heift <gerhard@heift.name> wrote:

> Before striping the binaries in $TARGET_DIR, the debug information is saved to
> $HOST_DIR/lib/debug using the following command as described in [1]:
> 
>   $ objcopy --only-keep-debug --compress-debug-sections $file
> 
> This allows remote debugging as described in section 8.12.2 with striped
> binaries in the final image. Therefore the build ID is included during the build
> process, if debug information is enabled via BR2_ENABLE_DEBUG.
> 
> [1] https://sourceware.org/gdb/onlinedocs/gdb/Separate-Debug-Files.html
> 
> Signed-off-by: Gerhard Heift <Gerhard@Heift.Name>

When you build with BR2_ENABLE_DEBUG=y and BR2_STRIP_strip=y, all the
libraries in $(STAGING_DIR) are installed with debugging symbols, and
they are not stripped.

As explained in our manual section 8.12.2, we provide a gdbinit that
tells gdb to look in $(STAGING_DIR) for debugging symbols.

Your patch has the effect of duplicating the debugging symbols: they
are already in $(STAGING_DIR), and they will now be duplicated in
$(HOST_DIR)/lib/debug. The only benefit that I can see is that the
gdbinit file is no longer needed because gdb will automatically look in
$(HOST_DIR)/lib/debug. But that can probably be resolved by making
$(HOST_DIR)/lib/debug a symlink to $(STAGING_DIR). Could you try this
instead ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

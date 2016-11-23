From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:22:09 +0100
Subject: [Buildroot] [PATCH] Makefile: fix ignored trace at
 target-finalize
In-Reply-To: <20161122205333.9735-1-gael.portay@savoirfairelinux.com>
References: <20161122205333.9735-1-gael.portay@savoirfairelinux.com>
Message-ID: <20161123232209.52e93240@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 15:53:33 -0500, Ga?l PORTAY wrote:
> Make may throw an error (but ignored) trace when cleaning up the
> rootfs.
> 
> The target-finalize rule intends to remove the folder
> `$(TARGET_DIR)/usr/share' but this directory may still contain items
> (such as the `udhcpc' helper script) and causes the rmdir to fail.
> 
> The stderr output is redirected to /dev/null but it returns and error
> which is escaped by the leading `-'; but make reports an ignored-error.
> 
> See the log below:
> $ make
> (...)
> rm -rf (...)/target/usr/share/gtk-doc
> rmdir (...)/target/usr/share
> rmdir: failed to remove '(...)/target/usr/share': Directory not empty
> make[1]: [Makefile:650: target-finalize] Error 1 (ignored)
> find /(...)/target -type f \( -perm /111 -o -name '*.so*' \) -not \( -name 'libpthread*.so*' -o -name 'ld-*.so*' -o -name '*.ko' \) -print0 | xargs -0 (...)/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-strip --remove-section=.comment --remove-section=.note 2>/dev/null || true
> 
> This patch apply the same rule at the instruction immediately after:
> * redirecting stderr to /dev/null (already done) and
> * executing true if the `rmdir' instruction fails.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
